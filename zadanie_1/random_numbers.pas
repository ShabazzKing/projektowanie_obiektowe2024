program random_numbers;

uses
    Math, sysutils;

type
    dynarray = array of integer;
var
    randomNumbers : dynarray;
    i : integer;

procedure getNumbers(inf : integer; sup : integer; amount : integer);
var
    i : integer;
begin
    for i := 1 to amount do
        randomNumbers[i] := randomRange(inf, sup + 1);
end;

procedure sortNumbers(amount : integer);
var
    swapped : boolean;
    temp : integer;
    n, i : integer;
begin
    n := amount;
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
    if (argc <> 4) or ((argc = 4) and ((strtoint(argv[1]) > strtoint(argv[2])) or (strtoint(argv[3]) < 1))) then
    begin
        writeln('Użycie: ', argv[0], ' INFIMUM SUPREMUM ILOŚĆ_LOSOWANYCH_LICZB');
        exit;
    end;
    setlength(randomNumbers, strtoint(argv[3]));
    randomize();
    getNumbers(strtoint(argv[1]), strtoint(argv[2]), strtoint(argv[3]));
    sortNumbers(strtoint(argv[3]));
    for i := 1 to strtoint(argv[3]) do
        write(randomNumbers[i], '  ');
    writeln();
end.
