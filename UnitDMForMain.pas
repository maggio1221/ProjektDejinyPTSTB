unit UnitDMForMain;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  System.Actions, Vcl.ActnList, Vcl.Forms, ZAbstractConnection,
  ZConnection, GLCrossPlatform, GLBaseClasses, GLScene, GLCadencer,
  GLCoordinates;

type
  TDMForMain = class(TDataModule)
    aclisMainForm: TActionList;
    ilIcons16: TImageList;
    ilIcons32: TImageList;
    actAddHisObd: TAction;
    actAddUdalost: TAction;
    conDBConnectionMaster: TZConnection;
    actConsolidation: TAction;
    glscnMainScene3D: TGLScene;
    glcdncrMainCadenc: TGLCadencer;
    glcmrMainCamera: TGLCamera;
    ilIcons64: TImageList;
    actRelatedData: TAction;
    actGraph: TAction;
    actShow3D: TAction;
    actOsoby: TAction;
    actUdalosti: TAction;
    actTechnika: TAction;
    actClose: TAction;
    actOpen: TAction;
    actOpenZaznam: TAction;
    actHisObd: TAction;
    actlstToolBar: TActionList;
    actPerson: TAction;
    procedure actAddHisObdExecute(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure actAddUdalostExecute(Sender: TObject);
    procedure actConsolidationExecute(Sender: TObject);
    procedure actHisObdExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ConnectToDB;
  public
    { Public declarations }
  end;

var
  DMForMain: TDMForMain;

implementation

uses
  UnitAddHisObd, UnitMaineForm, UnitCommon, UnitHUDL, UnitDataConsolidation, UnitHisObd;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMForMain.actAddHisObdExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAddHisObd, frmAddHisObd);
  frmAddHisObd.ShowModal;
  frmAddHisObd.Free;
end;

procedure TDMForMain.DataModuleCreate(Sender: TObject);
begin
  ConnectToDB;
  GetSqlFromDB;
  GetTextFromDB;
  Application.CreateForm(TfrmMaineForm, frmMaineForm);
  frmMaineForm.ShowModal;
  frmMaineForm.Close;
end;

procedure TDMForMain.DataModuleDestroy(Sender: TObject);
begin
  conDBConnectionMaster.Free;
end;

procedure TDMForMain.actAddUdalostExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmHUDL, frmHUDL);
  frmHUDL.ShowModal;
  frmHUDL.Free;
end;

procedure TDMForMain.actConsolidationExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmDataConsolidation, frmDataConsolidation);
  frmDataConsolidation.ShowModal;
  frmDataConsolidation.Free;
end;

procedure TDMForMain.actHisObdExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmHisObd, frmHisObd);
  frmHisObd.ShowModal;
  frmHisObd.Free;
end;

procedure TDMForMain.ConnectToDB;
begin
    with conDBConnectionMaster do
    begin
      Database:= 'HISTORY_STB';
      if Protocol='mysql_5' then begin
             Properties.Add('ServerArgument1=--basedir=./');
             Properties.Add('ServerArgument2=--datadir=./data');
             Properties.Add('ServerArgument3=--character-sets-dir=./share/charsets');
             Properties.Add('ServerArgument4=--language=./share/spanish');
             Properties.Add('ServerArgument5=--skip-innodb');
             Properties.Add('ServerArgument6=--key_buffer_size=32M');
          end
          else begin
             HostName := 'localhost';
             Port     := 3336;
             User     := 'root';
             Password := 'jemitofuk';
          end;
    end;
  try
    conDBConnectionMaster.Connect;
  finally

  end;
end;

end.
