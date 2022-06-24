unit exceptional_server;

interface

uses
SysUtils, System.Classes;

type
  TExcept = class
  private
    FValor: double;
    FLoad: integer;
    procedure compute(A, B : int64) ;
  public
      procedure Execute;


  end;

implementation


procedure TExcept.compute(A, B : int64) ;
var myArray : array of integer;
begin
        FLoad := FLoad+1;

       if (A < 0) then
       raise Exception.Create('A is negative');



end;


procedure TExcept.Execute;
var  i : integer;
begin

   with TStringList.Create do
   begin
      Add('-8=5');
      Add('1435434255433=5');

      for i := 0 to Count -1 do
      begin
            try

               compute(StrToInt64(Names[i]), StrToInt64(ValueFromIndex[i])) ;

            Except
              On E : Exception do
              Writeln(E.Message);


            end;
      end
   end;

   Writeln(FLoad.ToString);
   read

end;

end.
