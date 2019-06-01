function [angle]=Inverse(pose,len)
    % position of end-effector
    x=pose(1);
    y=pose(2);
    z=pose(3);
    % read a,b,c
    L=len(1);
    l=len(2);
    a=len(5);
    b=len(6);
    c=len(7);
    E1=2*L*(y+a);
    F=2*z*L;
    G1=x^2+y^2+z^2+a^2+L^2+2*y*a-l^2;

    delta=E1^2+F^2-G1^2;
    if (delta < 0)
        disp('Pose not in range!!!!!!!!!!!!!!!!!!!! Choose other Pose that is not a singularity');
    else
        t=(-F-sqrt(delta))/(G1-E1);
        angle(1)=2*atan(abs(t));
    end

    E2=-L*(sqrt(3)*(x+b)+y+c);
    G2=x^2+y^2+z^2+b^2+c^2+L^2+2*(x*b+y*c)-l^2;
    delta=E2^2+F^2-G2^2;
    if (delta < 0)
        disp('Pose not in range!!!!!!!!!!!!!!!!!!!! Choose other Pose that is not a singularity');
    else
        t=(-F-sqrt(delta))/(G2-E2);
        angle(2)=2*atan(abs(t));
    end

    E3=-L*(sqrt(3)*(x-b)-y-c);
    G3=x^2+y^2+z^2+b^2+c^2+L^2+2*(-x*b+y*c)-l^2;
    delta=E3^2+F^2-G3^2;
    if (delta < 0)
        disp('Pose not in range!!!!!!!!!!!!!!!!!!!! Choose other Pose that is not a singularity');
    else
        t=(-F-sqrt(delta))/(G3-E3);
        angle(3)=2*atan(abs(t));
    end
end