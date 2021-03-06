function [hatC,cost]=main(A,B,s1,d2,show)

C=[A,B];
szA=size(A);
n=szA(2);
szB=size(B);
d=szB(2);
% step 1: compute the sketch version
SC=countSketch(C,s1);

if show==1
    disp(SC);
end
% step 2: compute leverage score sampling matrix D_1 according to columns of S_1 C
%CD=slowLeverageScoreSampling(SC',d1)';
%omit this step now

CD=C;

% step 3: compute the leverage score sampling matrix D_2 according to rows of C D_1
%DD=slowLeverageScoreMatrix(CD,d2);


DC=slowLeverageScoreSampling(C,d2);
%DC=fastLeverageScoreSampling(C,d2);

% step 4: solve the small size problem
Z=rankOptimize(DC,DC,SC,n);

hatC=CD*Z*SC;


hatA=hatC(:,1:n);
hatB=hatC(:,n+1,n+d);
[X,cc]=leastSquare(X,cc);
cost=cc;

%V=hatC-C;
%cost=sum(sum(V.^2));


% compare to optimal solution
% hatX=rankOptimize(B,A,eye(d),d);
end