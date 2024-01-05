unit uFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmFuncoes = class(TForm)
  private
    { Private declarations }
  public
    procedure CadastrarCidade            (const ANome, AUF: string);
    procedure ExcluirCidade              (const ACidadeID: Integer);
    procedure CarregaDadosSelecionados   ();
    procedure AlterarCidade              (const ANome, AUF, ACidadeID: string);
  end;

var
  frmFuncoes: TfrmFuncoes;

implementation

uses uCidades, uConexao;

{$R *.dfm}

procedure TfrmFuncoes.CadastrarCidade(const ANome, AUF: string);
begin
   try
      dmConexao.cdsCIDADES.Close;
      dmConexao.cdsCIDADES.Open;
      dmConexao.cdsCIDADES.Append;
      dmConexao.cdsCIDADESCIDADE_NOME.AsString := ANome;
      dmConexao.cdsCIDADESCIDADE_UF.AsString   := AUF;
      dmConexao.qrConsulta.SQL.Clear;
      dmConexao.qrConsulta.SQL.Add('SELECT CAST(GEN_ID(GEN_CIDADE_ID, 1) as Integer) as CIDADE_ID from RDB$DATABASE');
      dmConexao.qrConsulta.Open;
      dmConexao.cdsCIDADESCIDADE_ID.AsInteger := dmConexao.qrConsulta.FieldByName('CIDADE_ID').AsInteger;
   finally
      dmConexao.qrConsulta.Close;
   end;
      dmConexao.cdsCIDADES.Post;
      dmConexao.cdsCIDADES.ApplyUpdates(0);
end;

procedure TfrmFuncoes.ExcluirCidade(const ACidadeID: Integer);
begin
   try
    if dmConexao.cdsCIDADES.Locate('CIDADE_ID', ACidadeID, []) then
    begin
       dmConexao.cdsCIDADES.Delete;
       dmConexao.cdsCIDADES.ApplyUpdates(0);
    end;
   finally
      dmConexao.qrConsulta.Close;
   end;
end;

procedure TfrmFuncoes.CarregaDadosSelecionados();
begin
  try
    if not dmConexao.cdsCIDADES.IsEmpty then
    begin
       frmCidades.edCidade.Text       := dmConexao.cdsCIDADES.FieldByName('CIDADE_NOME').AsString;
       frmCidades.edUF.Text           := dmConexao.cdsCIDADES.FieldByName('CIDADE_UF').AsString;
       frmCidades.edCidadeID.Text     := dmConexao.cdsCIDADES.FieldByName('CIDADE_ID').AsString;
    end;
  finally
     dmConexao.qrConsulta.Close;
  end;
end;

procedure TfrmFuncoes.AlterarCidade(const ANome, AUF, ACidadeID: string);
begin
  try
    if not dmConexao.cdsCIDADES.IsEmpty then
    begin
       dmConexao.cdsCIDADES.Edit;
       dmConexao.cdsCIDADES.FieldByName('CIDADE_NOME').AsString := ANome;
       dmConexao.cdsCIDADES.FieldByName('CIDADE_UF').AsString   := AUF;
       dmConexao.cdsCIDADES.Post;
       dmConexao.cdsCIDADES.ApplyUpdates(0);
    end;
  finally
     dmConexao.qrConsulta.Close;
  end;
end;

end.
