program peasant 
!main function
!decalre variables 
    integer :: a, b, recursion
    real :: T1, T2, time 

!get user input of a and b 
    write(*,*) "a= "
    read(*,*) a

    write(*,*) "b= "
    read(*,*) b
!set timer 
    call cpu_time(T1)
!call function 
    write(*,*) recursion(a, b)
    call cpu_time(T2)
!calculate time 
    time = (T2 - T1)
    write(*,*) "Runtime for recursive function in Fortron is: ", time
    
   
end program

!this is recursion function 
!a is the multiplier b is the other 
recursive function recursion(a, b) result(p)
!declare variables 
    integer, intent(in) :: a, b
    integer :: p

!followed algorithm 
    if (a == 0) then
        p = 0
    else if (a == 1) then
        p = b
    else if ((a > 1) .and. (mod(a, 2) == 0)) then
        p = recursion((a/2), (b*2))
    else if ((a > 1) .and. (mod(a, 2) == 1)) then
        p = (b + (recursion((a/2), (b*2))))
    end if
end function recursion