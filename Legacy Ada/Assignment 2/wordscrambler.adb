--Zachery Abbas 
--1019463
--assignment 2
--1019463
with ada.Text_IO;              use Ada.Text_IO;
with ada.Strings;              use ada.Strings;
with ada.Integer_Text_IO;      use Ada.Integer_Text_IO;
with Ada.Numerics; 
with Ada.Numerics.Discrete_Random; 
with Ada.Characters.Handling;  use Ada.Characters.Handling;
with Ada.Strings.Fixed;        use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

--Take the file and scramble the words in the file
procedure wordscrambler is
--variables for main
  Name : string(1..20) := (others => character'Val(0));

--created function to see if the file is inputed correctly
  function Exist(file : String) return boolean is
  
    fp : file_type;

  begin
--opening file
    open(fp, in_file, file);
    close(fp);
    return true;

--exception if the file doens't exist 
    exception
      when name_error => return false;

  end Exist;

--Function to retrieve the file name from user
  function FileName return string is
    
    fileName : string(1..20) := (others => character'Val(0));
    last : integer;
    exister : boolean := false;

  begin
    
--creating the loop error handling 
    while(exister = false) loop
      put_line("Enter the name of the file: ");
      get_line(fileName, last);

      if(Exist(fileName)) then
        exister := true;
      else
        put_line("File name is incorrect, try again");
      end if;
    end loop;

    return fileName;

  end FileName;
 --isWord checks if a body of text are characters
  function isWord return Integer is 
    ch : character;
    exist: Integer;
    

    begin 
    
    loop 
      get(ch);
--checks if there is letters a-z and A-Z will return 1 as true
      if ch in 'a' .. 'z' then 
        exist := 1;
      end if; 
      if ch in 'A' .. 'Z' then 
        exist := 1; 
      end if;
--checks if there are any characters that are numbers and will return 0 as flase. 
      if ch in '0' .. '9' then 
        exist := 0;
      end if;

--ends with period 
     exit when ch = '.'; 
    end loop; 
    put( "exist: " & integer'image(exist)); 

    return exist; 

 end isWord;

--procedure randomint() generate random integer between a and b
function randomInt return Integer is
   subtype number is Integer range 2 .. 10;
   package randomNumber is new Ada.Numerics.Discrete_Random (number);
   use randomNumber;
   G : Generator;
   D : number;
begin
-- Start the generator in a unique state in each run
   Reset (G);

--create random number
      D := Random(G); 
   put("number: " & integer'image(D));
  
  return D;
   
end randomInt;

-- Main function
begin
--file info and name is called here 
  Name := FileName;
  put_line(Name);

end wordscrambler;


