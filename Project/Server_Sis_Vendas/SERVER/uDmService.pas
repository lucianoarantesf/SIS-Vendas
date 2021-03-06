UNIT uDmService;

INTERFACE

USES
  SysUtils,
  Classes,
  SysTypes,
  UDWDatamodule,
  System.JSON,
  UDWJSONObject,
  Dialogs,
  ServerUtils,
  UDWConsts,
  UDWConstsData,
  Data.DB,
  URESTDWPoolerDB,
  uDWAbout, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase,
  FireDAC.Comp.Client, uRestDWDriverFD, uRESTDWServerEvents, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FMX.Graphics, FMX.Surfaces,
  Soap.EncdDecd, FireDAC.DApt, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, FMX.Canvas.D2D, uRESTDWBase,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.VCLUI.Wait;

TYPE
  TServerMethodDM = CLASS(TServerMethodDataModule)
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    Server_FDConnection: TFDConnection;
    RESTDWDriverFD1: TRESTDWDriverFD;
    DWServerEvents: TDWServerEvents;
    qryInsere: TFDCommand;
    qryVerificaCodigo_Pessoa: TFDQuery;
    qryUpdate: TFDCommand;
    qryVerificaCPF_Pessoa: TFDQuery;
    qryDelete: TFDCommand;
    qryVerficaCod_Fornecedor: TFDQuery;
    qryVerificaCNPJ_Fornecedor: TFDQuery;
    qryVerificaCodProduto: TFDQuery;
    qryVerificaCodProdutocod_produto: TIntegerField;
    qryTemProduto: TFDQuery;
    IntegerField1: TIntegerField;
    qryVerificaCodVenda: TFDQuery;
    qryVerificaCodVendacod_venda: TIntegerField;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure ServerMethodDataModuleUserBasicAuth(Welcomemsg, AccessTag,
      Username, Password: string; var Params: TDWParams; var ErrorCode: Integer;
      var ErrorMessage: string; var Accept: Boolean);
    procedure DWServerEvents1EventsGravaCadPessoaReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsUpdateCadPessoaReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsDeleteCadPessoaReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsGravaCadFornecedorReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsUpdateCadFornecedorReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsDeleteCadFornecedorReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsGravarCadProdutoReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsUpdateCadProdutoReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsDeleteCadProdutoReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsAbrirVendaReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure DWServerEventsEventsAdicionarProdutoVendaReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure DWServerEventsEventsDeleteVendaReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure DWServerEventsEventsGravarVendaReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure DWServerEventsEventsGravaCadUsuarioReplyEvent(
      var Params: TDWParams; var Result: string);

  PRIVATE
    { Private declarations }
  PUBLIC
    { Public declarations }
  END;

VAR
  ServerMethodDM: TServerMethodDM;

IMPLEMENTATION

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}



{ TServerMethodDM }

procedure TServerMethodDM.DWServerEvents1EventsGravaCadPessoaReplyEvent(
  var Params: TDWParams; var Result: string);
begin
   // COMANDO PARA GRAVAR OS DADOS DE CADASTRO DE PESSOA.

   try
    Server_FDConnection.StartTransaction;
    qryVerificaCodigo_Pessoa.Close;
    qryVerificaCodigo_Pessoa.Open();

    qryInsere.CommandText.Clear;
    qryInsere.CommandText.Add('INSERT INTO "PESSOA"(cod_pessoa,"NAME","CPF","CEP","ENDERECO","TIPO","FLG_EXCLUIDO")');
    qryInsere.CommandText.Add('VALUES (:cod_pessoa,:NAME,:CPF,:CEP,:ENDERECO,:TIPO,False)');
    qryInsere.ParamByName('cod_pessoa').AsInteger  :=  qryVerificaCodigo_Pessoa.FieldByName('cod_pessoa').AsInteger + 10;
    qryInsere.ParamByName('NAME').AsString     :=  Params.ItemsString['NAME'].AsString;
    qryInsere.ParamByName('CPF').AsString      :=  Params.ItemsString['CPF'].AsString;
    qryInsere.ParamByName('CEP').AsString      :=  Params.ItemsString['CEP'].AsString;
    qryInsere.ParamByName('ENDERECO').AsString :=  Params.ItemsString['ENDERECO'].AsString;
    qryInsere.ParamByName('TIPO').AsString     :=  Params.ItemsString['TIPO'].AsString;
    qryInsere.Execute();

    if Params.ItemsString['TIPO'].AsString = 'Cliente' then
    begin
      qryInsere.CommandText.Clear;
      qryInsere.CommandText.Add('INSERT INTO "CLIENTE"(cod_cliente, cod_pessoa,"CPF","NAME","STATUS","FLG_EXCLUIDO")');
      qryInsere.CommandText.Add('VALUES (:cod_cliente, :cod_pessoa,:CPF,:NAME,''Ativo'',False)');
      qryInsere.ParamByName('cod_cliente').AsInteger  :=  qryVerificaCodigo_Pessoa.FieldByName('cod_pessoa').AsInteger + 10;
      qryInsere.ParamByName('cod_pessoa').AsInteger  :=  qryVerificaCodigo_Pessoa.FieldByName('cod_pessoa').AsInteger + 10;
      qryInsere.ParamByName('NAME').AsString     :=  Params.ItemsString['NAME'].AsString;
      qryInsere.ParamByName('CPF').AsString      :=  Params.ItemsString['CPF'].AsString;
      qryInsere.Execute();

    end;

    Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao GRAVAR:' + e.Message;
    end;

   end;


end;
procedure TServerMethodDM.DWServerEventsEventsDeleteCadPessoaReplyEvent(
  var Params: TDWParams; var Result: string);
begin

   try
    Server_FDConnection.StartTransaction;
    qryVerificaCPF_Pessoa.Close;
    qryVerificaCPF_Pessoa.ParamByName('CPF').AsString :=  Params.ItemsString['CPF'].AsString;
    qryVerificaCPF_Pessoa.Open();

    if not qryVerificaCPF_Pessoa.IsEmpty then
    begin
    qryDelete.CommandText.Clear;
    qryDelete.CommandText.Add('UPDATE "PESSOA" SET "FLG_EXCLUIDO" = :FLG WHERE "CPF" = :CPF');
    qryDelete.ParamByName('CPF').AsString      :=  Params.ItemsString['CPF'].AsString;
    qryDelete.ParamByName('FLG').AsBoolean     :=  True;
    qryDelete.Execute();

    qryDelete.CommandText.Clear;
    qryDelete.CommandText.Add('UPDATE "CLIENTE" SET "FLG_EXCLUIDO" = :FLG WHERE "CPF" = :CPF');
    qryDelete.ParamByName('CPF').AsString      :=  Params.ItemsString['CPF'].AsString;
    qryDelete.ParamByName('FLG').AsBoolean     :=  True;
    qryDelete.Execute();
    end;

    Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao DELETAR:' + e.Message;
    end;

   end;


end;
procedure TServerMethodDM.DWServerEventsEventsUpdateCadPessoaReplyEvent(
  var Params: TDWParams; var Result: string);
begin
   try
    Server_FDConnection.StartTransaction;
    qryVerificaCPF_Pessoa.Close;
    qryVerificaCPF_Pessoa.ParamByName('CPF').AsString :=  Params.ItemsString['CPF'].AsString;
    qryVerificaCPF_Pessoa.Open();

    if not qryVerificaCPF_Pessoa.IsEmpty then
    begin
    qryUpdate.CommandText.Clear;
    qryUpdate.CommandText.Add('UPDATE "PESSOA" SET "NAME" = :NAME, "CEP" = :CEP, "ENDERECO" = :ENDERECO');
    qryUpdate.CommandText.Add('WHERE "CPF" = :CPF');
    qryUpdate.ParamByName('NAME').AsString     :=  Params.ItemsString['NAME'].AsString;
    qryUpdate.ParamByName('CPF').AsString      :=  Params.ItemsString['CPF'].AsString;
    qryUpdate.ParamByName('CEP').AsString      :=  Params.ItemsString['CEP'].AsString;
    qryUpdate.ParamByName('ENDERECO').AsString :=  Params.ItemsString['ENDERECO'].AsString;
    qryUpdate.Execute();

    Server_FDConnection.Commit;
    end;


   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao MODIFICAR:' + e.Message;
    end;

   end;

end;





procedure TServerMethodDM.DWServerEventsEventsAbrirVendaReplyEvent(
  var Params: TDWParams; var Result: string);
  var
    vData :TDateTime;
begin
     try
    Server_FDConnection.StartTransaction;
    qryVerificaCodVenda.Close;
    qryVerificaCodVenda.Open();

    qryInsere.CommandText.Clear;
    qryInsere.CommandText.Add('INSERT INTO "VENDA"(cod_venda,"DATA","STATUS","COD_CLIENTE")');
    qryInsere.CommandText.Add('VALUES (:cod_venda,:DATA,:STATUS,:COD_CLIENTE)');

    qryInsere.ParamByName('cod_venda').AsInteger      :=  qryVerificaCodVenda.FieldByName('COD_VENDA').AsInteger + 10;
    qryInsere.ParamByName('COD_CLIENTE').AsInteger    :=  StrToInt(Params.ItemsString['COD_CLIENTE'].AsString);
    vData := StrToDateTime(Params.ItemsString['DATA'].AsString);
    qryInsere.ParamByName('DATA').AsDateTime          :=   vData;
    qryInsere.ParamByName('STATUS').AsString          :=  Params.ItemsString['STATUS'].AsString;


    qryInsere.Execute();
    Result := IntToStr(qryVerificaCodVenda.FieldByName('COD_VENDA').AsInteger + 10);
    Params.ItemsString['Return'].AsString := IntToStr(qryVerificaCodVenda.FieldByName('COD_VENDA').AsInteger + 10);
    Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao GRAVAR:' + e.Message;
      Params.ItemsString['Return'].AsString := 'erro';
    end;

   end;
end;

procedure TServerMethodDM.DWServerEventsEventsAdicionarProdutoVendaReplyEvent(
  var Params: TDWParams; var Result: string);
  var
   vQuantidade : Integer;
   vValor : Double;
begin
     try
        vQuantidade := 0;
        vValor      := 0;
    Server_FDConnection.StartTransaction;

    qryInsere.CommandText.Clear;
    qryInsere.CommandText.Add('INSERT INTO "DETAL_VENDA"("COD_PRODUTO","COD_VENDA","QUANTIDADE","PRODUTO","VALOR_TOTAL")');
    qryInsere.CommandText.Add('VALUES (:COD_PRODUTO,:COD_VENDA,:QUANTIDADE,:PRODUTO,:VALOR_TOTAL)');

    qryInsere.ParamByName('COD_PRODUTO').AsInteger      :=  StrToInt(Params.ItemsString['COD_PRODUTO'].AsString);
    qryInsere.ParamByName('COD_VENDA').AsInteger        :=  StrToInt(Params.ItemsString['COD_VENDA'].AsString);

    vQuantidade :=  StrToInt(Params.ItemsString['QUANTIDADE'].AsString);
    qryInsere.ParamByName('QUANTIDADE').AsInteger       :=  vQuantidade;

    vValor :=  StrToFloat(Params.ItemsString['VALOR'].AsString);
    qryInsere.ParamByName('VALOR_TOTAL').AsFloat       :=  (vQuantidade * vValor);

    qryInsere.ParamByName('PRODUTO').AsString           :=  Params.ItemsString['PRODUTO'].AsString;
    qryInsere.Execute();


    qryUpdate.CommandText.Clear;
    qryUpdate.CommandText.Add(' UPDATE "PRODUTO" SET "ESTOQUE" = "ESTOQUE" - :QUANTIDADE '+
                              ' WHERE cod_produto = :cod_produto');
    qryUpdate.ParamByName('COD_PRODUTO').AsInteger      :=  StrToInt(Params.ItemsString['COD_PRODUTO'].AsString);
    vQuantidade :=  StrToInt(Params.ItemsString['QUANTIDADE'].AsString);
    qryUpdate.ParamByName('QUANTIDADE').AsInteger       :=  vQuantidade;
    qryUpdate.Execute();


    Server_FDConnection.Commit;

    Result := 'Ok';
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao GRAVAR:' + e.Message;
    end;

   end;
end;

procedure TServerMethodDM.DWServerEventsEventsDeleteCadFornecedorReplyEvent(
  var Params: TDWParams; var Result: string);
begin
     try
    Server_FDConnection.StartTransaction;
    qryVerificaCNPJ_Fornecedor.Close;
    qryVerificaCNPJ_Fornecedor.ParamByName('CNPJ').AsString :=  Params.ItemsString['CNPJ'].AsString;
    qryVerificaCNPJ_Fornecedor.Open();

    if not qryVerificaCNPJ_Fornecedor.IsEmpty then
    begin
    qryDelete.CommandText.Clear;
    qryDelete.CommandText.Add('UPDATE "FORNECEDOR" SET "FLG_EXCLUIDO" = :FLG WHERE "CNPJ" = :CNPJ');
    qryDelete.ParamByName('CNPJ').AsString      :=  Params.ItemsString['CNPJ'].AsString;
    qryDelete.ParamByName('FLG').AsBoolean     :=  True;
    qryDelete.Execute();
    end;

        Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao DELETAR:' + e.Message;
    end;

   end;
end;
procedure TServerMethodDM.DWServerEventsEventsUpdateCadFornecedorReplyEvent(
  var Params: TDWParams; var Result: string);
begin
   try
    Server_FDConnection.StartTransaction;
    qryVerificaCNPJ_Fornecedor.Close;
    qryVerificaCNPJ_Fornecedor.ParamByName('CNPJ').AsString :=  Params.ItemsString['CNPJ'].AsString;
    qryVerificaCNPJ_Fornecedor.Open();

    if not qryVerificaCNPJ_Fornecedor.IsEmpty then
    begin
    qryUpdate.CommandText.Clear;
    qryUpdate.CommandText.Add('UPDATE "FORNECEDOR" SET "NOME_FANTA" = :NOME_FANTA, "RAZAO_SOCIAL" = :RAZAO_SOCIAL, "STATUS" = :STATUS');
    qryUpdate.CommandText.Add('WHERE "CNPJ" = :CNPJ');
    qryUpdate.ParamByName('CNPJ').AsString          :=  Params.ItemsString['CNPJ'].AsString;
    qryUpdate.ParamByName('NOME_FANTA').AsString    :=  Params.ItemsString['NOME_FANTA'].AsString;
    qryUpdate.ParamByName('RAZAO_SOCIAL').AsString  :=  Params.ItemsString['RAZAO_SOCIAL'].AsString;
    qryUpdate.ParamByName('STATUS').AsString        :=  Params.ItemsString['STATUS'].AsString;
    qryUpdate.Execute();
    Server_FDConnection.Commit;
    end;


   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao MODIFICAR:' + e.Message;
    end;

   end;

end;
procedure TServerMethodDM.DWServerEventsEventsGravaCadFornecedorReplyEvent(
  var Params: TDWParams; var Result: string);
begin
     try
    Server_FDConnection.StartTransaction;
    qryVerficaCod_Fornecedor.Close;
    qryVerficaCod_Fornecedor.Open();

    qryInsere.CommandText.Clear;
    qryInsere.CommandText.Add('INSERT INTO "FORNECEDOR"(cod_fornecedor,"NOME_FANTA","CNPJ","RAZAO_SOCIAL","STATUS","FLG_EXCLUIDO")');
    qryInsere.CommandText.Add('VALUES (:cod_fornecedor,:NOME_FANTA,:CNPJ,:RAZAO_SOCIAL,:STATUS, False)');
    qryInsere.ParamByName('cod_fornecedor').AsInteger :=  qryVerficaCod_Fornecedor.FieldByName('COD_FORNECEDOR').AsInteger + 10;
    qryInsere.ParamByName('NOME_FANTA').AsString      :=  Params.ItemsString['NOME_FANTA'].AsString;
    qryInsere.ParamByName('CNPJ').AsString            :=  Params.ItemsString['CNPJ'].AsString;
    qryInsere.ParamByName('RAZAO_SOCIAL').AsString    :=  Params.ItemsString['RAZAO_SOCIAL'].AsString;
    qryInsere.ParamByName('STATUS').AsString          :=  Params.ItemsString['STATUS'].AsString;

    qryInsere.Execute();

    Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao GRAVAR:' + e.Message;
    end;

   end;

end;



procedure TServerMethodDM.DWServerEventsEventsGravaCadUsuarioReplyEvent(
  var Params: TDWParams; var Result: string);
begin
   qryVerificaCPF_Pessoa.Close;
   qryVerificaCPF_Pessoa.ParamByName('CPF').AsString := Params.ItemsString['CPF'].AsString;
   qryVerificaCPF_Pessoa.Open;

  qryInsere.CommandText.Clear;
  qryInsere.CommandText.Add('INSERT INTO "USUARIO"(cod_usuario, cod_pessoa, "USUARIO", "SENHA","PERCADPESSOA","PERCADFORNECEDOR","PERCADPRODUTO","PERVENDAS","FLG_EXCLUIDO" )');
  qryInsere.CommandText.Add('VALUES (:cod_usuario, :cod_pessoa, :USUARIO, :SENHA,:PERCADPESSOA,:PERCADFORNECEDOR,:PERCADPRODUTO,:PERVENDAS, False)');

  qryInsere.ParamByName('cod_usuario').AsInteger  := qryVerificaCPF_Pessoa.FieldByName('cod_pessoa').AsInteger;
  qryInsere.ParamByName('cod_pessoa').AsInteger   := qryVerificaCPF_Pessoa.FieldByName('cod_pessoa').AsInteger;
  qryInsere.ParamByName('USUARIO').AsString       :=  Params.ItemsString['USUARIO'].AsString;
  qryInsere.ParamByName('SENHA').AsString         :=  Params.ItemsString['SENHA'].AsString;
  qryInsere.ParamByName('PERCADPESSOA').AsBoolean        :=  Params.ItemsString['PERCADPESSOA'].AsBoolean;
  qryInsere.ParamByName('PERCADFORNECEDOR').AsBoolean    :=  Params.ItemsString['PERCADFORNECEDOR'].AsBoolean;
  qryInsere.ParamByName('PERCADPRODUTO').AsBoolean       :=  Params.ItemsString['PERCADPRODUTO'].AsBoolean;
  qryInsere.ParamByName('PERVENDAS').AsBoolean           :=  Params.ItemsString['PERVENDAS'].AsBoolean;
  qryInsere.Execute();

end;

procedure TServerMethodDM.DWServerEventsEventsDeleteCadProdutoReplyEvent(
  var Params: TDWParams; var Result: string);
begin

   try
    Server_FDConnection.StartTransaction;
    qryTemProduto.Close;
    qryTemProduto.ParamByName('COD_PRODUTO').AsInteger := StrToInt( Params.ItemsString['COD_PRODUTO'].AsString);
    qryTemProduto.Open();

    if not qryTemProduto.IsEmpty then
    begin
    qryDelete.CommandText.Clear;
    qryDelete.CommandText.Add('UPDATE "PRODUTO" SET "FLG_EXCLUIDO" = :FLG WHERE cod_produto = :COD_PRODUTO');
    qryDelete.ParamByName('FLG').AsBoolean     :=  True;
    qryDelete.ParamByName('COD_PRODUTO').AsInteger     :=  StrToInt( Params.ItemsString['COD_PRODUTO'].AsString);
    qryDelete.Execute();
    end;

    Server_FDConnection.Commit;

   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao DELETAR:' + e.Message;
    end;

   end;
end;
procedure TServerMethodDM.DWServerEventsEventsDeleteVendaReplyEvent(
  var Params: TDWParams; var Result: string);
begin
     try
    Server_FDConnection.StartTransaction;


    qryDelete.CommandText.Clear;
    qryDelete.CommandText.Add('DELETE FROM "DETAL_VENDA" WHERE "COD_VENDA" = :COD_VENDA');
    qryDelete.ParamByName('COD_VENDA').AsInteger     :=  StrToInt( Params.ItemsString['COD_VENDA'].AsString);
    qryDelete.Execute();

    qryDelete.CommandText.Clear;
    qryDelete.CommandText.Add('DELETE FROM "VENDA" WHERE cod_venda = :cod_venda');
    qryDelete.ParamByName('cod_venda').AsInteger     :=  StrToInt( Params.ItemsString['COD_VENDA'].AsString);
    qryDelete.Execute();


    Server_FDConnection.Commit;



   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao DELETAR:' + e.Message;
    end;

   end;
end;

procedure TServerMethodDM.DWServerEventsEventsGravarCadProdutoReplyEvent(
  var Params: TDWParams; var Result: string);
  var vVALOR : String;
begin
   try
    Server_FDConnection.StartTransaction;
    qryVerificaCodProduto.Close;
    qryVerificaCodProduto.Open();

    vVALOR := StringReplace(Params.ItemsString['VALOR'].AsString, 'R$','', [rfReplaceAll, rfIgnoreCase]);

    qryInsere.CommandText.Clear;
    qryInsere.CommandText.Add('INSERT INTO "PRODUTO" (COD_PRODUTO,"DESCRICAO","PRECO",cod_fornecedor,status,"FLG_EXCLUIDO","ESTOQUE")');
    qryInsere.CommandText.Add('VALUES (:COD_PRODUTO,:DESCRICAO,:PRECO,:cod_fornecedor,:status, False, :ESTOQUE)');
    qryInsere.ParamByName('COD_PRODUTO').AsInteger    :=  qryVerificaCodProduto.FieldByName('COD_PRODUTO').AsInteger + 10;
    qryInsere.ParamByName('DESCRICAO').AsString       :=  Params.ItemsString['NOME_PRODUTO'].AsString;
    qryInsere.ParamByName('PRECO').AsFloat            :=  StrToFloat(vVALOR) ;
    qryInsere.ParamByName('cod_fornecedor').AsInteger :=  StrToInt(Params.ItemsString['COD_FORNECEDOR'].AsString);
    qryInsere.ParamByName('STATUS').AsString          :=  Params.ItemsString['STATUS'].AsString;
    qryInsere.ParamByName('ESTOQUE').AsInteger         :=  StrtoInt(Params.ItemsString['ESTOQUE'].AsString);
    qryInsere.Execute();

    Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao GRAVAR:' + e.Message;
    end;

   end;

end;

procedure TServerMethodDM.DWServerEventsEventsGravarVendaReplyEvent(
  var Params: TDWParams; var Result: string);
begin
     try
    Server_FDConnection.StartTransaction;


    qryUpdate.CommandText.Clear;
    qryUpdate.CommandText.Add('UPDATE "VENDA" SET "STATUS" = ''Efetivada'' ');
    qryUpdate.CommandText.Add('WHERE COD_VENDA = :COD_VENDA');

    qryUpdate.ParamByName('COD_VENDA').AsInteger    :=  StrtoInt(Params.ItemsString['COD_VENDA'].AsString);

    qryUpdate.Execute();

    Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao GRAVAR:' + e.Message;
    end;

   end;
end;

procedure TServerMethodDM.DWServerEventsEventsUpdateCadProdutoReplyEvent(
  var Params: TDWParams; var Result: string);
  var vVALOR : String;
begin
   try
    Server_FDConnection.StartTransaction;

    vVALOR := StringReplace(Params.ItemsString['VALOR'].AsString, 'R$','', [rfReplaceAll, rfIgnoreCase]);

    qryTemProduto.Close;
    qryTemProduto.ParamByName('COD_PRODUTO').AsInteger := StrToInt( Params.ItemsString['COD_PRODUTO'].AsString);
    qryTemProduto.Open();

    if not qryTemProduto.IsEmpty then
    begin
    qryUpdate.CommandText.Clear;
    qryUpdate.CommandText.Add('UPDATE "PRODUTO" SET "DESCRICAO" = :DESCRICAO, '+
                              '"PRECO" = :PRECO, '+
                              'status = :STATUS, '+
                              '"ESTOQUE" = :ESTOQUE' );
    qryUpdate.CommandText.Add('WHERE cod_produto = :cod_produto');
    qryUpdate.ParamByName('COD_PRODUTO').AsInteger    :=  StrtoInt(Params.ItemsString['COD_PRODUTO'].AsString);
    qryUpdate.ParamByName('DESCRICAO').AsString       :=  Params.ItemsString['NOME_PRODUTO'].AsString;
    qryUpdate.ParamByName('PRECO').AsFloat            :=  StrToFloat(vVALOR);
    qryUpdate.ParamByName('STATUS').AsString          :=  Params.ItemsString['STATUS'].AsString;
    qryUpdate.ParamByName('ESTOQUE').AsInteger        :=  StrtoInt(Params.ItemsString['ESTOQUE'].AsString);
    qryUpdate.Execute();
    end;
    Server_FDConnection.Commit;
   except
    on e:exception do
    begin
      Server_FDConnection.Rollback;
      Result := 'Erro ao GRAVAR:' + e.Message;
    end;

   end;
end;

procedure TServerMethodDM.ServerMethodDataModuleUserBasicAuth(Welcomemsg,
  AccessTag, Username, Password: string; var Params: TDWParams;
  var ErrorCode: Integer; var ErrorMessage: string; var Accept: Boolean);
begin
 inherited;
  Accept := True;
 end;

END.
