namespace MU_Puzzle_OxyWPF;

interface

uses
  System.Collections.Generic,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Data,
  System.Windows.Documents,
  System.Windows.Media,
  System.Windows.Navigation,
  System.Windows.Shapes;

type
  TRuleMode = (eNoRule, eRule3, eRule4);
  MainWindow = public partial class(System.Windows.Window)
  private
    WorkStr: String;
    RuleMode: TRuleMode;
    SelectorPos: Integer;
    method UpdateMuStr;
    method ActivateSelBtns(const TurnOn: System.Windows.Visibility);
    method ActivateRuleBtns(const TurnOn: System.Windows.Visibility);
    method NextSelector;
    method PrevSelector;
    method LaunchRule(const RuleNum: Integer);
    method AddU;
    method DuplicateStr;
    method StartReplace3IWithU;
    method Replace3IWithU(const StartPos: Integer);
    method StartDeleteUU;
    method DeleteUU(const StartPos: Integer);
    method CancelRuleMode;
    method SelectOK;
    method btnRule1_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule2_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule3_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnRule4_Click(sender: Object; e: System.Windows.RoutedEventArgs);
  public
    constructor;
  end;
  
implementation

constructor MainWindow;
begin
  InitializeComponent();

  RuleMode := TRuleMode.eNoRule;
  WorkStr := 'I';
  UpdateMuStr;
end;

method MainWindow.btnRule1_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(1);
end;

method MainWindow.btnRule2_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(2);
end;
  
method MainWindow.btnRule3_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(3);
end;

method MainWindow.btnRule4_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  LaunchRule(4);
end;

method MainWindow.LaunchRule(RuleNum: Integer);
begin
  case RuleNum of
    1: AddU;
    2: DuplicateStr;
    3: StartReplace3IWithU;
    4: StartDeleteUU;
  end;
end;

method MainWindow.AddU;
begin
  { if the last character is "I", add a "U" }
  if WorkStr.StartsWith('I') then
    WorkStr := WorkStr + 'U';
  UpdateMuStr;
end;

method MainWindow.DuplicateStr;
begin
  { add the whole string to the end of itself }
  WorkStr := WorkStr + WorkStr;
  UpdateMuStr;
end;

method MainWindow.StartReplace3IWithU;
begin

end;

method MainWindow.Replace3IWithU(StartPos: Integer);
begin

end;

method MainWindow.StartDeleteUU;
begin

end;

method MainWindow.DeleteUU(StartPos: Integer);
begin
  WorkStr.Remove(StartPos, 2);
end;

method MainWindow.CancelRuleMode;
begin
  RuleMode := TRuleMode.eNoRule;
  ActivateSelBtns(System.Windows.Visibility.Hidden);
  ActivateRuleBtns(System.Windows.Visibility.Visible);
  UpdateMuStr;
end;

method MainWindow.SelectOK;
begin
  if RuleMode = TRuleMode.eRule3 then
    Replace3IWithU(SelectorPos)
  else
    DeleteUU(SelectorPos);

  CancelRuleMode;
end;

method MainWindow.UpdateMuStr;
begin
  if RuleMode = TRuleMode.eNoRule then
    lblMuStr.Content := 'M' + WorkStr
  else
    lblMuStr.Content := 'M' + WorkStr.Substring(1, SelectorPos-1) + '>' + WorkStr.Substring(SelectorPos, WorkStr.Length - SelectorPos);

  { add strings to ListBox ignoring duplicates }
  if (RuleMode = TRuleMode.eNoRule) and ((lbMuStrs.Items.Count = 0) or
            (String.Compare(lblMuStr.Content.ToString, lbMuStrs.Items[lbMuStrs.Items.Count-1].ToString) = 0)) then
    lbMuStrs.Items.Add(lblMuStr.Content.ToString);
end;

method MainWindow.ActivateSelBtns(const TurnOn: System.Windows.Visibility);
begin
  btnPrev.Visibility := TurnOn;
  btnOK.Visibility := TurnOn;
  btnCancel.Visibility := TurnOn;
  btnNext.Visibility := TurnOn;

  lblSelect.Visibility := TurnOn;
  if (TurnOn = System.Windows.Visibility.Visible) then
    if RuleMode = TRuleMode.eRule3 then
      lblSelect.Content := "Select: " + "III"
    else
      lblSelect.Content := "Select: " + "UU"
end;

method MainWindow.ActivateRuleBtns(const TurnOn: System.Windows.Visibility);
begin
  btnRule1.Visibility := TurnOn;
  btnRule2.Visibility := TurnOn;
  lblRule1.Visibility := TurnOn;
  lblRule2.Visibility := TurnOn;
  if RuleMode = TRuleMode.eRule3 then begin
    btnRule3.IsEnabled := TurnOn = System.Windows.Visibility.Visible;
    btnRule4.Visibility := TurnOn;
    btnRule4.Visibility := TurnOn;
  end else begin
    btnRule3.Visibility := TurnOn;
    lblRule3.Visibility := TurnOn;
    btnRule4.IsEnabled := TurnOn = System.Windows.Visibility.Visible;
  end;
end;

method MainWindow.NextSelector;
var
  RuleModeStr: String;
begin
  if RuleMode = TRuleMode.eRule3 then
    RuleModeStr := 'III'
  else if RuleMode = TRuleMode.eRule4 then
    RuleModeStr := 'UU'
  else
    raise new System.Exception('Invalid Rule Mode in "NextSelector"');

  var NewSelectorPos := WorkStr.IndexOf(RuleModeStr, SelectorPos + 1);

  if SelectorPos > 1 then
    SelectorPos := NewSelectorPos;
end;

method MainWindow.PrevSelector;
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

  while NewSelectorPos > -1 do
    if WorkStr.Substring(NewSelectorPos).StartsWith(RuleModeStr) then begin
      SelectorPos := NewSelectorPos;
      Break;
    end else
      Dec(NewSelectorPos);
end;

end.
