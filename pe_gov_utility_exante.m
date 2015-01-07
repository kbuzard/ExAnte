g = [1:.001:7/4];

W = 9/98 + 8*g/98 + ((8*g - 8)/49).*(8*g - 5)./(4.*(17-2*g)) + (2.*(2*g-17) + 9)/49 .* (8*g - 5)./(4.*(17-2*g)).^2;

plot(g,W);

%unilateral
t = (8*g - 5)./(4.*(17-2*g));
gtn = (68*t + 5)./(8.*(1+t));

PSx = ((2 +2*t).^2)/49;
CSx = .5*((3 -4*t).^2)/49;
TR = (t - 6*t.^2)/7;
CSy = ((3 +3*t).^2)/98;
PSy = ((4 -3*t).^2)/98;

w = 1./(4+g);
w = 1;

W = w.*CSx + g.*w.*PSx + w.*CSy + w.*PSy + w.*TR;
plot(g,W);

%efficient tariff
te = (4*g - 4)./(25-4*g);
gte = (25*t + 4)./(4+4*t);

PSxe = ((2 +2*te).^2)/49;
CSxe = .5*((3 -4*te).^2)/49;
TRe = (te - 6*te.^2)/7;
CSye = ((3 +3*te).^2)/98;
PSye = ((4 -3*te).^2)/98;

w = 1./(4+g);

We = w.*CSxe + g.*w.*PSxe + w.*CSye + w.*PSye + w.*TRe;
plot(g,We);


%add in ex-ante lobbying (that is, another profit term
tea = (4*g)./(21-4*g);

PSxea = ((2 +2*tea).^2)/49;
CSxea = .5*((3 -4*tea).^2)/49;
TRea = (te - 6*tea.^2)/7;
CSyea = ((3 +3*tea).^2)/98;
PSyea = ((4 -3*tea).^2)/98;

w = 1./(4+g);

Wea = w.*CSxea + g.*w.*PSxea + w.*CSyea + w.*PSyea + w.*TRea;
plot(g,Wea);



diff = We - W;
plot(g,diff)

function createaxes(Parent1, g, [We;)
%CREATEAXES(PARENT1, X1, YMATRIX1)
%  PARENT1:  axes parent
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 11-Apr-2014 11:46:22

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
%% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[1 1.75]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0.0854 0.087]);

% Create axes
axes1 = axes;
%% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[1 1.75]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0.42 0.5]);
box(axes1,'on');
hold(axes1,'all');

% Create multiple lines using matrix input to plot
plot1 = plot(g,[We;W],'Parent',axes1,'LineWidth',1);
set(plot1(1),'LineStyle','--','DisplayName','Trade Agreement Tariffs',...
    'Color',[0 0 0]);
set(plot1(2),'DisplayName','Non-Cooperative Tariffs');

% Create title
title('Government Welfare with Weighted Objective Function',...
    'FontWeight','demi',...
    'FontSize',12);

% Create xlabel
xlabel('\gamma','FontSize',12);

% Create ylabel
ylabel('Government Welfare','FontSize',12);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.184523809523809 0.774603174603175 0.348214285714286 0.1]);


