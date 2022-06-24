program Study;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.StrUtils,
  similar_strings in 'similar-strings\similar_strings.pas',
  exceptional_server in 'exceptional_server\exceptional_server.pas',
  priority_queue in 'priority_queue\priority_queue.pas';

begin

  try

    if ParamStr(1) = '1' then
    begin
      Execute;
    end
    else if ParamStr(1) = '2' then
    begin
      with TExcept.Create do
        Execute;
    end
    else if ParamStr(1) = '3' then
    begin
      with TPriorityQueue.Create do
        Execute;
    end
    else
    begin
       Writeln('Escolha o exercicio');
       Writeln('Digite: 1 paraSimilarString');
       Writeln('Digite: 2 ExceptionalServer');
       Writeln('Digite: 3 PriorityQueue');
    end;


    Read;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
