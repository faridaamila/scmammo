function varargout = layout2(varargin)
% LAYOUT2 MATLAB code for layout2.fig
%      LAYOUT2, by itself, creates a new LAYOUT2 or raises the existing
%      singleton*.
%
%      H = LAYOUT2 returns the handle to a new LAYOUT2 or the handle to
%      the existing singleton*.
%
%      LAYOUT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYOUT2.M with the given input arguments.
%
%      LAYOUT2('Property','Value',...) creates a new LAYOUT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before layout2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to layout2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help layout2

% Last Modified by GUIDE v2.5 14-Oct-2016 16:01:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @layout2_OpeningFcn, ...
                   'gui_OutputFcn',  @layout2_OutputFcn, ...
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


% --- Executes just before layout2 is made visible.
function layout2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to layout2 (see VARARGIN)

% Choose default command line output for layout2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes layout2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
LayoutMain = getappdata(0, 'LayoutMain');
h = waitbar(0,'Please Wait....');

%get data from other layout
cc_right_image = getappdata(LayoutMain, 'cc_right_image');
mlo_left_image = getappdata(LayoutMain, 'mlo_left_image');
mlo_right_image = getappdata(LayoutMain, 'mlo_right_image');
cc_left_image = getappdata(LayoutMain, 'cc_left_image');
disp(cc_left_image);
perc = 5;
waitbar(perc/100,h,sprintf('%d%% Please wait...',perc))

%open file
imshow(cc_left_image, 'Parent', handles.axes1);
axes(handles.axes2);
imshow(cc_right_image);
axes(handles.axes3);
imshow(mlo_left_image);
axes(handles.axes4);
imshow(mlo_right_image);


%horizontal histogram 
level = graythresh(cc_left_image);  %# Compute an appropriate threshold 
bw = 1-im2bw(cc_left_image,level);  
%plot
axes(handles.axes5);
imshow(cc_left_image)
hold on
plot(sum(bw,2),1:size(bw,1))
perc = 20;
waitbar(perc/100,h,sprintf('%d%% Please wait...',perc))


level2 = graythresh(cc_right_image);  %# Compute an appropriate threshold 
bw2 = im2bw(cc_right_image,level2);  
%plot
axes(handles.axes6);
imshow(cc_right_image)
hold on
plot(sum(bw2,2),1:size(bw2,1))
perc = 25;
waitbar(perc/100,h,sprintf('%d%% Please wait...',perc))

level3 = graythresh(mlo_left_image);  %# Compute an appropriate threshold 
bw3 = 1-im2bw(mlo_left_image,level3);  
%plot
axes(handles.axes7);
imshow(mlo_left_image)
hold on
plot(sum(bw3,2),1:size(bw3,1)) 
perc = 30;
waitbar(perc/100,h,sprintf('%d%% Please wait...',perc))


level4 = graythresh(mlo_right_image);  %# Compute an appropriate threshold 
bw4 = im2bw(mlo_right_image,level4);  
%plot
axes(handles.axes8);
imshow(mlo_right_image)
hold on
plot(sum(bw4,2),1:size(bw4,1))
perc = 35;
waitbar(perc/100,h,sprintf('%d%% Please wait...',perc))


%cropping



% --- Outputs from this function are returned to the command line.
function varargout = layout2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
