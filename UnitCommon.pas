unit UnitCommon;

interface

uses
  ZAbstractRODataset, ZDataset, Classes, Data.DB, Winapi.ActiveX,
  ZAbstractConnection, ZConnection,System.Generics.Collections, IdHashMessageDigest;

procedure GetTextFromDB;
procedure GetSqlFromDB;
function GCTA(AText:string):string;
function GetSql(ASql:string):string;
function MD5(const texto:string):string;
function CreateMyGuid: String;
//function IsConnectetToDB:boolean;


implementation

uses
  UnitMaineForm, UnitDMForMain;

var
TCaptionsList:TDictionary<String, String>;
TSqlList:TDictionary<string,string>;

procedure GetTextFromDB;
var Q:TZQuery;
    //par:TParam;
    I:integer;
    IDTEXT,CTEXT:string;
begin
  Q:= TZQuery.Create(Q);
  Q.Connection:=DMForMain.conDBConnectionMaster;
  Q.Params.CreateParam(ftString,'LANG',ptInput);
  Q.ParamByName('LANG').AsString:= 'SVK';
  TCaptionsList := TDictionary<String, String>.Create;

  Q.SQL.Text := 'select IDTEXT, FSTEXT from TDCTXT where LANG = :LANG';
  try
  Q.Open;
  Q.First;
  for I := 0 to Q.RecordCount-1 do

    begin
      IDTEXT:=Q.FieldByName('IDTEXT').AsString;
      CTEXT:=Q.FieldByName('FSTEXT').AsString;
      TCaptionsList.Add(IDTEXT,CTEXT);
      Q.Next;
    end;
  except

  end;
  Q.Close;
  Q.Free;
end;

procedure GetSqlFromDB;
var Q:TZQuery;
    I:integer;
    IDSQL,CTEXT:string;
begin
  Q:= TZQuery.Create(Q);
  Q.Connection:=DMForMain.conDBConnectionMaster;
  TSqlList := TDictionary<String, String>.Create;

  Q.SQL.Text:= 'select * from TSYSSQL';
  try
    Q.Open;
    Q.First;

    for I := 0 to Q.RecordCount-1 do
      begin
      IDSQL:=Q.FieldByName('IDSYSSQL').AsString;
      CTEXT:=Q.FieldByName('FSYSSQL').AsString;
      TSqlList.Add(IDSQL,CTEXT);
      Q.Next;
      end;

  finally

  end;
end;

function GetSql(ASql:string):string;
begin
   if TSqlList.ContainsKey(ASql) then
    Result:= TSqlList.Items[ASql];
end;

function GCTA(AText:string):string;
begin
  if TCaptionsList.ContainsKey(AText) then
    Result:= TCaptionsList.Items[AText]
  else
    Result:= '!' + AText;
end;

function MD5(const texto:string):string;
var
idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(UTF8Encode(texto));
  finally
    idmd5.Free;
  end;
end;

function CreateMyGuid: String;
var
  MyGUID: TGUID;
  MyWideChar: array[0..100] of WideChar;
begin
  CoCreateGUID(MyGUID);
  StringFromGUID2(MyGUID, MyWideChar, 39);
  Result := WideCharToString(MyWideChar);

  while Pos( '-', Result ) > 0 do
    Delete( Result, Pos( '-', Result ), 1 );
  {Get rid of the left and right brackets in the string:}
  while Pos( '{', Result ) > 0 do
    Delete( Result, Pos( '{', Result ), 1 );
  while Pos( '}', Result ) > 0 do
    Delete( Result, Pos( '}', Result ), 1 );
end;

end.
