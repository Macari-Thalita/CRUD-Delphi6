unit uCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, uConexao;

type
   TfrmCidades = class(TForm)
    pnGRIDCidades: TPanel;
    pnCadastroCidades: TPanel;
    lblCidade: TLabel;
    edCidade: TEdit;
    lblUF: TLabel;
    edUF: TEdit;
    btnCancelar: TButton;
    dbGridCidades: TDBGrid;
    btnExcluir: TButton;
    btnVoltar: TButton;
    btnCadastrar: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AvisoCadastroIncompleto;
    procedure CadastrarCidade;
    procedure ExcluirCidade;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCidades:  TfrmCidades;
  LCadastroIncompleto: Boolean;

implementation

{$R *.dfm}

procedure TfrmCidades.AvisoCadastroIncompleto;
begin
   if (Trim(edCidade.Text) = EmptyStr) or (Trim(edUF.Text) = EmptyStr) then
   begin
      MessageDlg('Preencha corretamente todos os campos!', mtWarning, [mbOK], 0);
      edCidade.SetFocus;
      LCadastroIncompleto := true;
   end
   else
      LCadastroIncompleto := false;
end;

procedure TfrmCidades.CadastrarCidade; 
begin
  try
    dmConexao.CadastrarCidade(edCidade.Text, edUF.Text);
    MessageDlg('Cidade cadastrada com sucesso!', mtInformation, [mbOK], 0);
  except
    on E: Exception do
      MessageDlg('Erro ao cadastrar cidade: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmCidades.ExcluirCidade;
var
  CidadeID: Integer;
begin
  try
    if not dmConexao.cdsCIDADES.IsEmpty then
    begin
      CidadeID := dmConexao.cdsCIDADES.FieldByName('CIDADE_ID').AsInteger;
      dmConexao.ExcluirCidade(CidadeID);
      MessageDlg('Cidade excluída com sucesso!', mtInformation, [mbOK], 0);
    end
    else
    begin
      MessageDlg('Nenhuma cidade selecionada para exclusão.', mtWarning, [mbOK], 0);
    end;
  except
    on E: Exception do
      MessageDlg('Erro ao excluir cidade: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmCidades.btnCadastrarClick(Sender: TObject);
begin
   AvisoCadastroIncompleto;
   
   if LCadastroIncompleto then
   begin
      Exit;
   end
   else
   begin
      CadastrarCidade;
      edCidade.Text := EmptyStr;
      edUF.Text     := EmptyStr;
   end;
end;

procedure TfrmCidades.FormCreate(Sender: TObject);
begin
   Left := (Screen.Width - Width) div 2;
   Top  := (Screen.Height - Height) div 2;
end;


procedure TfrmCidades.FormShow(Sender: TObject);
begin
   edCidade.SetFocus;
end;
procedure TfrmCidades.btnVoltarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCidades.btnExcluirClick(Sender: TObject);
begin
   if (dmConexao.cdsCIDADES.RecordCount > 0) then
   begin
      ExcluirCidade;
   end
   else
   begin
      MessageDlg('Nenhum registro encontrado!', mtInformation, [mbOk], 0);
   end;
end;
end.

