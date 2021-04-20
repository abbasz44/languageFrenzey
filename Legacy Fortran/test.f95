program test

character :: c
character (len=2) :: tempH
!integer, dimension(1:2) :: hex

write(*,*) 'Enter a character'
read(*,*) c
write(tempH, '(Z2)') c
print *, tempH

!read(tempH(1:1),'(Z1)') hex(1)
!read(tempH(2:2),'(Z1)') hex(2)
!print *, hex

end