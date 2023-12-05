object dmConexao: TdmConexao
  OldCreateOrder = False
  Left = 796
  Top = 304
  Height = 341
  Width = 429
  object Conexao: TSQLConnection
    Connected = True
    ConnectionName = 'Conexao'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=localhost:C:\Thalita\DB\ESTUDOS.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=1'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 192
    Top = 16
  end
  object dstCIDADES: TSQLDataSet
    NoMetadata = True
    SQLConnection = Conexao
    CommandText = 'SELECT CIDADE_ID, CIDADE_NOME, CIDADE_UF FROM CIDADES'
    Params = <>
    Left = 344
    Top = 16
    object dstCIDADESCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object dstCIDADESCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Required = True
      Size = 50
    end
    object dstCIDADESCIDADE_UF: TStringField
      FieldName = 'CIDADE_UF'
      Required = True
      Size = 2
    end
  end
  object dspCIDADES: TDataSetProvider
    DataSet = dstCIDADES
    Constraints = True
    Left = 344
    Top = 71
  end
  object cdsCIDADES: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCIDADES'
    Left = 344
    Top = 125
    object cdsCIDADESCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      Required = True
    end
    object cdsCIDADESCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      Required = True
      Size = 50
    end
    object cdsCIDADESCIDADE_UF: TStringField
      FieldName = 'CIDADE_UF'
      Required = True
      Size = 2
    end
  end
  object dsCIDADES: TDataSource
    DataSet = cdsCIDADES
    Left = 344
    Top = 180
  end
  object dstCLIENTES: TSQLDataSet
    SQLConnection = Conexao
    DataSource = dsCLIENTES
    Params = <>
    Left = 48
    Top = 16
  end
  object dpsCLIENTES: TDataSetProvider
    DataSet = dstCLIENTES
    Constraints = True
    Left = 48
    Top = 74
  end
  object cdsCLIENTES: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dpsCLIENTES'
    Left = 48
    Top = 131
  end
  object dsCLIENTES: TDataSource
    DataSet = cdsCLIENTES
    Left = 48
    Top = 180
  end
  object qrConsulta: TSQLQuery
    NoMetadata = True
    SQLConnection = Conexao
    DataSource = dsCLIENTES
    Params = <>
    Left = 192
    Top = 112
  end
end
