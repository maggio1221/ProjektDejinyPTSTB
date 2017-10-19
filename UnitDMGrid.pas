unit UnitDMGrid;

interface

uses
  System.SysUtils, System.Classes, SMDBFind, SMDBFltr, SMDBGSet;

type
  TDMGrid = class(TDataModule)
    dbdlgsetMaine: TSMSetDBGridDialog;
    fltrdlgMaine: TSMDBFilterDialog;
    fnddlgMaine: TSMDBFindDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    SLTableViews:TStringList;
  public
    { Public declarations }
  end;

var
  DMGrid: TDMGrid;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMGrid.DataModuleCreate(Sender: TObject);
begin
  SLTableViews := TStringList.Create;
end;

procedure TDMGrid.DataModuleDestroy(Sender: TObject);
begin
  SLTableViews.Free;
end;

end.
