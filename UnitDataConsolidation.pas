unit UnitDataConsolidation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractRODataset, ZDataset, Data.DB, ZAbstractConnection, ZConnection,
  Vcl.StdCtrls, Vcl.Buttons, JvExButtons, JvButtons, JvExStdCtrls, JvCombobox,
  JvDBCombobox, Vcl.Mask, JvExMask, JvToolEdit, JvMemo, ovceditf, JvExControls,
  JvDBLookup, Vcl.ExtCtrls, JvExExtCtrls, JvRadioGroup, UnitBaseFormData;

type
  TfrmDataConsolidation = class(TfrmBaseData)
    btnAdd: TJvHTButton;
    lblPMeno: TLabel;
    edtPMeno: TOvcEdit;
    lblPSurn: TLabel;
    edtPSurn: TOvcEdit;
    jvmPopis: TJvMemo;
    lblPopis: TLabel;
    lblFDDATEB: TLabel;
    dateFDDATEB: TJvDateEdit;
    lblFDDATED: TLabel;
    dateFDDATED: TJvDateEdit;
    lblIDHOMT: TLabel;
    jvdbcmbxState: TJvDBComboBox;
    jvdbcmbxRegion: TJvDBComboBox;
    jvdbcmbxCity: TJvDBComboBox;
    jvdbcmbxBState: TJvDBComboBox;
    jvdbcmbxBReg: TJvDBComboBox;
    lblBIRTHT: TLabel;
    jvdbcmbxBCity: TJvDBComboBox;
    jvdbcmbxDstate: TJvDBComboBox;
    lblIDDEATT: TLabel;
    jvdbcmbxDReg: TJvDBComboBox;
    jvdbcmbxDCity: TJvDBComboBox;
    dsState: TDataSource;
    dsRegion: TDataSource;
    dsCity: TDataSource;
    pnlMaine: TPanel;
    dsBRegion: TDataSource;
    dsBCity: TDataSource;
    dsDRegion: TDataSource;
    dsDCity: TDataSource;
    lblIDIndustry: TLabel;
    lblOcup: TLabel;
    lblDomain: TLabel;
    lblGender: TLabel;
    jvdbcmbxIndustry: TJvDBComboBox;
    jvdbcmbxOcup: TJvDBComboBox;
    jvdbcmbxDomain: TJvDBComboBox;
    jvrdgrpGender: TJvRadioGroup;
    dsIndustry: TDataSource;
    dsOcup: TDataSource;
    dsDomain: TDataSource;
    lblOsobnost: TLabel;
    jvdbcmbxOsobnost: TJvDBComboBox;
    dsOsoba: TDataSource;
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure jvdbcmbxStateExit(Sender: TObject);
    procedure jvdbcmbxRegionExit(Sender: TObject);
    procedure jvdbcmbxBStateExit(Sender: TObject);
    procedure jvdbcmbxDstateExit(Sender: TObject);
    procedure jvdbcmbxBRegChange(Sender: TObject);
    procedure jvdbcmbxDRegExit(Sender: TObject);
    procedure jvdbcmbxBRegExit(Sender: TObject);
  private
    { Private declarations }
    QState:TZQuery;
    QRegion:TZQuery;
    QCity:TZQuery;
    QBRegion:TZQuery;
    QBCity:TZQuery;
    QDRegion:TZQuery;
    QDCity:TZQuery;
    QIndustry:TZQuery;
    QDomain:TZQuery;
    QOcup:TZQuery;
    QOsoba:TZQuery;
    procedure GetCBData;
  public
    { Public declarations }
  end;

var
  frmDataConsolidation: TfrmDataConsolidation;

implementation

{$R *.dfm}

uses
  UnitCommon, UnitDMForMain, UnitMaineForm;

procedure TfrmDataConsolidation.btnAddClick(Sender: TObject);
var QUpdate:TZQuery;
    par:TParam;
    State,Country,City:string;
begin
  QUpdate := TZQuery.Create(Self);
  QUpdate.Connection := DMForMain.conDBConnectionMaster;

  par := QUpdate.Params.CreateParam(ftString,'IDPERSON',ptInput);
  par.AsString := jvdbcmbxOsobnost.Values.Strings[jvdbcmbxOsobnost.ItemIndex];

  par := QUpdate.Params.CreateParam(ftString,'FTPOPIS',ptInput);
  par.AsString := jvmPopis.Lines.Text;

  par := QUpdate.Params.CreateParam(ftDate,'FDDATEB',ptInput);
  par.AsDate := dateFDDATEB.Date;

  par := QUpdate.Params.CreateParam(ftDate,'FDDATED',ptInput);
  par.AsDate := dateFDDATED.Date;

  par := QUpdate.Params.CreateParam(ftString,'IDHOMT',ptInput);
  par.AsString := jvdbcmbxCity.Values.Strings[jvdbcmbxCity.ItemIndex];

  par := QUpdate.Params.CreateParam(ftString,'IDDEADT',ptInput);
  par.AsString := jvdbcmbxBCity.Values.Strings[jvdbcmbxBCity.ItemIndex];

  par := QUpdate.Params.CreateParam(ftString,'IDBIRTHT',ptInput);
  par.AsString := jvdbcmbxDCity.Values.Strings[jvdbcmbxDCity.ItemIndex];

  QUpdate.SQL.Text := 'Update TPERSON set FTPOPIS=:FTPOPIS, FDDATEB=:FDDATEB, FDDATED=:FDDATED, '
                    + 'IDHOMT=:IDHOMT, IDDEADT=:IDDEADT, IDBIRTHT=:IDBIRTHT where IDPERSON=:IDPERSON';

  try
    QUpdate.ExecSQL;
  finally

  end;
  QUpdate.Close;
  QUpdate.Free;

end;

procedure TfrmDataConsolidation.FormCreate(Sender: TObject);
begin
  SetFormComponents;
  GetCBData;
end;

procedure TfrmDataConsolidation.GetCBData;
begin
  QState:=  TZQuery.Create(Self);
  QState.Connection := DMForMain.conDBConnectionMaster;
  QState.SQL.Text:= GetSql('sqlGetStateForLCB') ;

  QRegion := TZQuery.Create(Self);
  QRegion.Connection := DMForMain.conDBConnectionMaster;
  QRegion.SQL.Text := GetSql('sqlGetRegionForLCBWSt');

  QCity := TZQuery.Create(Self);
  QCity.Connection := DMForMain.conDBConnectionMaster;
  QCity.SQL.Text := GetSql('sqlGetCityForLCB');

  QBRegion := TZQuery.Create(Self);
  QBRegion.Connection := DMForMain.conDBConnectionMaster;
  QBRegion.SQL.Text := GetSql('sqlGetRegionForLCBWSt');

  QBCity := TZQuery.Create(Self);
  QBCity.Connection := DMForMain.conDBConnectionMaster;
  QBCity.SQL.Text := GetSql('sqlGetCityForLCB');

  QDRegion := TZQuery.Create(Self);
  QDRegion.Connection := DMForMain.conDBConnectionMaster;
  QDRegion.SQL.Text := GetSql('sqlGetRegionForLCBWSt');

  QDCity := TZQuery.Create(Self);
  QDCity.Connection := DMForMain.conDBConnectionMaster;
  QDCity.SQL.Text := GetSql('sqlGetCityForLCB');

  QIndustry := TZQuery.Create(Self);
  QIndustry.Connection := DMForMain.conDBConnectionMaster;
  QIndustry.SQL.Text := 'select * from tindustry';

  QDomain := TZQuery.Create(Self);
  QDomain.Connection := DMForMain.conDBConnectionMaster;
  QDomain.SQL.Text := 'select * from tdomain where fslang="sk_SK"';

  QOcup := TZQuery.Create(Self);
  QOcup.Connection := DMForMain.conDBConnectionMaster;
  QOcup.SQL.Text := 'select * from tocup';

  QOsoba:= TZQuery.Create(Self);
  QOsoba.Connection := DMForMain.conDBConnectionMaster;
  QOsoba.SQL.Text := 'select IDPERSON, FSSURNAM from tperson';


  try
    QState.Open;
    dsState.DataSet :=QState;
    QRegion.Open;
    dsRegion.DataSet :=QRegion;
    QCity.Open;
    dsCity.DataSet := QCity;
    QBRegion.Open;
    dsBRegion.DataSet :=QBRegion;
    QBCity.Open;
    dsBCity.DataSet := QBCity;
    QDRegion.Open;
    dsDRegion.DataSet :=QDRegion;
    QDCity.Open;
    dsDCity.DataSet := QDCity;
    QIndustry.Open;
    dsIndustry.DataSet := QIndustry;
    QDomain.Open;
    dsDomain.DataSet := QDomain;
    QOcup.Open;
    dsOcup.DataSet := QOcup;

    QOsoba.Open;
    dsOsoba.DataSet := QOsoba;

  finally
    jvdbcmbxState.ListSettings.DisplayField:='FSNAME';
    jvdbcmbxState.ListSettings.KeyField:='FSCODE';
    jvdbcmbxBState.ListSettings.DisplayField:='FSNAME';
    jvdbcmbxBState.ListSettings.KeyField:='FSCODE';
    jvdbcmbxDState.ListSettings.DisplayField:='FSNAME';
    jvdbcmbxDState.ListSettings.KeyField:='FSCODE';

    jvdbcmbxRegion.ListSettings.DisplayField:='FSNAME';
    jvdbcmbxRegion.ListSettings.KeyField:='FSCODE';
    jvdbcmbxBReg.ListSettings.DisplayField:='FSNAME';
    jvdbcmbxBReg.ListSettings.KeyField:='FSCODE';
    jvdbcmbxDReg.ListSettings.DisplayField:='FSNAME';
    jvdbcmbxDReg.ListSettings.KeyField:='FSCODE';

    jvdbcmbxCity.ListSettings.DisplayField := 'FSNAME';
    jvdbcmbxCity.ListSettings.KeyField := 'IDCITY';
    jvdbcmbxBCity.ListSettings.DisplayField := 'FSNAME';
    jvdbcmbxBCity.ListSettings.KeyField := 'IDCITY';
    jvdbcmbxDCity.ListSettings.DisplayField := 'FSNAME';
    jvdbcmbxDCity.ListSettings.KeyField := 'IDCITY';

    jvdbcmbxOcup.ListSettings.DisplayField := 'FSOCUP';
    jvdbcmbxOcup.ListSettings.KeyField := 'IDOCUP';
    jvdbcmbxIndustry.ListSettings.DisplayField := 'FSINDUST';
    jvdbcmbxIndustry.ListSettings.KeyField := 'IDINDUST';
    jvdbcmbxDomain.ListSettings.DisplayField := 'FSDOMAIN';
    jvdbcmbxDomain.ListSettings.KeyField := 'IDDOMAIN';

    jvdbcmbxOsobnost.ListSettings.DisplayField := 'FSSURNAM';
    jvdbcmbxOsobnost.ListSettings.KeyField := 'IDPERSON';
  end;
end;

procedure TfrmDataConsolidation.jvdbcmbxBRegChange(Sender: TObject);
begin
  QBCity.Filter := 'fscountry = '+QuotedStr(jvdbcmbxBState.Values.Strings[jvdbcmbxBState.ItemIndex])+
                  ' and idregion = '+QuotedStr(jvdbcmbxBReg.Values.Strings[jvdbcmbxBReg.ItemIndex]);
  QBCity.Filtered := True;
end;

procedure TfrmDataConsolidation.jvdbcmbxBRegExit(Sender: TObject);
begin
  QBCity.Filter := 'fscountry = '+QuotedStr(jvdbcmbxBState.Values.Strings[jvdbcmbxBState.ItemIndex])+
                  ' and idregion = '+QuotedStr(jvdbcmbxBReg.Values.Strings[jvdbcmbxBReg.ItemIndex]);
  QBCity.Filtered := True;
end;

procedure TfrmDataConsolidation.jvdbcmbxBStateExit(Sender: TObject);
begin
  QBRegion.Filter := 'IDCOUNTRY = '+QuotedStr(jvdbcmbxBState.Values.Strings[jvdbcmbxBState.ItemIndex]);
  QBRegion.Filtered := True;

  QBCity.Filter := 'fscountry = '+QuotedStr(jvdbcmbxBState.Values.Strings[jvdbcmbxBState.ItemIndex]);
  QBCity.Filtered := True;
end;

procedure TfrmDataConsolidation.jvdbcmbxDRegExit(Sender: TObject);
begin
  QDCity.Filter := 'fscountry = '+QuotedStr(jvdbcmbxDState.Values.Strings[jvdbcmbxDState.ItemIndex])+
                  ' and idregion = '+QuotedStr(jvdbcmbxDReg.Values.Strings[jvdbcmbxDReg.ItemIndex]);
  QDCity.Filtered := True;
end;

procedure TfrmDataConsolidation.jvdbcmbxDstateExit(Sender: TObject);
begin
  QDRegion.Filter := 'IDCOUNTRY = '+QuotedStr(jvdbcmbxDState.Values.Strings[jvdbcmbxDState.ItemIndex]);
  QDRegion.Filtered := True;

  QDCity.Filter := 'fscountry = '+QuotedStr(jvdbcmbxDState.Values.Strings[jvdbcmbxDState.ItemIndex]);
  QDCity.Filtered := True;
end;

procedure TfrmDataConsolidation.jvdbcmbxRegionExit(Sender: TObject);
begin
  QCity.Filter := 'fscountry = '+QuotedStr(jvdbcmbxState.Values.Strings[jvdbcmbxState.ItemIndex])+
                  ' and idregion = '+QuotedStr(jvdbcmbxRegion.Values.Strings[jvdbcmbxRegion.ItemIndex]);
  QCity.Filtered := True;
end;

procedure TfrmDataConsolidation.jvdbcmbxStateExit(Sender: TObject);
begin
  QRegion.Filter := 'IDCOUNTRY = '+QuotedStr(jvdbcmbxState.Values.Strings[jvdbcmbxState.ItemIndex]);
  QRegion.Filtered := True;

  QCity.Filter := 'fscountry = '+QuotedStr(jvdbcmbxState.Values.Strings[jvdbcmbxState.ItemIndex]);
  QCity.Filtered := True;
end;

end.
