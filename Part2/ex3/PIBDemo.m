function varargout = PIBDemo(varargin)
% PIBDEMO MATLAB code for PIBDemo.fig
%      PIBDEMO,edit by itself, creates a new PIBDEMO or raises the existing
%      singleton*.
%
%      H = PIBDEMO returns the handle to a new PIBDEMO or the handle to
%      the existing singleton*.
%
%      PIBDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIBDEMO.M with the given input arguments.
%
%      PIBDEMO('Property','Value',...) creates a new PIBDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PIBDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PIBDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PIBDemo

% Last Modified by GUIDE v2.5 12-Mar-2018 19:13:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PIBDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @PIBDemo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before PIBDemo is made visible.
function PIBDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PIBDemo (see VARARGIN)

% Choose default command line output for PIBDemo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PIBDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PIBDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = imread('face7.jpg');
axes(handles.axes1);
imshow(I); 
title( sprintf('Input Image') );


axes(handles.axes2);
imhist(I); title('Histogram');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I   = imread('face7.jpg');
%IG  = imread('oculos.png');

FaceDetect = vision.CascadeObjectDetector; 
FaceDetect.MergeThreshold = 5 ;
%shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 255]);
bbox = step(FaceDetect, I);
Iout = insertObjectAnnotation(I,'rectangle',bbox,'Face');

% Draw boxes around detected faces and display results
%I_faces = step(shapeInserter, I, int32(bbox));

%BB = step(faceDetector,I);

%for i = 1 :size(BB,1)
    %J = imcrop(I,BB(i, :));
%end

%[rows, cols, chans] = size(J);
%IG = imresize(IG,[rows cols]);

%C = imfuse(J,IG,'blend','Scaling','joint');

%Transparency = 0.6;
%fontColor = [1,1,1];
%position = [0,0];

%mask = zeros(size(I),'like',I);
%outimg = insertText(mask,position,'PIB Mark', ...
%    'BoxOpacity',0,...
%    'FontSize',40,...
%    'TextColor', 'white');

%bwMask = imbinarize(rgb2gray(outimg));

%finalImg = labeloverlay(I,bwMask,...
%    'Transparency',Transparency,...
%    'Colormap',fontColor);

axes(handles.axes3);
imshow(Iout);
title( sprintf('Output Image') );
axes(handles.axes4);
imhist(Iout); title('Histogram');
