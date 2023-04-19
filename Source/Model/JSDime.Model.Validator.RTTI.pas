unit JSDime.Model.Validator.RTTI;

interface

uses
  System.SysUtils,
  System.Rtti;

type
  TJSDimeRTTIPropertyHelper = class helper for TRttiProperty
  public
    function IsString: Boolean;
    function IsInteger: Boolean;
    function IsEnum: Boolean;
    function IsFloat: Boolean;
    function IsDateTime: Boolean;
    function IsDate: Boolean;
    function IsTime: Boolean;
    function IsBoolean: Boolean;
    function IsNullable: Boolean;
    function NullableType: string;
    function IsEmptyValue(AObject: TObject): Boolean;
    function GetAttribute<T: TCustomAttribute>: T;
  end;

implementation

{ TJSDimeRTTIPropertyHelper }

function TJSDimeRTTIPropertyHelper.GetAttribute<T>: T;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Pred(Length(Self.GetAttributes)) do
    if Self.GetAttributes[I].ClassNameIs(T.className) then
      Exit(T( Self.GetAttributes[I]));
end;

function TJSDimeRTTIPropertyHelper.IsBoolean: Boolean;
begin
  if Self.IsNullable then
    Result := Self.NullableType.ToLower.Equals('boolean') or
      Self.NullableType.ToLower.Equals('bool')
  else
    Result := Self.PropertyType.ToString.ToLower.Equals('boolean');
end;

function TJSDimeRTTIPropertyHelper.IsDate: Boolean;
var
  Ltype: string;
begin
  if Self.IsNullable then
    Ltype := Self.NullableType.ToLower
  else
    Ltype := Self.PropertyType.ToString.ToLower;
  Result := (Ltype.Equals('tdate'));
end;

function TJSDimeRTTIPropertyHelper.IsDateTime: Boolean;
var
  Ltype: string;
begin
  if Self.IsNullable then
    Ltype := Self.NullableType.ToLower
  else
    Ltype := Self.PropertyType.ToString.ToLower;

  Result := (Ltype.Equals('tdatetime'));
end;

function TJSDimeRTTIPropertyHelper.IsEmptyValue(AObject: TObject): Boolean;
begin
  Result := False;
  if IsString then
    Exit(Self.GetValue(AObject).AsString.Trim.IsEmpty);

  if IsInteger then
    Exit(Self.GetValue(AObject).AsInteger = 0);

  if IsFloat then
    Exit(Self.GetValue(AObject).AsExtended = 0);

  if IsDateTime or IsDate or IsTime then
    Exit(Self.GetValue(AObject).AsExtended = 0);
end;

function TJSDimeRTTIPropertyHelper.IsEnum: Boolean;
begin
  Result := (not IsBoolean) and (Self.PropertyType.TypeKind = tkEnumeration);
end;

function TJSDimeRTTIPropertyHelper.IsFloat: Boolean;
begin
  if Self.IsNullable then
    Result := Self.NullableType.ToLower.Equals('double') or
      Self.NullableType.ToLower.Equals('currency') or
      Self.NullableType.ToLower.Equals('real') or
      Self.NullableType.ToLower.Equals('extended') or
      Self.NullableType.ToLower.Equals('single')
  else
    Result := (Self.PropertyType.TypeKind = tkFloat) and
      (not IsDateTime) and (not IsDate) and (not IsTime);
end;

function TJSDimeRTTIPropertyHelper.IsInteger: Boolean;
begin
  if Self.IsNullable then
    Result := Self.NullableType.ToLower.Equals('integer') or
      Self.NullableType.ToLower.Equals('int64') or
      Self.NullableType.ToLower.Equals('word') or
      Self.NullableType.ToLower.Equals('dword') or
      Self.NullableType.ToLower.Equals('byte') or
      Self.NullableType.ToLower.Equals('longint') or
      Self.NullableType.ToLower.Equals('smallint')
  else
    Result := Self.PropertyType.TypeKind in [tkInt64, tkInteger];
end;

function TJSDimeRTTIPropertyHelper.IsNullable: Boolean;
begin
  Result := False;
  if Self.PropertyType.ToString.ToLower.StartsWith('nullable<') then
    Exit(True);
end;

function TJSDimeRTTIPropertyHelper.IsString: Boolean;
begin
  if Self.IsNullable then
    Result := Self.NullableType.ToLower.Equals('string')
  else
    Result := Self.PropertyType.TypeKind in [tkChar,
      tkString, tkWChar, tkLString, tkWString, tkUString];
end;

function TJSDimeRTTIPropertyHelper.IsTime: Boolean;
var
  Ltype: string;
begin
  if Self.IsNullable then
    Ltype := Self.NullableType.ToLower
  else
    Ltype := Self.PropertyType.ToString.ToLower;

  Result := (Ltype.Equals('ttime'));
end;

function TJSDimeRTTIPropertyHelper.NullableType: string;
var
  LNullableType: string;
begin
  Result := '';
  if not IsNullable then
    Exit;
  LNullableType := Self.PropertyType.ToString.ToLower;
  LNullableType := StringReplace(LNullableType,'nullable<','',[rfIgnoreCase]);
  LNullableType := StringReplace(LNullableType,'system.','',[rfIgnoreCase]);
  LNullableType := LNullableType.Remove(LNullableType.Length-1);
  Result := LNullableType;
end;

end.
