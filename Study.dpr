program Study;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  similar_strings in 'similar-strings\similar_strings.pas';

begin
  try


      CallMe();
      readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
