unit Utils;

interface

uses
  Forms, Classes, Windows, SysUtils;
//  , OleServer, WordXP, ExtCtrls, ImgList, Controls, IBDatabase, DB,
//  , StdActns, ActnList, IBServices, Menus, DBCtrls, ToolWin,
//  , ComCtrls, Windows, INIFiles
// , Messages, Dialogs;

  //проверка создания окна
  function IsFormOpen(const FormName : string): Boolean;
  //получение версии программы
  function GetMyVersion:string;

implementation

function IsFormOpen(const FormName : string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Screen.FormCount - 1 DownTo 0 do
    if (Screen.Forms[i].Name = FormName) then
    begin
      Result := True;
      Break;
    end;
end;

function GetMyVersion: string;
type
  TVerInfo=packed record
    Nevazhno: array[0..47] of byte; // не нужніе первіе 48 байт
    Minor,Major,Build,Release: word; // тут версия
  end;
var
  s:TResourceStream;
  v:TVerInfo;
begin
  result:='';
  try
    s:=TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаем ресурс
    if s.Size>0 then
    begin
      s.Read(v,SizeOf(v)); // читаем нужніе байті
      result:=Format('%d.%d.%d.%d', [v.Major, v.Minor, v.Release, v.Build]);
    end;
    s.Free;
  except;
  end;
end;

end.
