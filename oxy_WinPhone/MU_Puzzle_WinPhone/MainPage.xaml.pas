namespace MU_Puzzle_WinPhone;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Net,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Media,
  System.Windows.Navigation,
  Microsoft.Phone.Controls,
  Microsoft.Phone.Shell,
  MU_Puzzle_WinPhone.Resources;

type
  TRuleMode = (eNoRule, eRule3, eRule4);
  MainPage = public partial class(PhoneApplicationPage)

  public
    // Constructor
    constructor ;

  private
    WorkStr: String;
    RuleMode: TRuleMode;
    SelectorPos: Integer;
    method UpdateMuStr;
    method AddU;
    method DuplicateStr;
    method StartReplace3IWithU;
    method Replace3IWithU(const StartPos: Integer);
    method StartDeleteUU;
    method DeleteUU(const StartPos: Integer);
    method CancelRuleMode;
    method SelectOK;
    method LaunchRule(const RuleNum: Integer);
    method ActivateSelBtns(const TurnOn:Visibility);
    method ActivateRuleBtns(const TurnOn: Visibility);
    method SetNewWorkingString(NewWorkStr: string);
    method CurrRuleModeStr: String;
    method NextSelector; 
    method PrevSelector;
    method btnRule2_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule1_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule3_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule4_Click(sender: Object; e: System.Windows.RoutedEventArgs);
      method btnPrev_Click(sender: Object; e: System.Windows.RoutedEventArgs);
      method btnOK_Click(sender: Object; e: System.Windows.RoutedEventArgs);
      method btnCancel_Click(sender: Object; e: System.Windows.RoutedEventArgs);
      method btnNext_Click(sender: Object; e: System.Windows.RoutedEventArgs);
  end;

implementation

constructor MainPage;
begin
  InitializeComponent();

  RuleMode := TRuleMode.eNoRule;
  WorkStr := 'I';
  //LastStrAdded := '';
  UpdateMuStr;
end;

method MainPage.UpdateMuStr;
begin
  if RuleMode = TRuleMode.eNoRule then
    lblMuStr.Text := 'M' + WorkStr
  else if (RuleMode = TRuleMode.eRule3) or (RuleMode = TRuleMode.eRule4) then
    if SelectorPos = -1 then
      lblMuStr.Text := 'M' + WorkStr
    else begin
      var ws1 := WorkStr.Substring(0, SelectorPos);
      var ws2 := WorkStr.Substring(SelectorPos);
      lblMuStr.Text := 'M' + ws1 + '>' + ws2;
    end;      

  { add strings to ListBox ignoring duplicates }
(*
      if (RuleMode = TRuleMode.eNoRule) and ((lbMuStrs Items.Count = 0) or
     (String.Compare(lblMuStr.Text, LastStrAdded) <> 0)) then begin
    lbMuStrs.Items.Add(lblMuStr.Text);
    LastStrAdded := lblMuStr.Text;
  end;
*)
    end;

method MainPage.AddU;
begin
  { if the last character is "I", add a "U" }
  if WorkStr.EndsWith('I') then
    WorkStr := WorkStr + 'U';
  UpdateMuStr;
end;

method MainPage.DuplicateStr;
begin
  { add the whole string to the end of itself }
  WorkStr := WorkStr + WorkStr;
  UpdateMuStr;
end;

method MainPage.StartReplace3IWithU;
// replace an occurance of III with U
var
  i: Integer;
  s: String;
begin
  // first, count how many occurances of III exist

  var count := 0;
  for i := 0 to WorkStr.Length - 3 do begin
    s := WorkStr.Substring(i);
    if s.StartsWith('III') then
      Inc(count);
  end;

  { if none, put up a message }
  if count = 0 then
    MessageBox.Show('There is no occurance of "III" in the current string.')
  else begin
    { if one, replace it automatically }
    if count = 1 then
      Replace3IWithU(WorkStr.IndexOf('III'))
    else begin
      { if more than one, let user select }
      RuleMode := TRuleMode.eRule3;

      ActivateSelBtns(Visibility.Visible);
      ActivateRuleBtns(Visibility.Collapsed);
      SelectorPos := -1;
      NextSelector;
    end;

    UpdateMuStr;
  end;
end;

method MainPage.Replace3IWithU(StartPos: Integer);
begin
  var ws1 := WorkStr.Substring(0, StartPos);
  var ws2 := WorkStr.Substring(StartPos + 3);
  WorkStr := ws1 + "U" + ws2;
end;

method MainPage.StartDeleteUU;
// delete an occurance of UU
var
  i: Integer;
  s: String;
begin
  // first, count how many occurances of UU exist
  var count := 0;
  for i := 0 to WorkStr.Length - 2 do begin
    s := WorkStr.Substring(i);
    if s.StartsWith('UU') then
      inc(count);
  end;

  // none?  just show a message 
  if count = 0 then 
    MessageBox.Show('There is no occurance of "UU" in the current string.')
  else begin
    // just 1? then just replace it
    if count = 1 then
      DeleteUU(WorkStr.IndexOf('UU'))
    else begin
      // it looks like we'll have to let the user select which occurance
      RuleMode := TRuleMode.eRule4 ;
      ActivateSelBtns(Visibility.Visible);
      ActivateRuleBtns(Visibility.Collapsed);
      SelectorPos := -1;
      NextSelector;
    end;
    UpdateMuStr;
  end
end;

method MainPage.DeleteUU(StartPos: Integer);
begin
  var ws1 := WorkStr.Substring(0, StartPos);
  var ws2 := WorkStr.Substring(StartPos + 2);
  WorkStr := ws1 + ws2;
end;

method MainPage.CancelRuleMode;
begin
  RuleMode := TRuleMode.eNoRule;
  ActivateSelBtns(Visibility.Collapsed);
  ActivateRuleBtns(Visibility.Visible);
  UpdateMuStr;
end;

method MainPage.SelectOK;
begin
  if RuleMode = TRuleMode.eRule3 then
    Replace3IWithU(SelectorPos)
  else
    DeleteUU(SelectorPos);

  CancelRuleMode;
end;

method MainPage.LaunchRule(RuleNum: Integer);
begin
  case RuleNum of
    1: AddU;
    2: DuplicateStr;
    3: StartReplace3IWithU;
    4: StartDeleteUU;
  end;
end;

method MainPage.ActivateSelBtns(TurnOn: Visibility);
begin
  SelectGrid.Visibility := TurnOn;

  lblSelect.Visibility := TurnOn;
  if (TurnOn = Visibility.Visible) then
      lblSelect.Text := if RuleMode = TRuleMode.eRule3 then
          "Select: " + "III"  else "Select: " + "UU"
end;

method MainPage.ActivateRuleBtns(TurnOn: System.Windows.Visibility);
begin
  btnRule1.Visibility := TurnOn;
  btnRule2.Visibility := TurnOn;
  lblRule1.Visibility := TurnOn;
  lblRule2.Visibility := TurnOn;

  if RuleMode = TRuleMode.eRule3 then begin
    btnRule3.IsEnabled := TurnOn = Visibility.Visible;
    lblRule4.Visibility := TurnOn;
    btnRule4.Visibility := TurnOn;
  end else if RuleMode = TRuleMode.eRule4 then begin
    btnRule3.Visibility := TurnOn;
    lblRule3.Visibility := TurnOn;
    btnRule4.IsEnabled := TurnOn = Visibility.Visible;
  end else begin
    lblRule3.Visibility := TurnOn;
    btnRule3.Visibility := TurnOn;
    btnRule3.IsEnabled := TurnOn = Visibility.Visible;
    lblRule4.Visibility := TurnOn;
    btnRule4.Visibility := TurnOn;
    btnRule4.IsEnabled := TurnOn = Visibility.Visible;
  end;
end;

method MainPage.NextSelector;
begin
  var NewSelectorPos := WorkStr.IndexOf(CurrRuleModeStr, SelectorPos + 1);

  if NewSelectorPos >= 0 then
    SelectorPos := NewSelectorPos;
end;

method MainPage.PrevSelector;
begin
  var RuleModeStr := CurrRuleModeStr;
  var NewSelectorPos := SelectorPos - 1;

  while NewSelectorPos > -1 do
    if WorkStr.Substring(NewSelectorPos).StartsWith(RuleModeStr) then begin
      SelectorPos := NewSelectorPos;
      Break;
    end else
      Dec(NewSelectorPos);
end;

method MainPage.SetNewWorkingString(NewWorkStr: string);
begin
  WorkStr := NewWorkStr.Substring(1);
  UpdateMuStr;
end;

method MainPage.CurrRuleModeStr: String;
begin
  if RuleMode in (TRuleMode.eRule3, TRuleMode.eRule4) then
    Result := if RuleMode = TRuleMode.eRule3 then 'III' else 'UU'
  else
    Result := '';
end;

method MainPage.btnRule2_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(2);
end;

method MainPage.btnRule1_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(1);
end;

method MainPage.btnRule3_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(3);
end;

method MainPage.btnRule4_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(4);
end;

method MainPage.btnPrev_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  PrevSelector;
  UpdateMuStr;
end;

method MainPage.btnOK_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  SelectOK;
end;

method MainPage.btnCancel_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  CancelRuleMode;
end;

method MainPage.btnNext_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  NextSelector;
  UpdateMuStr;
end;

end.