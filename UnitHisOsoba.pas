unit UnitHisOsoba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseForm, Vcl.Menus, JvMenus,
  GLWin32Viewer, Vcl.ExtCtrls;

type
  TfrmHisOsoba = class(TfrmBaseForm)
    pnlMaine: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHisOsoba: TfrmHisOsoba;

implementation

uses
  UnitDMForMain;
{$R *.dfm}

end.
