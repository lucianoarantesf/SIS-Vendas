﻿program SisVendas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  uSisVendas in 'uSisVendas.pas' {FormPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uSincronismo in 'uSincronismo.pas',
  uFormat in 'uFormat.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
