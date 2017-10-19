unit UnitDM3DView;

interface

uses
  System.SysUtils, System.Classes, GLScene, GLFullScreenViewer, GLCadencer,
  GLCrossPlatform, GLBaseClasses, Vcl.Menus;

type
  TDM3DView = class(TDataModule)
    glscnMain: TGLScene;
    glcdncrMain: TGLCadencer;
    glflscrnvwrMaine: TGLFullScreenViewer;
    pm3DView: TPopupMenu;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    SL3DView:TStringList;
  public
    { Public declarations }
  end;

var
  DM3DView: TDM3DView;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM3DView.DataModuleCreate(Sender: TObject);
begin
  SL3DView := TStringList.Create;
end;

procedure TDM3DView.DataModuleDestroy(Sender: TObject);
begin
  SL3DView.Free;
end;

end.
