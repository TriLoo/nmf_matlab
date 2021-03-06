clc;
clear;
close all;

% add fusion assessment files
addpath ('/home/smher/myMatlab/RADLW_Saliency/FusionAssess/');

% add algorithms
addpath ('./RADLW_S/');                            % our method
% addpath ('./GFF_1.0/');                          % method -1
% addpath ('./TwoScaleSaliencyDetection2016/');    % method -2
% addpath ('./');                                % method -3, yet no source
% code
% addpath ('./Image-fusion-with-VSM-and-WLS/');    % method -4(VSM + WLS)
% addpath ('./Hybird-MSDFusion/');                 % method -5(Hybrid - MSD)
% addpath ('./FuseTools/')                           % method -6(DWT)

totalNUM = 35;
FA = cell(1, totalNUM);

for pic = 1 : totalNUM
    clear I;
    % Read images
    switch pic
        case 1
    %         Group 1.
            imgA = imread('./datas/source20_1.tif');
            imgB = imread('./datas/source20_2.tif');
        case 2
    %         Group 2.
            imgA = imread('./datas/Marne_04_IR.bmp');
            imgB = imread('./datas/Marne_04_Vis.bmp');
        case 3
            % Group 3.
            imgA = imread('./datas/LWIR-MarnehNew_15RGB_603.tif');
            imgB = imread('./datas/NIR-MarnehNew_15RGB_603.tif');
        case 4
            % Group 4.
            imgA = imread('./datas/7422i.bmp');
            imgB = imread('./datas/7422v.bmp');
        case 5
            % Group 5.
            imgA = imread('./datas/4916i.bmp');
            imgB = imread('./datas/4916v.bmp');
        case 6
            % Group 6.
            imgA = imread('./datas/Farm_IR.bmp');
            imgB = imread('./datas/Farm_Vis.bmp');
        case 7
            % Group 7.
            imgA = imread('./datas/img_00000.bmp');
            imgB = imread('./datas/img_00001.bmp');
            imgA = rgb2gray(imgA);
        case 8
            % Group 8.
            imgA = imread('./datas/IR_meting003_g.bmp');
            imgB = imread('./datas/VIS_meting003_r.bmp');
        case 9
            % Group 9.
            imgA = imread('./datas/Marne_24_IR.bmp');
            imgB = imread('./datas/Marne_24_Vis.bmp');
        case 10
            % Group 10.
            imgA = imread('./datas/Reek_IR.bmp');
            imgB = imread('./datas/Reek_Vis.bmp');
        case 11
            % Group 11.
            imgA = imread('./datas/IR_18rad.bmp');
            imgB = imread('./datas/VIS_18dhvR.bmp');
        case 12
            % Group 12.
            imgA = imread('./datas/Kaptein_1123_IR.bmp');
            imgB = imread('./datas/Kaptein_1123_Vis.bmp');
        case 13
            % Group 13.
            imgA = imread('./datas/Kaptein_1654_IR.bmp');
            imgB = imread('./datas/Kaptein_1654_Vis.bmp');
        case 14
            % Group 14.
            imgA = imread('./datas/1_fk_ge_03_005.bmp');
            imgB = imread('./datas/2_fk_ge_03_005.bmp');
        case 15
            imgA = imread('./datas/Balls_IR.bmp');
            imgB = imread('./datas/Balls_Vis.bmp');
        case 16
            imgA = imread('./datas/LWIR.bmp');
            imgB = imread('./datas/VIS.bmp');
        case 17
            imgA = imread('./datas/1827i.bmp');
            imgB = imread('./datas/1827v.bmp');
        case 18
            imgA = imread('./datas/7416i.bmp');
            imgB = imread('./datas/7416v.bmp');
        case 19
            imgA = imread('./datas/NIR.tif');
            imgB = imread('./datas/VIS.tif');
        case 20
            imgA = imread('./datas/source17_1.tif');
            imgB = imread('./datas/source17_2.tif');
        case 21
            imgA = imread('./datas/4906i.bmp');
            imgB = imread('./datas/4906v.bmp');
        case 22
            imgA = imread('./datas/c_LWIR-MarnehNew_24RGB_1110.tif');
            imgB = imread('./datas/a_VIS-MarnehNew_24RGB_1110.tif');
        case 23
            imgA = imread('./datas/HouseVIS.bmp');
            imgB = imread('./datas/HouseNIR.bmp');
        case 24
            imgA = imread('./datas/IR_37rad.bmp');
            imgB = imread('./datas/VIS_37dhvR.bmp');
        case 25
            imgA = imread('./datas/IR_163rad.bmp');
            imgB = imread('./datas/VIS_163dhvR.BMP');
        case 26
            imgA = imread('./datas/IR_helib_011.bmp');
            imgB = imread('./datas/VIS_helib_011.bmp');
        case 27
            imgA = imread('./datas/IR_meting012-1200_g.bmp');
            imgB = imread('./datas/VIS_meting012-1200_r.bmp');
        case 28
            imgA = imread('./datas/IR_meting055_g.bmp');
            imgB = imread('./datas/VIS_meting055_r.bmp');
        case 29
            imgA = imread('./datas/Marne_09_IR.bmp');
            imgB = imread('./datas/Marne_09_Vis.bmp');
        case 30
            imgA = imread('./datas/Movie_18_IR.bmp');
            imgB = imread('./datas/Movie_18_Vis.bmp');
        case 31
            imgA = imread('./datas/Jeep_IR.bmp');
            imgB = imread('./datas/Jeep_Vis.bmp');
        case 32
            imgA = imread('./datas/IR_fk_06_005.bmp');
            imgB = imread('./datas/VIS_fk_06_005.bmp');
        case 33
            imgA = imread('./datas/source22_1.tif');
            imgB = imread('./datas/source22_2.tif');
        case 34
            imgA = imread('./datas/TankLWIR.tif');
            imgB = imread('./datas/TankVis.tif');
        case 35
            imgA = imread('./datas/IR_lake_g.bmp');
            imgB = imread('./datas/VIS_lake_r.bmp');
        case 36
            imgA = imread('./datas/Jeep_IR.bmp');
            imgB = imread('./datas/Jeep_Vis.bmp');
        case 37
            imgA = imread('./datas/source17_1.tif');
            imgB = imread('./datas/source17_2.tif');
        case 38
            imgA = imread('./datas/source17_1.tif');
            imgB = imread('./datas/source17_2.tif');
        case 39
            imgA = imread('./datas/source17_1.tif');
            imgB = imread('./datas/source17_2.tif');
        case 40
            imgA = imread('./datas/source17_1.tif');
            imgB = imread('./datas/source17_2.tif');
        case 41
            imgA = imread('./datas/source17_1.tif');
            imgB = imread('./datas/source17_2.tif');
        otherwise
            error('Input 1 ~ 35 please.');
    end
    
    if(size(imgA, 3) == 3)
        imgA = rgb2gray(imgA);
    end
    if(size(imgB, 3) == 3)
        imgB = rgb2gray(imgB);
    end
    
    imgA = im2double(imgA);
    imgB = im2double(imgB);
    
    I(:, :, 1) = imgA;
    I(:, :, 2) = imgB;

    % Fusion two input images
    imgRes = RADLW_Fusion(imgA, imgB);    % my algorithms
%     imgRes = GFF(imgA, imgB);
%     imgRes = imageFusion(imgA, imgB);
%     imgRes = WLS_Fusion(imgA, imgB);
%     imgRes = HybridMSDFusion(imgA, imgB);

    imgA = im2uint8(imgA);
    imgB = im2uint8(imgB);
    imgRes = im2uint8(imgRes);

    % Fusion Assess
    FA{pic} = fusionAssess(imgA, imgB, imgRes);
    FA{pic}(11) = FA{pic}(11) / 1000.0;

%     subplot(1, 3, 1);
%     imshow(imgA, []);
%     title('Input A');
% 
%     subplot(1, 3, 2);
%     imshow(imgB, []);
%     title('Input B');
% 
%     subplot(1, 3, 3);
%     imshow(imgRes, []);
%     title('Fusion Result');

    switch pic
        case 1
            imwrite(imgRes, './results/source20.jpg');
        case 2
            imwrite(imgRes, './results/Marne_04.jpg');
        case 3
            imwrite(imgRes, './results/MarnehNew_15RGB_603.jpg');
        case 4
            imwrite(imgRes, './results/7422.jpg');
        case 5
            imwrite(imgRes, './results/4916.jpg');
        case 6
            imwrite(imgRes, './results/Farm.jpg');
        case 7
            imwrite(imgRes, './results/img_00000.jpg');
        case 8
            imwrite(imgRes, './results/meting003.jpg');
        case 9
            imwrite(imgRes, './results/Marne_24.jpg');
        case 10
            imwrite(imgRes, './results/Reek.jpg');
        case 11
            imwrite(imgRes, './results/18rad.jpg');
        case 12
            imwrite(imgRes, './results/Kaptein_1123.jpg');
        case 13
            imwrite(imgRes, './results/Kaptein_1654.jpg');
        case 14
            imwrite(imgRes, './results/fk_ge_03_005.jpg');
        case 15
            imwrite(imgRes, './results/Balls.jpg');
        case 16
            imwrite(imgRes, './results/ThreeMen.jpg');
        case 17
            imwrite(imgRes, './results/1827.jpg');
        case 18
            imwrite(imgRes, './results/7416.jpg');
        case 19
            imwrite(imgRes, './results/House1.jpg');
        case 20
            imwrite(imgRes, './results/source17.jpg');
        case 21
            imwrite(imgRes, './results/4096.jpg');
        case 22
            imwrite(imgRes, './results/MarnehNew_24RGB_1110.jpg');
        case 23
            imwrite(imgRes, './results/House2.jpg');
        case 24
            imwrite(imgRes, './results/37road.jpg');
        case 25
            imwrite(imgRes, './results/163road.jpg');
        case 26
            imwrite(imgRes, './results/helib_011.jpg');
        case 27
            imwrite(imgRes, './results/meting012-1200.jpg');
        case 28
            imwrite(imgRes, './results/meting055.jpg');
        case 29
            imwrite(imgRes, './results/Marne_09.jpg');
        case 30
            imwrite(imgRes, './results/Movie_18.jpg');
        case 31
            imwrite(imgRes, './results/Jeep.jpg');
        case 32
            imwrite(imgRes, './results/Tank1.jpg');
        case 33
            imwrite(imgRes, './results/source22.jpg');
        case 34
            imwrite(imgRes, './results/Tank2.jpg');
        case 35
            imwrite(imgRes, './results/lake1.jpg');
        case 36
            imwrite(imgRes, './results/Jeep.jpg');
        case 37
            imwrite(imgRes, './results/source17.jpg');
        case 38
            imwrite(imgRes, './results/source17.jpg');
        case 39
            imwrite(imgRes, './results/source17.jpg');
        case 40
            imwrite(imgRes, './results/source17.jpg');
        case 41
            imwrite(imgRes, './results/source17.jpg');
        otherwise
            error('Not correct selection.');
    end
    
    fprintf('\r\n %d -th image done.\r\n', pic);

end

disp 'done.!'



