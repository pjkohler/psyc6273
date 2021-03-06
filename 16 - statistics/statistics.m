%% topic16code.m  Illustration of some statistical functions


%% normal distribution
figure(1); set(gcf,'Name','normal');
subplot(2,2,1); fplot( @(x) normpdf(x,0,1) , [ -3 3 ]);  title('pdf');
subplot(2,2,2); fplot( @(x) normcdf(x,0,1) , [ -3 3 ]);  title('cdf');
subplot(2,2,3); fplot( @(x) norminv(x,0,1) , [  0 1 ]);  title('inv');
subplot(2,2,4); hist(       normrnd(0,1,[ 10000 1 ]));   title('rnd');


%% Student's t-distribution
figure(2); set(gcf,'Name','student''s t');
subplot(2,2,1); fplot( @(x) tpdf(x,5) , [ -3 3 ]);  title('pdf');
subplot(2,2,2); fplot( @(x) tcdf(x,5) , [ -3 3 ]);  title('cdf');
subplot(2,2,3); fplot( @(x) tinv(x,5) , [  0 1 ]);  title('inv');
subplot(2,2,4); hist(       trnd(5,[ 10000 1 ]));   title('rnd');


%% t-test
x   = 10+3*randn([ 1 20 ]);   % make up some data
mu0 = 10;                     % hypothesize a mean
n   = numel(x);               % count the data points
muhat    = mean(x);           % get the sample mean
sigmahat = std(x);            % get the sample standard deviation
t  = (muhat-mu0)/(sigmahat/sqrt(n)); % calculate the t statistic
plow  =   tcdf(t,n-1)         % probability that t is at least this low
phigh = 1-tcdf(t,n-1)         % probability that t is at least this high
p2    = tcdf(-abs(t),n-1) + (1-tcdf(abs(t),n-1)) % probability that t is at least this far from zero


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

