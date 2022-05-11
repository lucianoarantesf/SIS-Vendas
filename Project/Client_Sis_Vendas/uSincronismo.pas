unit uSincronismo;

interface
 uses
  System.SysUtils, FireDAC.Comp.Client, IdHashMessageDigest,
  uRESTDWPoolerDB, FireDAC.Comp.DataSet, System.Classes, Soap.EncdDecd, Data.DB, uDWJSONObject,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, uDWDataset, Firedac.Stan.Param, System.NetEncoding;

  type
  TSincronismo = class
            private
              { private declarations }
            public
              { public declarations }

              function Conectando : Boolean;

              function GravaCadPessoa(vNAME,vCPF,vCEP,vENDERECO,vTIPO : String) :Boolean;
              function GravaCadUsuario(vCPF, vUSUARIO, vSENHA: String; vPERCADPESSOA, vPERCADFORNECEDOR, vPERCADPRODUTO, vPERVENDAS : Boolean) :Boolean;
              function UpdateCadPessoa(vNAME,vCPF,vCEP,vENDERECO,vTIPO : String) :Boolean;
              function DeleteCadPessoa(vCPF : String) :Boolean;

              function GravaCadFornecedor( vNOME_FANTA,vCNPJ,vRAZAO_SOCIAL,vSTATUS : String) :Boolean;
              function UpdateCadFornecedor(vNOME_FANTA,vCNPJ,vRAZAO_SOCIAL,vSTATUS : String) :Boolean;
              function DeleteCadFornecedor(vCNPJ : String) :Boolean;

              function GravaCadProduto( vNOME_PRODUTO,vVALOR,vCOD_FORNECEDOR,vSTATUS,vESTOQUE : String) :Boolean;
              function UpdateCadProduto(vCOD_PRODUTO,vNOME_PRODUTO,vVALOR,vCOD_FORNECEDOR,vSTATUS,vESTOQUE : String) :Boolean;
              function DeleteCadProduto(vCOD_PRODUTO : String) :Boolean;

              function AdicinarVenda( vDATA,vCOD_CLIENTE,vSTATUS : String) :string;
              function AdicionarDetalVenda(vCOD_VENDA,vCOD_PRODUTO,vQUANTIDADE,vPRODUTO,vValor : String) :Boolean;

            end;


implementation

uses
 uDM;

{ TSincronismo }


function TSincronismo.Conectando : Boolean;
begin
 try
   //verifica se ta ativa a conexão, se não tiver ele ativa.
    Result := True;
   if not DM.DataBase.Active then
   dm.DataBase.Active := True;
  except
  on e: Exception do
   begin
    Result := False;
    raise Exception.Create('Erro ao Conectar: '+e.Message);
   end;
  end;
end;

function TSincronismo.DeleteCadFornecedor(vCNPJ: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('DeleteCadFornecedor',dwParams);
   dwParams.ItemsString['CNPJ'].AsString := vCNPJ;
   dm.DWClientEvents.SendEvent('DeleteCadFornecedor',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.DeleteCadPessoa(vCPF: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('DeleteCadPessoa',dwParams);
   dwParams.ItemsString['CPF'].AsString := vCPF;
   dm.DWClientEvents.SendEvent('DeleteCadPessoa',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.DeleteCadProduto(vCOD_PRODUTO: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('DeleteCadProduto',dwParams);
   dwParams.ItemsString['COD_PRODUTO'].AsString := vCOD_PRODUTO;
   dm.DWClientEvents.SendEvent('DeleteCadProduto',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.GravaCadFornecedor(vNOME_FANTA, vCNPJ, vRAZAO_SOCIAL,
  vSTATUS: String): Boolean;
VAR
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('GravaCadFornecedor',dwParams);
   dwParams.ItemsString['NOME_FANTA'].AsString := vNOME_FANTA;
   dwParams.ItemsString['CNPJ'].AsString := vCNPJ;
   dwParams.ItemsString['RAZAO_SOCIAL'].AsString := vRAZAO_SOCIAL;
   dwParams.ItemsString['STATUS'].AsString := vSTATUS;
   dm.DWClientEvents.SendEvent('GravaCadFornecedor',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.GravaCadPessoa(vNAME,vCPF,vCEP,vENDERECO,vTIPO : String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('GravaCadPessoa',dwParams);
   dwParams.ItemsString['NAME'].AsString := vName;
   dwParams.ItemsString['CPF'].AsString := vCPF;
   dwParams.ItemsString['CEP'].AsString := vCEP;
   dwParams.ItemsString['ENDERECO'].AsString := vENDERECO;
   dwParams.ItemsString['TIPO'].AsString := vTIPO;
   dm.DWClientEvents.SendEvent('GravaCadPessoa',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.GravaCadProduto(vNOME_PRODUTO, vVALOR, vCOD_FORNECEDOR,
  vSTATUS, vESTOQUE: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('GravarCadProduto',dwParams);
   dwParams.ItemsString['NOME_PRODUTO'].AsString := vNOME_PRODUTO;
   dwParams.ItemsString['VALOR'].AsString := vVALOR;
   dwParams.ItemsString['COD_FORNECEDOR'].AsString := vCOD_FORNECEDOR;
   dwParams.ItemsString['STATUS'].AsString := vSTATUS;
   dwParams.ItemsString['ESTOQUE'].AsString := vESTOQUE;
   dm.DWClientEvents.SendEvent('GravarCadProduto',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;


function TSincronismo.GravaCadUsuario(vCPF, vUSUARIO, vSENHA: String;
  vPERCADPESSOA, vPERCADFORNECEDOR, vPERCADPRODUTO,
  vPERVENDAS: Boolean): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('GravaCadUsuario',dwParams);
   dwParams.ItemsString['CPF'].AsString := vCPF;
   dwParams.ItemsString['USUARIO'].AsString := vUSUARIO;
   dwParams.ItemsString['SENHA'].AsString := vSENHA;
   dwParams.ItemsString['PERCADPESSOA'].AsBoolean := vPERCADPESSOA;
   dwParams.ItemsString['PERCADFORNECEDOR'].AsBoolean := vPERCADFORNECEDOR;
   dwParams.ItemsString['PERCADPRODUTO'].AsBoolean := vPERCADPRODUTO;
   dwParams.ItemsString['PERVENDAS'].AsBoolean := vPERVENDAS;
   dm.DWClientEvents.SendEvent('GravaCadUsuario',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.UpdateCadFornecedor(vNOME_FANTA, vCNPJ, vRAZAO_SOCIAL,
  vSTATUS: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('UpdateCadFornecedor',dwParams);
   dwParams.ItemsString['NOME_FANTA'].AsString := vNOME_FANTA;
   dwParams.ItemsString['CNPJ'].AsString := vCNPJ;
   dwParams.ItemsString['RAZAO_SOCIAL'].AsString := vRAZAO_SOCIAL;
   dwParams.ItemsString['STATUS'].AsString := vSTATUS;
   dm.DWClientEvents.SendEvent('UpdateCadFornecedor',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.UpdateCadPessoa(vNAME, vCPF, vCEP, vENDERECO,
  vTIPO: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('UpdateCadPessoa',dwParams);
   dwParams.ItemsString['NAME'].AsString := vName;
   dwParams.ItemsString['CPF'].AsString := vCPF;
   dwParams.ItemsString['CEP'].AsString := vCEP;
   dwParams.ItemsString['ENDERECO'].AsString := vENDERECO;
   dwParams.ItemsString['TIPO'].AsString := vTIPO;
   dm.DWClientEvents.SendEvent('UpdateCadPessoa',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;

function TSincronismo.UpdateCadProduto(vCOD_PRODUTO,vNOME_PRODUTO, vVALOR, vCOD_FORNECEDOR,
  vSTATUS,vESTOQUE: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('UpdateCadProduto',dwParams);
   dwParams.ItemsString['COD_PRODUTO'].AsString := vCOD_PRODUTO ;
   dwParams.ItemsString['NOME_PRODUTO'].AsString := vNOME_PRODUTO;
   dwParams.ItemsString['VALOR'].AsString := vVALOR;
   dwParams.ItemsString['COD_FORNECEDOR'].AsString := vCOD_FORNECEDOR;
   dwParams.ItemsString['STATUS'].AsString := vSTATUS;
   dwParams.ItemsString['ESTOQUE'].AsString := vESTOQUE;
   dm.DWClientEvents.SendEvent('UpdateCadProduto',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;



















function TSincronismo.AdicinarVenda(vDATA, vCOD_CLIENTE,
  vSTATUS: String): String;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('AbrirVenda',dwParams);
   dwParams.ItemsString['DATA'].AsString := vDATA ;
   dwParams.ItemsString['COD_CLIENTE'].AsString := vCOD_CLIENTE;
   dwParams.ItemsString['STATUS'].AsString := vSTATUS;
   dm.DWClientEvents.SendEvent('AbrirVenda',dwParams,vError);
   if (dwParams.ItemsString['Return'].AsString = 'erro') then
   begin
     Result := 'Erro';
   end
   else
   begin
    Result := dwParams.ItemsString['Return'].AsString;
   end;

  finally
   dwParams.Free;
  end;
end;

function TSincronismo.AdicionarDetalVenda(vCOD_VENDA, vCOD_PRODUTO,
  vQUANTIDADE, vPRODUTO,vValor: String): Boolean;
var
 dwParams  : TDWParams;
 vError :String;
begin
  try
   dm.DWClientEvents.CreateDWParams('AdicionarProdutoVenda',dwParams);
   dwParams.ItemsString['COD_PRODUTO'].AsString := vCOD_PRODUTO ;
   dwParams.ItemsString['COD_VENDA'].AsString := vCOD_VENDA;
   dwParams.ItemsString['QUANTIDADE'].AsString := vQUANTIDADE;
   dwParams.ItemsString['PRODUTO'].AsString := vPRODUTO;
   dwParams.ItemsString['VALOR'].AsString := vValor;
   dm.DWClientEvents.SendEvent('AdicionarProdutoVenda',dwParams,vError);
   if vError = '' then
   begin
     Result := True;
   end
   else
   begin
    Result := False;
   end;
  finally
   dwParams.Free;
  end;
end;



end.
