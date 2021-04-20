
!subroutine gets the word 
subroutine readWord(w)
character(len=*):: w
    
write(*,*) 'enter word'
read(*,*) w 
    
end

!subroutine gets character value and turns it to hex 
subroutine char2Hex(tempH,c)
character :: c
character (len=*) :: tempH

write(tempH, '(Z2)') c

end

!subroutine gets the whole word and tunrs it to hex 
subroutine word2Hex(w,h,l)

    integer:: i, len, k 
    character (len=*):: w,h
    character (len =2):: tempH
    
    l = len(w)
    k = 1
    
    do i = 1, l, 2
        call char2Hex(tempH, w(k:k))
        k = k + 1        
        
        h(i:i) = temph(1:1)
        h(i+1:i+1) = temph(2:2)
        
        !making sure all the spaces = 00 instead of 20
        if (w(k:k).eq. ' ') h(i:i) = ' '
        if (w(k:k) .eq. ' ') h(i+1:i+1) = ' '
           
    
    end do 

    end
    
    !subroutine prints hex value
    subroutine print2hex(h)

        character(len=*):: h

        write(*,*) 'Hexadecimal'
        write (*,*) h

    end



