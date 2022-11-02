
function NewX = Solution_Imp(X,BestX,lb,ub,N,cofi,M,A,D,i)

    NewX(1,:)=(ub-lb)*rand+lb;
    NewX(2,:)=BestX-abs((randi(2)*M-randi(2)*X(i,:)).*A).*cofi(randi(4),:);
    NewX(3,:)=(M+cofi(randi(4),:))+(randi(2)*BestX-randi(2).*X((randi(N)),:)).*cofi(randi(4),:);
    NewX(4,:)=(X(i,:)-D)+(randi(2)*BestX-randi(2)*M).*cofi(randi(4),:);
            
end