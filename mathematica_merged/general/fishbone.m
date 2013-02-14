pl	3	# args l,a,rin
		set l = $1
		set a = $2
		set rin = $3
		#
		set rc = 1.05*(1. + sqrt(1. - a*a))
		set min = 1.e-8
		#
		mgrid 256 256 0 60 0 60
		#
		set R = x
		set z = y
		set r = sqrt(R*R + z*z)
		set th = atan(R/z)
		set th = (th < 0.) ? th + pi : th
		#
		set DD   = (r > rc) ? r**2 - 2.*r + a**2                   : min
		set AA   = (r > rc) ? (r**2 + a**2)**2 - DD*(a*sin(th))**2 : min
		set SS   = (r > rc) ? r**2 + (a*cos(th))**2                : min
		#
		set thin = pi/2.
		set DDin =  rin**2 - 2.*rin + a**2
		set AAin = (rin**2 + a**2)**2 - DDin*(a*sin(thin))**2 
		set SSin =  rin**2 + (a*cos(thin))**2
		#
		#set epsi = (r > rc) ? sin(th)**2*AA/SS                     : min
		#set enu  = (r > rc) ? SS*DD/AA                             : min
		#set echi = (r > rc) ? epsi/enu                             : min
		#set w    = (r > rc) ? 2.*a*r/AA                            : min
		#
		set lnh  = 0.5*ln((1. + sqrt(1. + 4.*(l*SS)**2*DD/(AA*sin(th))**2))/ \
			(SS*DD/AA)) - 0.5*sqrt(1. + 4.*(l*SS)**2*DD/(AA*sin(th))**2) - \
			2.*a*r*l/AA \
		 	- ( \
			0.5*ln((1. + sqrt(1. + 4.*(l*SSin)**2*DDin/(AAin*sin(thin))**2))/ \
			(SSin*DDin/AAin)) - 0.5*sqrt(1. + 4.*(l*SSin)**2*DDin/(AAin*sin(thin))**2) - \
			2.*a*rin*l/AAin )
		#
		set image[ix,iy] = lnh
		#
		plgrid
		#
pla	2	# args l,a
		set l = $1
		set a = $2
		#
		set rc = 1.5*(1. + sqrt(1. - a*a))
		#
		mgrid 128 128 0 20 -10 10
		#
		set x = rc,1.e3,0.25
		set lx = lg(x)
		set r = x
		set th = pi/2.
		#
		set DD   = r**2 - 2.*r + a**2
		set AA   = (r**2 + a**2)**2 - DD*(a*sin(th))**2 
		set SS   = r**2 + (a*cos(th))**2
		#
		set lnh  = 0.5*ln((1. + sqrt(1. + 4.*(l*SS)**2*DD/(AA*sin(th))**2))/ \
			(SS*DD/AA)) - 0.5*sqrt(1. + 4.*(l*SS)**2*DD/(AA*sin(th))**2) - \
			2.*a*r*l/AA
		#
		set y = lnh
		#
		limits lx y
		era
		box
		connect lx y
		#
mgrid	6	# args nx ny xin xout yin yout 
		#
		define _nx ($1)
		define _ny ($2)
		define _xin ($3)
		define _xout ($4)
		define _yin ($5)
		define _yout ($6)
		#
		image($_nx,$_ny) $_xin $_xout $_yin $_yout
		#
		define dx (($_xout - $_xin)/$_nx)
		define dy (($_yout - $_yin)/$_ny)
		#
		set i = 1,$_nx*$_ny
		set x = (int((i-0.5)/$_ny) + 0.5)*$dx + $_xin
                set y = (int(i-0.5 - $_ny*int((i-0.5)/$_ny)) + 0.5)*$dy + $_yin
		set ix = int((x - $_xin - 0.4*$dx)/$dx)
		set iy = int((y - 0.4*$dy - $_yin)/$dy)
		#
		#set image[ir,ih] = $2[i-1]
		#
plgrid	0	#
		limits 6. $_xout $_yin $_yout
		minmax min max echo $min $max
		limits $_xin $_xout $_yin $_yout
		erase
		box
		if($min*$max < 0.) {\
			#
			define delta ((-$min)/10.)
			set lev=$min,0.,$delta
			levels lev
			ltype 2
			contour
			#
			define delta ($max/10.)
			set lev=0,$max,$delta
			levels lev
			ltype 0
			contour
			#
			ctype cyan
			set lev = 0
			levels lev
			contour
			ctype white
			#
		} \
		else {\
			set lev=$min,$max,($max-$min)/10.
			levels lev
			ltype 0
			contour
		}
		#
ppl	3	# args l,a,rin
		set l = $1
		set a = $2
		set rin = $3
		#
		set rc = 1.05*(1. + sqrt(1. - a*a))
		set min = 1.e-8
		#
		mgrid 256 256 0 20 0 pi
		#
		set r = x
		set th = y
		#
		set DD   = (r > rc) ? r**2 - 2.*r + a**2                   : min
		set AA   = (r > rc) ? (r**2 + a**2)**2 - DD*(a*sin(th))**2 : min
		set SS   = (r > rc) ? r**2 + (a*cos(th))**2                : min
		#
		set thin = pi/2.
		set DDin =  rin**2 - 2.*rin + a**2
		set AAin = (rin**2 + a**2)**2 - DDin*(a*sin(thin))**2 
		set SSin =  rin**2 + (a*cos(thin))**2
		#
		#set epsi = (r > rc) ? sin(th)**2*AA/SS                     : min
		#set enu  = (r > rc) ? SS*DD/AA                             : min
		#set echi = (r > rc) ? epsi/enu                             : min
		#set w    = (r > rc) ? 2.*a*r/AA                            : min
		#
		set lnh  = 0.5*ln((1. + sqrt(1. + 4.*(l*SS)**2*DD/(AA*sin(th))**2))/ \
			(SS*DD/AA)) - 0.5*sqrt(1. + 4.*(l*SS)**2*DD/(AA*sin(th))**2) - \
			2.*a*r*l/AA \
		 	- ( \
			0.5*ln((1. + sqrt(1. + 4.*(l*SSin)**2*DDin/(AAin*sin(thin))**2))/ \
			(SSin*DDin/AAin)) - 0.5*sqrt(1. + 4.*(l*SSin)**2*DDin/(AAin*sin(thin))**2) - \
			2.*a*rin*l/AAin )
		#
		set image[ix,iy] = lnh
		#
		plgrid
		#
