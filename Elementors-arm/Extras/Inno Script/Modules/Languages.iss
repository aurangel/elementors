[Code]
var
  CurrLanguage: string;
procedure ChangeLanguage(Lang: string);
begin
  CurrLanguage:=Lang;
end;

function GetWord(INIWord: string): string;
var
  inistring: string;
  position: integer;
begin
  inistring:=GetIniString(CurrLanguage,INIWord,'Error',ExpandConstant('{tmp}\') + 'Languages.ini');
  while Pos('\n',inistring)<>0 do begin
    position:=Pos('\n',inistring);
    Delete(inistring,position,2);
    Insert(#13#10,inistring,position);
  end;
  while Pos('[#AppName]',inistring)<>0 do begin
    position:=Pos('[#AppName]',inistring);
    Delete(inistring,position,10);
    Insert('{#AppName}',inistring,position);
  end;
  Result:=inistring;
end;