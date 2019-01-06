program halfPillsRatioProgram;
uses crt;

type typeforArrays = Array of Integer; 
type outputArraytype =Array of Array of Double;
{*Declaring all variables*}
var
    noOfPills: integer;
    jarOfPills: typeforArrays;
    halfPillsRatio: outputArraytype; {*two dimensional array for holding ratio of each iteration from 1 to 4 and their average*}
    totalPills: integer; 
    numofHalfPills: integer;
    randomDay: integer; i: integer; count: Integer;
	
{*User-defined function to intialize array of pills or to fill jar of pills before each iteration*}
function fillJar(var arrayOfPills:typeforArrays) : typeforArrays;   
	var i: integer;           
	begin       
		for i:= 0 to (Length(arrayOfPills)-1) do
		arrayOfPills[i]:=1;
		fillJar:= arrayOfPills;
	end;

{*User-defined function to remove the pill from jar after half pill is taken out*}	
function removePill(var arrayOfPills:typeforArrays; day, leftPills : Integer) : typeforArrays;   
	begin       
		while day < (leftPills-1) do
		begin
			arrayOfPills[day]:=arrayOfPills[day+1];
			day := day+1;
		end;
		removePill := arrayOfPills;
	end;
	
{*User-defined function for computing average of all iterations and Printing out ratio of all the computations*}	
procedure printOutput(var pill:Integer; var finalArray:outputArraytype);
  begin
    i:=0;
        while i<(2*pill) do
        begin
                finalArray[4,i] := (finalArray[0,i]+finalArray[1,i]+finalArray[2,i]+finalArray[3,i])/4;

                writeln('Day-->',i+1,', Ratio 1-->',finalArray[0,i]:2:3,', Ratio 2-->',finalArray[1,i]:2:3,', Ratio 3-->',finalArray[2,i]:2:3,', Ratio 4-->',finalArray[3,i]:2:3,', Average-->',finalArray[4,i]:2:3);
                i:=i+1;
        end;
  end;
	
begin

noOfPills:= 50; 
setlength(halfPillsRatio,5,noOfPills*2); {*setting length for array which is storing result for each iteration*}
setlength(jarOfPills,noOfPills); {*setting length of array with size of number of Pills*}

clrscr;
randomize;
	
		for count := 0 to 3 do  
        begin
                totalPills := noOfPills; {*setting total pills intially with all the available pills *}
				jarOfPills := fillJar(jarOfPills); {*Calling function to fill jar*}             
		
		numofHalfPills:=0;
		 
		i:= 0;
                while i<(2*noOfPills) do
                begin
					randomDay := random(totalPills);
                        if (jarOfPills[randomDay] = 1) then
                        begin
                                jarOfPills[randomDay] := 0;
                                halfPillsRatio[count,i] := numofHalfPills/(totalPills);
                                numofHalfPills := numofHalfPills+1;
                        end
						else if (jarOfPills[randomDay] = 0) then
                        begin
								jarOfPills := removePill(jarOfPills,randomDay,totalPills);{*Calling function to remove pill*}
                                halfPillsRatio[count,i] := numofHalfPills/(totalPills);
                                numofHalfPills := numofHalfPills-1;
								totalPills:=totalPills-1;
                        end;
                        i:= i+1;				
				end;
			 
		end;
		
		{*Calling print function*}
		printOutput(noOfPills,halfPillsRatio);
		
		writeln('Press enter to exit.');
        readln;
end.