﻿program SisVendas;

uses
  System.StartUpCopy,
  GuiTestRunner,
  FMX.Forms,
  Skia.FMX,
  uSisVendas in 'uSisVendas.pas' {FormPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uSincronismo in 'uSincronismo.pas',
  uTeste in 'uTeste.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
