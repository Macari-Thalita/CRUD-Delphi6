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
  private
    { Private declarations }
  public
    procedure CadastrarCidade(const Nome, UF: string);    
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

procedure TdmConexao.CadastrarCidade(const Nome, UF: string);
begin
   cdsCIDADES.Close;
   cdsCIDADES.Open;
   cdsCIDADES.Append;
   cdsCIDADES.Params.ParamByName('Nome').Value := Nome;
   cdsCIDADES.Params.ParamByName('UF').Value   := UF;
   cdsCIDADES.Post;
   cdsCIDADES.ApplyUpdates(0);
end;
end.
