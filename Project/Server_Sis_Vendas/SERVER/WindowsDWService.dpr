program WindowsDWService;


uses
  Vcl.SvcMgr,
  System.SysUtils,
  uRESTDWBase,
  uDmService in 'uDmService.pas' {ServerMethodDM: TServerMethodDataModule},
  undmsrv in 'undmsrv.pas' {RestDWsrv: TDataModule};

{$R *.RES}

Begin
  {$ifdef DEBUG}
  {$APPTYPE CONSOLE}
   // In debug mode the server acts as a console application.
  Try
   WriteLn('Vendas RDW CORE - Server : DEBUG mode. Press enter to exit.');
   // Create the TService descendant manually.
   If Not Application.DelayInitialize Or Application.Installing Then
    Application.Initialize;
   Application.CreateForm(TRestDWsrv, RestDWsrv);
   Application.Run;
   ReadLn;
  Except
   On E: Exception Do
    Begin
     Writeln(E.ClassName, ': ', E.Message);
     ReadLn;
    End;
  End;
  {$else}
  {$APPTYPE CONSOLE}
  Try
   WriteLn('Vendas RDW CORE - Server');
   If Not Application.DelayInitialize Or Application.Installing Then
   Application.Initialize;
   Application.CreateForm(TRestDWsrv, RestDWsrv);
   Application.Run;
   ReadLn;
  Except
     On E: Exception Do
    Begin
    Writeln(E.ClassName, ': ', E.Message);
    ReadLn;
    End;
  End;
  {$endif}
End.

