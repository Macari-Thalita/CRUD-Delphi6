unit uConexao;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider;

type
    TdmConexao = class(TDataModule)
    Conexao: TSQLConnection;
    dstCIDADES: TSQLDataSet;
    dspCIDADES: TDataSetProvider;
    cdsCIDADES: TClientDataSet;
    dsCIDADES: TDataSource;
    dstCLIENTES: TSQLDataSet;
    dpsCLIENTES: TDataSetProvider;
    cdsCLIENTES: TClientDataSet;
    dsCLIENTES: TDataSource;
    dstCIDADESCIDADE_ID: TIntegerField;
    dstCIDADESCIDADE_NOME: TStringField;
    dstCIDADESCIDADE_UF: TStringField;
    cdsCIDADESCIDADE_ID: TIntegerField;
    cdsCIDADESCIDADE_NOME: TStringField;
    cdsCIDADESCIDADE_UF: TStringField;
    qrConsulta: TSQLQuery;
  private
   { Private Declarations }
  public
   { Public Declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{$R *.dfm}

{ TdmConexao }
end.

