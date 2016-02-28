totaldata=[Xtrain;Xtest];
%% extract feasible features
data(:,1:3172)=totaldata(:,provideIdx(1:3172));
%% center data
for i=1:1502
    D(i,:)=data(i,:)-mean(data);
end
%% find covariance
cov=D'*D/1502;
%% do PCA
PCN=50;
[evector,~]=svds(cov,PCN);
%% project data
weights=data*evector;
testweights=provideData*evector;
%% build model and predict
for i=1:2731
    i
    x=weights;
    y=totaldata(:,missIdx(i));
    model=fitlm(x,y);
    prediction1(:,i)=predict(model,testweights);
end
