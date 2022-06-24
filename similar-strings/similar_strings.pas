unit similar_strings;

interface

uses
  StrUtils, SysUtils, System.Classes;

Function CallMe(): Boolean;
Function fIs_Similar(firstString, secondString: String): Boolean;
procedure pSimilar_Strings();
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

 result :=  pCountSimilar(firstValue, secondValue, _start, _end, inputedText)

end;

Function CallMe(): Boolean;
var value : Integer;
begin


//  writeln(compute(1, 1) = 8);
//  writeln(compute(1, 2) = 6);
//  writeln(compute(1, 3) = 2);
//  writeln(compute(2, 4) = 1);



end;

Function fIs_Similar(firstString, secondString: String): Boolean;
var
  firstStringArray, secondStringArray: Array of String;
  i: integer;
  Value: Boolean;
begin
  Value := true;
  SetLength(firstStringArray, Length(firstString));
  SetLength(secondStringArray, Length(firstString));

  for i := 1 to Length(firstString) do
  begin

    if MatchStr(firstString[i], firstStringArray) then
      continue
    else
      try

        if MatchStr(secondString[i], firstStringArray) then
        begin
          Value := False;
          break
        end;

      except
        Read
      end;

    firstStringArray[i - 1] := secondString[i];

    if not(firstStringArray[i - 1] = secondString[i]) then
      Value := False;

  end;

  Result := Value;

end;

procedure pSimilar_Strings();
var
  answer, _start, _end, i, j, firstValue, secondValue: integer;
  inputedText: String;
  string_check: String;

  firstString, secondString: String;
begin

  firstValue := 8;
  secondValue := 4;
  inputedText := 'giggabaj';
  _start := 1;
  _end := 3;

  // for i := 0 to _start - 1 do
  // begin

  string_check := Copy(inputedText, _start, _end);
  answer := 0;

  firstValue := (Length(inputedText) - _end + _start) - 1;

  if _end = 1 then
  begin
    answer := Length(inputedText);
  end
  else
  for j := 0 to (Length(inputedText) - _end + _start) - 1 do
  begin
    secondString := Copy(inputedText, _start + j, _end);

    writeln(Format('string_check : %s, secondString : %s',
      [string_check, secondString]));


    if (fIs_Similar(string_check, secondString)) then
    begin
      writeln(Format('base: %s, subs: %s', [string_check, secondString]));
      answer := answer + 1;
    end;
  end;
  // end;

  writeln(answer);
  Read;
end;

Function pCountSimilar(n, q, li, ri: integer; S: String): integer;
var
  substringLen, i: integer;
  _end: integer;
  base, subStr: String;
  substrings, similars: TStringList;
   wtf : Boolean;
begin
  substrings := TStringList.Create;
  similars   := TStringList.Create;

  substringLen := (ri + 1) - li;

  if (substringLen = 1) then
  begin
    Result := n;
    exit;
  end;

  writeln(Format('substringLen: %d', [substringLen]));

  base := Copy(S, li, substringLen);
  writeln(Format('substring base: %s', [base]));

  for i := 1 to n+1 do
  begin

    _end := i + substringLen;

    if (_end > n+1) then
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

 //  if similars.Count > 0 then
 //  for i := 0 to similars.Count -1 do
 //  Writeln(similars[i]);

   Result := similars.Count
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

   Result := (totalNotEqual + totalEqual = total) and (totalEqual < 2);
end;

end.
