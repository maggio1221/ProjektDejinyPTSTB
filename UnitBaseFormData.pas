unit UnitBaseFormData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvToolEdit, JvDBCombobox, Vcl.StdCtrls;

type
  TfrmBaseData = class(TForm)
  protected
    procedure SetFormComponents;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseData: TfrmBaseData;

implementation

{$R *.dfm}

procedure TfrmBaseData. SetFormComponents;
var i:Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
    begin
      if Self.Components[i] is TJvDateEdit then
      begin
        TJvDateEdit(Self.Components[i]).CalendarStyle := csPopup;
        TJvDateEdit(Self.Components[i]).PopupColor := clSkyBlue;
        TJvDateEdit(Self.Components[i]).WeekendColor := clRed;
      end;

      if Self.Components[i] is TJvDBComboBox then
      begin
        TJvDBComboBox(Self.Components[i]).Style := csDropDownList;
      end;

      if Self.Components[i] is TLabel then
      begin
        TLabel(Self.Components[i]).SendToBack;
      end;

    end;
end;

end.
