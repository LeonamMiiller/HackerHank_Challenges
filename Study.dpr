program Study;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  similar_strings in 'similar-strings\similar_strings.pas',
  exceptional_server in 'exceptional_server\exceptional_server.pas';

begin
  try


      CallMe();



  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
