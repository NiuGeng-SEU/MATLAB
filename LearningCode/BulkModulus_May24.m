% Bulk modulus calculate
%Input data
VolumeFraction = readmatrix("Book2.xlsx",'Sheet','Sheet1','Range','B2:F2');
E = readmatrix("Book2.xlsx",'Sheet','Sheet1','Range','B3:F3');
nu = readmatrix("Book2.xlsx",'Sheet','Sheet1','Range','B4:F4');

%Calculate
G = E./(2*(1+nu));
k = E./(3*(1-2*nu));

dk(1:5,1) = 0;
c(1:5,1) = 1;
keff(1:5,1) = 0;
keff(1) = E(1)./(3*(1-2*nu(1)));

for ii=2:5
    dk(ii) = keff(ii-1) - k(ii);
    c(ii) = sum(VolumeFraction(1:ii-1))./sum(VolumeFraction(1:ii));
    keff(ii) = k(ii)+(( c(ii).*(keff(ii-1)-k(ii)))./( 1+(1-c(ii)).*( keff(ii-1)-k(ii) )./( k(ii)+(4/3)*G(ii) ) ));
end

plot(1:5,keff,1:5,E,1:5,nu,1:5,G,1:5,k,1:5,dk,"LineWidth",2)
legend("keff","E","nu","G","k","dk");
