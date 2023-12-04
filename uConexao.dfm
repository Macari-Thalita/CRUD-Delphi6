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
    SQLConnection = Conexao
    DataSource = dsCIDADES
    Params = <>
    Left = 344
    Top = 16
  end
  object dspCIDADES: TDataSetProvider
    DataSet = dstCIDADES
    Constraints = True
    Left = 344
    Top = 71
  end
  object cdsCIDADES: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCIDADES'
    Left = 344
    Top = 125
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
end
