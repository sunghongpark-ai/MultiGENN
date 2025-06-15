clc;clear;

addpath("./Function");

load('Dataset.mat');
Parameter.NumIter = 100;
Parameter.NumFold = 5;
Parameter.MaxEpoch = 500;
Parameter.LearnRate = 0.001;
Parameter.RegCoeff = 0.005;

for IdxIter = 1:Parameter.NumIter

    RandStream.setGlobalStream(RandStream('mt19937ar','Seed',IdxIter))
    MdlIter.IdxIter = IdxIter; MdlIter.Dataset = Dataset;
    MdlIter.Parameter = Parameter; MdlIter.Index = DataIndex(MdlIter);

    for IdxMdl = 1:MdlIter.Index.NumMdl
        MdlInit = ModelInit(MdlIter,IdxMdl); MdlInit = ParamInit(MdlInit);
        MdlInit.AdamParam = AdamInit(MdlInit.NumParam,MdlInit.LearnRate);
        MdlTrain = ParamTrain(MdlInit);
    end

end