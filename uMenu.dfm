object frmMenu: TfrmMenu
  Left = 570
  Top = 228
  Width = 820
  Height = 490
  Caption = 'Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnMenu: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 431
    Align = alClient
    TabOrder = 0
    object imgLogo: TImage
      Left = 240
      Top = 152
      Width = 305
      Height = 105
    end
  end
  object mainMenu: TMainMenu
    Left = 368
    Top = 8
    object mnCidades: TMenuItem
      Caption = 'Cidades'
      object mnCadastroCidades: TMenuItem
        Caption = 'Cadastro'
        OnClick = mnCadastroCidadesClick
      end
      object mnRelatorioCidades: TMenuItem
        Caption = 'Relat'#243'rio de cidades'
      end
    end
    object mnClientes: TMenuItem
      Caption = 'Clientes'
      object mnCadastroClientes: TMenuItem
        Caption = 'Cadastro'
        OnClick = mnCadastroClientesClick
      end
      object mnRelatorioClientes: TMenuItem
        Caption = 'Relat'#243'rio de clientes'
      end
    end
  end
end
