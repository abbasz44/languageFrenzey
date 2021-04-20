program peasant 
!main function
!decalre variables 
    integer :: a, b, nonrecursion
    real :: T1, T2, time 

!get user input of a and b 
    write(*,*) "a= "
    read(*,*) a

    write(*,*) "b= "
    read(*,*) b
!set timer 
    call cpu_time(T1)
!call function 
    write(*,*) nonrecursion(a, b) 
    call cpu_time(T2)

!calculate time 
    time = (T2 - T1)
    write(*,*) "Runime for nonrecursion function in Fortron is: ", time

end program 
 
!this is non recursion function 
!a is the multiplier b is the other 
integer function nonrecursion(a, b)
!declare variables 
    integer :: a, b

!followed algorithm 
    do while (a > 0)
        if ((mod(a, 2)) == 1) then
            nonrecursion = (b + nonrecursion)
        end if
        a = a/2
        b = b*2
    end do
end function nonrecursion