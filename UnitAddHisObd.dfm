object frmAddHisObd: TfrmAddHisObd
  Left = 0
  Top = 0
  Caption = 'frmAddHisObd'
  ClientHeight = 323
  ClientWidth = 536
  Color = clBtnFace
  DefaultMonitor = dmMainForm
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
    323)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 30
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
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
  object pnlMiddle: TPanel
    Left = 0
    Top = 32
    Width = 537
    Height = 290
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object lblEPCH: TLabel
      Left = 17
      Top = 5
      Width = 43
      Height = 16
      Caption = 'lblEPCH'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblHisObd: TLabel
      Left = 17
      Top = 40
      Width = 53
      Height = 16
      Caption = 'lblHisObd'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblObdobie: TLabel
      Left = 17
      Top = 82
      Width = 60
      Height = 16
      Caption = 'lblObdobie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblHisObdPopis: TLabel
      Left = 17
      Top = 120
      Width = 83
      Height = 16
      Caption = 'lblHisObdPopis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbEPCH: TJvDBComboBox
      Left = 131
      Top = 4
      Width = 382
      Height = 21
      DataSource = dsAddHisObd
      TabOrder = 0
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsAddHisObd
    end
    object teHisObd: TJvEdit
      Left = 131
      Top = 39
      Width = 382
      Height = 21
      TabOrder = 1
      Text = 'teHisObd'
    end
    object teObdOd: TJvEdit
      Left = 131
      Top = 81
      Width = 174
      Height = 21
      TabOrder = 2
      Text = 'teObdOd'
    end
    object teObdDo: TJvEdit
      Left = 339
      Top = 81
      Width = 174
      Height = 21
      TabOrder = 3
      Text = 'teObdDo'
    end
    object memHisPopis: TJvMemo
      Left = 131
      Top = 135
      Width = 382
      Height = 97
      Lines.Strings = (
        'memHisPopis')
      TabOrder = 4
    end
    object btnAddHisObd: TJvHTButton
      Left = 321
      Top = 256
      Width = 93
      Height = 25
      Action = actAddHisObd
      Caption = 'actAddHisObd'
      TabOrder = 5
    end
    object btnClose: TJvHTButton
      Left = 420
      Top = 256
      Width = 93
      Height = 25
      Action = actClose
      Caption = 'actClose'
      TabOrder = 6
    end
    object cbEpocha: TComboBox
      Left = 131
      Top = 4
      Width = 382
      Height = 21
      TabOrder = 7
      Text = 'cbEpocha'
    end
  end
  object aclstAddHisObd: TActionList
    Images = DMForMain.ilIcons16
    Left = 32
    Top = 192
    object actAddHisObd: TAction
      Caption = 'actAddHisObd'
      OnExecute = actAddHisObdExecute
    end
    object actClose: TAction
      Caption = 'actClose'
      OnExecute = actCloseExecute
    end
  end
  object dsAddHisObd: TDataSource
    Left = 32
    Top = 248
  end
end
