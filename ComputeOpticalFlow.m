function [] = ComputeOpticalFlow(numOfFrames)
inputFramesFolder = fullfile('C:\Users\srish\Downloads\dip\Code_CrowdFlow_Segmentation\Frames');
outputFolder = fullfile(cd, 'OpticalFlows');
outputFolder1 = fullfile(cd, 'OpticalFlowsImage');

if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

if ~exist(outputFolder1, 'dir')
    mkdir(outputFolder1);
end

video_frames_filenames = dir(['C:\Users\srish\Downloads\dip\Code_CrowdFlow_Segmentation\Frames', '\*.png']);

for t = 1 : numOfFrames
    img1_filename = fullfile ( inputFramesFolder, video_frames_filenames(t).name );
    img2_filename = fullfile ( inputFramesFolder, video_frames_filenames(t+1).name );
    img1 = imread(img1_filename);
    img2 = imread(img2_filename);
    
    [u, v] =optic_flow_brox(img1, img2);
    opt_flow = [u, v];
    %save flow1.mat opt_flow;
    %imwrite(opt_flow,'flow1.png');
    %currentFrame = read(inputVideo, t);    
    opBaseFileName = sprintf('%3.3d.png', t);
    opFullFileName = fullfile(outputFolder1, opBaseFileName);
    imwrite(opt_flow, opFullFileName, 'png'); 
    
    matFTLEFileName = fullfile ( outputFolder, sprintf('OpticalFlow%3.3d.mat', t ));

% save(matFTLEFileName, 'ftle_options', 'xflowmap', 'yflowmap', 'xFX', 'yFX', 'xFY', 'yFY', 'sigma');
save(matFTLEFileName, 'opt_flow');
end
