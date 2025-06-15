function model = ParamInit(model)

RandStream.setGlobalStream(RandStream('mt19937ar','Seed',model.IdxIter))

Ufun = zeros(model.NumProtein,1); sizeUfun = size(Ufun); model.Ufun = ones(sizeUfun);
Uphy = zeros(model.NumProtein,1); sizeUphy = size(Uphy); model.Uphy = ones(sizeUphy);
Ureg = zeros(model.NumProtein,1); sizeUreg = size(Ureg); model.Ureg = ones(sizeUreg);

Afun = zeros(model.NumProtein,1); sizeAfun = size(Afun); model.Afun = zeros(sizeAfun);
Aphy = zeros(model.NumProtein,1); sizeAphy = size(Aphy); model.Aphy = zeros(sizeAphy);
Areg = zeros(model.NumProtein,1); sizeAreg = size(Areg); model.Areg = zeros(sizeAreg);

Babt = zeros(model.NumProtein,1); sizeBabt = size(Babt); model.Babt = (2*rand(sizeBabt)-1)*sqrt(6/sum(sizeBabt));
Bgfa = zeros(model.NumProtein,1); sizeBgfa = size(Bgfa); model.Bgfa = (2*rand(sizeBgfa)-1)*sqrt(6/sum(sizeBgfa));
Bnfl = zeros(model.NumProtein,1); sizeBnfl = size(Bnfl); model.Bnfl = (2*rand(sizeBnfl)-1)*sqrt(6/sum(sizeBnfl));
Btau = zeros(model.NumProtein,1); sizeBtau = size(Btau); model.Btau = (2*rand(sizeBtau)-1)*sqrt(6/sum(sizeBtau));

model.SizeParam = [sizeUfun;sizeUphy;sizeUreg;sizeAfun;sizeAphy;sizeAreg;sizeBabt;sizeBgfa;sizeBnfl;sizeBtau];
model.NumParam = prod(sizeUfun)+prod(sizeUphy)+prod(sizeUreg)+prod(sizeAfun)+prod(sizeAphy)+prod(sizeAreg)+prod(sizeBabt)+prod(sizeBgfa)+prod(sizeBnfl)+prod(sizeBtau);
model.WeightParam = [model.Ufun(:);model.Uphy(:);model.Ureg(:);model.Afun(:);model.Aphy(:);model.Areg(:);model.Babt(:);model.Bgfa(:);model.Bnfl(:);model.Btau(:)];
model.WeightEpoch = cell(model.MaxEpoch,1); model.LossTrain = zeros(model.MaxEpoch,1); model.LossValid = zeros(model.MaxEpoch,1);



