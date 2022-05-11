unit undmsrv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Win.Registry, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, uRESTDWBase;

type
  TRestDWsrv = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    RESTServicePooler : TRESTServicePooler;
  end;

var
  RestDWsrv: TRestDWsrv;

implementation

uses
  uDmService,ServerUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tdmsrv }

procedure TRestDWsrv.ServiceCreate(Sender: TObject);
begin
  RESTServicePooler := TRESTServicePooler.Create(Nil);
  RESTServicePooler.ServerMethodClass     := TServerMethodDM;
  RESTServicePooler.ServicePort           := 8082;
  RESTServicePooler.SSLPrivateKeyFile     := '';
  RESTServicePooler.SSLPrivateKeyPassword := '';
  RESTServicePooler.SSLCertFile           := '';
  RESTServicePooler.MultiCORE             := True;
  RESTServicePooler.Active                := True;


end;
procedure TRestDWsrv.ServiceDestroy(Sender: TObject);
begin
 RESTServicePooler.Active := False;
 RESTServicePooler.DisposeOf;
end;

end.
