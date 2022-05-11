object DM: TDM
  OldCreateOrder = False
  Height = 293
  Width = 381
  object DataBase: TRESTDWDataBase
    Active = True
    Compression = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    MyIP = '127.0.0.1'
    AuthenticationOptions.AuthorizationOption = rdwAOBasic
    AuthenticationOptions.OptionParams.AuthDialog = True
    AuthenticationOptions.OptionParams.CustomDialogAuthMessage = 'Protected Space...'
    AuthenticationOptions.OptionParams.Custom404TitleMessage = '(404) The address you are looking for does not exist'
    AuthenticationOptions.OptionParams.Custom404BodyMessage = '404'
    AuthenticationOptions.OptionParams.Custom404FooterMessage = 'Take me back to <a href="./">Home REST Dataware'
    AuthenticationOptions.OptionParams.Username = 'Admin'
    AuthenticationOptions.OptionParams.Password = '@dMiN01'
    Proxy = False
    ProxyOptions.Port = 8888
    PoolerService = 'LOCALHOST'
    PoolerPort = 8082
    PoolerName = 'TServerMethodDM.RESTDWPoolerDB1'
    StateConnection.AutoCheck = False
    StateConnection.InTime = 1000
    RequestTimeOut = 50000
    ConnectTimeOut = 50000
    EncodeStrings = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    PoolerNotFoundMessage = 'Pooler not found'
    HandleRedirects = False
    RedirectMaximum = 0
    ParamCreate = False
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    ClientConnectionDefs.Active = False
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    Left = 47
    Top = 14
  end
  object qryUsuario: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvStoreItems, rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = True
    MasterCascadeDelete = True
    BinaryRequest = True
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <
      item
        DataType = ftWideString
        Name = 'usuario'
        ParamType = ptInput
        Size = 8190
      end
      item
        DataType = ftWideString
        Name = 'senha'
        ParamType = ptInput
        Size = 8190
      end>
    DataBase = DataBase
    SQL.Strings = (
      'select * from "USUARIO"'
      'where  "USUARIO" = :usuario'
      'and "SENHA" = :senha')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 46
    Top = 62
  end
  object DWClientEvents: TDWClientEvents
    ServerEventName = 'TServerMethodDM.DWServerEvents'
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    RESTClientPooler = RESTClientPooler
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
          end>
        JsonMode = jmDataware
        Name = 'AbrirVenda'
        EventName = 'AbrirVenda'
        OnlyPreDefinedParams = False
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
      end>
    Left = 152
    Top = 64
  end
  object RESTClientPooler: TRESTClientPooler
    DataCompression = True
    Encoding = esUtf8
    hEncodeStrings = True
    ThreadRequest = False
    Host = 'LOCALHOST'
    AuthenticationOptions.AuthorizationOption = rdwAOBasic
    AuthenticationOptions.OptionParams.AuthDialog = True
    AuthenticationOptions.OptionParams.CustomDialogAuthMessage = 'Protected Space...'
    AuthenticationOptions.OptionParams.Custom404TitleMessage = '(404) The address you are looking for does not exist'
    AuthenticationOptions.OptionParams.Custom404BodyMessage = '404'
    AuthenticationOptions.OptionParams.Custom404FooterMessage = 'Take me back to <a href="./">Home REST Dataware'
    AuthenticationOptions.OptionParams.Username = 'Admin'
    AuthenticationOptions.OptionParams.Password = '@dMiN01'
    ProxyOptions.BasicAuthentication = False
    ProxyOptions.ProxyPort = 0
    RequestTimeOut = 50000
    ConnectTimeOut = 50000
    AllowCookies = False
    RedirectMaximum = 0
    HandleRedirects = False
    FailOver = False
    FailOverConnections = <>
    FailOverReplaceDefaults = False
    BinaryRequest = True
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/41.0.2227.0 Safari/537.36'
    PoolerNotFoundMessage = 'Pooler not found'
    Left = 152
    Top = 16
  end
  object qryPessoa: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <
      item
        Name = 'codtxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'cod_pessoa'
        DataType = ftInteger
      end
      item
        Name = 'nomtxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'cpftxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'ceptxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'endtxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'tiptxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'usutxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'usuario'
        DataType = ftString
        Size = 8190
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvStoreItems, rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = True
    MasterCascadeDelete = True
    BinaryRequest = True
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DataBase
    SQL.Strings = (
      'SELECT '
      #39'COD:'#39'::"varchar"  AS CODTXT, P.cod_pessoa,'
      #39'NOM:'#39'::"varchar"  AS NOMTXT, P."NAME",'
      #39'CPF:'#39'::"varchar"  AS CPFTXT, P."CPF",'
      #39'CEP:'#39'::"varchar"  AS CEPTXT, P."CEP",'
      #39'END:'#39' ::"varchar" AS ENDTXT, P."ENDERECO",'
      #39'TIP:'#39' ::"varchar" AS TIPTXT, P."TIPO",'
      
        #39'USU:'#39' ::"varchar"  AS USUTXT, CASE WHEN P."TIPO" = '#39'Funcionario' +
        #39' '
      
        #9#9#9#9#9#9'THEN (SELECT "USUARIO" FROM "USUARIO" U WHERE U.cod_pessoa' +
        ' = P.cod_pessoa)'
      #9#9#9#9#9#9'ELSE '#39'CLIENTE N'#195'O POSSUI USU'#193'RIO'#39
      #9#9#9#9#9#9'END AS USUARIO'
      'FROM "PESSOA" P'
      'WHERE "FLG_EXCLUIDO"  = False'
      ''
      'ORDER BY P.cod_pessoa')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 262
    Top = 6
  end
  object qryFornecedor: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <
      item
        Name = 'codtxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'cod_fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'nometxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'NOME_FANTA'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'cnpjtxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'razaotxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'RAZAO_SOCIAL'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'statustxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 8190
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvStoreItems, rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = True
    MasterCascadeDelete = True
    BinaryRequest = True
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DataBase
    SQL.Strings = (
      'SELECT '#39'COD:'#39'::"varchar"  AS CODTXT,cod_fornecedor,'
      #39'NOME FANTASIA:'#39'::"varchar"  AS NOMETXT,"NOME_FANTA",'
      #39'CNPJ:'#39'::"varchar"  AS CNPJTXT,"CNPJ",'
      #39'RAZ'#195'O SOCIAL:'#39'::"varchar"  AS RAZAOTXT,"RAZAO_SOCIAL",'
      #39'STATUS:'#39'::"varchar"  AS STATUSTXT,"STATUS" '
      'FROM "FORNECEDOR"'
      'WHERE "FLG_EXCLUIDO"  = False'
      ''
      'ORDER BY cod_fornecedor')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 262
    Top = 64
  end
  object qryProduto: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <
      item
        Name = 'prodtext'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'precotext'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'statustxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'estoquetxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'cod_produto'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'PRECO'
        DataType = ftSingle
        Precision = 7
      end
      item
        Name = 'cod_fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'status'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'FLG_EXCLUIDO'
        DataType = ftBoolean
      end
      item
        Name = 'ESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'fornecedor'
        DataType = ftString
        Size = 8190
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = True
    MasterCascadeDelete = True
    BinaryRequest = True
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DataBase
    SQL.Strings = (
      
        'SELECT  '#39'PRODUTO:'#39' ::"varchar"  AS PRODTEXT, '#39'PRE'#199'O:'#39'::"varchar"' +
        '  AS PRECOTEXT, '#39'STATUS:'#39'::"varchar"  AS STATUSTXT, '#39'ESTOQUE:'#39'::' +
        '"varchar"  AS ESTOQUETXT,'
      
        'P.*, (F."RAZAO_SOCIAL" || '#39' - '#39' || F."CNPJ")::"varchar" AS FORNE' +
        'CEDOR  FROM "PRODUTO" P, "FORNECEDOR" F'
      'WHERE P.cod_fornecedor = F.cod_fornecedor'
      'AND P."FLG_EXCLUIDO" <>  TRUE')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 264
    Top = 120
  end
  object qryCliente: TRESTDWClientSQL
    Active = True
    Filtered = False
    FieldDefs = <
      item
        Name = 'cod_cliente'
        DataType = ftInteger
      end
      item
        Name = 'cod_pessoa'
        DataType = ftInteger
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 8190
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvStoreItems, rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = True
    MasterCascadeDelete = True
    BinaryRequest = True
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DataBase
    SQL.Strings = (
      
        'SELECT cod_cliente, cod_pessoa,("CPF")::"varchar" AS CPF,("NAME"' +
        ')::"varchar" AS NAME FROM "CLIENTE"'
      'WHERE "STATUS" = '#39'Ativo'#39
      'AND "FLG_EXCLUIDO" <> TRUE')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 262
    Top = 174
  end
  object qryProdutoVenda: TRESTDWClientSQL
    Active = True
    Filtered = False
    FieldDefs = <
      item
        Name = 'cod_produto'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'PRECO'
        DataType = ftSingle
      end
      item
        Name = 'cod_fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'status'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'FLG_EXCLUIDO'
        DataType = ftBoolean
      end
      item
        Name = 'ESTOQUE'
        DataType = ftInteger
      end
      item
        Name = 'identificador'
        DataType = ftString
        Size = 8190
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvStoreItems, rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = True
    MasterCascadeDelete = True
    BinaryRequest = True
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DataBase
    SQL.Strings = (
      
        'SELECT * ,('#39'PROD: '#39'|| "DESCRICAO" || '#39' -  VALOR: '#39' || "PRECO")::' +
        '"varchar"  AS IDENTIFICADOR FROM "PRODUTO"'
      'WHERE status = '#39'Ativo'#39
      'AND "FLG_EXCLUIDO" <> TRUE')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 294
    Top = 174
  end
  object qryProduto_Fornecedor: TRESTDWClientSQL
    Active = False
    Filtered = False
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = True
    MasterCascadeDelete = True
    BinaryRequest = True
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DataBase
    SQL.Strings = (
      
        'SELECT cod_fornecedor, ("RAZAO_SOCIAL" || '#39' - '#39' || "CNPJ")::"var' +
        'char" AS IDENTIFICADOR FROM "FORNECEDOR"'
      'WHERE "STATUS" = '#39'Ativo'#39)
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crSQLWait
    ReflectChanges = False
    Left = 312
    Top = 120
    object qryProduto_Fornecedorcod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
    end
    object qryProduto_Fornecedoridentificador: TStringField
      FieldName = 'identificador'
      Size = 8190
    end
  end
  object qryVendas: TRESTDWClientSQL
    Active = True
    Filtered = False
    FieldDefs = <
      item
        Name = 'datatxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'DATA'
        DataType = ftDate
      end
      item
        Name = 'clientetxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'produtotxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'quantidadetxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftInteger
      end
      item
        Name = 'valorvendatxt'
        DataType = ftString
        Size = 8190
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftSingle
        Precision = 7
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    BinaryCompatibleMode = False
    MasterCascadeDelete = True
    BinaryRequest = False
    Datapacks = -1
    DataCache = False
    MassiveType = mtMassiveCache
    Params = <>
    DataBase = DataBase
    SQL.Strings = (
      'SELECT '
      #39'DATA:'#39'::"varchar" as DataTxt,'#9#9#9#9'V."DATA",'
      #39'CLIENTE:'#39'::"varchar" as ClienteTxt,'#9#9'C."NAME",'
      #39'PRODUTO:'#39'::"varchar" as ProdutoTxt,'#9#9'DV."PRODUTO",'
      #39'QUANTIDADE:'#39'::"varchar" as QuantidadeTxt,  DV."QUANTIDADE",'
      #39'VALOR VENDA:'#39'::"varchar" as ValorVendaTxt, DV."VALOR_TOTAL"'
      'FROM "VENDA" V, "DETAL_VENDA" DV, "CLIENTE" C'
      'WHERE V.cod_venda = DV."COD_VENDA"'
      'AND V."COD_CLIENTE" = C.cod_cliente')
    CacheUpdateRecords = True
    AutoCommitData = False
    AutoRefreshAfterCommit = False
    ThreadRequest = False
    RaiseErrors = True
    ActionCursor = crHourGlass
    ReflectChanges = False
    Left = 264
    Top = 224
  end
end
