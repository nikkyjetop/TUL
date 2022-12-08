%Strecanska.Dominika 


% 1.vykreslite funkciu na intervale
figure(1)
x = -10:0.01:10;
y = funkcia1(x);
plot(x,y);
min1 = fminbnd(@funkcia1,2,4);
min2 = fminbnd(@funkcia1,4,6);

% 2. najdite globalne minimum
figure(2)
x = -5:0.01:15;
y = funkcia2(x);
plot(x,y);
min3 = fminbnd(@funkcia2,-5,15);

% 3. vykreslite graf funkcie
figure(3)
fun = @(x)100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
x0 = [-1.2,1];
min4 = fminsearch(fun,x0);

x1 = -2:0.01:2;
x2 = -2:0.01:2;
[X1, X2] = meshgrid(x1,x2);
mesh(X1,X2,funkcia3(X1,X2));

% 4. vyrieste ulohu linearneho programovania pomocou linprog
A = [1 -1 1; 3 2 4; 3 2 0];
b = [20;42;30];
lb = [0 0 0];
f=-[5 2 6];
answ=linprog(f,A,b,[],[],lb,[]);

% 5. vyrieste ulohu kvadratickeho programovania pomocou quadprog
syms x1 x2 x3
funkcia5=4*x1.^2+2*x2.^2+3*x3.^2+2*x1*x2-3*x2*x3-x1;
H=double(hessian(funkcia5,[x1 x2 x3]));
f=[-1 0 0];
A=[1 -1 1; 1 2 -6];
b=[-1; 5];
lb=zeros(3,1);
x=quadprog(H,f,A,b,[],[],lb);

function f1 = funkcia1(x)
f1=sin(x)./x+(exp(-(x-4).^2));
end

function f2 = funkcia2(x)
f2=(1/4*x.^4)-(41/6*x.^3)+(209/4*x.^2)-135*x;
end

function f3 = funkcia3(x1,x2)
f3=100*(x2-x1.^2).^2+(1-x1).^2;
end