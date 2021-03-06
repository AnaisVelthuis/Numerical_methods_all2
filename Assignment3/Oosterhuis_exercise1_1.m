function [vector_lambda_new,vector_c,residue_vector_lambda_new] = Oosterhuis_exercise1_1(data,vector_initial_guesses)
%uitleg
%function takes data (form = 1000x2 matrix: column1 = +
%linespace(0,1000,10000), column2=y) and a row vector of n
%initial guesses for the exponents lambda_i.
%function output is row vector with n values of lambda_i's, a vector n with
%values for C and the residue (sum of square of elementswise residues).
%Graphic output is a plot of the data and a function f that is an
%approximation of a function of the data, computed using least square
%method.
%
%read data and make independent and dependent vector
vector_x = data(1:length(data))' %independent variables
vector_y = data(1+length(data):2*length(data))' %dependent variables

%plot data
plot(vector_x,vector_y)
%hold on to plot solution after it's computed
hold on
 
%use least sqaure method
%data_matrix * [B;C] = vector_lambda
% A * x = b => x = inv(A' * A) * A' * b, or if A is not of full rank, use pseudo inverse: x = pinv(A) * b
 
row_vector_lambda = vector_initial_guesses
vector_c = zeros(1,length(row_vector_lambda))

%
%BY TEACHER: make verything as a function of lambda, this replaces the
%definitons above of A,vector_c,vector_residue
%vector_x is column vector, lambda is row vector
%functions
A=@(lambda) exp(vector_x*lambda);
vector_c=@(lambda) A(lambda) \ vector_y
vector_residue =@(lambda) A(lambda) * vector_c(lambda) - vector_y
residue = @(lambda) sum(vector_residue(lambda).^2)    
%%vector_lambda_new = fminsearch(residue,row_vector_lambda)
%use above functions and compute vector_lambda_new with new values based on
%vector_c and least square method
vector_c = vector_c(row_vector_lambda)
residue_initial_lambda = residue(row_vector_lambda)
vector_lambda_new = fminsearch(residue,row_vector_lambda)
%compute new minimalized residue
residue_vector_lambda_new = residue(vector_lambda_new)


solution = A(vector_lambda_new) * vector_c%(row_vector_lambda)
%plotting, continuing from plot data at beginning of function
plot(vector_x,solution)
hold off
%plot(vector_x,vector_y)
%hold off
%
%beta_hat = inv(matrix' * matrix) * matrix' * data(2) %CHECK THIS
 
%x=linspace(0,max(data(1),100)
%for i=1:length(beta_hat)
%   plot(beta_hat(i,1) + beta_hat(2)*exp(vector_lambda(i) * x(i)
%    hold on
%end
%hold off
 
% calculate corresponding residue
%vector_residu = zeros(length(data)
%for j=1:length(data)
%    vector_residu(j) = beta_hat(j) - data(j)
vector_lambda_new
vector_c
residue_vector_lambda_new
%testinput: Oosterhuis_exercise1_1(data_test,[-2,-1.5,-2])
end