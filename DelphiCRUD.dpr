program DelphiCRUD;

uses
  Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  uConexao in 'uConexao.pas' {dmConexao: TDataModule},
  uCidades in 'uCidades.pas' {frmCidades},
  uClientes in 'uClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmCidades, frmCidades);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
