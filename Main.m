% Mountain Gazelle Optimizer
% Read the following publication first and cite if you use it
% @article{abdollahzadeh2021african,
%   title={Mountain Gazelle Optimizer: A new Nature-inspired Metaheuristic Algorithm for Global Optimization Problems},
%   author={Abdollahzadeh, Benyamin and Gharehchopogh, Farhad Soleimanian and Khodadadi, Nima and Mirjalili, Seyedali},
%   journal={Advances in Engineering Software},
%   pages={.....},
%   year={2022},
%   publisher={Elsevier},
%   url = {.........}
% }

clear all %#ok
clc

SearchAgents_no=30; % Number of search agents

Function_name='F23'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=500; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,MGO_cg_curve]=MGO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);


% Best convergence curve
semilogy(MGO_cg_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('MGO')

display(['The best solution obtained by MGO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by MGO is : ', num2str(Best_score)]);
