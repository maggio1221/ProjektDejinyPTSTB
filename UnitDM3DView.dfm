object DM3DView: TDM3DView
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 335
  Width = 498
  object glscnMain: TGLScene
    Left = 40
    Top = 8
  end
  object glcdncrMain: TGLCadencer
    Left = 104
    Top = 8
  end
  object glflscrnvwrMaine: TGLFullScreenViewer
    Width = 800
    Height = 600
    ManualRendering = False
    RefreshRate = 0
    Left = 184
    Top = 8
  end
  object pm3DView: TPopupMenu
    Left = 280
    Top = 8
  end
end
