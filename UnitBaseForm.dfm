object frmBaseForm: TfrmBaseForm
  Left = 0
  Top = 0
  Caption = 'frmBaseForm'
  ClientHeight = 356
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = jvmnmnBaseMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopInf: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 33
    Align = alTop
    TabOrder = 0
  end
  object jvmnmnBaseMenu: TJvMainMenu
    Images = DMForMain.ilIcons16
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 592
    Top = 32
    object btnOpis: TMenuItem
      Caption = 'Opis'
    end
    object btnRelatedData: TMenuItem
      Action = DMForMain.actRelatedData
    end
    object btnGraphs: TMenuItem
      Action = DMForMain.actGraph
    end
    object btn3DShow: TMenuItem
      Action = DMForMain.actShow3D
    end
    object btnOsoby: TMenuItem
      Action = DMForMain.actOsoby
    end
    object btnUdalosti: TMenuItem
      Action = DMForMain.actUdalosti
    end
    object btnTechnika: TMenuItem
      Action = DMForMain.actTechnika
    end
    object btnClose: TMenuItem
      Action = DMForMain.actClose
    end
  end
end
