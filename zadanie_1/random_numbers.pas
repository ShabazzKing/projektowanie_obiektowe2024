program random_numbers;

uses
    Math;

const
    nOfNumbers : integer = 50;
    inf : integer = 0;
    sup : integer = 100;
var
    randomNumbers : array [1..50] of integer;
    i : integer;

procedure getNumbers();
var
    i : integer;
begin
    for i := 1 to nOfNumbers do
        randomNumbers[i] := randomRange(inf, sup + 1);
end;

procedure sortNumbers();
var
    swapped : boolean;
    temp : integer;
    n, i : integer;
begin
    n := nOfNumbers;
    repeat
        swapped := false;
        for i := 2 to n do
            if randomNumbers[i - 1] > randomNumbers[i] then
            begin
                temp := randomNumbers[i - 1];
                randomNumbers[i - 1] := randomNumbers[i];
                randomNumbers[i] := temp;
                swapped := true;
            end;
        n := n - 1;
    until not swapped;
end;

begin
    randomize();
    getNumbers();
    sortNumbers();
    for i := 1 to nOfNumbers do
        write(randomNumbers[i], '  ');
    writeln();
end.
