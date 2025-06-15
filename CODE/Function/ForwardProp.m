function model = ForwardProp(model)

model.HfunTrain = (model.Dfun+model.Lfun)\model.Dfun*model.XTrain; model.HfunValid = (model.Dfun+model.Lfun)\model.Dfun*model.XValid; model.HfunTest = (model.Dfun+model.Lfun)\model.Dfun*model.XTest;
model.HphyTrain = (model.Dphy+model.Lphy)\model.Dphy*model.XTrain; model.HphyValid = (model.Dphy+model.Lphy)\model.Dphy*model.XValid; model.HphyTest = (model.Dphy+model.Lphy)\model.Dphy*model.XTest;
model.HregTrain = (model.Dreg+model.Lreg)\model.Dreg*model.XTrain; model.HregValid = (model.Dreg+model.Lreg)\model.Dreg*model.XValid; model.HregTest = (model.Dreg+model.Lreg)\model.Dreg*model.XTest;

model.ZTrain = ((model.Sfun*ones(1,model.NumTrain)).*model.HfunTrain)+((model.Sphy*ones(1,model.NumTrain)).*model.HphyTrain)+((model.Sreg*ones(1,model.NumTrain)).*model.HregTrain);
model.ZValid = ((model.Sfun*ones(1,model.NumValid)).*model.HfunValid)+((model.Sphy*ones(1,model.NumValid)).*model.HphyValid)+((model.Sreg*ones(1,model.NumValid)).*model.HregValid);
model.ZTest = ((model.Sfun*ones(1,model.NumTest)).*model.HfunTest)+((model.Sphy*ones(1,model.NumTest)).*model.HphyTest)+((model.Sreg*ones(1,model.NumTest)).*model.HregTest);

model.PabtTrain = 1./(1+exp((-1)*(model.Babt'*model.ZTrain))); model.PabtValid = 1./(1+exp((-1)*(model.Babt'*model.ZValid))); model.PabtTest = 1./(1+exp((-1)*(model.Babt'*model.ZTest)));
model.PgfaTrain = 1./(1+exp((-1)*(model.Bgfa'*model.ZTrain))); model.PgfaValid = 1./(1+exp((-1)*(model.Bgfa'*model.ZValid))); model.PgfaTest = 1./(1+exp((-1)*(model.Bgfa'*model.ZTest)));
model.PnflTrain = 1./(1+exp((-1)*(model.Bnfl'*model.ZTrain))); model.PnflValid = 1./(1+exp((-1)*(model.Bnfl'*model.ZValid))); model.PnflTest = 1./(1+exp((-1)*(model.Bnfl'*model.ZTest)));
model.PtauTrain = 1./(1+exp((-1)*(model.Btau'*model.ZTrain))); model.PtauValid = 1./(1+exp((-1)*(model.Btau'*model.ZValid))); model.PtauTest = 1./(1+exp((-1)*(model.Btau'*model.ZTest)));