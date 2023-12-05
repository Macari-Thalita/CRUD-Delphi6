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
    { Private declarations }
  public
    procedure CadastrarCidade (const Nome, UF: string);
    procedure ExcluirCidade   (const CidadeID: Integer);
  end;

var
  dmConexao: TdmConexao;

implementation

{$R *.dfm}

{ TdmConexao }

//procedure TdmConexao.CadastrarCidade(const Nome, UF: string);
//begin
//   cdsCIDADES.Close;
//   cdsCIDADES.Clear;
//   cdsCIDADES.Add('INSERT INTO CIDADES (CIDADE_NOME, CIDADE_UF) VALUES (:Nome, :UF)');
//   cdsCIDADES.Params.ParamByName('Nome').Value := Nome;
//   cdsCIDADES.Params.ParamByName('UF').Value   := UF;
//   cdsCIDADES.Open;
//   cdsCIDADES.Post;
//   cdsCIDADES.ApplyUpDates(0);
//   Close;
//end;


//procedure TdmConexao.CadastrarCidade(const Nome, UF: string);
//begin
//   cdsCIDADES.Close;
//   cdsCIDADES.CommandText := 'INSERT INTO CIDADES (CIDADE_NOME, CIDADE_UF) VALUES (:Nome, :UF)';
//   cdsCIDADES.Params.ParamByName('Nome').Value := Nome;
//   cdsCIDADES.Params.ParamByName('UF').Value   := UF;
//   cdsCIDADES.Open;
//   cdsCIDADES.Append;
//   cdsCIDADES.Post;
//   cdsCIDADES.ApplyUpdates(0);
//end;

//procedure TdmConexao.CadastrarCidade(const Nome, UF: string);
//begin
//   cdsCIDADES.Close;
//   cdsCIDADES.Open;
//   qrConsulta.SQL.Text := 'SET GENERATOR GEN_CIDADE_ID TO 0';
//   qrConsulta.ExecSQL;
//   cdsCIDADES.Append;
//   cdsCIDADESCIDADE_NOME.AsString := Nome;
//   cdsCIDADESCIDADE_UF.AsString := UF;
//   cdsCIDADES.Post;
//   cdsCIDADES.ApplyUpdates(0);
//end;

//procedure TdmConexao.CadastrarCidade(const Nome, UF: string);
//begin
//   qrConsulta.Close;
//   qrConsulta.SQL.Clear;
//   qrConsulta.SQL.Add('SELECT CAST(GEN_ID(GEN_CIDADE_ID, 1) as Integer) as CIDADE_ID from RDB$DATABASE');
//   qrConsulta.Open;
//   cdsCIDADES.Post;
//   cdsCIDADES.ApplyUpdates(0);
//
//
//   qrConsulta.Close;
//   qrConsulta.SQL.Clear;
//   qrConsulta.SQL.Add('INSERT INTO CIDADES ("CIDADE_NOME", "CIDADE_UF") values (:Nome, :UF)');
//   qrConsulta.ParamByName(':Nome').asString := dmConexao.cdsCIDADESCIDADE_NOME.Value;
//   qrConsulta.ParamByName(':UF').asString   := dmConexao.cdsCIDADESCIDADE_UF.Value;
//   qrConsulta.Open;
//   cdsCIDADES.Post;
//  // cdsCIDADES.ApplyUpdates(0);
//end;

procedure TdmConexao.CadastrarCidade(const Nome, UF: string);
begin
   try
      cdsCIDADES.Close;
      cdsCIDADES.Open;
      cdsCIDADES.Append;
      cdsCIDADESCIDADE_NOME.AsString := Nome;
      cdsCIDADESCIDADE_UF.AsString   := UF;
      qrConsulta.SQL.Clear;
      qrConsulta.SQL.Add('SELECT CAST(GEN_ID(GEN_CIDADE_ID, 1) as Integer) as CIDADE_ID from RDB$DATABASE');
      qrConsulta.Open;
      cdsCIDADESCIDADE_ID.AsInteger := qrConsulta.FieldByName('CIDADE_ID').AsInteger;
   finally
      qrConsulta.Close;
   end;
   cdsCIDADES.Post;
   cdsCIDADES.ApplyUpdates(0);
end;

procedure TdmConexao.ExcluirCidade(const CidadeID: Integer);
begin
   try
      cdsCIDADES.Close;
      cdsCIDADES.Open;
      
    if cdsCIDADES.Locate('CIDADE_ID', CidadeID, []) then
    begin
       cdsCIDADES.Delete;
       cdsCIDADES.ApplyUpdates(0);
    end;
   finally
      qrConsulta.Close;
   end;
end;
end.

