unit UnitMaineForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, JvActionsEngine, JvControlActions, ZAbstractConnection,
  ZConnection, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, JvExComCtrls, JvToolBar, JvMenus, Data.DB, ZAbstractRODataset,
  ZDataset,UnitCommon, Vcl.StdCtrls, JvExStdCtrls, JvEdit, Vcl.Grids,
  Vcl.DBGrids, ZAbstractDataset, Vcl.Menus, UnitDMForMain, VCLTee.Control,
  VCLTee.Grid, JvDBTreeView, VirtualTrees, JvMemo, JvExDBGrids, JvDBGrid,
  ovcbase, ovctcmmn, ovcdbtbl, Vcl.DBCtrls, JvExForms, JvScrollBox, GMClasses,
  GMMap, GMMapVCL, Vcl.OleCtrls, SHDocVw, GMLinkedComponents, GMInfoWindow,
  GMMarker, GMMarkerVCL, GMGeoCode, SMDBGrid;

type
  TfrmMaineForm = class(TForm)
    tpMainMenu: TPanel;
    tpLeftMenu: TPanel;
    tpCenter: TPanel;
    actlistMainForm: TJvControlActionList;
    ilMain16: TImageList;
    TZReadOnlyQuery: TZReadOnlyQuery;
    dsMaineForm: TDataSource;
    ZQueryAccess: TZQuery;
    mmMainMenu: TJvMainMenu;
    btnPridat: TMenuItem;
    btnAddHisObd: TMenuItem;
    btnAddUdalost: TMenuItem;
    btnConsolidation: TMenuItem;
    btnOpen: TMenuItem;
    btnHisObd: TMenuItem;
    wbMainMap: TWebBrowser;
    gmpMainMap: TGMMap;
    gmnfwndw1: TGMInfoWindow;
    gmrkrMaine: TGMMarker;
    gmgcdMain: TGMGeoCode;
    tlbMainBar: TToolBar;
    btnPerson: TToolButton;
    smdbgrd1: TSMDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tgrdEPCHClick(Sender: TObject);
    procedure jvdbgrd1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure gmpMainMapAfterPageLoaded(Sender: TObject; First: Boolean);
    procedure gmrkrMaineDblClick(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure gmrkrMaineRightClick(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
  private
    procedure ConnectToDatabase;
    procedure LocalizeCaptions;
    procedure ShowFormData;
    procedure SetMainMenuAct;
    procedure SetGridProperties;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMaineForm: TfrmMaineForm;

implementation

uses
  Vcl.Styles.FormStyleHooks,
  Vcl.GraphUtil,
  Vcl.Styles,
  Vcl.Themes, UnitVTTree;

{$R *.dfm}

procedure TfrmMaineForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TfrmMaineForm.FormCreate(Sender: TObject);
var style:string;
begin
  ShowFormData;
  LocalizeCaptions;
  SetMainMenuAct;
end;

procedure TfrmMaineForm.FormShow(Sender: TObject);
var Q:TZQuery;
    lat: Real;
    i: Integer;
    Pom:TCustomMarker;
begin
  Q:= TZQuery.Create(Self);
  Q.Connection:= DMForMain.conDBConnectionMaster;
  Q.SQL.Text := 'select *,"D:\\Palino\\Programovanie\\Projkt Dejiny\\icons\\IconHistorySTB2.png" as FNICON  from TCONTINENT';
  try
    Q.Open;
  finally
  gmrkrMaine.LoadFromDataSet(TDataSet(Q),'FFLATI','FFLONGI', 'FSNAME', 'FNICON');

  for I := 0 to gmrkrMaine.Count-1 do
    begin
      gmrkrMaine.Items[I].Clickable := True;
    end;

  end;
  Q.Close;
  Q.Free;

end;

procedure TfrmMaineForm.gmpMainMapAfterPageLoaded(Sender: TObject;
  First: Boolean);
begin
  if First then
    begin
      gmpMainMap.DoMap;
    end;
end;

procedure TfrmMaineForm.gmrkrMaineDblClick(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
begin
  LinkedComponent.DisplayName;
  ShowMessage('Funguje To' + LinkedComponent.DisplayName);
end;

procedure TfrmMaineForm.gmrkrMaineRightClick(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
begin
  ShowMessage('Funguje To' + LinkedComponent.DisplayName);
end;

procedure TfrmMaineForm.jvdbgrd1CellClick(Column: TColumn);
var position,i:integer;
    AValue:string;
    Q:TZQuery;
    par:TParam;
begin
  //AValue := VarToStr(jvdbgrd1.SelectedField.CurValue);
  Q:= TZQuery.Create(Self);
  Q.Connection:= DMForMain.conDBConnectionMaster;
  par:= Q.Params.CreateParam(ftString,'FSNAME',ptInput);
  par.AsString:= AValue;
  Q.SQL.Text := 'select * from TEPCH where FSNAME=:FSNAME';
  try
    Q.Open;
    //jvmText.Text:= Q.FieldByName('FETEXT').AsString;
  finally

  end;
  Q.Close;
  Q.Free;
end;

procedure TfrmMaineForm.ShowFormData;
begin
  try
    TZReadOnlyQuery.Connection := DMForMain.conDBConnectionMaster;
    TZReadOnlyQuery.SQL.Text := GetSql('sqlGetEpchForTable');
    TZReadOnlyQuery.Open;
  finally
    TZReadOnlyQuery.Last;
    SetGridProperties;
  end;
end;


procedure TfrmMaineForm.tgrdEPCHClick(Sender: TObject);
var position,i:integer;
    AValue:string;
begin
  //
end;

procedure TfrmMaineForm.ConnectToDatabase;
begin
  //
end;

procedure TfrmMaineForm.LocalizeCaptions;
begin
  frmMaineForm.Caption := GCTA('frmMainForm');
  btnPridat.Caption := GCTA('btnAdd');
  DMForMain.actAddHisObd.Caption := GCTA('btnAddEpocha');
end;

procedure TfrmMaineForm.SetMainMenuAct;
begin
  btnAddHisObd.Action:= DMForMain.actAddHisObd;
  btnAddUdalost.Action:= DMForMain.actAddUdalost;
end;

procedure TfrmMaineForm.SetGridProperties;
var Name:string;
begin
  Name := smdbgrd1.Columns[1].Title.Caption;
  smdbgrd1.Columns[0].Visible := False;
  smdbgrd1.Columns[1].Width := 80;
  smdbgrd1.Columns[1].Title.Caption := GCTA(Name);
end;

initialization

  TStyleManager.Engine.RegisterStyleHook(TfrmMaineForm, TFormStyleHookBackground);

end.
