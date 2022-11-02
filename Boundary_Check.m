function [NewX , Sol_CostNew] = Boundary_Check(NewX,fobj,LB,UB)

    for j=1:4
        NewX(j,:) = boundaryCheck(NewX(j,:), LB, UB);
        Sol_CostNew(j,:)=fobj(NewX(j,:));%#ok
    end
            
end