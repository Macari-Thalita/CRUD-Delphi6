unit uCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, uConexao, uFuncoes;

type
   TfrmCidades = class(TForm)
    pnCadastroCidades: TPanel;
    lblCidade: TLabel;
    edCidade: TEdit;
    lblUF: TLabel;
    edUF: TEdit;
    btnCancelar: TButton;
    btnVoltar: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    dbGridCidades: TDBGrid;
    btnAlterar: TButton;
    btnNovo: TButton;
    btnPesquisar: TButton;
    btnRelatorio: TButton;
    lblID: TLabel;
    edCidadeID: TEdit;
    btnAtualizar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure AvisoCadastroIncompleto();
    procedure CadastrarCidade();
    procedure ExcluirCidade();
    procedure AlterarCidade();
    procedure HabilitaFoco();
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  private
   FCadastroIncompleto: Boolean;
   FModoEdicao:         Boolean;
   FResultadoPesquisar: String;
  public
    { Public declarations }
  end;

var
  frmCidades: TfrmCidades;

implementation

{$R *.dfm}

procedure TfrmCidades.AvisoCadastroIncompleto();
begin
   if (Trim(edCidade.Text)) = EmptyStr then
   begin
      MessageDlg('Preencha corretamente a cidade!', mtWarning, [mbOK], 0);
      edCidade.SetFocus;
      FCadastroIncompleto := True;
      Exit;
   end;

   if (Trim(edUF.Text)) = EmptyStr then
   begin
      MessageDlg('Preencha corretamente a UF!', mtWarning, [mbOK], 0);
      edUF.SetFocus;
      FCadastroIncompleto := True;
      Exit;
   end;
end;

procedure TfrmCidades.HabilitaFoco();
begin
   edCidade.Enabled  := True;
   edUF.Enabled      := True;
   lblCidade.Enabled := True;
   lblUF.Enabled     := True;
   btnSalvar.Enabled := True;
end;


procedure TfrmCidades.CadastrarCidade(); 
begin
   try
      frmFuncoes.CadastrarCidade(edCidade.Text, edUF.Text);
      MessageDlg('Cidade cadastrada com sucesso!', mtInformation, [mbOK], 0);
   except
      on E: Exception do
      MessageDlg('Erro ao cadastrar cidade: ' + E.Message, mtError, [mbOK], 0);
   end;
end;

procedure TfrmCidades.AlterarCidade();
begin
   try
      if not dmConexao.cdsCIDADES.IsEmpty then
      begin
         frmFuncoes.AlterarCidade(edCidade.Text, edUF.Text, edCidadeID.Text);
         MessageDlg('Cidade alterada com sucesso!', mtInformation, [mbOK], 0);
      end
      else
      begin
         MessageDlg('Nenhuma cidade selecionada para alteração.', mtWarning, [mbOK], 0);
      end;
   except
      on E: Exception do
      MessageDlg('Erro ao alterar cidade: ' + E.Message, mtError, [mbOK], 0);
   end;
end;

procedure TfrmCidades.ExcluirCidade();
var
   ACidadeID: Integer;
begin
   try
     if not dmConexao.cdsCIDADES.IsEmpty then
     begin
        ACidadeID := dmConexao.cdsCIDADES.FieldByName('CIDADE_ID').AsInteger;
        frmFuncoes.ExcluirCidade(ACidadeID);
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

procedure TfrmCidades.btnSalvarClick(Sender: TObject);
begin
   AvisoCadastroIncompleto();

   if (FCadastroIncompleto) then
      Exit
   else
   begin
      if (FModoEdicao) then
      begin
         AlterarCidade();
         edCidade.Text := EmptyStr;
         edUF.Text     := EmptyStr;
      end
      else
      begin
         CadastrarCidade();
         edCidade.Text := EmptyStr;
         edUF.Text     := EmptyStr;
      end;
   end;
end;

procedure TfrmCidades.btnVoltarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCidades.btnExcluirClick(Sender: TObject);
begin
   try
      dmConexao.cdsCIDADES.Close;
      dmConexao.cdsCIDADES.Open;
      
      if (dmConexao.cdsCIDADES.RecordCount > 0) then
      begin
         ExcluirCidade();
      end
      else
      begin
         MessageDlg('Nenhum registro encontrado!', mtInformation, [mbOk], 0);
      end;
   finally
      dmConexao.qrConsulta.Close;
   end;
end;

procedure TfrmCidades.btnNovoClick(Sender: TObject);
begin
   HabilitaFoco();
   edCidadeID.Text   := EmptyStr;
   FModoEdicao       := False;
   edUF.SetFocus;
end;

procedure TfrmCidades.btnCancelarClick(Sender: TObject);
begin
   edCidade.Text      := EmptyStr;
   edUF.Text          := EmptyStr;
   edCidadeID.Text    := EmptyStr;
end;

procedure TfrmCidades.btnAlterarClick(Sender: TObject);
begin
   HabilitaFoco();
   FModoEdicao := True;
   frmFuncoes.CarregaDadosSelecionados();   
end;

procedure TfrmCidades.FormCreate(Sender: TObject);
begin
   dmConexao.cdsCIDADES.Open;
end;

procedure TfrmCidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dmConexao.cdsCIDADES.Close;
end;

procedure TfrmCidades.btnPesquisarClick(Sender: TObject);
begin
   FResultadoPesquisar:= InputBox('Pesquisa', 'Informe a descrição:', '');

   if (FResultadoPesquisar <> EmptyStr) then
   begin
      frmFuncoes.PesquisarCidade(FResultadoPesquisar);
      dbGridCidades.Refresh;
   end;
end;

procedure TfrmCidades.btnAtualizarClick(Sender: TObject);
begin
   frmFuncoes.AtualizarCidades();
end;

end.

