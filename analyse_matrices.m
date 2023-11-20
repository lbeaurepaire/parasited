n = 81;

A_raw = importdata("A.m", delimiter=" ", header_rows = 3);
B_raw = importdata("B.m", delimiter=" ", header_rows = 3);

A_sparse = A_raw.data;
B_sparse = B_raw.data;

A_pleine = [];
B_pleine = [];
for i = 1:range(size(A_sparse))
  A_pleine(cast(A_sparse(i,1)+1, "int8"), cast(A_sparse(i,2)+1, "int8")) = A_sparse(i,3);
  B_pleine(cast(B_sparse(i,1)+1, "int8"), cast(B_sparse(i,2)+1, "int8")) = B_sparse(i,3);
endfor

[VecP, ValP] = eigs (A_pleine, B_pleine, k=n);

if isdiag(ValP)
  plot(ValP,'o','MarkerSize',6)
endif
plot(VecP,'o','MarkerSize',6)
