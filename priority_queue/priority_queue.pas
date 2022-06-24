unit priority_queue;

interface

uses
  StrUtils, SysUtils, System.Classes, System.Generics.Collections,
  System.Generics.Defaults;

type
  TAluno = class
    Nome: String;
    ValorCGPA: double;
    ID: Integer;

  end;

type
  TPriorityQueue = class
  private
    procedure processarEvento(Evento: String);
  public
    Lista: TObjectList<TAluno>;
    procedure Execute;
    function AlunoFromString(Valor: String): TAluno;
  end;

implementation

procedure TPriorityQueue.Execute;
var
  i: byte;
begin
  Lista := TObjectList<TAluno>.Create;

  with TStringList.Create do
    try
      Add('ENTER John 3.75 50');
      Add('ENTER Mark 3.8 24');
      Add('ENTER Shafaet 3.7 35');
      Add('SERVED');
      Add('SERVED');
      Add('ENTER Samiha 3.85 36');
      Add('SERVED');
      Add('ENTER Ashley 3.9 42');
      Add('ENTER Maria 3.6 46');
      Add('ENTER Anik 3.95 49');
      Add('ENTER Dan 3.95 50');
      Add('SERVED');

      for i := 0 to Count - 1 do
      begin
        processarEvento(Strings[i]);
      end;

      for i := 0 to Lista.Count - 1 do
        Writeln(Lista[i].Nome);

      Read;
    finally
      Free;
    end;
end;

procedure TPriorityQueue.processarEvento(Evento: String);
begin

  if Evento.StartsWith('SERVED') then
  begin
    Lista.Sort(TComparer<TAluno>.Construct(
      function(const L, R: TAluno): Integer
      begin

        if (L.ValorCGPA = R.ValorCGPA) then
          Result := StrComp(Pchar(L.Nome), Pchar(R.Nome))
        else if (L.ValorCGPA > R.ValorCGPA) then
          Result := -1
        else
          Result := 1;

      end));

    Lista.Delete(0);
  end;

  if Evento.StartsWith('ENTER') then
  begin
    Lista.Add(AlunoFromString(Evento));
  end;

end;

function TPriorityQueue.AlunoFromString(Valor: String): TAluno;
var
  Splitted: TArray<String>;
begin
  FormatSettings.DecimalSeparator := '.';
  Splitted := Valor.Split([' ']);

  Result := TAluno.Create;
  Result.Nome := Splitted[1];
  Result.ValorCGPA := StrToFloat(Splitted[2]);
  Result.ID := StrToInt(Splitted[3]);

end;

end.
