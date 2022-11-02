

function [BestF,BestX,cnvg]=MGO(N,MaxIter,LB,UB,dim,fobj)

lb=ones(1,dim).*LB;  
ub=ones(1,dim).*UB;

%Initialize the first random population of Gazelles 
X=initialization(N,dim,UB,LB);

% initialize Best Gazelle
BestX=[];
BestFitness=inf;


for i=1:N   
    
    % Calculate the fitness of the population
    Sol_Cost(i,:)=fobj(X(i,:));%#ok
    
    % Update the Best Gazelle if needed
    if Sol_Cost(i,:)<=BestFitness 
        BestFitness=Sol_Cost(i,:); 
        BestX=X(i,:);
    end
end

%mainloop
    for Iter=1:MaxIter
        for i=1:N
            
            RandomSolution=randperm(N,ceil(N/3));
            M=X(randi([(ceil(N/3)),N]),:)*floor(rand)+mean(X(RandomSolution,:)).*ceil(rand);     
            
            % Calculate the vector of coefficients
            cofi = Coefficient_Vector(dim,Iter,MaxIter);
            
            A=randn(1,dim).*exp(2-Iter*(2/MaxIter));
            D=(abs(X(i,:)) + abs(BestX))*(2*rand-1);
                       
            % Update the location
            NewX = Solution_Imp(X,BestX,lb,ub,N,cofi,M,A,D,i); 
            
            % Cost function calculation and Boundary check
            [NewX , Sol_CostNew] = Boundary_Check(NewX,fobj,LB,UB);
            
            % Adding new gazelles to the herd
            X=[X; NewX];       %#ok
            Sol_Cost=[Sol_Cost; Sol_CostNew];%#ok
            [~,idbest]=min(Sol_Cost);
            BestX=X(idbest,:);
            
        end
        
        % Update herd
        [Sol_Cost, SortOrder]=sort(Sol_Cost);
        X=X(SortOrder,:);
        [BestFitness,idbest]=min(Sol_Cost);   
        BestX=X(idbest,:);
        X=X(1:N,:);
        Sol_Cost=Sol_Cost(1:N,:);
        cnvg(Iter)=BestFitness;%#ok
        BestF=BestFitness;
    end
end
