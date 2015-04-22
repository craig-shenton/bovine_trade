

figure(1); % test plot
plot(dates,poland)

% Exponential fit
x_to_fit = (1:38);                      % month 38 = Feb 2013
y_to_fit = poland(1:38);                % select pre-scare data to model
f = fit(x_to_fit',y_to_fit','exp1');    % fit exponential curve to data
f_cut = cat(1,f(1:38),nan(1,59-38)');   % fill rest with NaNs for plotting

mdl = fitlm(Poland(1:38),f_cut(1:38))   % test goodness of fit (R^2)

figure(2);
hold
plot(dates,poland)
plot(dates,f_cut)
legend('Observed Values', 'Model Fit')
ylabel('Percent of UK imports from Poland','FontSize',14) % label for y axis
xlabel('Year','FontSize',14)            % label for x axis
set(gca, 'FontSize', 14)                % set plot font to 14

% model specification
% y(x) = \alpha*exp(\betax)
% \alpha = 0.0038
% \beta = 0.063
% R^{2} = 0.85

