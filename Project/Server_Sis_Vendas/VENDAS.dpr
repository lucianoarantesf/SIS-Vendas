program VENDAS;

uses
  Vcl.Forms,
  uPrincipal in 'FONTES\uPrincipal.pas' {Fprincipal},
  uDM in 'FONTES\uDM.pas' {DM: TDataModule},
  uSincronismo in 'FONTES\uSincronismo.pas',
  uFormat in 'FONTES\uFormat.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFprincipal, Fprincipal);
  Application.Run;
end.
