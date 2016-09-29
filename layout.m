function varargout = layout(varargin)
% LAYOUT MATLAB code for layout.fig
%      LAYOUT, by itself, creates a new LAYOUT or raises the existing
%      singleton*.
%
%      H = LAYOUT returns the handle to a new LAYOUT or the handle to
%      the existing singleton*.
%
%      LAYOUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYOUT.M with the given input arguments.
%
%      LAYOUT('Property','Value',...) creates a new LAYOUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before layout_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to layout_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help layout

% Last Modified by GUIDE v2.5 30-Sep-2016 00:31:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @layout_OpeningFcn, ...
                   'gui_OutputFcn',  @layout_OutputFcn, ...
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


% --- Executes just before layout is made visible.
function layout_OpeningFcn(hObject, eventdata, handles, varargin)
set(findobj(gcf, 'type','axes'), 'Visible','off')
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to layout (see VARARGIN)

% Choose default command line output for layout
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes layout wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = layout_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%load cases
folder_name = uigetdir('D:\DDSM\benign\benign_01','Select Case');
disp(folder_name)
%get id
id = folder_name(30:33);
set(handles.text7, 'String', id)
%set name of .ics file
name_ics=strcat('\C-',id,'-1.ics');
disp(name_ics)
%set name of CC LEFT image file
name_cc_left_image=strcat('\C_',id,'_1.LEFT_CC.LJPEG.1.image.tif');
disp(name_cc_left_image)
%set name of CC RIGHT image file
name_cc_right_image=strcat('\C_',id,'_1.RIGHT_CC.LJPEG.1.image.tif');
disp(name_cc_right_image)
% set name of MLO LEFT image file
name_mlo_left_image=strcat('\C_',id,'_1.LEFT_MLO.LJPEG.1.image.tif');
disp(name_mlo_left_image)
% set name of MLO RIGHT image file
name_mlo_right_image=strcat('\C_',id,'_1.RIGHT_MLO.LJPEG.1.image.tif');
disp(name_mlo_right_image)
% set name of CC LEFT OVERLAY
name_cc_left_overlay=strcat('\C_',id,'_1.LEFT_CC.OVERLAY');
disp(name_cc_left_overlay)
% set name of CC RIGHT OVERLAY
name_cc_right_overlay=strcat('\C_',id,'_1.RIGHT_CC.OVERLAY');
disp(name_cc_right_overlay)
% set name of MLO LEFT OVERLAY
name_mlo_left_overlay=strcat('\C_',id,'_1.LEFT_MLO.OVERLAY');
disp(name_mlo_left_overlay)
% set name of MLO RIGHT OVERLAY
name_mlo_right_overlay=strcat('\C_',id,'_1.RIGHT_MLO.OVERLAY');
disp(name_mlo_right_overlay)

%show all mammogram from filepath
handles.cc_left_image=imread(strcat(folder_name,name_cc_left_image));
handles.cc_left_image=flip(handles.cc_left_image,2);
axes(handles.axes1);
imshow(handles.cc_left_image);
handles.cc_right_image=imread(strcat(folder_name,name_cc_right_image));
handles.cc_right_image=flip(handles.cc_right_image,2);
axes(handles.axes2);
imshow(handles.cc_right_image);
handles.mlo_left_image=imread(strcat(folder_name,name_mlo_left_image));
handles.mlo_left_image=flip(handles.mlo_left_image,2);
axes(handles.axes3);
imshow(handles.mlo_left_image);
handles.mlo_right_image=imread(strcat(folder_name,name_mlo_right_image));
handles.mlo_right_image=flip(handles.mlo_right_image,2);
axes(handles.axes4);
imshow(handles.mlo_right_image);


%biner
%horizontal histogram
%level = graythresh(handles.image);  %# Compute an appropriate threshold 
%bw = 1-im2bw(handles.image,level);  
%plot
%axes(handles.axes2);
%imshow(handles.image)
%hold on
%plot(sum(bw,2),1:size(bw,1))


% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
