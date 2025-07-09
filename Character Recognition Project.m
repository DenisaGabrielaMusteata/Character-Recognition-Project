function imageGUI()
% Creating the GUI window
fig = uifigure('Name', 'Character Recognition');
btnS = uibutton(fig, 'push', 'Text', 'Select Image', 'Position', [50 50 150 22], 'ButtonPushedFcn', @(btn,event) selectImage());
btnC = uibutton(fig, 'push', 'Text', 'Capture Image', 'Position', [220 50 150 22], 'ButtonPushedFcn', @(btn,event) captureImage());
btnProcess = uibutton(fig, 'push', 'Text', 'Process Image', 'Position', [390 50 150 22], 'ButtonPushedFcn', @(btn,event) processImage());
btnProcess.BackgroundColor = [0.85 0.93 0.54];
btnS.BackgroundColor = [0.76 0.9 0.91];
btnC.BackgroundColor = [0.85 0.76 0.91];

% Changing the font size of the buttons
btnS.FontSize = 12;
btnC.FontSize = 12;
btnProcess.FontSize = 12;

% UI axes for displaying the image in the GUI window
ax = uiaxes(fig, 'Position', [50 200 500 200]);

% Text area for displaying the recognized text
txt = uitextarea(fig, 'Position', [100 100 350 100]);

% Select image
    function selectImage()
        % Select an image from the computer
        [filename, filepath] = uigetfile({'.jpg;.jpeg;*.png'}, 'Select an image');
        % Check if the user selected an image
        if isequal(filename,0) || isequal(filepath,0)
            disp('You did not select any image.');
        else
            % Read the selected image
            img = imread(fullfile(filepath, filename));
            % Display the image in the UI axes
            imshow(img, 'Parent', ax);
        end
    end

% Capture image
    function captureImage()
        % Create webcam object
        cam = webcam(1); % 1 to select the first available camera

        % Capture image
        img = snapshot(cam);

        % Display image
        imshow(img, 'Parent', ax);

        % Clear the captured camera information
        clear cam;
    end

% Process image
function processImage()
% Read the image from the UI axes
img = getimage(ax);

% Check if the image is RGB or grayscale and convert if needed
if ismatrix(img)
    disp('The image is grayscale');
    grayImg = img;
elseif ndims(img) == 3 && size(img, 3) == 3
    disp('The image is RGB');
    grayImg = rgb2gray(img);
else
    disp('The image format is not suitable. It has been converted.');
    grayImg = rgb2gray(img);
    grayImg = repmat(grayImg, [1 1 3]);
end

% Adjust the contrast and resize the image
grayImgB= imresize(grayImg, 3.5, 'nearest');

% Initialize character recognition (OCR - optical character recognition)
ocrResults = ocr(grayImgB);

% Extract the recognized text
recognizedText = ocrResults.Text;

% Display the recognized text in the text area
txt.Value = recognizedText;

end

end