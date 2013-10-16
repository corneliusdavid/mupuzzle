namespace MU_Puzzle_WinRT;

interface

uses
  System,
  System.Collections.Generic,
  System.IO,
  System.Linq,
  Windows.Foundation,
  Windows.Foundation.Collections,
  Windows.UI.Xaml,
  Windows.UI.Xaml.Controls,
  Windows.UI.Xaml.Controls.Primitives,
  Windows.UI.Xaml.Data,
  Windows.UI.Xaml.Input,
  Windows.UI.Xaml.Media,
  Windows.UI.Xaml.Navigation;

type
  TRuleMode = (eNoRule, eRule3, eRule4);
  MainPage = partial class(Page)
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
    method ActivateSelBtns(const TurnOn: Windows.UI.Xaml.Visibility);
    method ActivateRuleBtns(const TurnOn: Windows.UI.Xaml.Visibility);
    method SetNewWorkingString;
    method CurrRuleModeStr: String;
    method NextSelector; 
    method PrevSelector;
    method btnRule1_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnRule2_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnRule3_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnRule4_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
      method btnCancel_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
      method btnOK_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
      method btnPrev_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
      method btnNext_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);

  public
    constructor ;

  protected
    method OnNavigatedTo(e: NavigationEventArgs); override;
  end;

implementation

constructor MainPage;
begin
  self.InitializeComponent();

  RuleMode := TRuleMode.eNoRule;
  WorkStr := 'I';
  UpdateMuStr;
end;

method MainPage.OnNavigatedTo(e: NavigationEventArgs);
begin
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
{
      if (RuleMode = TRuleMode.eNoRule) and ((lbMuStrs.Items.Count = 0) or
            (String.Compare(lblMuStr.Text.ToString, lbMuStrs.Items. [lbMuStrs.Items.Count-1].ToString) <> 0)) then
    lbMuStrs.Items.Add(lblMuStr.Text.ToString);
}
end;

method MainPage.btnRule1_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(1);
end;

method MainPage.btnRule2_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(2);
end;

method MainPage.btnRule3_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(3);
end;

method MainPage.btnRule4_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(4);
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

method MainPage.ActivateSelBtns(TurnOn: Windows.UI.Xaml.Visibility);
begin
  SelectGrid.Visibility := TurnOn;

  lblSelect.Visibility := TurnOn;
  if (TurnOn = Windows.UI.Xaml.Visibility.Visible) then
      lblSelect.Text := if RuleMode = TRuleMode.eRule3 then
          "Select: " + "III"  else "Select: " + "UU"
end;

method MainPage.ActivateRuleBtns(TurnOn: Windows.UI.Xaml.Visibility);
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

method MainPage.SetNewWorkingString;
begin

end;

method MainPage.NextSelector;
begin
  var NewSelectorPos := WorkStr.IndexOf(CurrRuleModeStr, SelectorPos + 1);

  if NewSelectorPos >= 0 then
    SelectorPos := NewSelectorPos;
end;

method MainPage.PrevSelector;
begin
  var NewSelectorPos := WorkStr.IndexOf(CurrRuleModeStr, SelectorPos + 1);

  while NewSelectorPos > -1 do
    if WorkStr.Substring(NewSelectorPos).StartsWith(CurrRuleModeStr) then begin
      SelectorPos := NewSelectorPos;
      Break;
    end else
      Dec(NewSelectorPos);
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
      inc(count);
  end;

  { if none, put up a message }
  if count = 0 then begin
    var msg := Windows.UI.Popups.MessageDialog.Create('There is no occurance of "III" in the current string.');
    msg.ShowAsync;
  end else begin
    { if one, replace it automatically }
    if count = 1 then
      Replace3IWithU(WorkStr.IndexOf('III'))
    else begin
      { if more than one, let user select }
      RuleMode := TRuleMode.eRule3;

      ActivateSelBtns(Windows.UI.Xaml.Visibility.Visible);
      ActivateRuleBtns(Windows.UI.Xaml.Visibility.Collapsed);
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
  if count = 0 then begin
    var msg := Windows.UI.Popups.MessageDialog.Create('There is no occurance of ''UU'' in the current string.');
    msg.ShowAsync;
  end else begin
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

method MainPage.CurrRuleModeStr: String;
begin
  if RuleMode in (TRuleMode.eRule3, TRuleMode.eRule4) then
    Result := if RuleMode = TRuleMode.eRule3 then 'III' else 'UU'
  else
    Result := '';
end;

method MainPage.btnCancel_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  CancelRuleMode;
end;

method MainPage.btnOK_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  SelectOK;
end;

method MainPage.btnPrev_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  PrevSelector;
  UpdateMuStr;
end;

method MainPage.btnNext_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  NextSelector;
  UpdateMuStr;
end;

end.
