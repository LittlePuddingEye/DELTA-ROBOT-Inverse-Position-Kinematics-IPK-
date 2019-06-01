%% Delta Robot
% Annine
%%
clc
clear
%% values used in Commissioning
% set length
L=170; %  upper arm
l=300; % lower arm

f=200*sqrt(3); % fixed base
e=50*sqrt(3); % end-effector

a=(f/2-e)/sqrt(3);
b=e/2-f/4;
c=(e-f/2)/(2*sqrt(3));

len=[L,l,f,e,a,b,c];
%% values used in functions
% rotation around Z axis
R=[cos(-2*pi/3) -sin(-2*pi/3) 0;sin(-2*pi/3) cos(-2*pi/3) 0;0 0 1];
% three joints on fixed base
J1=[0 -f/(2*sqrt(3)) 0];
J2=J1*R;
J3=J2*R;
% calc and plot robot e plate
E1=[0 -e/sqrt(3) 0];
E2=E1*R;
E3=E2*R;
% other easy-cal values
wb=f/(2*sqrt(3));

con=[J1; J2; J3; E1; E2; E3];
%% inverse Inverse Position Kinematics (IPK) Solution
n=100; % divide path into n parts
r=100; % radius of parth (path is a circle)
pose=pathCal(n,r);% position of end-effector
angle=zeros(n+1,3);
for i=1:n+1
    angle(i,:)=Inverse(pose(i,:),len);
end

anim(len,pose,angle,con,R,wb)

function []=anim(len,pose,angle,con,R,wb)
n=length(pose(:,1));

for i=1:n
    clf;
    axis([-500 300 -500 300 -450 50])
    pause on % to enable pause function
    figureDrawing(len,pose(i,:),angle(i,:),con,R,wb);
    for j=1:i
        plot3(pose(j,1),pose(j,2),pose(j,3),'.r')
    end
    pause(0.01); 
end
end
