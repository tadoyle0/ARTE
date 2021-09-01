%% STL to MATLAB
model = createpde(3);
gm = importGeometry(model, "Link_1 v2.stl")
pdegplot(gm)