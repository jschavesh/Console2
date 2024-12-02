!    PROGRAM Console2
!    use mkl_dfti
!    
!    
!    IMPLICIT NONE
!    
!    !integer, parameter :: n = 4, m = 5
!    !real :: row(m), col(n), matrix(n, m)
!    !
!    real, parameter :: PI= 3.14
!    real:: theta 
!    integer :: i
!    integer :: j
!    character(len=10) :: a , b
!    
!    real :: voltage = 13800.
!    integer :: k=2, l=3, m=4, n=5
!    
!    write(*,50) voltage / 1000.
!50 format (1X, 'Voltage = ', F8.1, ' kV')    
!    
!    write (*,*) 'Eneter de'
!    read (*,*) theta
!    
!    write(*, '(A,F10.4)') 'The secant is ', secant(theta)
!    
!    if (secant(theta) > 1) then
!        print *, 'M'
!    else
!        print *, 'N'
!    end if
!    a  = '123456'
!    do i=10,9, -1
!        do j=0, 2, 1 
!            print *, i, '*',j,'=', j-i, a(1:2) 
!        end do
!    end do
!    
!    !------------------------------
!    
!    write (*, 60) j, k, m, n, theta
!    write (*, 70) j, k, m, n, theta
!    print *, '---'
!    write (*, 80) j, k, m, n, theta
!    
!60 format(10X, 'Value = ', I4, I4, I5, I3, F10.2)
!70 format(1X, 'Value = ', I3)
!80 format(1X, 'Value = ', / ,(1X, 'New Line',3(3X,I3)))
!    
!    read (*,30) i, j
!30  format (5I5)    
!    print *, i, j
!    pause
!    
!    
!    
!    
!    ! ----------------------------    
!    
!    contains
!    real function secant(angle_in_degrees)
!    real :: angle_in_degrees
!    
!    secant = 1. / cos(theta *pi/180.)
!        
!    end function secant
!    
!    
!
!
!    end PROGRAM Console2
    
module globals
    implicit none
    integer :: order   ! Size of the matrix
    integer :: len_signal 
    end module globals
    
program prony
    use globals
    len_signal = 9
    order = 4
    call toeplitz_matrix
    pause
    
end program  prony

subroutine toeplitz_matrix
    use globals
    integer :: i, j
    real :: signal(len_signal)
    real :: first_row(len_signal-order), first_col(order)
    real :: toeplitz(len_signal-order, order)
    integer :: m 
    
    m = len_signal - order
    print *, "m = ", m

    ! Define the first row and first column
    signal = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]  ! Example values
    first_row = signal(order:len_signal)
    first_col = signal(order:1:-1)

    print *, "First Row:", first_row
    print *, "First Col:", first_col
    ! Fill the Toeplitz matrix
    do i = 1, m
        do j = 1, order
            if (j >= i) then
                toeplitz(i, j) = first_col(j - i + 1)
            else
                toeplitz(i, j) = first_row(i - j + 1)
            end if
        end do
    end do
    
    ! Print the Toeplitz matrix
    print *, "Toeplitz Matrix:"
    do i = 1, m
        write(*, "(4F6.1)") toeplitz(i, :)
    end do
end subroutine toeplitz_matrix
