unit UnitBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, JvMenus, UnitDMForMain,
  Vcl.ExtCtrls;

type
  TfrmBaseForm = class(TForm)
    jvmnmnBaseMenu: TJvMainMenu;
    btnOpis: TMenuItem;
    btnRelatedData: TMenuItem;
    btnGraphs: TMenuItem;
    btn3DShow: TMenuItem;
    btnOsoby: TMenuItem;
    btnUdalosti: TMenuItem;
    btnTechnika: TMenuItem;
    btnClose: TMenuItem;
    pnlTopInf: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseForm: TfrmBaseForm;

implementation

{$R *.dfm}

end.
