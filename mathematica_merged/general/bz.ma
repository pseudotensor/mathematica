
DD = 1 - 2/r + (a/r)^2
mu = 1 + a^2 Cos[th]^2/r^2

S = r^2 mu
De = r^2 DD

blgcov = {
        {-(1 - 2/(r mu)) , 0, 0, -2 a Sin[th]^2/(r mu)},
        {0, mu/DD, 0, 0},
        {0, 0, r^2 mu, 0},
        {-2 a Sin[th]^2/(r mu), 0, 0, r^2 Sin[th]^2 
                (1 + (a/r)^2 + 2 a^2 Sin[th]^2/(r^3 mu))} }
blgcon = Simplify[Inverse[blgcov]]


rho2 = r^2 + a^2 Cos[th]^2
e = -1
Y = a^2 Sin[th]^2/rho2
Z = 2 r/rho2

bltoks = Simplify[ {{1,  - e ( (1 + Y)/(1 + Y - Z) - (1 - Z)/(1 - Z)), 0, 0},
	{0, 1, 0, 0},
	{0, 0, 1, 0},
	{0, -e a/(r^2 DD), 0, 1}} ]

Fcov = {
	{0, w Apr, w Aph, 0},
	{-w Apr, 0, Bt S/(Sin[th] De), Apr},
	{-w Aph, -Bt S/(Sin[th] De), 0, Aph},
	{0, -Apr, -Aph, 0}
	}

Fcon = Table[ Sum[ Fcov[[k,l]] blgcon[[i,k]] blgcon[[j,l]], 
	{k,4},{l,4} ], {i,4},{j,4} ]

Fconks = Table[ Sum[ bltoks[[i,k]] bltoks[[j,l]] Fcon[[k,l]], {k,4},{l,4} ], 
		{i,4},{j,4} ]

