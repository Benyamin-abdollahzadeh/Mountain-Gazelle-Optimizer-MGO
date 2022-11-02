function cofi = Coefficient_Vector(dim,Iter,MaxIter)

    a2=-1+Iter*((-1)/MaxIter);
    u=randn(1,dim);
    v=randn(1,dim); 

    cofi(1,:)=rand(1,dim);
    cofi(2,:)= (a2+1)+rand;
    cofi(3,:)= a2.*randn(1,dim);
    cofi(4,:)= u.*v.^2.*cos((rand*2)*u);
            
end