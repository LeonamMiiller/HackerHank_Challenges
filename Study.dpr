program Study;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  similar_strings in 'similar-strings\similar_strings.pas',
  exceptional_server in 'exceptional_server\exceptional_server.pas',
  priority_queue in 'priority_queue\priority_queue.pas';

begin
  try


     // CallMe();

   //  with TExcept.Create do
   //  Execute;


      with TPriorityQueue.Create do
      Execute;

     Read;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
