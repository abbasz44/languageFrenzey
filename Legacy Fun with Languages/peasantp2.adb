with ada.text_io; use ada.text_io;
with Ada.Calendar; use Ada.Calendar;
procedure peasantp2 is

--set up enviorment and variables
    type unsigned is range 0 .. 2**62;
    package unsigned_io is new ada.text_io.integer_io(unsigned);
    use unsigned_io;
    a, b : unsigned;

--recursive function 
--a is multiplier b is other
    function nonrecursive(a: in out unsigned; b: in out unsigned) return unsigned is
--declare variabels 
        p : unsigned := 0;   

--follow algorithm
    begin
        while (a > 0) loop
            if ((a mod 2) = 1) then
                p := (b + p);
            end if;
            a := a/2;
            b := b*2;
        end loop;
        
        return p;
    end nonrecursive;
--set variabeles of timer 

    startTime, endTime : Time;
    time : Duration;

begin
--get user input
    put_line("enter a: ");
    unsigned_io.get(a);

    put_line("enter b: ");
    unsigned_io.get(b);
--start timer  
    startTime := Clock;
    unsigned_io.put(nonrecursive(a, b));
    endTime := Clock;
--end timer
    new_line;
    new_line;

--calculate time
    time :=(endTime - startTime);
    put_line("Runtime for nonrecursive in Ada is:  " & Duration'Image(time));


    end peasantp2;