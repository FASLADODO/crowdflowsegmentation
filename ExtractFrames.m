%cd('C:\Users\srish\OneDrive\Documents\MATLAB\Project');
inputVideo = VideoReader('C:\Users\srish\Dropbox\sbasavaraju1\myProject\Project\Hajj009.wmv');
outputFolder = fullfile(cd, 'Frames');

if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

numFrames = inputVideo.NumberOfFrames;

for t = 1 : numFrames
    currentFrame = read(inputVideo, t);    
    opBaseFileName = sprintf('%3.3d.png', t);
    opFullFileName = fullfile(outputFolder, opBaseFileName);
    imwrite(currentFrame, opFullFileName, 'png'); 
end
ComputeOpticalFlow(numFrames);
