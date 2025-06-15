function L = GraphLaplacian(W,N)

diagW = 1./sqrt(sum(W,2));
diagW(isinf(diagW)==1) = 0;
D = diag(diagW);
L = eye(N)-(D*W*D);