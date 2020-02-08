clc;clear;
S=[0,0,0;0,0,0;0,0,0]
S(1,1)=input("Enter a11: ")
S(1,2)=input("Enter a12: ")
S(1,3)=input("Enter a13: ")
S(2,1)=input("Enter a21: ")
S(2,2)=input("Enter a22: ")
S(2,3)=input("Enter a23: ")
S(3,1)=input("Enter a31: ")
S(3,2)=input("Enter a32: ")
S(3,3)=input("Enter a33: ")
n=length(S(1,:))
Augmented=[S,eye(n,n)]
//Forward elimination
for j=1:n-1
    for i=j+1:n
        Augmented(i,j:2*n)=Augmented(i,j:2*n)-Augmented(i,j)/Augmented(j,j)*Augmented(j,j:2*n)
    end
end
//Backward elimination
for j=n:-1:2
    Augmented(1:j-1,:)=Augmented(1:j-1,:)-Augmented(1:j-1,j)/Augmented(j,j)*Augmented(j,:)
end
//Diagonal Normalisation
for j=1:n
    Augmented(j,:)=Augmented(j,:)/Augmented(j,j)
end
T=Augmented(:,n+1:2*n)
disp(T,'The inverse of S is');
