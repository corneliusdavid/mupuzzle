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
    method SetNewWorkingString;
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
    method btnCancel_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnOK_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnPrev_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method btnNext_Click(sender: Object; e: System.Windows.RoutedEventArgs);
    method lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
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
  if WorkStr.EndsWith('I') then
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
      inc(count);
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

      ActivateSelBtns(System.Windows.Visibility.Visible);
      ActivateRuleBtns(System.Windows.Visibility.Hidden);
      SelectorPos := -1;
      NextSelector;
    end;

    UpdateMuStr;
  end;
end;

method MainWindow.Replace3IWithU(StartPos: Integer);
begin
  var ws1 := WorkStr.Substring(0, StartPos);
  var ws2 := WorkStr.Substring(StartPos + 3);
  WorkStr := ws1 + "U" + ws2;
end;

method MainWindow.StartDeleteUU;
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
    MessageBox.Show('There is no occurance of ''UU'' in the current string.')
  else begin
    // just 1? then just replace it
    if count = 1 then
      DeleteUU(WorkStr.IndexOf('UU'))
    else begin
      // it looks like we'll have to let the user select which occurance
      RuleMode := TRuleMode.eRule4 ;
      ActivateSelBtns(System.Windows.Visibility.Visible);
      ActivateRuleBtns(System.Windows.Visibility.Hidden);
      SelectorPos := -1;
      NextSelector;
    end;
    UpdateMuStr;
  end
end;

method MainWindow.DeleteUU(StartPos: Integer);
begin
  var ws1 := WorkStr.Substring(0, StartPos);
  var ws2 := WorkStr.Substring(StartPos + 2);
  WorkStr := ws1 + ws2;
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
  else if (RuleMode = TRuleMode.eRule3) or (RuleMode = TRuleMode.eRule4) then
    if SelectorPos = -1 then
      lblMuStr.Content := 'M' + WorkStr
    else begin
      var ws1 := WorkStr.Substring(0, SelectorPos);
      var ws2 := WorkStr.Substring(SelectorPos);
      lblMuStr.Content := 'M' + ws1 + '>' + ws2;
    end;      

  { add strings to ListBox ignoring duplicates }
  if (RuleMode = TRuleMode.eNoRule) and ((lbMuStrs.Items.Count = 0) or
            (String.Compare(lblMuStr.Content.ToString, lbMuStrs.Items[lbMuStrs.Items.Count-1].ToString) <> 0)) then
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
<<<<<<< HEAD
    btnRule3.IsEnabled := TurnOn = Visibility.Visible;
=======
    btnRule3.IsEnabled := TurnOn = System.Windows.Visibility.Visible;
>>>>>>> origin/master
    lblRule4.Visibility := TurnOn;
    btnRule4.Visibility := TurnOn;
  end else if RuleMode = TRuleMode.eRule4 then begin
    btnRule3.Visibility := TurnOn;
    lblRule3.Visibility := TurnOn;
<<<<<<< HEAD
    btnRule4.IsEnabled := TurnOn = Visibility.Visible;
=======
    btnRule4.IsEnabled := TurnOn = System.Windows.Visibility.Visible;
>>>>>>> origin/master
  end else begin
    lblRule3.Visibility := TurnOn;
    btnRule3.Visibility := TurnOn;
    btnRule3.IsEnabled := TurnOn = Visibility.Visible;
    lblRule4.Visibility := TurnOn;
    btnRule4.Visibility := TurnOn;
    btnRule4.IsEnabled := TurnOn = Visibility.Visible;
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

  if NewSelectorPos >= 0 then
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
      dec(NewSelectorPos);
end;

method MainWindow.btnCancel_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  CancelRuleMode;
end;

method MainWindow.btnOK_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  SelectOK;
end;

method MainWindow.btnPrev_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  PrevSelector;
  UpdateMuStr;
end;

method MainWindow.btnNext_Click(sender: Object; e: System.Windows.RoutedEventArgs);
begin
  NextSelector;
  UpdateMuStr;
end;

method MainWindow.SetNewWorkingString;
begin
  WorkStr := lbMuStrs.Items[lbMuStrs.SelectedIndex].ToString.Substring(1);
  UpdateMuStr;
end;
    
method MainWindow.lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
begin
  SetNewWorkingString;
end;

end.
