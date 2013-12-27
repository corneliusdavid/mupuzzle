namespace MU_PuzzleWin8;

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
  Windows.UI.Xaml.Navigation,
  MU_PuzzleClasses;

// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

/// <summary>
/// An empty page that can be used on its own or navigated to within a Frame.
/// </summary>
type
  TWidthConverter = public class(IValueConverter)
  public
    method Convert(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
    method ConvertBack(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
  end;

  THeightConverter = public class(IValueConverter)
  public
    method Convert(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
    method ConvertBack(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
  end;


  TWin8Page = partial class(Page)
  private
    MyMuString: TMuString;
    MuStrHistory: System.Collections.ObjectModel.ObservableCollection<String>;
    method ActivateSelBtns(const TurnOn: Windows.UI.Xaml.Visibility);
    method ActivateRuleBtns(const TurnOn: Windows.UI.Xaml.Visibility);
    method SetNewWorkingString;
    method LaunchRule(const RuleNum: Integer);
    method StartReplace3IWithU;
    method StartDeleteUU;
    method CancelRuleMode;
    method SelectOK;
    method btnRule1_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnRule2_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnRule3_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnRule4_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnCancel_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnOK_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnPrev_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
    method btnNext_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
   // method lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
    method MuStringChanged(const aNewString: String);
    method RuleModeChanged(const aNewRuleMode: TRuleMode);
  public
    constructor;

  /// <summary>
  /// Invoked when this page is about to be displayed in a Frame.
  /// </summary>
  /// <param name="e">Event data that describes how this page was reached.  The Parameter
  /// property is typically used to configure the page.</param>
  protected
    method OnNavigatedTo(e: NavigationEventArgs); override;
  end;

implementation


{--- TWidthConverter---}

method TWidthConverter.Convert(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
begin
  Result := 'Width: ' + String(value);
end;

method TWidthConverter.ConvertBack(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
begin
  // not used
end;

{--- THeightConverter---}

method THeightConverter.Convert(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
begin
  Result := 'Height: ' + String(value);
end;

method THeightConverter.ConvertBack(value: System.Object; targetType: System.Type; parameter: System.Object; language: System.String): System.Object; 
begin
  // not used
end;

{--- TWin8Page ---}

constructor TWin8Page;
begin
  InitializeComponent();

  MyMuString := new TMuString;
  MyMuString.OnSetMuString += MuStringChanged;  
  MyMuString.OnRuleModeChanged += RuleModeChanged;

  self.DataContext := MyMuString;

  MuStrHistory := new System.Collections.ObjectModel.ObservableCollection<String>;
  lbMuStrs.ItemsSource := MuStrHistory;
end;

method TWin8Page.ActivateSelBtns(const TurnOn: Windows.UI.Xaml.Visibility);
begin
  SelectGrid.Visibility := TurnOn;

  if (TurnOn = Windows.UI.Xaml.Visibility.Visible) then 
    lblSelect.Text := "Select: " + MyMuString.GetRuleStr(MyMuString.RuleMode);
end;

method TWin8Page.ActivateRuleBtns(const TurnOn: Windows.UI.Xaml.Visibility);
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

method TWin8Page.SetNewWorkingString;
begin
//  MyMuString.MuString := lbMuStrs.Items[lbMuStrs.SelectedIndex].ToString;
end;

method TWin8Page.LaunchRule(RuleNum: Integer);
begin
  case RuleNum of
    1: MyMuString.AddU;
    2: MyMuString.DuplicateStr;
    3: StartReplace3IWithU;
    4: StartDeleteUU;
  end;
end;

method TWin8Page.StartReplace3IWithU;
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
  if count = 0 then begin
    var msg := Windows.UI.Popups.MessageDialog.Create('There is no occurance of "III" in the current string.');
    msg.ShowAsync;
  end else begin
    // if one, replace it automatically 
    if count = 1 then begin
      MyMuString.Replace3IWithU(WorkStr.IndexOf('III'));
    end else 
      // if more than one, let user select 
      MyMuString.RuleMode := TRuleMode.eRule3;
  end;
end;

method TWin8Page.StartDeleteUU;
// delete an occurance of UU
begin
  var count := MyMuString.GetRuleStrCount(TRuleMode.eRule4);

  // how many - none?  just show a message 
  if count = 0 then begin
    var msg := Windows.UI.Popups.MessageDialog.Create('There is no occurance of ''UU'' in the current string.');
    msg.ShowAsync;
  end else begin
    // just 1? then just replace it
    if count = 1 then
      MyMuString.DeleteUU(MyMuString.MuString.IndexOf('UU'))
    else begin
      // it looks like we'll have to let the user select which occurance
      MyMuString.RuleMode := TRuleMode.eRule4 ;
    end;
  end
end;

method TWin8Page.CancelRuleMode;
begin
  MyMuString.RuleMode := TRuleMode.eNoRule;
end;

method TWin8Page.SelectOK;
begin
  if MyMuString.RuleMode = TRuleMode.eRule3 then
    MyMuString.Replace3IWithU(MyMuString.Position)
  else
    MyMuString.DeleteUU(MyMuString.Position);

  MyMuString.RuleMode := TRuleMode.eNoRule;
end;

method TWin8Page.btnRule1_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(1);
end;

method TWin8Page.btnRule2_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(2);
end;

method TWin8Page.btnRule3_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(3);
end;

method TWin8Page.btnRule4_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  LaunchRule(4);
end;

method TWin8Page.btnCancel_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  CancelRuleMode;
end;

method TWin8Page.btnOK_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  SelectOK;
end;

method TWin8Page.btnPrev_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  MyMuString.PrevSelector;
end;

method TWin8Page.btnNext_Click(sender: Object; e: Windows.UI.Xaml.RoutedEventArgs);
begin
  MyMuString.NextSelector;
end;

{
method TWin8Page.lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
begin
  SetNewWorkingString;
end;
}

method TWin8Page.MuStringChanged(aNewString: String);
begin
  MuStrHistory.Add(aNewString);
end;

method TWin8Page.RuleModeChanged(aNewRuleMode: TRuleMode);
begin
  if aNewRuleMode = TRuleMode.eNoRule then begin
    ActivateSelBtns(Visibility.Collapsed);
    ActivateRuleBtns(Visibility.Visible);
  end else begin
    ActivateSelBtns(Windows.UI.Xaml.Visibility.Visible);
    ActivateRuleBtns(Windows.UI.Xaml.Visibility.Collapsed);
    MyMuString.FirstSelector;
  end;
end;

method TWin8Page.OnNavigatedTo(e: NavigationEventArgs);
begin

end;

end.
