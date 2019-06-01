function []=figureDrawing(len,position,angles,con,rot,w_b)
%% needed values
f=len(3); % fixed
e=len(4); % end-effector
L=len(1); %  upper arm
pose=position; % position of end-effector
angle=angles;
% rotation around Z axis
R=rot;
% three joints on fixed base
J1=con(1,:);
J2=con(2,:);
J3=con(3,:);
% calc and plot robot e plate
E1=con(4,:);
E2=con(5,:);
E3=con(6,:);
% other easy-cal values
wb=w_b;
%%
% position of fixed base
B1=[-sqrt(3)*wb,-wb,0];
B2=[sqrt(3)*wb,-wb,0];
B3=[0,2*wb,0];
grid on
view(3)
patch([B1(1) B2(1) B3(1)],[B1(2) B2(2) B3(2)],[B1(3) B2(3) B3(3)],'white');% 'FaceColor','none'

hold on

% position of three joints
JL1=[-sqrt(3)*wb/10,-wb,0];
JR1=[sqrt(3)*wb/10,-wb,0];

JL2=JL1*R;
JR2=JR1*R;
JL3=JL2*R;
JR3=JR2*R;
line([JL1(1) JR1(1)],[JL1(2) JR1(2)],[JL1(3) JR1(3)],'LineWidth',3)
line([JL2(1) JR2(1)],[JL2(2) JR2(2)],[JL2(3) JR2(3)],'LineWidth',3)
line([JL3(1) JR3(1)],[JL3(2) JR3(2)],[JL3(3) JR3(3)],'LineWidth',3)
%% position of end-effector while moving
p_e1=pose+E1;
p_e2=pose+E2;
p_e3=pose+E3;
plot3([p_e1(1) p_e2(1) p_e3(1) p_e1(1)],[p_e1(2) p_e2(2) p_e3(2) p_e1(2)],[p_e1(3) p_e2(3) p_e3(3) p_e1(3)]);
plot3(p_e1(1),p_e1(2),p_e1(3),'.','color','blue')
plot3(p_e2(1),p_e2(2),p_e2(3),'.','color','blue')
plot3(p_e3(1),p_e3(2),p_e3(3),'.','color','blue')

% point the center of end effector
x=pose(1); y=pose(2); z=pose(3);
plot3(x,y,z,'*','color','green')
plot3(x,y,z,'o','color','green')
%% upper arm
% vector L=JA
L1=[0 -L*cos(angle(1)),-L*sin(angle(1))];
L2=[0 -L*cos(angle(2)),-L*sin(angle(2))]*R;
L3=[0 -L*cos(angle(3)),-L*sin(angle(3))]*R*R;
% position of joint A (joint between upper arm ans lower arm)
A1=J1+L1;
A2=J2+L2;
A3=J3+L3;
line([J1(1) A1(1)],[J1(2) A1(2)],[J1(3) A1(3)],'LineWidth',2)
line([J2(1) A2(1)],[J2(2) A2(2)],[J2(3) A2(3)],'LineWidth',2)
line([J3(1) A3(1)],[J2(2) A3(2)],[J3(3) A3(3)],'LineWidth',2)
% plot three joints
plot3(A1(1),A1(2),A1(3),'o','color','green')
plot3(A2(1),A2(2),A2(3),'o','color','green')
plot3(A3(1),A3(2),A3(3),'o','color','green')
%% lower arm
% joints on end-effector
EL1=pose+[-sqrt(3)*wb/10 -e/sqrt(3) 0];
ER1=pose+[sqrt(3)*wb/10 -e/sqrt(3) 0];
EL2=pose+[-sqrt(3)*wb/10 -e/sqrt(3) 0]*R;
ER2=pose+[sqrt(3)*wb/10 -e/sqrt(3) 0]*R;
EL3=pose+[-sqrt(3)*wb/10 -e/sqrt(3) 0]*R*R;
ER3=pose+[sqrt(3)*wb/10 -e/sqrt(3) 0]*R*R;
% joint A
AL1=JL1+L1;
AR1=JR1+L1;
AL2=JL2+L2;
AR2=JR2+L2;
AL3=JL3+L3;
AR3=JR3+L3;
plot3([AL1(1) AR1(1) ER1(1) EL1(1) AL1(1)],[AL1(2) AR1(2) ER1(2) EL1(2) AL1(2)],[AL1(3) AR1(3) ER1(3) EL1(3) AL1(3)])
plot3([AL2(1) AR2(1) ER2(1) EL2(1) AL2(1)],[AL2(2) AR2(2) ER2(2) EL2(2) AL2(2)],[AL2(3) AR2(3) ER2(3) EL2(3) AL2(3)])
plot3([AL3(1) AR3(1) ER3(1) EL3(1) AL3(1)],[AL3(2) AR3(2) ER3(2) EL3(2) AL3(2)],[AL3(3) AR3(3) ER3(3) EL3(3) AL3(3)])


text(-420,250,-380,'Angles ( rad )')
str=num2str(angle);
text(-420,250,-430,str)

text(-420,-100,-400,'position(mm)')
str=['x=' num2str(pose(1)) ', y=' num2str(pose(2)) ', z=' num2str(pose(3))];
text(-420,-100,-450,str)

drawing=0;
end