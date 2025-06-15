function CVdata = DataIndex(model)

CVdata.NumMdl = (model.Parameter.NumFold)*(model.Parameter.NumFold-1);

idx = 0; CVfoldTrain = cell(CVdata.NumMdl,1); CVfoldValid = cell(CVdata.NumMdl,1); CVfoldTest = cell(CVdata.NumMdl,1);
for IDXtest = 1:model.Parameter.NumFold
    FoldList = [1:model.Parameter.NumFold]; FoldTest = IDXtest; FoldList(IDXtest) = [];
    for IDXvalid = 1:length(FoldList)
        FoldValid = FoldList(IDXvalid); FoldTrain = FoldList; FoldTrain(IDXvalid) = [];
        idx = idx+1; CVfoldTrain{idx} = FoldTrain; CVfoldValid{idx} = FoldValid; CVfoldTest{idx} = FoldTest;
    end
end

IndexTrain = cell(CVdata.NumMdl,1); IndexValid = cell(CVdata.NumMdl,1); IndexTest = cell(CVdata.NumMdl,1);
for idx = 1:CVdata.NumMdl
    IndexTrain{idx} = find(contains(string(model.Dataset.CVindex(model.IdxIter,:)),string(CVfoldTrain{idx}))==1);
    IndexValid{idx} = find(contains(string(model.Dataset.CVindex(model.IdxIter,:)),string(CVfoldValid{idx}))==1);
    IndexTest{idx} = find(contains(string(model.Dataset.CVindex(model.IdxIter,:)),string(CVfoldTest{idx}))==1);
end
CVdata.Train = IndexTrain; CVdata.Valid = IndexValid; CVdata.Test = IndexTest;