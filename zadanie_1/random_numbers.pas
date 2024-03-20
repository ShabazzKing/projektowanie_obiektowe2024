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

begin
    randomize();
    getNumbers();
    for i := 1 to nOfNumbers do
        write(randomNumbers[i], '  ');
    writeln();
end.
