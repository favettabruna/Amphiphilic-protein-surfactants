%% Use raw data containing radius of droplets from findcircles() on tiles

% Convert Pixel to um
C = 0.093015873;

CBM = CB.*C;
CAM = CA.*C;
OBM = OB.*C;
OAM = OA.*C;
FBM = FB.*C;
FAM = FA.*C;
EBM = EB.*C;
EAM = EA.*C;
EBM2 = EB2.*C;
EAM2 = EA2.*C;

% Make structure with data
s = struct('ControlBefore',CBM,'ControlAfter',CAM,'OneBefore',OBM,'OneAfter',OAM,'FiveBefore',FBM,'FiveAfter',FAM,'ExpBefore2',EBM2,'ExpAfter2',EAM2);

% Plot violins
figure
vs = violinplot(s);
vs(1).ViolinColor = [95,122,185]/255;
vs(2).ViolinColor = [162,181,222]/255;
vs(3).ViolinColor = [243,167,59]/255;
vs(4).ViolinColor = [243,219,186]/255;
vs(5).ViolinColor = [153,87,148]/255;
vs(6).ViolinColor = [212,152,187]/255;
vs(7).ViolinColor = [15,140,68]/255;
vs(8).ViolinColor = [130,199,118]/255;