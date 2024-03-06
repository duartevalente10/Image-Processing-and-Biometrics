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
I = imread('flowers.bmp');
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
I = imread('flowers.bmp');
%IB = imadjust(I);
%BW = im2bw(IB,0.4);
%rgbImage = ind2rgb(I, colormap);
[row,col]=size(I);
for i=1:1:row
    for j=1:1:col
        if (I(i,j)>= 0) && (I(i,j)< 90)
            red(i,j)=0;
            green(i,j)=100;
            blue(i,j)=200;    
        elseif (I(i,j)>= 90) && (I(i,j)< 108)
            red(i,j)=0;
            green(i,j)=150;
            blue(i,j)=150;
        elseif (I(i,j)>= 108) && (I(i,j)< 144)
            red(i,j)=100;
            green(i,j)=100;
            blue(i,j)=100;
        elseif (I(i,j)>= 144) && (I(i,j)< 198)
            red(i,j)=150;
            green(i,j)=150;
            blue(i,j)=0;
        elseif (I(i,j)>= 198) && (I(i,j)< 255)
            red(i,j)=200;
            green(i,j)=100;
            blue(i,j)=0;
        end
    end
end
pseudo_image=cat(3,red,green,blue);
pseudo_image=pseudo_image/255;%convert from 0-255 to 0-1
%Output = zeros([size(I,1) size(I,2) 3]);
%map = colormap(jet(256));

%Red = map(:,1);
%Green = map(:,2);
%Blue = map(:,3);

%Output(:,:,1) = Red(I);
%Output(:,:,2) = Green(I);
%Output(:,:,3) = Blue(I);

%Output = im2uint8(Output);

axes(handles.axes3);
imshow(pseudo_image);
title( sprintf('Output Image') );
axes(handles.axes4);
imhist(pseudo_image); title('Histogram');
