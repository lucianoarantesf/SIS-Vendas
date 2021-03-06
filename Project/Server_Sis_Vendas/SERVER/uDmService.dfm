object ServerMethodDM: TServerMethodDM
  OldCreateOrder = False
  Encoding = esUtf8
  OnUserBasicAuth = ServerMethodDataModuleUserBasicAuth
  QueuedRequest = False
  Height = 476
  Width = 717
  object RESTDWPoolerDB1: TRESTDWPoolerDB
    RESTDriver = RESTDWDriverFD1
    Compression = True
    Encoding = esUtf8
    StrsTrim = True
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 79
    Top = 25
  end
  object Server_FDConnection: TFDConnection
    Params.Strings = (
      'Database=DBV'
      'User_Name=Admin'
      'Password=sa'
      'Server=192.168.100.111'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 47
    Top = 25
  end
  object RESTDWDriverFD1: TRESTDWDriverFD
    CommitRecords = 5000
    Connection = Server_FDConnection
    Left = 111
    Top = 25
  end
  object DWServerEvents: TDWServerEvents
    IgnoreInvalidParams = True
    Events = <
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'NAME'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CPF'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CEP'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'ENDERECO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'TIPO'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'GravaCadPessoa'
        EventName = 'GravaCadPessoa'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEvents1EventsGravaCadPessoaReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'NAME'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CPF'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CEP'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'ENDERECO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'TIPO'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'UpdateCadPessoa'
        EventName = 'UpdateCadPessoa'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsUpdateCadPessoaReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CPF'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'DeleteCadPessoa'
        EventName = 'DeleteCadPessoa'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsDeleteCadPessoaReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'NOME_FANTA'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CNPJ'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'RAZAO_SOCIAL'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'STATUS'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'GravaCadFornecedor'
        EventName = 'GravaCadFornecedor'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsGravaCadFornecedorReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CNPJ'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'NOME_FANTA'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'RAZAO_SOCIAL'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'STATUS'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'UpdateCadFornecedor'
        EventName = 'UpdateCadFornecedor'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsUpdateCadFornecedorReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CNPJ'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'DeleteCadFornecedor'
        EventName = 'DeleteCadFornecedor'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsDeleteCadFornecedorReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'NOME_PRODUTO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'VALOR'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'COD_FORNECEDOR'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'STATUS'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'ESTOQUE'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'GravarCadProduto'
        EventName = 'GravarCadProduto'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsGravarCadProdutoReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'COD_PRODUTO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'NOME_PRODUTO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'VALOR'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'COD_FORNECEDOR'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'STATUS'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'ESTOQUE'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'UpdateCadProduto'
        EventName = 'UpdateCadProduto'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsUpdateCadProdutoReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odINOUT
            ObjectValue = ovString
            ParamName = 'COD_PRODUTO'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'DeleteCadProduto'
        EventName = 'DeleteCadProduto'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsDeleteCadProdutoReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'DATA'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'COD_CLIENTE'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'STATUS'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'Return'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'AbrirVenda'
        EventName = 'AbrirVenda'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsAbrirVendaReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'COD_VENDA'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'COD_PRODUTO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'QUANTIDADE'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'PRODUTO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'VALOR'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'AdicionarProdutoVenda'
        EventName = 'AdicionarProdutoVenda'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsAdicionarProdutoVendaReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'COD_VENDA'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'DeleteVenda'
        EventName = 'DeleteVenda'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsDeleteVendaReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odINOUT
            ObjectValue = ovString
            ParamName = 'COD_VENDA'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'GravarVenda'
        EventName = 'GravarVenda'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsGravarVendaReplyEvent
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'CPF'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'USUARIO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'SENHA'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovBoolean
            ParamName = 'PERCADPESSOA'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovBoolean
            ParamName = 'PERCADFORNECEDOR'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovBoolean
            ParamName = 'PERCADPRODUTO'
            Encoded = True
          end
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovBoolean
            ParamName = 'PERVENDAS'
            Encoded = True
          end>
        JsonMode = jmDataware
        Name = 'GravaCadUsuario'
        EventName = 'GravaCadUsuario'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEventsEventsGravaCadUsuarioReplyEvent
      end>
    Left = 144
    Top = 24
  end
  object qryInsere: TFDCommand
    Connection = Server_FDConnection
    Left = 288
    Top = 24
  end
  object qryVerificaCodigo_Pessoa: TFDQuery
    Connection = Server_FDConnection
    SQL.Strings = (
      'SELECT MAX(cod_pessoa) cod_pessoa FROM "PESSOA"')
    Left = 80
    Top = 136
  end
  object qryUpdate: TFDCommand
    Connection = Server_FDConnection
    Left = 288
    Top = 72
  end
  object qryVerificaCPF_Pessoa: TFDQuery
    Connection = Server_FDConnection
    SQL.Strings = (
      'SELECT * FROM "PESSOA"'
      'WHERE "CPF" = :CPF')
    Left = 112
    Top = 136
    ParamData = <
      item
        Name = 'CPF'
        ParamType = ptInput
      end>
  end
  object qryDelete: TFDCommand
    Connection = Server_FDConnection
    Left = 288
    Top = 120
  end
  object qryVerficaCod_Fornecedor: TFDQuery
    Connection = Server_FDConnection
    SQL.Strings = (
      'SELECT MAX(COD_FORNECEDOR) COD_FORNECEDOR FROM "FORNECEDOR"')
    Left = 80
    Top = 200
  end
  object qryVerificaCNPJ_Fornecedor: TFDQuery
    Connection = Server_FDConnection
    SQL.Strings = (
      'SELECT * FROM "FORNECEDOR"'
      'WHERE "CNPJ" = :CNPJ')
    Left = 112
    Top = 200
    ParamData = <
      item
        Name = 'CNPJ'
        ParamType = ptInput
      end>
  end
  object qryVerificaCodProduto: TFDQuery
    Connection = Server_FDConnection
    SQL.Strings = (
      'SELECT MAX(COD_PRODUTO) COD_PRODUTO FROM "PRODUTO"')
    Left = 80
    Top = 264
    object qryVerificaCodProdutocod_produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object qryTemProduto: TFDQuery
    Connection = Server_FDConnection
    SQL.Strings = (
      'SELECT * FROM "PRODUTO"'
      'WHERE COD_PRODUTO = :COD_PRODUTO'
      '')
    Left = 112
    Top = 264
    ParamData = <
      item
        Name = 'COD_PRODUTO'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object qryVerificaCodVenda: TFDQuery
    Connection = Server_FDConnection
    SQL.Strings = (
      'SELECT MAX(COD_VENDA) AS COD_VENDA FROM "VENDA"')
    Left = 80
    Top = 320
    object qryVerificaCodVendacod_venda: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cod_venda'
      Origin = 'cod_venda'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 
      'C:\TrabalhosFaculdade\SIS Vendas\Project\Server_Sis_Vendas\SERVE' +
      'R'
    Left = 48
    Top = 80
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 432
    Top = 24
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 440
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 80
  end
end
