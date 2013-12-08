namespace MU_Puzzle_OxyWPF3;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Data,
  System.Windows.Documents,
  System.Windows.Media,
  System.Windows.Navigation,
  System.Windows.Shapes;

type
  OnSetStringDelegate = delegate(const aNewString: String);

  TMuString = class
  private
    fTheString: String := 'MI';
    fOnSetName: OnSetStringDelegate;
  protected
    method SetTheString(const Value: String);
  public
    method AddU;
    method DuplicateStr;
    method Replace3IWithU(const StartPos: Integer);
    method DeleteUU(const StartPos: Integer);
    property TheString: String read fTheString write SetTheString; notify;
    event OnSetString: OnSetStringDelegate delegate fOnSetName;  
  end;

  TRuleMode = (eNoRule, eRule3, eRule4);
  StackedWindow3 = public partial class(System.Windows.Window)
  private
    RuleMode: TRuleMode;
    SelectorPos: Integer;
    TheMuString: TMuString;
    MuStrHistory: List<String>;
    method UpdateMuStr(const OrigMuString: String);
    method ActivateSelBtns(const TurnOn: System.Windows.Visibility);
    method ActivateRuleBtns(const TurnOn: System.Windows.Visibility);
    method SetNewWorkingString;
    method NextSelector; 
    method PrevSelector;
    method LaunchRule(const RuleNum: Integer);
    method StartReplace3IWithU;
    method StartDeleteUU;
    method CancelRuleMode;
    method SelectOK;
    method btnRule1_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule2_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule3_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule4_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnCancel_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnOK_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnPrev_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnNext_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
    method MuStringChanged(const aNewString: String);
  public
    constructor;
  end;
  
implementation

constructor StackedWindow3;
begin
  InitializeComponent();

  RuleMode := TRuleMode.eNoRule;

  TheMuString := new TMuString;
  TheMuString.OnSetString += MuStringChanged;
  self.DataContext := TheMuString;

  MuStrHistory := new List<String>;
  lbMuStrs.ItemsSource := MuStrHistory;
end;

method StackedWindow3.btnRule1_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(1);
end;

method StackedWindow3.btnRule2_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(2);
end;
  
method StackedWindow3.btnRule3_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(3);
end;

method StackedWindow3.btnRule4_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(4);
end;

method StackedWindow3.LaunchRule(RuleNum: Integer);
begin
  case RuleNum of
    1: TheMuString.AddU;
    2: TheMuString.DuplicateStr;
    3: StartReplace3IWithU;
    4: StartDeleteUU;
  end;
end;

method StackedWindow3.StartReplace3IWithU;
// replace an occurance of III with U
var
  i: Integer;
  s: String;
  WorkStr: String;
begin
  WorkStr := lblMuStr.Content.ToString.Substring(1);
  // first, count how many occurances of III exist

  var count := 0;
  for i := 0 to WorkStr.Length - 3 do begin
    s := WorkStr.Substring(i);
    if s.StartsWith('III') then
      inc(count);
  end;

  { if none, put up a message }
  if count = 0 then
    MessageBox.Show('There is no occurance of "III" in the current string.')
  else begin
    { if one, replace it automatically }
    if count = 1 then begin
      DataContext := self.TheMuString;
      TheMuString.Replace3IWithU(WorkStr.IndexOf('III'));
    end else begin
      { if more than one, let user select }
      RuleMode := TRuleMode.eRule3;

      ActivateSelBtns(System.Windows.Visibility.Visible);
      ActivateRuleBtns(System.Windows.Visibility.Hidden);
      
      SelectorPos := -1;
      NextSelector;
    end;

    UpdateMuStr(WorkStr);
  end;
end;

method StackedWindow3.StartDeleteUU;
// delete an occurance of UU
var
  i: Integer;
  s: String;
  WorkStr: String;
begin
  WorkStr := lblMuStr.Content.ToString.Substring(1);

  // first, count how many occurances of UU exist
  var count := 0;
  for i := 0 to WorkStr.Length - 2 do begin
    s := WorkStr.Substring(i);
    if s.StartsWith('UU') then
      inc(count);
  end;

  // none?  just show a message 
  if count = 0 then
    MessageBox.Show('There is no occurance of ''UU'' in the current string.')
  else begin
    // just 1? then just replace it
    if count = 1 then
      TheMuString.DeleteUU(WorkStr.IndexOf('UU'))
    else begin
      // it looks like we'll have to let the user select which occurance
      RuleMode := TRuleMode.eRule4 ;
      ActivateSelBtns(System.Windows.Visibility.Visible);
      ActivateRuleBtns(System.Windows.Visibility.Hidden);
      SelectorPos := -1;
      NextSelector;
    end;

    UpdateMuStr(WorkStr);
  end
end;

method StackedWindow3.CancelRuleMode;
begin
  RuleMode := TRuleMode.eNoRule;
  ActivateSelBtns(System.Windows.Visibility.Collapsed);
  ActivateRuleBtns(System.Windows.Visibility.Visible);
end;

method StackedWindow3.SelectOK;
begin
  if RuleMode = TRuleMode.eRule3 then
    TheMuString.Replace3IWithU(SelectorPos)
  else
    TheMuString.DeleteUU(SelectorPos);

  RuleMode := TRuleMode.eNoRule;
  ActivateSelBtns(System.Windows.Visibility.Collapsed);
  ActivateRuleBtns(System.Windows.Visibility.Visible);
end;

method StackedWindow3.UpdateMuStr(const OrigMuString: String);
begin
  if RuleMode = TRuleMode.eNoRule then
    lblTmpMuStr.Content := 'M' + OrigMuString
  else if (RuleMode = TRuleMode.eRule3) or (RuleMode = TRuleMode.eRule4) then
    if SelectorPos = -1 then
      lblTmpMuStr.Content := 'M' + OrigMuString
    else begin
      var ws1 := OrigMuString.Substring(0, SelectorPos);
      var ws2 := OrigMuString.Substring(SelectorPos);
      lblTmpMuStr.Content := 'M' + ws1 + '>' + ws2;
    end;      
(*
  { add strings to ListBox ignoring duplicates }
  if (RuleMode = TRuleMode.eNoRule) and ((lbMuStrs.Items.Count = 0) or
            (String.Compare(lblMuStr.Content.ToString, lbMuStrs.Items[lbMuStrs.Items.Count-1].ToString) <> 0)) then
    lbMuStrs.Items.Add(lblMuStr.Content.ToString);
*)
end;

method StackedWindow3.ActivateSelBtns(const TurnOn: System.Windows.Visibility);
begin
  SelectGrid.Visibility := TurnOn;
  btnPrev.Visibility := TurnOn;
  btnOK.Visibility := TurnOn;
  btnCancel.Visibility := TurnOn;
  btnNext.Visibility := TurnOn;
  lblTmpMuStr.Visibility := TurnOn;

  lblSelect.Visibility := TurnOn;
  if (TurnOn = System.Windows.Visibility.Visible) then 
    if RuleMode = TRuleMode.eRule3 then
      lblSelect.Content := "Select: " + "III"
    else
      lblSelect.Content := "Select: " + "UU"
end;

method StackedWindow3.ActivateRuleBtns(const TurnOn: System.Windows.Visibility);
begin
  lblMuStr.Visibility := TurnOn;
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

method StackedWindow3.NextSelector;
var
  RuleModeStr: String;
begin
  if RuleMode = TRuleMode.eRule3 then
    RuleModeStr := 'III'
  else if RuleMode = TRuleMode.eRule4 then
    RuleModeStr := 'UU'
  else
    raise new System.Exception('Invalid Rule Mode in "NextSelector"');

  var WorkStr: String := TheMuString.TheString.Substring(1);
  var NewSelectorPos := WorkStr.IndexOf(RuleModeStr, SelectorPos + 1);

  if NewSelectorPos >= 0 then
    SelectorPos := NewSelectorPos;
end;

method StackedWindow3.PrevSelector;
var
  RuleModeStr: String;
begin
  if RuleMode = TRuleMode.eRule3 then
    RuleModeStr := 'III'
  else if RuleMode = TRuleMode.eRule4 then
    RuleModeStr := 'UU'
  else
    raise new System.Exception('Invalid Rule Mode in "NextSelector"');

  var NewSelectorPos := SelectorPos - 1;

  var WorkStr: String := TheMuString.TheString.Substring(1);
  while NewSelectorPos > -1 do
    if WorkStr.Substring(NewSelectorPos).StartsWith(RuleModeStr) then begin
      SelectorPos := NewSelectorPos;
      Break;
    end else
      dec(NewSelectorPos);
end;

method StackedWindow3.btnCancel_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  CancelRuleMode;
end;

method StackedWindow3.btnOK_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  SelectOK;
end;

method StackedWindow3.btnPrev_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  PrevSelector;
  UpdateMuStr(lblTmpMuStr.Content.ToString.Substring(1).Replace('>', ''));
end;

method StackedWindow3.btnNext_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  NextSelector;
  UpdateMuStr(lblTmpMuStr.Content.ToString.Substring(1).Replace('>', ''));
end;

method StackedWindow3.SetNewWorkingString;
begin
//  WorkStr := lbMuStrs.Items[lbMuStrs.SelectedIndex].ToString.Substring(1);
//  UpdateMuStr;
end;
    
method StackedWindow3.lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
begin
  SetNewWorkingString;
end;

method StackedWindow3.MuStringChanged(aNewString: String);
begin
  MuStrHistory.Add(aNewString);
end;

{---TMuString--}

method TMuString.DuplicateStr;
begin
  // add the whole string after the M to the end of itself
  TheString := TheString + TheString.Substring(1);  
end;

method TMuString.AddU;
begin
  // if the last character is "I", add a "U" 
  if TheString.EndsWith('I') then
    TheString := TheString + 'U';
end;

method TMuString.Replace3IWithU(StartPos: Integer);
begin
  var ws1 := TheString.Substring(1, StartPos);
  var ws2 := TheString.Substring(StartPos + 4);
  TheString := 'M' + ws1 + "U" + ws2;
end;

method TMuString.DeleteUU(StartPos: Integer);
begin
  var ws1 := TheString.Substring(1, StartPos);
  var ws2 := TheString.Substring(StartPos + 3);
  TheString := 'M' + ws1 + ws2;
end;

method TMuString.SetTheString(const Value: String);
begin
  fTheString := Value;
  if assigned(fOnSetName) then
    fOnSetName(Value);
end;

end.
