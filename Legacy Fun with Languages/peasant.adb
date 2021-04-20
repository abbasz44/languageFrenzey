
with ada.text_io; use ada.text_io;
with Ada.Calendar; use Ada.Calendar;

procedure peasant is

--set up enviorment and variables
    type unsigned is range 0 .. 2**62;
    package unsigned_io is new ada.text_io.integer_io(unsigned);
    use unsigned_io;
    a, b : unsigned;


--recursive function 
--a is multiplier b is other 
    function recursive(a: unsigned; b: unsigned) return unsigned is
--declare variabels 
        p : unsigned := 0;

--follow algorithm
    begin
        if (a = 0) then
            p := 0;
        elsif (a = 1) then
            p := b;
        elsif ((a > 1) and ((a mod 2) = 0)) then
            p := recursive((a/2), (b*2));
        elsif ((a > 1) and ((a mod 2) = 1)) then
            p := (b + (recursive((a/2), (b*2))));
        end if;
        return p;
    end recursive;

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
    unsigned_io.put(recursive(a, b));
    endTime := Clock;
--end timer 
    new_line;
    new_line;

--calculate time 
    time :=(endTime - startTime);
    put_line("Runtime for recursive in Ada is:  " & Duration'Image(time));

    end peasant;