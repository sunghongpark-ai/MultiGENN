function init = ModelInit(model,index)

init.IdxIter = model.IdxIter;

init.Xdata = model.Dataset.Xdata;
init.Yabt = model.Dataset.Yabt;
init.Ygfa = model.Dataset.Ygfa;
init.Ynfl = model.Dataset.Ynfl;
init.Ytau = model.Dataset.Ytau;

[init.NumProtein,init.NumSubject] = size(init.Xdata);
init.Wphy = model.Dataset.Wphy; init.Lphy = GraphLaplacian(model.Dataset.Wphy,init.NumProtein);
init.Wfun = model.Dataset.Wfun; init.Lfun = GraphLaplacian(model.Dataset.Wfun,init.NumProtein);
init.Wreg = model.Dataset.Wreg; init.Lreg = GraphLaplacian(model.Dataset.Wreg,init.NumProtein);

init.IdxTrain = model.Index.Train{index}; init.NumTrain = length(init.IdxTrain);
init.IdxValid = model.Index.Valid{index}; init.NumValid = length(init.IdxValid);
init.IdxTest = model.Index.Test{index}  ; init.NumTest = length(init.IdxTest)  ;

init.XTrain = init.Xdata(:,init.IdxTrain); init.XValid = init.Xdata(:,init.IdxValid); init.XTest = init.Xdata(:,init.IdxTest);
init.YabtTrain = init.Yabt(init.IdxTrain); init.YabtValid = init.Yabt(init.IdxValid); init.YabtTest = init.Yabt(init.IdxTest);
init.YgfaTrain = init.Ygfa(init.IdxTrain); init.YgfaValid = init.Ygfa(init.IdxValid); init.YgfaTest = init.Ygfa(init.IdxTest);
init.YnflTrain = init.Ynfl(init.IdxTrain); init.YnflValid = init.Ynfl(init.IdxValid); init.YnflTest = init.Ynfl(init.IdxTest);
init.YtauTrain = init.Ytau(init.IdxTrain); init.YtauValid = init.Ytau(init.IdxValid); init.YtauTest = init.Ytau(init.IdxTest);

init.MaxEpoch = model.Parameter.MaxEpoch; init.LearnRate = model.Parameter.LearnRate; init.RegCoeff = model.Parameter.RegCoeff;