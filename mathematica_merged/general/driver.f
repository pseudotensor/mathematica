        program test
        double precision x,y(2),z(2)
        data y/1,2/
        x = 2.3
        call sub(x,y,z)
        write(*,*) z
        stop
        end
