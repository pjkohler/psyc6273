%% topic16code.m  Illustration of some statistical functions

%% COMPARE T DISTRIBUTION AND NORMAL DISTRIBUTION
close all;
font_params = ... % use 3 dots to change line
    {'fontsize',12, 'fontname', 'Arial', 'fontweight', 'normal'}; % store in a cell
figure(1); set(gcf,'Name','normal_vs_t');
hold on
fplot( @(x) normpdf(x,0,1) , [ -3 3 ]);
fplot( @(x) tpdf(x, 5) , [ -3 3 ]);
fplot( @(x) tpdf(x, 10) , [ -3 3 ]);
set(gca, font_params{:})
% print legend, use '{\it ... }' to do italic script
legend('normal','{\itt-disp} (df=5)','{\itt-disp} (df=10)', 'box', 'off', font_params{:});
title('t-distribution and normal distribution', font_params{:});
hold off
% t-distribution is designed to account 
% for uncertainty with smaller sample sizes
% t-distribution approaches normal distribution as sample size (df) gets larger

%% STUDENT'S T-DISTRIBUTION
figure(2); set(gcf,'Name','student''s t');
n = 20;
fig_labels = {'A','B','C','D'};
for z = 1:4
    subplot(2,2,z); 
    switch z
        case 1
            fplot( @(x) tpdf(x, n-1) , [ -3 3 ]); title('pdf', font_params{:});
        case 2
            fplot( @(x) tcdf(x, n-1) , [ -3 3 ]);  title('cdf', font_params{:});
        case 3
            fplot( @(x) tinv(x, n-1) , [  0 1 ]);  title('inv', font_params{:});
        case 4
            histogram( trnd(n-1 ,[ 10000 1 ]), 20);  set(gca,'xlim',[-4,4]);  title('rnd', font_params{:});
    end    
    set(gca, font_params{:}, 'box', 'off')
    text(min(get(gca,'xlim')), max(get(gca,'ylim')), fig_labels{z}, font_params{:}, 'fontsize', 20); 
end

%% RUN THE T-TEST BY HAND
x   = 11+3*randn([ 1 n ]);                          % make up some data
mu0 = 10;                                           % hypothesize a mean
muhat    = mean(x);                                 % get the sample mean
sigmahat = std(x);                                  % get the sample standard deviation
t  = (muhat-mu0)/(sigmahat/sqrt(n));                % calculate the t statistic
plow  =   tcdf(t,n-1)                               % probability that t is at least this low (left-tailed test)
phigh = 1-tcdf(t,n-1)                               % probability that t is at least this high (right-tailed test)
p2    = tcdf(-abs(t),n-1) + (1-tcdf(abs(t),n-1))    % probability that t is at least this far from zero (two-tailed test)

%% ADD TO FIGURE
figure(2);
subplot(2,2,1);
hold on
plot([t,t],linspace(0,.4,2), 'r-')
hold off
subplot(2,2,2);
hold on
plot(t,plow, 'ro')
hold off

subplot(2,2,3);
hold on
plot(plow,t, 'ro')

%% compare to matlab

% use matlab's ttest function:
[t_sig, t_p, t_ci, stat] = ttest(x, 10, 'tail', 'both')

stat.sig = t_sig;
stat.p = t_p;
stat.ci = t_ci;

% use ttest2 for unpaired two-sample tests, 
% and ttest for one-sample and paired samples

%% two-way anova
x = [ 15    20    18
      13    21    16
      15    20    20
      11    16    14
      13    18    16
      15    20    18
      14    19    17
      15    20    18
      14    19    17
      11    16    14
      15    20    18
      15    20    18 ];
nobs=3; % indicate the number of repeats over rows
        % because there are 12 rows in x, the row factor has 4 levels
p_an1 = anova2(x,nobs, 'on')

%% unbalanced anova

x = x(:); % convert to a vector
group_var(1) = {[ones(12,1); ones(12,1)*2; ones(12,1)*3]}; % column factor
group_var(2) = {reshape(repmat(1:4,3,3),numel(x),1)};      % row factor 
                                                           % [1; 1; 1; 2; 2; 2; 3; 3; 3; ...]
p_an2 = anovan(x,group_var, 'model', 'interaction' )       % gives the same result

% more than two levels possible and
% lots of other settings, specify fixed and random effects etc. 

%% even better: save as csv and analyze in R or JASP
% ... or any other software that you prefer
tbl = table(group_var{1}, group_var{2}, x,'VariableNames', {'factor1','factor2','data'});
writetable(tbl, '~/Desktop/test.csv', 'Delimiter',',','QuoteStrings',true);
