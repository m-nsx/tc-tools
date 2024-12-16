function y = calcul_convolution(x, h, t, dt)
    % Calcul de la convolution en temps continu entre x(t) et h(t)
    % x et h sont les deux signaux à convoluer
    % t est le vecteur de temps
    % dt est le pas de temps

    % Initialiser la sortie de la convolution
    y = zeros(size(t)); 

    % Convolution : somme discrète de l'intégrale
    for k = 1:length(t)
        tau = t - t(k); % Décalage de t en fonction de chaque point de la convolution
        % Calculer la convolution par une somme discrète
        y(k) = sum(x .* interp1(t, h, tau, 'linear', 0)) * dt;
    end
end

% Définir les paramètres
t_min = -5; t_max = 5; dt = 0.001; % Plage de temps et pas
t = t_min:dt:t_max; % Vecteur de temps

% Définir les fonctions x(t) et h(t)
x = double(abs(t) <= 0.5);
h = abs(t+2);

% Calcul de la convolution
y = calcul_convolution(x, h, t, dt);

% Affichage du résultat
figure;
subplot(3,1,1);
plot(t, x);
title('x(t) = Fonction Porte');
xlabel('Temps');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, h);
title('h(t) = Fonction Échelon Unité');
xlabel('Temps');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, y);
title('y(t) = Convolution de x(t) et h(t)');
xlabel('Temps');
ylabel('Amplitude');
grid on;