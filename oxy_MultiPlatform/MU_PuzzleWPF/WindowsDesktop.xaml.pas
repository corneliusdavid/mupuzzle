namespace MU_PuzzleWPF;

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
  System.Windows.Shapes,
  MU_PuzzleClasses;

type
  TLabeledValueConverter = public class(IMultiValueConverter)
  public
    method Convert(values: array of System.Object; targetType: System.Type; parameter: System.Object; culture: System.Globalization.CultureInfo): System.Object; 
    method ConvertBack(value: System.Object; targetTypes: array of System.Type; parameter: System.Object; culture: System.Globalization.CultureInfo): array of System.Object; 
  end;

  TWindowsDesktop = public partial class(System.Windows.Window)
  private
    MyMuString: TMuString;
    MuStrHistory: System.Collections.ObjectModel.ObservableCollection<String>;
    method ActivateSelBtns(const TurnOn: System.Windows.Visibility);
    method ActivateRuleBtns(const TurnOn: System.Windows.Visibility);
    method SetNewWorkingString;
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
    method RuleModeChanged(const aNewRuleMode: TRuleMode);
  public
    constructor;
  end;
  
implementation

{--- TMultiStringConverter ---}

method TLabeledValueConverter.Convert(values: array of Object; targetType: &Type; parameter: Object; culture: System.Globalization.CultureInfo): Object;
// expects values in the form "Label: ", XXX  where XXX is a numeric value
begin
  Result := String(values[0]) + values[1].ToString;
end;

method TLabeledValueConverter.ConvertBack(value: Object; targetTypes: array of &Type; parameter: Object; culture: System.Globalization.CultureInfo): array of Object;
begin
  raise new Exception('not supported');
end;

{--- TWindowsDesktop ---}

constructor TWindowsDesktop;
begin
  InitializeComponent();

  MyMuString := new TMuString;
  MyMuString.OnSetMuString += MuStringChanged;  
  MyMuString.OnRuleModeChanged += RuleModeChanged;

  self.DataContext := MyMuString;

  MuStrHistory := new System.Collections.ObjectModel.ObservableCollection<String>;
  lbMuStrs.ItemsSource := MuStrHistory;
end;

method TWindowsDesktop.ActivateSelBtns(TurnOn: Visibility);
begin
  SelectGrid.Visibility := TurnOn;

  if (TurnOn = System.Windows.Visibility.Visible) then 
    lblSelect.Content := "Select: " + MyMuString.GetRuleStr(MyMuString.RuleMode);
end;

method TWindowsDesktop.ActivateRuleBtns(TurnOn: Visibility);
begin
  lblMuStr.Visibility := TurnOn;
  lblRule1.Visibility := TurnOn;
  lblRule2.Visibility := TurnOn;
  lblRule3.Visibility := TurnOn;
  lblRule4.Visibility := TurnOn;
  btnRule1.Visibility := TurnOn;
  btnRule2.Visibility := TurnOn;
  btnRule3.Visibility := TurnOn;
  btnRule4.Visibility := TurnOn;

  if MyMuString.RuleMode = TRuleMode.eRule3 then begin
    lblRule3.Visibility := Visibility.Visible;
    btnRule3.Visibility := Visibility.Visible;
    btnRule3.IsEnabled := TurnOn = Visibility.Visible;
  end else if MyMuString.RuleMode = TRuleMode.eRule4 then begin
    lblRule4.Visibility := Visibility.Visible;
    btnRule4.Visibility := Visibility.Visible;
    btnRule4.IsEnabled := TurnOn = Visibility.Visible;
  end else begin
    btnRule3.IsEnabled := TurnOn = Visibility.Visible;
    btnRule4.IsEnabled := TurnOn = Visibility.Visible;
  end;
end;

method TWindowsDesktop.SetNewWorkingString;
begin
  MyMuString.MuString := lbMuStrs.Items[lbMuStrs.SelectedIndex].ToString;
end;

method TWindowsDesktop.LaunchRule(RuleNum: Integer);
begin
  case RuleNum of
    1: MyMuString.AddU;
    2: MyMuString.DuplicateStr;
    3: StartReplace3IWithU;
    4: StartDeleteUU;
  end;
end;

method TWindowsDesktop.StartReplace3IWithU;
// replace an occurance of III with U
var
  i: Integer;
  s: String;
  WorkStr: String;
begin
  WorkStr := MyMuString.MuString.Substring(1);
  // first, count how many occurances of III exist

  var count := 0;
  for i := 0 to WorkStr.Length - 3 do begin
    s := WorkStr.Substring(i);
    if s.StartsWith('III') then
      inc(count);
  end;

  // if none, put up a message 
  if count = 0 then
    MessageBox.Show('There is no occurance of "III" in the current string.')
  else begin
    // if one, replace it automatically 
    if count = 1 then begin
      MyMuString.Replace3IWithU(WorkStr.IndexOf('III'));
    end else 
      // if more than one, let user select 
      MyMuString.RuleMode := TRuleMode.eRule3;
  end;
end;

method TWindowsDesktop.StartDeleteUU;
// delete an occurance of UU
begin
  var count := MyMuString.GetRuleStrCount(TRuleMode.eRule4);

  // how many - none?  just show a message 
  if count = 0 then
    MessageBox.Show('There is no occurance of ''UU'' in the current string.')
  else begin
    // just 1? then just replace it
    if count = 1 then
      MyMuString.DeleteUU(MyMuString.MuString.IndexOf('UU'))
    else begin
      // it looks like we'll have to let the user select which occurance
      MyMuString.RuleMode := TRuleMode.eRule4 ;
    end;
  end
end;

method TWindowsDesktop.CancelRuleMode;
begin
  MyMuString.RuleMode := TRuleMode.eNoRule;
end;

method TWindowsDesktop.SelectOK;
begin
  if MyMuString.RuleMode = TRuleMode.eRule3 then
    MyMuString.Replace3IWithU(MyMuString.Position)
  else
    MyMuString.DeleteUU(MyMuString.Position);

  MyMuString.RuleMode := TRuleMode.eNoRule;
end;

method TWindowsDesktop.btnRule1_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(1);
end;

method TWindowsDesktop.btnRule2_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(2);
end;

method TWindowsDesktop.btnRule3_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(3);
end;

method TWindowsDesktop.btnRule4_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(4);
end;

method TWindowsDesktop.btnCancel_Click(sender: Object; e: RoutedEventArgs);
begin
  CancelRuleMode;
end;

method TWindowsDesktop.btnOK_Click(sender: Object; e: RoutedEventArgs);
begin
  SelectOK;
end;

method TWindowsDesktop.btnPrev_Click(sender: Object; e: RoutedEventArgs);
begin
  MyMuString.PrevSelector;
end;

method TWindowsDesktop.btnNext_Click(sender: Object; e: RoutedEventArgs);
begin
  MyMuString.NextSelector;
end;

method TWindowsDesktop.lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
begin
  SetNewWorkingString;
end;

method TWindowsDesktop.MuStringChanged(aNewString: String);
begin
  MuStrHistory.Add(aNewString);
end;

method TWindowsDesktop.RuleModeChanged(aNewRuleMode: TRuleMode);
begin
  if aNewRuleMode = TRuleMode.eNoRule then begin
    ActivateSelBtns(System.Windows.Visibility.Collapsed);
    ActivateRuleBtns(System.Windows.Visibility.Visible);     
  end else begin
    ActivateSelBtns(System.Windows.Visibility.Visible);
    ActivateRuleBtns(System.Windows.Visibility.Hidden);
    MyMuString.FirstSelector;
  end;
end;

end.
