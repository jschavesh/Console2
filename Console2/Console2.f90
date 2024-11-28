!  Console2.f90 
!
!  FUNCTIONS:
!  Console2 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: Console2
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    PROGRAM Console2
    use mkl_dfti
    
    
    IMPLICIT NONE
    
    !integer, parameter :: n = 4, m = 5
    !real :: row(m), col(n), matrix(n, m)
    !
    real, parameter :: PI= 3.14
    real:: theta 
    
    write (*,*) 'Eneter de'
    read (*,*) theta
    
    write(*, '(A,F10.4)') 'The secant is ', secant(theta)
    pause
    
    
    contains
    real function secant(angle_in_degrees)
    real :: angle_in_degrees
    
    secant = 1. / cos(theta *pi/180.)
        
    end function secant
    
    


    end PROGRAM Console2

