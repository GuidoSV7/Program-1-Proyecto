program Project1;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  UBala in 'UBala.pas',
  UNave in 'UNave.pas',
  UEnemigos in 'UEnemigos.pas',
  UEF in 'UEF.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
