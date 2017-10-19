unit UnitVTTree;

interface

uses System.Classes, Data.DB, VirtualTrees;

type
  PTTRec = ^TTTrec;
  TTTRec = record
    FType:string;
    GView:string;
    FIDVIEW:string;
    VName:string;
    VOrder:Integer;
    MaineView:Boolean;
    FGroupF:string;
    FComponent:TComponent;
    FData:TDataSet;
  private
    procedure SetIDVIEW(Value:string);
    procedure SetGroupFields(Value:string);
    procedure SetComponent(Value:TComponent);
    procedure SetDataset(Value:TDataSet);
  public
    property IDVIEW:string read FIDVIEW write SetIDVIEW;
    property GroupField:string read FGroupF write SetGroupFields;
    property Component:TComponent read FComponent write SetComponent;
    property Data:TDataSet read FData write SetDataset;
end;

implementation

procedure TTTRec.SetIDVIEW(Value:string);
begin
  FIDVIEW := Value;
end;

procedure TTTRec.SetGroupFields(Value: string);
begin
  FGroupF := Value;
end;

procedure TTTRec.SetComponent(Value: TComponent);
begin
  FComponent := Value;
end;

procedure TTTRec.SetDataset(Value: TDataSet);
begin
  FData := Value;
end;

end.
