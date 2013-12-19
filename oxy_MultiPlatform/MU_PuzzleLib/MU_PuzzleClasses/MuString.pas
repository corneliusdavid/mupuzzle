namespace MU_PuzzleClasses;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text;

type
  TRuleMode = public enum (eNoRule, eRule3, eRule4);

  OnSetStringDelegate = public delegate(const aNewString: String);
  OnSetPositionDelegate = public delegate(const aNewPosition: Integer);
  OnSetRuleModeDelegate = public delegate(const aNewRule: TRuleMode);

  TMuString = public class
  private
    {$REGION 'fields'}
    fRuleMode: TRuleMode := TRuleMode.eNoRule;
    fMuString: String := 'MI';
    {$ENDREGION}
    {$REGION 'event handlers'}
    fOnRuleModeChange: OnSetRuleModeDelegate;
    fOnSetMuString: OnSetStringDelegate;
    {$ENDREGION}
    method SetRuleMode(const aNewRuleMode: TRuleMode);
    method UpdateSelectorString;
  protected
    method SetMuString(const Value: String);
  public
    method AddU;
    method DuplicateStr;
    method Replace3IWithU(const StartPos: Integer);
    method DeleteUU(const StartPos: Integer);
    {$REGION 'selectors'}
    method FirstSelector;
    method NextSelector;
    method PrevSelector;
    {$ENDREGION}
    method GetRuleStrCount(aRuleMode: TRuleMode): Integer;
    method GetRuleStr(aRuleMode: TRuleMode): String;
    property MuString: String read fMuString write SetMuString; notify;
    property SelectorString: String := ''; notify;
    property Position: Integer := 0; notify; 
    property RuleMode: TRuleMode read fRuleMode write SetRuleMode; notify;
    event OnSetMuString: OnSetStringDelegate delegate fOnSetMuString;  
    event OnRuleModeChanged: OnSetRuleModeDelegate delegate fOnRuleModeChange;
  end;


implementation

method TMuString.DuplicateStr;
begin
  // add the whole string after the M to the end of itself
  MuString:= MuString+ MuString.Substring(1);  
end;

method TMuString.AddU;
begin
  // if the last character is "I", add a "U" 
  if MuString.EndsWith('I') then
    MuString:= MuString+ 'U';
end;

method TMuString.Replace3IWithU(StartPos: Integer);
begin
  var ws1 := MuString.Substring(1, StartPos - 1);
  var ws2 := MuString.Substring(StartPos + 3);
  MuString:= 'M' + ws1 + "U" + ws2;
end;

method TMuString.DeleteUU(StartPos: Integer);
begin
  var ws1 := MuString.Substring(1, StartPos - 1);
  var ws2 := MuString.Substring(StartPos + 2);
  MuString:= 'M' + ws1 + ws2;
end;

method TMuString.SetMuString(const Value: String);
begin
  fMuString := Value;
  if assigned(fOnSetMuString) then
    fOnSetMuString(Value);
end;

method TMuString.FirstSelector;
begin
  SelectorString := MuString;
  Position := -1;
  NextSelector;
end;

method TMuString.NextSelector;
var
  RuleModeStr: String;
begin
  if RuleMode = TRuleMode.eRule3 then
    RuleModeStr := 'III'
  else if RuleMode = TRuleMode.eRule4 then
    RuleModeStr := 'UU'
  else
    raise new System.Exception('Invalid Rule Mode in "NextSelector"');

  var NewSelectorPos := MuString.IndexOf(RuleModeStr, Position + 1);

  if NewSelectorPos >= 1 then begin
    Position := NewSelectorPos;
    UpdateSelectorString;
  end;
end;

method TMuString.PrevSelector;
var
  RuleModeStr: String;
begin
  if RuleMode = TRuleMode.eRule3 then
    RuleModeStr := 'III'
  else if RuleMode = TRuleMode.eRule4 then
    RuleModeStr := 'UU'
  else
    raise new System.Exception('Invalid Rule Mode in "NextSelector"');

  var NewSelectorPos := Position - 1;

  while NewSelectorPos >= 1 do
    if MuString.Substring(NewSelectorPos).StartsWith(RuleModeStr) then begin
      Position := NewSelectorPos;
      UpdateSelectorString;
      Break;
    end else
      dec(NewSelectorPos);
end;

method TMuString.UpdateSelectorString;
require
  Position >= 0;
  Position < SelectorString.Length;
begin
  var ws1 := MuString.Substring(1, Position - 1);
  var ws2 := MuString.Substring(Position);
  SelectorString := 'M' + ws1 + '>' + ws2;
end;

method TMuString.SetRuleMode(aNewRuleMode: TRuleMode);
begin
  if fRuleMode <> aNewRuleMode then begin
    fRuleMode := aNewRuleMode;
    if assigned(fOnRuleModeChange) then
      fOnRuleModeChange(fRuleMode);
  end;
end;

method TMuString.GetRuleStrCount(aRuleMode: TRuleMode): Integer;
var
  i: Integer;
require
  aRuleMode in [TRuleMode.eRule3, TRuleMode.eRule4];
begin
  Result := 0;

  for i := 1 to MuString.Length - GetRuleStr(aRuleMode).Length + 1 do 
    if MuString.Substring(i).StartsWith(GetRuleStr(aRuleMode)) then
      inc(Result);
end;

method TMuString.GetRuleStr(aRuleMode: TRuleMode): String;
require
  aRuleMode in [TRuleMode.eRule3, TRuleMode.eRule4];
begin
  case aRuleMode of
    TRuleMode.eRule3:
      Result := 'III';
    TRuleMode.eRule4:
      Result := 'UU';
  end;
end;

end.
