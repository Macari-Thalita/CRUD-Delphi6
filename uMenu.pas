unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,{ pngimage,} ExtCtrls;

type
  TfrmMenu = class(TForm)
    mainMenu: TMainMenu;
    mnCidades: TMenuItem;
    mnClientes: TMenuItem;
    mnCadastroCidades: TMenuItem;
    mnCadastroClientes: TMenuItem;
    mnRelatorioCidades: TMenuItem;
    mnRelatorioClientes: TMenuItem;
    pnMenu: TPanel;
    imgLogo: TImage;
    procedure mnCadastroCidadesClick(Sender: TObject);
    procedure mnCadastroClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses uCidades, uClientes;

{$R *.dfm}

procedure TfrmMenu.mnCadastroCidadesClick(Sender: TObject);
begin
   Application.CreateForm(TfrmCidades, frmCidades);
   frmCidades.ShowModal;
   frmCidades.Release;
   frmCidades := nil;
end;

procedure TfrmMenu.mnCadastroClientesClick(Sender: TObject);
begin
   Application.CreateForm(TfrmClientes, frmClientes);
   frmClientes.ShowModal;
   frmClientes.Release;
   frmClientes := nil;
end;

end.
