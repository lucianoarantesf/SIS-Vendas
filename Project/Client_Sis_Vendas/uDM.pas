unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDWConstsData, uRESTDWPoolerDB, uDWAbout, uRESTDWServerEvents, uRESTDWBase;

type
  TDM = class(TDataModule)
    DataBase: TRESTDWDataBase;
    qryUsuario: TRESTDWClientSQL;
    DWClientEvents: TDWClientEvents;
    RESTClientPooler: TRESTClientPooler;
    qryPessoa: TRESTDWClientSQL;
    qryFornecedor: TRESTDWClientSQL;
    qryProduto: TRESTDWClientSQL;
    qryCliente: TRESTDWClientSQL;
    qryProdutoVenda: TRESTDWClientSQL;
    qryProduto_Fornecedor: TRESTDWClientSQL;
    qryProduto_Fornecedorcod_fornecedor: TIntegerField;
    qryProduto_Fornecedoridentificador: TStringField;
    qryVendas: TRESTDWClientSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
