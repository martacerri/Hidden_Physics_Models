function [] = plot_interpolantN(params)

N0 = params.N0;
N1 = params.N1;
tn = params.tn;
error = params.error;
error_noise = params.error_noise;
lambda1 = params.lambda1;
lambda2 = params.lambda2;

guessN0 = ones(size(tn));
guessN1 = ones(size(tn));

tol = 0.3;

for i = 1:length(tn)
    for j = 2:length(N0)-1
        if ( abs(lambda1(j+1,i)-lambda1(j,i))/abs(lambda1(j,i)) > tol )
            guessN0(i) = N0(j+1);
            guessN1(i) = N1(j+1);
        end
    end
end

y0 = fit(tn',guessN0','poly1');
figure
plot(y0,tn',guessN0');
grid on
xlabel('t');
ylabel('N0');

y1 = fit(tn',guessN1','poly1');
figure
plot(y1,tn',guessN1');
grid on
xlabel('t');
ylabel('N1');

end