
(* Kerr-Schild form *)

rho2 = r^2 + a^2 Cos[th]^2
(*
rho2 = Rho2[r,th]
*)

gcov = {
	{-(1 - 2 r/rho2),       2 r/rho2,                    0,    -2 a r Sin[th]^2/rho2},
	{2 r/rho2,              1 + 2 r/rho2,                0,    -a (1 + 2 r/rho2) Sin[th]^2},
	{0,                     0,                           rho2, 0},
	{-2 a r Sin[th]^2/rho2, -a (1 + 2 r/rho2) Sin[th]^2, 0,    Sin[th]^2 (rho2 + a^2 (1 + 2 r/rho2) Sin[th]^2) }}

gcon = Simplify[Inverse[gcov]]
gdet = Sqrt[ Simplify[PowerExpand[-Det[gcov]]] ]

X = {t,r,th,ph}

conn = Table[
        Sum[(1/2) gcon[[s,m]] (
                        D[gcov[[n,s]], X[[l]] ] +
                        D[gcov[[l,s]], X[[n]] ] -
                        D[gcov[[l,n]], X[[s]] ])
        , {s, 4}]
        , {m, 4}, {n, 4}, {l, 4}]

(* check connection *)
chk = Table[ 
	Sum[ (1/gdet) D[ gdet gcon[[i,j]], X[[j]] ], {j,4} ] 
	+ Sum[ gcon[[k,l]] conn[[i,k,l]], {k,4},{l,4} ]
	, {i,4} ]

conn1 = Table[ D[gcov[[i,j]], X[[k]] ], {i,4},{j,4},{k,4} ]
conn2 = Table[ conn1[[j,i,k]] + conn1[[k,i,j]] - conn1[[k,j,i]] , {i,4},{j,4},{k,4} ]/2
conn3 = Table[ Sum[
		gcon[[i,l]] conn2[[l,j,k]], {l,4} ]
		,{i,4},{j,4},{k,4} ]

(*
a = 0.1
th = 0.0490874
r = 3.

er = Eigenvectors[gcon]
el = Eigenvalues[gcon]
ecov = Table[ er[[i,j]]/Sqrt[Abs[el[[i]]]], {i,4},{j,4} ]

er = Eigenvectors[gcov]
el = Eigenvalues[gcov]
econ = Table[ er[[i,j]]/Sqrt[Abs[el[[i]]]], {i,4},{j,4} ]
*)

