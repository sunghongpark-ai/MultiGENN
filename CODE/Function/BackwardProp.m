function model = BackwardProp(model)

dLdBabt = (1/model.NumTrain)*model.ZTrain*(model.PabtTrain-model.YabtTrain)';
dLdBgfa = (1/model.NumTrain)*model.ZTrain*(model.PgfaTrain-model.YgfaTrain)';
dLdBnfl = (1/model.NumTrain)*model.ZTrain*(model.PnflTrain-model.YnflTrain)';
dLdBtau = (1/model.NumTrain)*model.ZTrain*(model.PtauTrain-model.YtauTrain)';

dLdZabt = (1/model.NumTrain)*model.Babt*(model.PabtTrain-model.YabtTrain);
dLdZgfa = (1/model.NumTrain)*model.Bgfa*(model.PgfaTrain-model.YgfaTrain);
dLdZnfl = (1/model.NumTrain)*model.Bnfl*(model.PnflTrain-model.YnflTrain);
dLdZtau = (1/model.NumTrain)*model.Btau*(model.PtauTrain-model.YtauTrain);
dLdZ = dLdZabt+dLdZgfa+dLdZnfl+dLdZtau;

dLdOfun = dLdZ.*model.HfunTrain*ones(1,model.NumTrain)'; dLdOphy = dLdZ.*model.HphyTrain*ones(1,model.NumTrain)'; dLdOreg = dLdZ.*model.HregTrain*ones(1,model.NumTrain)';

dLdAfun = model.Sfun.*(dLdOfun-((model.Sfun.*dLdOfun)+(model.Sphy.*dLdOphy)+(model.Sreg.*dLdOreg)));
dLdAphy = model.Sphy.*(dLdOphy-((model.Sfun.*dLdOfun)+(model.Sphy.*dLdOphy)+(model.Sreg.*dLdOreg)));
dLdAreg = model.Sreg.*(dLdOreg-((model.Sfun.*dLdOfun)+(model.Sphy.*dLdOphy)+(model.Sreg.*dLdOreg)));

dLdHfun = dLdZ.*(model.Sfun*ones(1,model.NumTrain)); dLdHphy = dLdZ.*(model.Sphy*ones(1,model.NumTrain)); dLdHreg = dLdZ.*(model.Sreg*ones(1,model.NumTrain));
dLdUfun = dLdHfun*(((model.Dphy+model.Lphy)\(eye(model.NumProtein)-((model.Dphy+model.Lphy)\model.Uphy)))*model.XTrain)'.*eye(model.NumProtein)*ones(1,model.NumProtein)';
dLdUphy = dLdHphy*(((model.Dphy+model.Lphy)\(eye(model.NumProtein)-((model.Dphy+model.Lphy)\model.Uphy)))*model.XTrain)'.*eye(model.NumProtein)*ones(1,model.NumProtein)';
dLdUreg = dLdHreg*(((model.Dreg+model.Lreg)\(eye(model.NumProtein)-((model.Dreg+model.Lreg)\model.Ureg)))*model.XTrain)'.*eye(model.NumProtein)*ones(1,model.NumProtein)';

% Gradient
gBabt = dLdBabt + 2*model.RegCoeff*model.Babt; gBgfa = dLdBgfa + 2*model.RegCoeff*model.Bgfa; gBnfl = dLdBnfl + 2*model.RegCoeff*model.Bnfl; gBtau = dLdBtau + 2*model.RegCoeff*model.Btau;
gAfun = dLdAfun + 2*model.RegCoeff*model.Afun; gAphy = dLdAphy + 2*model.RegCoeff*model.Aphy; gAreg = dLdAreg + 2*model.RegCoeff*model.Areg;
gUfun = dLdUfun + 2*model.RegCoeff*model.Ufun; gUphy = dLdUphy + 2*model.RegCoeff*model.Uphy; gUreg = dLdUreg + 2*model.RegCoeff*model.Ureg;
model.Gradient = [gUfun(:);gUphy(:);gUreg(:);gAfun(:);gAphy(:);gAreg(:);gBabt(:);gBgfa(:);gBnfl(:);gBtau(:)];
