program SisVendas;

uses
  System.StartUpCopy,
  FMX.Forms,
  uSisVendas in 'uSisVendas.pas' {FormPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFormat in 'uFormat.pas',
  uSincronismo in 'uSincronismo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
