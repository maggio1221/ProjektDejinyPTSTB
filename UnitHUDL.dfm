object frmHUDL: TfrmHUDL
  Left = 0
  Top = 0
  Caption = 'frmHUDL'
  ClientHeight = 436
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    536
    436)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCenter: TPanel
    Left = 0
    Top = 28
    Width = 537
    Height = 409
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object lblTHISOBD: TLabel
      Left = 16
      Top = 9
      Width = 65
      Height = 16
      Caption = 'lblTHISOBD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTHUDL: TLabel
      Left = 16
      Top = 58
      Width = 51
      Height = 16
      Caption = 'lblTHUDL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblOdDo: TLabel
      Left = 16
      Top = 85
      Width = 44
      Height = 16
      Caption = 'lblOdDo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblHUTXT: TLabel
      Left = 16
      Top = 112
      Width = 53
      Height = 16
      Caption = 'lblHUTXT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbbTHISOBD: TComboBox
      Left = 137
      Top = 8
      Width = 376
      Height = 21
      TabOrder = 0
      Text = 'cbbTHISOBD'
    end
    object teTHUDL: TJvEdit
      Left = 137
      Top = 57
      Width = 376
      Height = 21
      TabOrder = 1
      Text = 'teTHUDL'
    end
    object teDateOd: TJvEdit
      Left = 137
      Top = 84
      Width = 176
      Height = 21
      TabOrder = 2
      Text = 'teDateOd'
    end
    object teDateTo: TJvEdit
      Left = 328
      Top = 84
      Width = 185
      Height = 21
      TabOrder = 3
      Text = 'teDateTo'
    end
    object memHUTXT: TJvMemo
      Left = 137
      Top = 111
      Width = 376
      Height = 176
      Lines.Strings = (
        'memHUTXT')
      TabOrder = 4
    end
    object btnPridat: TJvHTButton
      Left = 298
      Top = 310
      Width = 105
      Height = 25
      Caption = 'btnPridat'
      TabOrder = 5
    end
    object btnCloseForm: TJvHTButton
      Left = 409
      Top = 310
      Width = 105
      Height = 25
      Caption = 'btnCloseForm'
      TabOrder = 6
    end
    object jvdbcmbxCont: TJvDBComboBox
      Left = 137
      Top = 30
      Width = 176
      Height = 21
      DataSource = dsCont
      TabOrder = 7
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsCont
      OnExit = jvdbcmbxContExit
    end
    object jvdbcmbxState: TJvDBComboBox
      Left = 328
      Top = 31
      Width = 185
      Height = 21
      DataSource = dsState
      TabOrder = 8
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsState
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 30
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object lblTopInfo: TLabel
      Left = 54
      Top = 3
      Width = 85
      Height = 23
      Caption = 'lblTopInfo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object actlstHUDL: TActionList
    Left = 32
    Top = 168
  end
  object dsCont: TDataSource
    Left = 32
    Top = 240
  end
  object dsState: TDataSource
    Left = 32
    Top = 312
  end
end
