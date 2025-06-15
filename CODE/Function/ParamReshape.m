function model = ParamReshape(model)

sizeUfun = model.SizeParam(1,:) ; start = 1                    ; finish = prod(sizeUfun)        ; model.Ufun = reshape(model.WeightParam(start:finish),sizeUfun);
sizeUphy = model.SizeParam(2,:) ; start = start+prod(sizeUfun) ; finish = finish+prod(sizeUphy) ; model.Uphy = reshape(model.WeightParam(start:finish),sizeUphy);
sizeUreg = model.SizeParam(3,:) ; start = start+prod(sizeUphy) ; finish = finish+prod(sizeUreg) ; model.Ureg = reshape(model.WeightParam(start:finish),sizeUreg);
sizeAfun = model.SizeParam(4,:) ; start = start+prod(sizeUreg) ; finish = finish+prod(sizeAfun) ; model.Afun = reshape(model.WeightParam(start:finish),sizeAfun);
sizeAphy = model.SizeParam(5,:) ; start = start+prod(sizeAfun) ; finish = finish+prod(sizeAphy) ; model.Aphy = reshape(model.WeightParam(start:finish),sizeAphy);
sizeAreg = model.SizeParam(6,:) ; start = start+prod(sizeAphy) ; finish = finish+prod(sizeAreg) ; model.Areg = reshape(model.WeightParam(start:finish),sizeAreg);
sizeBabt = model.SizeParam(7,:) ; start = start+prod(sizeAreg) ; finish = finish+prod(sizeBabt) ; model.Babt = reshape(model.WeightParam(start:finish),sizeBabt);
sizeBgfa = model.SizeParam(8,:) ; start = start+prod(sizeBabt) ; finish = finish+prod(sizeBgfa) ; model.Bgfa = reshape(model.WeightParam(start:finish),sizeBgfa);
sizeBnfl = model.SizeParam(9,:) ; start = start+prod(sizeBgfa) ; finish = finish+prod(sizeBnfl) ; model.Bnfl = reshape(model.WeightParam(start:finish),sizeBnfl);
sizeBtau = model.SizeParam(10,:); start = start+prod(sizeBnfl) ; finish = finish+prod(sizeBtau) ; model.Btau = reshape(model.WeightParam(start:finish),sizeBtau);

model.Dfun = diag(model.Ufun); model.Dphy = diag(model.Uphy); model.Dreg = diag(model.Ureg);
Appi = [model.Afun,model.Aphy,model.Areg]; Sppi = exp(Appi)./sum(exp(Appi),2);
model.Sfun = Sppi(:,1); model.Sphy = Sppi(:,2); model.Sreg = Sppi(:,3);