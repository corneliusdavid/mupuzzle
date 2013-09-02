using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MU_Puzzle_WPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        enum RuleModes { None, Rule3, Rule4 };
        RuleModes RuleMode = RuleModes.None;
        int SelectorPos = -1;
        string WorkStr = "I";

        public MainWindow()
        {
            InitializeComponent();
        }

        private void UpdateMuStr()
        {
            if (RuleMode == RuleModes.None)
                lblMuStr.Content = "M" + WorkStr;
            else if (RuleMode == RuleModes.Rule3 || RuleMode == RuleModes.Rule4)
                if (SelectorPos == -1)
                    lblMuStr.Content = "M" + WorkStr;
                else
                    lblMuStr.Content = "M" + WorkStr.Substring(0, SelectorPos) + ">" +
                                       WorkStr.Substring(SelectorPos);

            if (RuleMode == RuleModes.None && (lbMuStrs.Items.Count == 0 || string.Compare(lblMuStr.Content.ToString(), lbMuStrs.Items[lbMuStrs.Items.Count - 1].ToString()) != 0))
                lbMuStrs.Items.Add(lblMuStr.Content);
        }

        private void ActivateSelectButtons(System.Windows.Visibility TurnOn)
        {
            btnPrev.Visibility = TurnOn;
            btnOK.Visibility = TurnOn;
            btnCancel.Visibility = TurnOn;
            btnNext.Visibility = TurnOn;

            lblSelect.Visibility = TurnOn;
            if (TurnOn == System.Windows.Visibility.Visible)
                lblSelect.Content = "Select: " + (RuleMode == RuleModes.Rule3 ? "III" : "UU");
        }

        private void ActivateRuleButtons(System.Windows.Visibility TurnOn)
        {
            btnRule1.Visibility = TurnOn;
            lblRule1.Visibility = TurnOn;
            btnRule2.Visibility = TurnOn;
            lblRule2.Visibility = TurnOn;

            if (RuleMode == RuleModes.Rule3)
            {
                btnRule3.IsEnabled = TurnOn == System.Windows.Visibility.Visible;
                lblRule4.Visibility = TurnOn;
                btnRule4.Visibility = TurnOn;
            }
            else if (RuleMode == RuleModes.Rule4)
            {
                btnRule4.IsEnabled = TurnOn == System.Windows.Visibility.Visible;
                lblRule3.Visibility = TurnOn;
                btnRule3.Visibility = TurnOn;
            }
            else
            {
                lblRule3.Visibility = TurnOn;
                btnRule3.Visibility = TurnOn;
                btnRule3.IsEnabled = TurnOn == System.Windows.Visibility.Visible;
                lblRule4.Visibility = TurnOn;
                btnRule4.Visibility = TurnOn;
                btnRule4.IsEnabled = TurnOn == System.Windows.Visibility.Visible;
            }
        }

        private void CancelRuleMode()
        {
            RuleMode = RuleModes.None;
            ActivateSelectButtons(System.Windows.Visibility.Hidden);
            ActivateRuleButtons(System.Windows.Visibility.Visible);
            UpdateMuStr();
        }

        private void SelectOK()
        {
            if (RuleMode == RuleModes.Rule3)
                Replace3IWithU(SelectorPos);
            else
                DeleteUU(SelectorPos);

            CancelRuleMode();
        }

        private void NextSelector()
        {
            string RuleModeStr = (RuleMode == RuleModes.Rule3 ? "III" : "UU");
            int NewSelectorPos = WorkStr.IndexOf(RuleModeStr, SelectorPos + 1);

            if (NewSelectorPos > -1)
                SelectorPos = NewSelectorPos;
        }

        private void PreviousSelector()
        {
            string RuleModeStr = (RuleMode == RuleModes.Rule3 ? "III" : "UU");

            int NewSelectorPos = SelectorPos - 1;

            while (NewSelectorPos > -1)
            {
                if (WorkStr.Substring(NewSelectorPos).StartsWith(RuleModeStr))
                {
                    SelectorPos = NewSelectorPos;
                    break;
                }
                else
                    NewSelectorPos--;
            }
        }

        private void SelectPrevious()
        {
            PreviousSelector();
            UpdateMuStr();
        }

        private void SelectNext()
        {
            NextSelector();
            UpdateMuStr();
        }

        private void DuplicateStr()
        {
            // add the whole string to the end of itself
            WorkStr += WorkStr;
            UpdateMuStr();
        }

        private void AddU()
        {
            // if the last character is "I", add a "U"
            if (WorkStr.EndsWith("I"))
                WorkStr += "U";
            UpdateMuStr();
        }

        private void Replace3IWithU(int StartPos)
        {
            WorkStr = WorkStr.Substring(0, StartPos) + "U" + WorkStr.Substring(StartPos + 3);
        }

        private void StartReplace3IWithU()
        {
            // replace an occurance of III with U

            int count = 0;

            // first, count how many occurances of III exist
            for (int i = 0; WorkStr.Substring(i).Length >= 3; i++)
                if (WorkStr.Substring(i).StartsWith("III"))
                    count++;

            // none?  just show a message 
            if (count == 0)
                MessageBox.Show("There is no occurance of 'III' in the current string.");
            else
            {
                // just 1? then just replace it
                if (count == 1)
                    Replace3IWithU(WorkStr.IndexOf("III"));
                else
                {
                    // it looks like we'll have to let the user select which occurance
                    RuleMode = RuleModes.Rule3;
                    ActivateSelectButtons(System.Windows.Visibility.Visible);
                    ActivateRuleButtons(System.Windows.Visibility.Hidden);
                    SelectorPos = -1;
                    NextSelector();
                }
                UpdateMuStr();
            }
        }

        private void DeleteUU(int StartPos)
        {
            WorkStr = WorkStr.Remove(StartPos, 2);
        }

        private void StartDeleteUU()
        {
            // delete an occurance of UU

            int count = 0;

            // first, count how many occurances of UU exist
            for (int i = 0; WorkStr.Substring(i).Length >= 2; i++)
                if (WorkStr.Substring(i).StartsWith("UU"))
                    count++;

            // none?  just show a message 
            if (count == 0)
                MessageBox.Show("There is no occurance of 'UU' in the current string.");
            else
            {
                // just 1? then just replace it
                if (count == 1)
                    DeleteUU(WorkStr.IndexOf("UU"));
                else
                {
                    // it looks like we'll have to let the user select which occurance
                    RuleMode = RuleModes.Rule4;
                    ActivateSelectButtons(System.Windows.Visibility.Visible);
                    ActivateRuleButtons(System.Windows.Visibility.Hidden);
                    SelectorPos = -1;
                    NextSelector();
                }
                UpdateMuStr();
            }
        }

        private void LaunchRule(int RuleNum)
        {
            switch (RuleNum)
            {
                case 1:
                    AddU();
                    break;
                case 2:
                    DuplicateStr();
                    break;
                case 3:
                    StartReplace3IWithU();
                    break;
                case 4:
                    StartDeleteUU();
                    break;
                default:
                    throw new Exception(string.Format("RuleNum ({0}) out of range in LaunchRule", RuleNum));
            }
        }

        private void SetNewWorkString()
        {
            if (RuleMode == RuleModes.None)
            {
                lblMuStr.Content = lbMuStrs.Items[lbMuStrs.SelectedIndex].ToString();
                WorkStr = lblMuStr.Content.ToString().Substring(1);
            }
        }

        private void btnRule1_Click(object sender, RoutedEventArgs e)
        {
            LaunchRule(1);
        }

        private void btnRule2_Click(object sender, RoutedEventArgs e)
        {
            LaunchRule(2);
        }

        private void btnRule3_Click(object sender, RoutedEventArgs e)
        {
            LaunchRule(3);
        }

        private void btnRule4_Click(object sender, RoutedEventArgs e)
        {
            LaunchRule(4);
        }

        private void btnPrev_Click(object sender, RoutedEventArgs e)
        {
            SelectPrevious();
        }

        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            SelectNext();
        }

        private void btnOK_Click(object sender, RoutedEventArgs e)
        {
            SelectOK();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            CancelRuleMode();
        }

        private void lbMuStrs_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            SetNewWorkString();
        }
    }
}
