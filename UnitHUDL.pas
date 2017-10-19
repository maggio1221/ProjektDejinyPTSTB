unit UnitHUDL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit,
  Vcl.ExtCtrls, ZAbstractRODataset, ZDataset, Data.DB, ZAbstractConnection, ZConnection,
  Vcl.Buttons, JvExButtons, JvButtons, JvMemo, System.Actions, Vcl.ActnList,
  JvCombobox, JvDBCombobox, JvExControls, JvDBLookup;

type
  TfrmHUDL = class(TForm)
    pnlCenter: TPanel;
    pnlTop: TPanel;
    lblTopInfo: TLabel;
    lblTHISOBD: TLabel;
    lblTHUDL: TLabel;
    cbbTHISOBD: TComboBox;
    teTHUDL: TJvEdit;
    actlstHUDL: TActionList;
    lblOdDo: TLabel;
    teDateOd: TJvEdit;
    teDateTo: TJvEdit;
    memHUTXT: TJvMemo;
    lblHUTXT: TLabel;
    btnPridat: TJvHTButton;
    btnCloseForm: TJvHTButton;
    jvdbcmbxCont: TJvDBComboBox;
    jvdbcmbxState: TJvDBComboBox;
    dsCont: TDataSource;
    dsState: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure jvdbcmbxContExit(Sender: TObject);
  private
    { Private declarations }
    THISOBD:TStringList;
    HISID:string;
    QState:TZQuery;
    QCont:TZQuery;
    procedure GetFormData;
    procedure LocalizeCaptions;
    procedure ClearForm;
    procedure GetCBData;
  public
    { Public declarations }
  end;

var
  frmHUDL: TfrmHUDL;

implementation

{$R *.dfm}

uses
  UnitCommon, UnitDMForMain, UnitMaineForm;

procedure TfrmHUDL.FormCreate(Sender: TObject);
begin
  GetFormData;
  LocalizeCaptions;
  GetCBData;
end;

procedure TfrmHUDL.GetFormData;
var
  Q:TZQuery;
  I: Integer;
begin
  Q:= TZQuery.Create(self);
  THISOBD:= TStringList.Create;
  Q.Connection := DMForMain.conDBConnectionMaster;
  Q.SQL.Text:= GetSql('sqlGetHiobdForLCB');

  try
    Q.Open;
  finally
    Q.First;
    for I := 1 to Q.RecordCount do
      begin
        cbbTHISOBD.AddItem(Q.FieldByName('FSHISOBD').AsString,cbbTHISOBD);
        THISOBD.Add(Q.FieldByName('IDHISOBD').AsString);
        Q.Next;
      end;
    cbbTHISOBD.ItemIndex:=1;
  end;

  ClearForm;
end;

procedure TfrmHUDL.jvdbcmbxContExit(Sender: TObject);
var par: TParam;
begin
  if QCont.Active then
  begin
    QState:= TZQuery.Create(Self);
    QState.Connection := DMForMain.conDBConnectionMaster;
    par:= QState.Params.CreateParam(ftString,'IDCONT',ptInput);
    par.AsString := jvdbcmbxCont.Values.Strings[jvdbcmbxCont.ItemIndex];

    QState.SQL.Text:= GetSql('sqlGetKrajinuForLCB');
    try
      QState.Open;
      dsState.DataSet:= QState;
    finally
      jvdbcmbxState.ListSettings.DisplayField:='FSNAME';
      jvdbcmbxState.ListSettings.KeyField:='IDSTATE';
    end;
  end;

end;

procedure TfrmHUDL.LocalizeCaptions;
begin
  lblTHISOBD.Caption := GCTA('THISPBD');
  btnCloseForm.Caption := GCTA('btnClose');
  btnPridat.Caption := GCTA('btnAdd');
  lblOdDo.Caption := GCTA('ObdobiePopis');
  lblHUTXT.Caption := GCTA('TextPolePopis');
  lblTHUDL.Caption := GCTA('THUDL');
  lblTopInfo.Caption := GCTA('THUDL');
end;

procedure TfrmHUDL.ClearForm;
begin
  //
end;

procedure TfrmHUDL.GetCBData;
begin
  QCont:=  TZQuery.Create(Self);
  QCont.Connection := DMForMain.conDBConnectionMaster;
  QCont.SQL.Text:= GetSql('sqlContForLCB') ;

  try
    QCont.Open;
    dsCont.DataSet :=QCont;
  finally
    jvdbcmbxCont.ListSettings.DisplayField:='FSNAME';
    jvdbcmbxCont.ListSettings.KeyField:='IDCONT';
  end;

end;

end.
