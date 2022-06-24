unit similar_strings;

interface

uses
  StrUtils, SysUtils, System.Classes;

Procedure Execute;
Function fSimilar(firstString: String; subs: String; q: integer): Boolean;

function compute(_start, _end: integer): integer;

Function pCountSimilar(n, q, li, ri: integer; S: String): integer;

implementation

function compute(_start, _end: integer): integer;
const
  firstValue = 8;
  secondValue = 4;
var
  inputedText: String;
begin

  inputedText := 'giggabaj';

  result := pCountSimilar(firstValue, secondValue, _start, _end, inputedText)

end;

Procedure Execute;
begin

   writeln(compute(1, 1) = 8);
   writeln(compute(1, 2) = 6);
   writeln(compute(1, 3) = 2);
   writeln(compute(2, 4) = 1);

end;


Function pCountSimilar(n, q, li, ri: integer; S: String): integer;
var
  substringLen, i: integer;
  _end: integer;
  base, subStr: String;
  substrings, similars: TStringList;
  wtf: Boolean;
begin
  substrings := TStringList.Create;
  similars := TStringList.Create;

  substringLen := (ri + 1) - li;

  if (substringLen = 1) then
  begin
    result := n;
    exit;
  end;

  writeln(Format('substringLen: %d', [substringLen]));

  base := Copy(S, li, substringLen);
  writeln(Format('substring base: %s', [base]));

  for i := 1 to n + 1 do
  begin

    _end := i + substringLen;

    if (_end > n + 1) then
      continue;

    substrings.Add(Copy(S, i, substringLen));

  end;

  for i := 0 to substrings.Count - 1 do
    writeln(Format('all substrings: %s', [substrings[i]]));

  for i := 0 to substrings.Count - 1 do
  begin
    subStr := substrings[i];
    if (fSimilar(base, subStr, q)) then
    begin
      similars.Add(subStr);
    end;
  end;


  result := similars.Count
end;

Function fSimilar(firstString: String; subs: String; q: integer): Boolean;
var
  i, j, totalEqual, totalNotEqual, total: integer;
begin

  if (Length(firstString) <> Length(subs)) then
    exit;

  totalEqual := 0;
  totalNotEqual := 0;
  total := 0;

  for i := 1 to Length(firstString) do
    for j := 1 to Length(firstString) do
    begin

      if (i = j) then
        continue;
      if (i > j) then
        continue;

      writeln(Format('i: %d j: %d', [i, j]));

      total := total + 1;

      if ((firstString[i] = firstString[j]) and (subs[i] = subs[j])) then
        totalEqual := totalEqual + 1;

      if ((firstString[i] <> firstString[j]) and (subs[i] <> subs[j])) then
        totalNotEqual := totalNotEqual + 1;

    end;

  result := (totalNotEqual + totalEqual = total) and (totalEqual < 2);
end;

end.
