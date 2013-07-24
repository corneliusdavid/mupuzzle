namespace MuPuzzle;

interface

uses
  System.Collections.Generic,
  System.Windows.Forms,
  System.Text;

type
  StringChangeEvent = delegate(aMUStr: MUString);
  SubStringChooseEvent = delegate(ASearchString: string; var Index: Integer);

  MUString = public class
  const
    MAX_LENGTH = 150;
  private
    fstring: String := 'MI';
    method DoStringChangedEvent;
  protected
    method SetString(value: string);
  public
    method AddU;
    method AppendAll;
    method ReplaceIIIwithU;
    method DeleteUU;
    property TheString: string read fstring write SetString;
    event OnStringChanged: StringChangeEvent;
    event OnChooseSubString: SubStringChooseEvent;
  end;

implementation

{ MUString }

method MUString.AddU; 
begin
  if TheString[TheString.Length - 1] = 'I' then
    TheString := TheString + 'U';
end;

method MUString.AppendAll; 
begin
  TheString := TheString + TheString.SubString(1);
end;

method MUString.ReplaceIIIwithU; 
const
  III_STR = 'III';
var
  III_Index: Integer;
begin
  if TheString.Contains(III_STR) then begin
    if Assigned(OnChooseSubString) then begin
      OnChooseSubString(III_STR, III_Index);
      if III_Index > 0 then 
        TheString := TheString.Remove(III_Index, 3).Insert(III_Index, 'U');
    end else
      MessageBox.Show('This rule is not implemented.');
  end else
    MessageBox.Show('There is no occurance of ' + III_STR + ' in the current string.',
               'Notice!', MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
end;

method MUString.DeleteUU; 
const
  UU_STR = 'UU';
var
  UU_Index: Integer;
begin
  if TheString.Contains(UU_STR) then begin
    if Assigned(OnChooseSubString) then begin
      OnChooseSubString(UU_STR, UU_Index);
      if UU_Index > 0 then 
        TheString := TheString.Remove(UU_Index, 2);
    end else
      MessageBox.Show('This rule is not implemented.');
  end else
    MessageBox.Show('There is no occurance of ' + UU_STR + ' in the current string.',
               'Notice!', MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
end;

method MUString.SetString(value: string); 
begin
  if value.Length > MAX_LENGTH then
    MessageBox.Show('Operation skipped as resulting string would be too long.')
  else if Value <> fstring then begin
    fstring := Value;    
    DoStringChangedEvent;
  end;
end;

method MUString.DoStringChangedEvent;
begin
  if Assigned(OnStringChanged) then
    OnStringChanged(self);
end;

end.
