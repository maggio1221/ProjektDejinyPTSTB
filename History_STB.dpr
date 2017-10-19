program History_STB;

uses
  Vcl.Forms,
  UnitMaineForm in 'UnitMaineForm.pas' {frmMaineForm},
  UnitCommon in 'UnitCommon.pas',
  UnitDMForMain in 'UnitDMForMain.pas' {DMForMain: TDataModule},
  UnitAddHisObd in 'UnitAddHisObd.pas' {frmAddHisObd},
  UnitHUDL in 'UnitHUDL.pas' {frmHUDL},
  UnitBaseForm in 'UnitBaseForm.pas' {frmBaseForm},
  UnitHisOsoba in 'UnitHisOsoba.pas' {frmHisOsoba},
  UnitDataConsolidation in 'UnitDataConsolidation.pas' {frmDataConsolidation},
  Vcl.Themes,
  Vcl.Styles,
  UnitHisObd in 'UnitHisObd.pas' {frmHisObd},
  UnitBaseFormData in 'UnitBaseFormData.pas' {frmBaseData},
  UnitDM3DView in 'UnitDM3DView.pas' {DM3DView: TDataModule},
  UnitDMGrid in 'UnitDMGrid.pas' {DMGrid: TDataModule},
  UnitVTTree in 'UnitVTTree.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.CreateForm(TDMForMain, DMForMain);
  Application.Run;
end.
