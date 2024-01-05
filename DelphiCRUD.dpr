program DelphiCRUD;

uses
  Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  uConexao in 'uConexao.pas' {dmConexao: TDataModule},
  uCidades in 'uCidades.pas' {frmCidades},
  uClientes in 'uClientes.pas' {frmClientes},
  uFuncoes in 'uFuncoes.pas' {frmFuncoes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmCidades, frmCidades);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmFuncoes, frmFuncoes);
  Application.Run;
end.
