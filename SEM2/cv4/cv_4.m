% Vytvoreni matice M
M = [0, 1, 1, 1, 0; 
     1, 0, 1, 0, 0; 
     1, 1, 0, 1, 1; 
     1, 0, 0, 0, 0; 
     1, 0, 1, 1, 0];

% Počáteční vektor y0
y0 = ones(size(M, 1), 1) / size(M, 1);

% Tolerance a počet iterací
tol = 1e-6;
maxit = 1000;

% Spusteni mocninove metody
[vec, lambda] = mocninna_metoda(M, y0, tol, maxit);

% Vytvoreni seznamu webovych stranek
web_stranky = {'A', 'B', 'C', 'D', 'E'};

% Razeni stranek podle PageRank
[~, index] = sort(vec, 'descend');
webs = web_stranky(index);