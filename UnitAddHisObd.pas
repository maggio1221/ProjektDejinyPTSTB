unit UnitAddHisObd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.Buttons, JvExButtons, JvButtons,
  JvExStdCtrls, JvMemo, JvEdit, JvCombobox, JvDBCombobox,
  ZAbstractRODataset, ZDataset, Data.DB, ZAbstractConnection, ZConnection,
  JvExControls, JvDBLookup, UnitBaseForm;

type
  TfrmAddHisObd = class(TForm)
    pnlTop: TPanel;
    lblTopInfo: TLabel;
    pnlMiddle: TPanel;
    cbEPCH: TJvDBComboBox;
    lblEPCH: TLabel;
    lblHisObd: TLabel;
    teHisObd: TJvEdit;
    lblObdobie: TLabel;
    teObdOd: TJvEdit;
    teObdDo: TJvEdit;
    lblHisObdPopis: TLabel;
    memHisPopis: TJvMemo;
    btnAddHisObd: TJvHTButton;
    btnClose: TJvHTButton;
    aclstAddHisObd: TActionList;
    actAddHisObd: TAction;
    actClose: TAction;
    dsAddHisObd: TDataSource;
    cbEpocha: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure actAddHisObdExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
  private
    { Private declarations }
    TEPCHID:TStringList;
    EPCHID:string;
    LcbDS:TDataSource;
    procedure GetFormData;
    procedure LocalizeCaption;
    procedure ShowFormData;
    procedure ClearForm;
    procedure SaveDataToDB;
  public
    { Public declarations }
  end;

var
  frmAddHisObd: TfrmAddHisObd;

implementation

{$R *.dfm}

uses
  UnitCommon, UnitDMForMain, UnitMaineForm;

procedure TfrmAddHisObd.FormCreate(Sender: TObject);
begin
  GetFormData;
  LocalizeCaption;
end;

procedure TfrmAddHisObd.GetFormData;
var
  Q:TZQuery;
  I: Integer;
begin
  Q:= TZQuery.Create(self);
  LcbDS := TDataSource.Create(Self);
  TEPCHID:= TStringList.Create;
  Q.Connection := DMForMain.conDBConnectionMaster;
  Q.DataSource := dsAddHisObd;
  Q.SQL.Text:= GetSql('sqlGetEpchForLCB');

  try
    Q.Open;
    LcbDS:= Q.DataSource;
  finally
    Q.First;
    for I := 1 to Q.RecordCount do
      begin
        cbEpocha.AddItem(Q.FieldByName('FENAME').AsString,cbEpocha);
        TEPCHID.Add(Q.FieldByName('IDEPCH').AsString);
        Q.Next;
      end;
    cbEpocha.ItemIndex:=0;
  end;

  ClearForm;
end;

procedure TfrmAddHisObd.actAddHisObdExecute(Sender: TObject);
begin
  EPCHID:= TEPCHID[cbEpocha.ItemIndex];
  SaveDataToDB;
end;

procedure TfrmAddHisObd.actCloseExecute(Sender: TObject);
begin
  TEPCHID.Free;
  frmAddHisObd.Close;
end;

procedure TfrmAddHisObd.ClearForm;
begin
  teHisObd.Text := '';
  teObdOd.Text := '';
  teObdDo.Text := '';
  memHisPopis.Clear;
end;

procedure TfrmAddHisObd.LocalizeCaption;
begin
  frmAddHisObd.Caption := GCTA('frmAddHisObd');
  lblTopInfo.Caption := GCTA('frmAddHisObd');
  actClose.Caption := GCTA('btnClose');
  actAddHisObd.Caption := GCTA('btnAdd');
  lblEPCH.Caption := GCTA('TDEPCH');
  lblHisObd.Caption := GCTA('THISPBD');
  lblObdobie.Caption := GCTA('ObdobiePopis');
  lblHisObdPopis.Caption := GCTA('TextPolePopis');
end;

procedure TfrmAddHisObd.ShowFormData;
begin
  //
end;

procedure TfrmAddHisObd.SaveDataToDB;
var
  QData:TZQuery;
  par:TParam;
begin
  QData:=TZQuery.Create(self);
  QData.Connection := DMForMain.conDBConnectionMaster;
  par:= QData.Params.CreateParam(ftString,'ID',ptInput);
  par.AsString:= MD5(teHisObd.Text+DateToStr(Now()));
  par:= QData.Params.CreateParam(ftString,'Name',ptInput);
  par.AsString:= teHisObd.Text;
  par:= QData.Params.CreateParam(ftString,'From',ptInput);
  par.AsString:= teObdOd.Text;
  par:= QData.Params.CreateParam(ftString,'To',ptInput);
  par.AsString:= teObdDo.Text;
  par:= QData.Params.CreateParam(ftString,'EpchId',ptInput);
  par.AsString:= EPCHID;
  par:= QData.Params.CreateParam(ftString,'Text',ptInput);
  par.AsString:= memHisPopis.Text;

  QData.SQL.Text:= 'replace into THISOBD (IDHIOB, FHONAME, FHOFROMD, FHOTOD, IDEPCH, FHOTEXT) '
                 + 'values (:ID, :Name, :From, :To, :EpchId, :Text)';

  try
    QData.ExecSQL;
  finally

  end;
  QData.Close;
  QData.Free;


end;

end.
