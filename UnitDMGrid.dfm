object DMGrid: TDMGrid
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 373
  Width = 502
  object dbdlgsetMaine: TSMSetDBGridDialog
    Caption = 'Grid setup'
    Left = 32
    Top = 32
  end
  object fltrdlgMaine: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 112
    Top = 32
  end
  object fnddlgMaine: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 184
    Top = 32
  end
end
