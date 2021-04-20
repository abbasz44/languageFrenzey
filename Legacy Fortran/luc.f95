program luc
!main program 
data handle/0/

!all of the integer and dimensions
integer:: d
integer, dimension(0:7,0:15):: k
integer, dimension(0:7,0:7,0:1)::m
integer, dimension(0:127)::key, message
equivalence (k(0,0),key(1)),(m(0,0,0),message(1))
integer, dimension(0:31):: kb, mb

write(*,*) 'Key'
read(*,'(32z1.1)') (kb(i),i=0,31)

write(*,*) 'plain'
read(*,'(32z1.1)') (mb(i),i=0,31)

call expand(message,mb,32)
call expand(key,kb,32)

!encrypted message is here because d=0
d=0
call lucifer(d,k,m)
call compress(message,mb,32)
write(*,*) 'Encrypted Message'
write(*,'(1x,32z1.1)') mb

call expand(key,kb,32)

d=1
call lucifer(d,k,m)
call compress(message,mb,32)
write(*,*) 'Decrypted Message'



call compress(message,mb,32)
call compress(key,kb,32)
write(*,*) 'key'
write(*,'(1x,32z1.1)') (kb(i),i=0,31)
write(*,*) 'plaintext'
write(*,'(1x,32z1.1)') (mb(i),i=0,31)

end

!subroutine lucifer is here 
subroutine lucifer(d,k,m)

!all of the integer and dimensions
integer:: d, h, h0, h1, ii, jj, jjj, kc, kk, ks, l, v
integer, dimension(0:7,0:7,0:1):: m
integer, dimension(0:7,0:15)::k
integer, dimension(0:7)::o

integer, dimension(0:7,0:7):: sw
integer, dimension(0:7)::pr, tr
integer, dimension(0:15)::s0, s1
integer, dimension(0:1):: c
equivalence (c(0),h),(c(1),l)

!diffusion pattern
data o/7,6,2,1,5,0,3,4/

!inverse of fixed permutation
data pr/2,5,4,0,3,1,7,6/

!S-box permutations
data s0/12,15,7,10,14,13,11,0,2,6,3,1,9,4,5,8/
data s1/7,2,14,9,3,11,0,4,12,13,1,10,6,15,8,5/

h0=0
h1=1
kc=0

if (d .eq. 1) kc=8

do ii=1,16,1

if (d.eq.1) kc=mod(kc+1,16)
ks=kc

do jj=0,7,1
    l=0
    h=0

do kk=0,3,1
    l=l*2+m(7-kk,jj,h1)
end do
do kk=4,7,1
    h=h*2+m(7-kk,jj,h1)
end do

v=(s0(l)+16*s1(h))*(1-k(jj,ks))+(s0(h)+16*s1(l))*k(jj,ks)

do kk=0,7,1
    tr(kk)=mod(v,2)
    v=v/2
end do

do kk=0,7,1
    m(kk,mod(o(kk)+jj,8),h0)=mod(k(pr(kk),kc)+tr(pr(kk))+m(kk,mod(o(kk)+jj,8),h0),2)
end do

if (jj .lt. 7 .or. d .eq. 1) kc=mod(kc+1,16)
end do

jjj=h0
h0=h1
h1=jjj
end do

do jj=0,7,1
    do kk=0,7,1
        sw(kk,jj)=m(kk,jj,0)
        m(kk,jj,0)=m(kk,jj,1)
        m(kk,jj,1)=sw(kk,jj)
    end do
end do 

return
end

!subroutine expand is here 
subroutine expand(a,b,l)

    !all integers and dimensions are here 
    integer:: i, l, j, v
    integer, dimension(0:*)::a,b
    !changed loop too do enddo
    
    do i=0,l-1,1
        v=b(i)
        
        do j=0,3,1
            a((3-j)+i*4)=mod(v,2)
            v=v/2
        end do
    end do
return
end

!subroutine compress is here
subroutine compress(a,b,l)

    integer::i, l, j, v
    integer, dimension(0:*)::a,b
    !changed loop to do enddo

    do i=0,l-1,1
        v=0
        do j=0,3,1
            v=v*2+mod(a(j+i*4),2)
        end do
        b(i)=v
    end do
return
end
