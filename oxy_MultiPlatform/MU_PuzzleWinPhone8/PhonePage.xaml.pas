namespace MU_PuzzleWinPhone8;

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
  MU_PuzzleWinPhone8.Resources,
  MU_PuzzlePhoneClass;

type
  PhonePage = public partial class(PhoneApplicationPage)
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
    // Constructor
    constructor ;

  private
    //frandom : Random := new Random();
    // Sample code for building a localized ApplicationBar
    method BuildLocalizedApplicationBar;
  end;


implementation

constructor PhonePage;
begin
  InitializeComponent;

  // Sample code to localize the ApplicationBar
  BuildLocalizedApplicationBar();

  MyMuString := new TMuString;
  MyMuString.OnSetMuString += MuStringChanged;  
  MyMuString.OnRuleModeChanged += RuleModeChanged;

  self.DataContext := MyMuString;

  MuStrHistory := new System.Collections.ObjectModel.ObservableCollection<String>;
  lbMuStrs.ItemsSource := MuStrHistory;
end;

method PhonePage.BuildLocalizedApplicationBar;
begin
  // Set the page's ApplicationBar to a new instance of ApplicationBar.
  ApplicationBar := new ApplicationBar();

  // Create a new button and set the text value to the localized string from AppResources.
  var appBarButton: ApplicationBarIconButton := new ApplicationBarIconButton(new Uri('/Assets/AppBar/appbar.add.rest.png', UriKind.Relative));
  appBarButton.Text := AppResources.AppBarButtonText;
  ApplicationBar.Buttons.Add(appBarButton);
  ApplicationBar.IsVisible := False;

  // Create a new menu item with the localized string from AppResources.
  //var appBarMenuItem: ApplicationBarMenuItem := new ApplicationBarMenuItem(AppResources.AppBarMenuItemText);
  //ApplicationBar.MenuItems.Add(appBarMenuItem)
end;

method PhonePage.ActivateSelBtns(TurnOn: Visibility);
begin
  SelectGrid.Visibility := TurnOn;

  if (TurnOn = System.Windows.Visibility.Visible) then 
    lblSelect.Text := "Select: " + MyMuString.GetRuleStr(MyMuString.RuleMode);
end;

method PhonePage.ActivateRuleBtns(TurnOn: Visibility);
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

method PhonePage.SetNewWorkingString;
begin
  MyMuString.MuString := lbMuStrs.Items[lbMuStrs.SelectedIndex].ToString;
end;

method PhonePage.LaunchRule(RuleNum: Integer);
begin
  case RuleNum of
    1: MyMuString.AddU;
    2: MyMuString.DuplicateStr;
    3: StartReplace3IWithU;
    4: StartDeleteUU;
  end;
end;

method PhonePage.StartReplace3IWithU;
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

method PhonePage.StartDeleteUU;
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

method PhonePage.CancelRuleMode;
begin
  MyMuString.RuleMode := TRuleMode.eNoRule;
end;

method PhonePage.SelectOK;
begin
  if MyMuString.RuleMode = TRuleMode.eRule3 then
    MyMuString.Replace3IWithU(MyMuString.Position)
  else
    MyMuString.DeleteUU(MyMuString.Position);

  MyMuString.RuleMode := TRuleMode.eNoRule;
end;

method PhonePage.btnRule1_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(1);
end;

method PhonePage.btnRule2_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(2);
end;

method PhonePage.btnRule3_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(3);
end;

method PhonePage.btnRule4_Click(sender: Object; e: RoutedEventArgs);
begin
  LaunchRule(4);
end;

method PhonePage.btnCancel_Click(sender: Object; e: RoutedEventArgs);
begin
  CancelRuleMode;
end;

method PhonePage.btnOK_Click(sender: Object; e: RoutedEventArgs);
begin
  SelectOK;
end;

method PhonePage.btnPrev_Click(sender: Object; e: RoutedEventArgs);
begin
  MyMuString.PrevSelector;
end;

method PhonePage.btnNext_Click(sender: Object; e: RoutedEventArgs);
begin
  MyMuString.NextSelector;
end;

method PhonePage.lbMuStrs_MouseDoubleClick(sender: Object; e: System.Windows.Input.MouseButtonEventArgs);
begin
  SetNewWorkingString;
end;

method PhonePage.MuStringChanged(aNewString: String);
begin
  MuStrHistory.Add(aNewString);
end;

method PhonePage.RuleModeChanged(aNewRuleMode: TRuleMode);
begin
  if aNewRuleMode = TRuleMode.eNoRule then begin
    ActivateSelBtns(System.Windows.Visibility.Collapsed);
    ActivateRuleBtns(System.Windows.Visibility.Visible);     
  end else begin
    ActivateSelBtns(System.Windows.Visibility.Visible);
    ActivateRuleBtns(System.Windows.Visibility.Collapsed);
    MyMuString.FirstSelector;
  end;
end;

end.