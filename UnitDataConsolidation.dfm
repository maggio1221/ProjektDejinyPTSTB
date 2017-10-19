object frmDataConsolidation: TfrmDataConsolidation
  Left = 0
  Top = 0
  Caption = 'frmDataConsolidation'
  ClientHeight = 524
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMaine: TPanel
    Left = 0
    Top = 0
    Width = 757
    Height = 524
    Align = alClient
    TabOrder = 0
    object lblPSurn: TLabel
      Left = 381
      Top = 45
      Width = 38
      Height = 13
      Caption = 'lblPSurn'
    end
    object lblPopis: TLabel
      Left = 4
      Top = 72
      Width = 35
      Height = 13
      Caption = 'lblPopis'
    end
    object lblPMeno: TLabel
      Left = 4
      Top = 45
      Width = 42
      Height = 13
      Caption = 'lblPMeno'
    end
    object lblIDHOMT: TLabel
      Left = 4
      Top = 202
      Width = 50
      Height = 13
      Caption = 'lblIDHOMT'
    end
    object lblIDDEATT: TLabel
      Left = 4
      Top = 266
      Width = 53
      Height = 13
      Caption = 'lblIDDEATT'
    end
    object lblFDDATED: TLabel
      Left = 381
      Top = 169
      Width = 55
      Height = 13
      Caption = 'lblFDDATEB'
    end
    object lblFDDATEB: TLabel
      Left = 4
      Top = 169
      Width = 55
      Height = 13
      Caption = 'lblFDDATEB'
    end
    object lblBIRTHT: TLabel
      Left = 4
      Top = 233
      Width = 59
      Height = 13
      Caption = 'lblIDBEARTT'
    end
    object lblIDIndustry: TLabel
      Left = 4
      Top = 297
      Width = 62
      Height = 13
      Caption = 'lblIDIndustry'
    end
    object lblOcup: TLabel
      Left = 4
      Top = 324
      Width = 35
      Height = 13
      Caption = 'lblOcup'
    end
    object lblDomain: TLabel
      Left = 4
      Top = 350
      Width = 45
      Height = 13
      Caption = 'lblDomain'
    end
    object lblGender: TLabel
      Left = 4
      Top = 377
      Width = 45
      Height = 13
      Caption = 'lblGender'
    end
    object lblOsobnost: TLabel
      Left = 4
      Top = 14
      Width = 56
      Height = 13
      Caption = 'lblOsobnost'
    end
    object jvmPopis: TJvMemo
      Left = 104
      Top = 69
      Width = 645
      Height = 89
      Lines.Strings = (
        'jvmPopis')
      TabOrder = 0
    end
    object jvdbcmbxState: TJvDBComboBox
      Left = 104
      Top = 199
      Width = 207
      Height = 21
      DataSource = dsState
      TabOrder = 1
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsState
      OnExit = jvdbcmbxStateExit
    end
    object jvdbcmbxRegion: TJvDBComboBox
      Left = 321
      Top = 199
      Width = 204
      Height = 21
      DataSource = dsRegion
      TabOrder = 2
      ListSettings.ShowOutfilteredValue = True
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsRegion
      OnExit = jvdbcmbxRegionExit
    end
    object jvdbcmbxDstate: TJvDBComboBox
      Left = 104
      Top = 263
      Width = 207
      Height = 21
      DataSource = dsState
      TabOrder = 3
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsState
      OnExit = jvdbcmbxDstateExit
    end
    object jvdbcmbxDReg: TJvDBComboBox
      Left = 321
      Top = 263
      Width = 204
      Height = 21
      DataSource = dsDRegion
      TabOrder = 4
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsDRegion
      OnExit = jvdbcmbxDRegExit
    end
    object jvdbcmbxDCity: TJvDBComboBox
      Left = 536
      Top = 263
      Width = 213
      Height = 21
      DataSource = dsDCity
      TabOrder = 5
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsDCity
    end
    object jvdbcmbxCity: TJvDBComboBox
      Left = 536
      Top = 199
      Width = 213
      Height = 21
      DataSource = dsCity
      TabOrder = 6
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsCity
    end
    object jvdbcmbxBState: TJvDBComboBox
      Left = 104
      Top = 230
      Width = 207
      Height = 21
      DataSource = dsState
      TabOrder = 7
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsState
      OnExit = jvdbcmbxBStateExit
    end
    object jvdbcmbxBReg: TJvDBComboBox
      Left = 321
      Top = 230
      Width = 204
      Height = 21
      DataSource = dsBRegion
      TabOrder = 8
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsBRegion
      OnChange = jvdbcmbxBRegChange
      OnExit = jvdbcmbxBRegExit
    end
    object jvdbcmbxBCity: TJvDBComboBox
      Left = 536
      Top = 230
      Width = 213
      Height = 21
      DataSource = dsBCity
      TabOrder = 9
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsBCity
    end
    object edtPSurn: TOvcEdit
      Left = 447
      Top = 42
      Width = 302
      Height = 21
      TabOrder = 10
    end
    object edtPMeno: TOvcEdit
      Left = 104
      Top = 42
      Width = 271
      Height = 21
      TabOrder = 11
    end
    object dateFDDATED: TJvDateEdit
      Left = 447
      Top = 166
      Width = 302
      Height = 21
      ShowNullDate = False
      TabOrder = 12
    end
    object dateFDDATEB: TJvDateEdit
      Left = 104
      Top = 166
      Width = 271
      Height = 21
      ShowNullDate = False
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 13
    end
    object btnAdd: TJvHTButton
      Left = 648
      Top = 441
      Width = 75
      Height = 25
      Caption = 'btnAdd'
      TabOrder = 14
      OnClick = btnAddClick
    end
    object jvdbcmbxIndustry: TJvDBComboBox
      Left = 104
      Top = 294
      Width = 207
      Height = 21
      DataSource = dsIndustry
      TabOrder = 15
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsIndustry
    end
    object jvdbcmbxOcup: TJvDBComboBox
      Left = 104
      Top = 321
      Width = 207
      Height = 21
      DataSource = dsOcup
      TabOrder = 16
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsOcup
    end
    object jvdbcmbxDomain: TJvDBComboBox
      Left = 104
      Top = 347
      Width = 207
      Height = 21
      DataSource = dsDomain
      TabOrder = 17
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsDomain
    end
    object jvrdgrpGender: TJvRadioGroup
      Left = 104
      Top = 369
      Width = 421
      Height = 33
      Columns = 2
      Items.Strings = (
        'Mu'#382
        #381'ena')
      TabOrder = 18
    end
    object jvdbcmbxOsobnost: TJvDBComboBox
      Left = 104
      Top = 11
      Width = 645
      Height = 21
      DataSource = dsOsoba
      TabOrder = 19
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      ListSettings.DataSource = dsOsoba
    end
  end
  object dsState: TDataSource
    Left = 592
    Top = 256
  end
  object dsRegion: TDataSource
    Left = 648
    Top = 256
  end
  object dsCity: TDataSource
    Left = 704
    Top = 256
  end
  object dsBRegion: TDataSource
    Left = 648
    Top = 312
  end
  object dsBCity: TDataSource
    Left = 704
    Top = 312
  end
  object dsDRegion: TDataSource
    Left = 648
    Top = 360
  end
  object dsDCity: TDataSource
    Left = 704
    Top = 360
  end
  object dsIndustry: TDataSource
    Left = 592
    Top = 312
  end
  object dsOcup: TDataSource
    Left = 592
    Top = 360
  end
  object dsDomain: TDataSource
    Left = 544
    Top = 256
  end
  object dsOsoba: TDataSource
    Left = 568
    Top = 448
  end
end
