%% topic16code.m  Illustration of some statistical functions


%% normal distribution
figure(1); set(gcf,'Name','normal');
subplot(2,2,1); fplot( @(x) normpdf(x,0,1) , [ -3 3 ]);  title('pdf');
subplot(2,2,2); fplot( @(x) normcdf(x,0,1) , [ -3 3 ]);  title('cdf');
subplot(2,2,3); fplot( @(x) norminv(x,0,1) , [  0 1 ]);  title('inv');
subplot(2,2,4); histogram(       normrnd(0,1,[ 10000 1 ]), 20); set(gca,'xlim',[-4,4]);  title('rnd');


%% Student's t-distribution
figure(2); set(gcf,'Name','student''s t');
n = 20;
subplot(2,2,1); fplot( @(x) tpdf(x, df) , [ -3 3 ]);  title('pdf');
subplot(2,2,2); fplot( @(x) tcdf(x, df) , [ -3 3 ]);  title('cdf');
subplot(2,2,3); fplot( @(x) tinv(x, df) , [  0 1 ]);  title('inv');
subplot(2,2,4); histogram(       trnd(df ,[ 10000 1 ]), 20);   set(gca,'xlim',[-4,4]);  title('rnd');


%% t-test
x   = 10+3*randn([ 1 n ]);                          % make up some data
mu0 = 10;                                           % hypothesize a mean
muhat    = mean(x);                                 % get the sample mean
sigmahat = std(x);                                  % get the sample standard deviation
t  = (muhat-mu0)/(sigmahat/sqrt(n));                % calculate the t statistic
plow  =   tcdf(t,n-1)                               % probability that t is at least this low (left-tailed test)
phigh = 1-tcdf(t,n-1)                               % probability that t is at least this high (right-tailed test)
p2    = tcdf(-abs(t),n-1) + (1-tcdf(abs(t),n-1))    % probability that t is at least this far from zero (two-tailed test)

% use matlab's ttest function:
[t_sig, t_p, t_ci, stat] = ttest(x, 10)

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
nobs=3;
p=anova2(x,nobs)

