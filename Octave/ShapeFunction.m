function phi = ShapeFunction(epsilon, Property)
%Natural Coordinates

type=Property.Type;
degree=Property.degree;
switch type
case '1D'
    switch degree
    case '1'
        phi=zeros(1,2);
        phi(1)=-0.5*(epsilon(1)-1);
        phi(2)=0.5*(epsilon(1)+1);
    
    case '2'
        phi=zeros(1,3);
        phi(1)=0.5*epsilon(1)*(epsilon(1)-1);
        phi(2)=-(epsilon(1)+1)*(epsilon(1)-1);
        phi(3)=0.5*epsilon(1)*(epsilon(1)+1);
    
    case '3'
        phi=zeros(1,4);
        phi(1)=-9/16*(epsilon(1)+1/3)*(epsilon(1)-1/3)*(epsilon(1)-1);
        phi(2)=27/16*(epsilon(1)+1)*(epsilon(1)-1/3)*(epsilon(1)-1);
        phi(3)=-27/16*(epsilon(1)+1)*(epsilon(1)+1/3)*(epsilon(1)-1);
        phi(4)=-9/16*(epsilon(1)+1)*(epsilon(1)+1/3)*(epsilon(1)-1/3);
    otherwise
        printf('Shape Function Degree specified not found');
    end

case 'Triangle'
        zeta=1-(epsilon(1)+epsilon(2));
    switch degree
    case '1'
        phi=zeros(1,3);
        phi(1)=epsilon(1);
        phi(2)=epsilon(2);
        phi(3)=(1-zeta);
    case '2'
        phi=zeros(1,6);
        phi(1)=epsilon(1)*(2*epsilon(1)-1);
        phi(2)=epsilon(2)*(2*epsilon(2)-1);
        phi(3)=zeta*(2*zeta-1);
        phi(4)=4*epsilon(1)*epsilon(2);
        phi(5)=4*epsilon(2)*zeta;
        phi(6)=4*epsilon(1)*zeta;
    case '3'
        phi=zeros(1,10);
        phi(1)=0.5*epsilon(1)*(3*epsilon(1)-1)*(3*epsilon(1)-2);
        phi(2)=0.5*epsilon(2)*(3*epsilon(2)-1)*(3*epsilon(2)-2);
        phi(3)=0.5*zeta*(3*zeta-1)*(3*zeta-2);
        phi(4)=4.5*epsilon(1)*epsilon(2)*(3*epsilon(1)-1);
        phi(5)=4.5*epsilon(1)*epsilon(2)*(3*epsilon(2)-1);
        phi(6)=4.5*epsilon(2)*zeta*(3*epsilon(2)-1);
        phi(7)=4.5*epsilon(2)*zeta*(3*zeta-1);
        phi(8)=4.5*epsilon(1)*zeta*(3*zeta-1);
        phi(9)=4.5*epsilon(1)*zeta*(3*epsilon(1)-1);
        phi(10)=4.5*epsilon(1)*epsilon(2)*zeta;
    otherwise
        printf('Shape Function Degree specified not found');
    end
case 'Quadrilateral'
    switch degree
    case '1'
        phi=zeros(1,4);
        phi(1)=0.25*(1-epsilon(1))*(1-epsilon(2));
        phi(2)=0.25*(1+epsilon(1))*(1-epsilon(2));
        phi(3)=0.25*(1+epsilon(1))*(1+epsilon(2));
        phi(4)=0.25*(1-epsilon(1))*(1+epsilon(2));
    case 'Biquadratic'
        phi=zeros(1,9);
        phi(1)=0.25*epsilon(1)*epsilon(2)*(epsilon(1)-1)*(epsilon(2)-1);
        phi(2)=-0.25*epsilon(1)*epsilon(2)*(epsilon(1)+1)*(epsilon(2)-1);
        phi(3)=0.25*epsilon(1)*epsilon(2)*(epsilon(1)+1)*(epsilon(2)+1);
        phi(4)=-0.25*epsilon(1)*epsilon(2)*(epsilon(1)-1)*(epsilon(2)+1);
        phi(5)=-0.5*epsilon(2)*(epsilon(2)-1)*(epsilon(1)^2-1);
        phi(6)=-0.5*epsilon(1)*(epsilon(1)+1)*(epsilon(2)^2-1);
        phi(7)=-0.5*epsilon(2)*(epsilon(2)+1)*(epsilon(1)^2-1);
        phi(8)=-0.5*epsilon(1)*(epsilon(1)-1)*(epsilon(2)^2-1);
        phi(9)=(1-epsilon(1)^2)*(1-epsilon(2)^2);
    case 'Serendipity'
        phi=zeros(1,8);
        phi(1)=-0.25*(epsilon(1)-1)*(epsilon(2)-1)*(epsilon(1)+epsilon(2)+1);
        phi(2)=-0.25*(epsilon(1)+1)*(epsilon(2)-1)*(epsilon(1)-epsilon(2)-1);
        phi(3)=-0.25*(epsilon(1)+1)*(1+epsilon(2))*(1-epsilon(1)-epsilon(2));
        phi(4)=-0.25*(1-epsilon(1))*(1+epsilon(2))*(1+epsilon(1)-epsilon(2));
        phi(5)=0.5*(1-epsilon(1))*(1+epsilon(1))*(1-epsilon(2));
        phi(6)=0.5*(1+epsilon(1))*(1+epsilon(2))*(1-epsilon(2));
        phi(7)=0.5*(1-epsilon(1))*(1+epsilon(1))*(1+epsilon(2));
        phi(8)=0.5*(1-epsilon(1))*(1+epsilon(2))*(1-epsilon(2));
    otherwise
        printf('Shape Function Degree specified not found');
    end
case 'Tetrahedral'
    gamma=1-(epsilon(1)+epsilon(2)+epsilon(3));
    switch degree
    case '1'
        phi=zeros(1,4);
        phi(1)=epsilon(1);
        phi(2)=epsilon(2);
        phi(3)=epsilon(3);
        phi(4)=gamma;
    case '2'
        phi=zeros(1,10);
        phi(1)=epsilon(1)*(2*epsilon(1)-1);
        phi(2)=epsilon(2)*(2*epsilon(2)-1);
        phi(3)=epsilon(3)*(2*epsilon(3)-1);
        phi(4)=gamma*(2*gamma-1);
        phi(5)=4*epsilon(1)*epsilon(2);
        phi(6)=4*epsilon(2)*epsilon(3);
        phi(7)=4*epsilon(3)*epsilon(1);
        phi(8)=4*epsilon(1)*gamma;
        phi(9)=4*epsilon(2)*gamma;
        phi(10)=4*epsilon(3)*gamma;
    otherwise
        printf('Shape Function Degree specified not found');
    end
case 'Hexahedral'
    switch degree
    case '1'
        phi=zeros(1,8);
        phi(1)=1/8*(1-epsilon(1))*(1-epsilon(2))*(1-epsilon(3));
        phi(2)=1/8*(1+epsilon(1))*(1-epsilon(2))*(1-epsilon(3));
        phi(3)=1/8*(1+epsilon(1))*(1+epsilon(2))*(1-epsilon(3));
        phi(4)=1/8*(1-epsilon(1))*(1+epsilon(2))*(1-epsilon(3));
        phi(5)=1/8*(1-epsilon(1))*(1-epsilon(2))*(1+epsilon(3));
        phi(6)=1/8*(1+epsilon(1))*(1-epsilon(2))*(1+epsilon(3));
        phi(7)=1/8*(1+epsilon(1))*(1+epsilon(2))*(1+epsilon(3));
        phi(8)=1/8*(1-epsilon(1))*(1+epsilon(2))*(1+epsilon(3));
    otherwise
        printf('Shape Function Degree specified not found');
    end
end 
