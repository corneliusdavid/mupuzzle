using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MU_Puzzle_WinForm
{
    public partial class frmMUPuzzle : Form
    {
        enum RuleModes { None, Rule3, Rule4 };
        RuleModes RuleMode = RuleModes.None;
        int SelectorPos = -1;
        string WorkStr = "I";

        public frmMUPuzzle()
        {
            InitializeComponent();
            UpdateMuStr();
        }

        private void UpdateMuStr()
        {
            if (RuleMode == RuleModes.None)
                MuStr.Text = "M" + WorkStr;
            else if (RuleMode == RuleModes.Rule3 || RuleMode == RuleModes.Rule4)
                if (SelectorPos == -1)
                    MuStr.Text = "M" + WorkStr;
                else
                    MuStr.Text = "M" + WorkStr.Substring(0, SelectorPos) + ">" +
                                       WorkStr.Substring(SelectorPos);

            if(RuleMode == RuleModes.None && (lbMuStrs.Items.Count == 0 || string.Compare(MuStr.Text, lbMuStrs.Items[lbMuStrs.Items.Count-1].ToString()) != 0))
                lbMuStrs.Items.Add(MuStr.Text);
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
                    ActivateSelectButtons(true);
                    ActivateRuleButtons(false);
                    SelectorPos = -1;
                    NextSelector();
                }
                UpdateMuStr();
            }
        }

        private void StartDeleteUU()
        {
            MessageBox.Show("rule 4 not yet finished");
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
                MuStr.Text = lbMuStrs.Items[lbMuStrs.SelectedIndex].ToString();
                WorkStr = MuStr.Text.Substring(1);
            }
        }

        private void ActivateSelectButtons(bool TurnOn)
        {
            btnPrev.Visible = TurnOn;
            btnOK.Visible = TurnOn;
            btnCancel.Visible = TurnOn;
            btnNext.Visible = TurnOn;

            lblSelect.Visible = TurnOn;
            if (TurnOn)
                lblSelect.Text = "Select: " + (RuleMode == RuleModes.Rule3 ? "III" : "UU");
        }

        private void ActivateRuleButtons(bool TurnOn)
        {
            btnRule1.Visible = TurnOn;
            lblRule1.Visible = TurnOn;
            btnRule2.Visible = TurnOn;
            lblRule2.Visible = TurnOn;

            if (RuleMode == RuleModes.Rule3)
            {
                btnRule3.Enabled = TurnOn;
                lblRule4.Visible = TurnOn;
                btnRule4.Visible = TurnOn;
            }
            else if (RuleMode == RuleModes.Rule4)
            {
                btnRule4.Enabled = TurnOn;
                lblRule3.Visible = TurnOn;
                btnRule3.Visible = TurnOn;
            }
            else
            {
                lblRule3.Visible = TurnOn;
                btnRule3.Visible = TurnOn;
                btnRule3.Enabled = TurnOn;
                lblRule4.Visible = TurnOn;
                btnRule4.Visible = TurnOn;
                btnRule4.Enabled = TurnOn;
            }
        }

        private void CancelRuleMode()
        {
            RuleMode = RuleModes.None;
            ActivateSelectButtons(false);
            ActivateRuleButtons(true);
            UpdateMuStr();
        }

        private void SelectOK()
        {
            if (RuleMode == RuleModes.Rule3)
                Replace3IWithU(SelectorPos);
            else

                WorkStr.Remove(SelectorPos, 2);

            CancelRuleMode();
        }

        private void btnPrev_Click(object sender, EventArgs e)
        {
            SelectPrevious();
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            SelectNext();
        }

        private void btnRule1_Click(object sender, EventArgs e)
        {
            LaunchRule(1);
        }

        private void btnRule2_Click(object sender, EventArgs e)
        {
            LaunchRule(2);
        }

        private void btnRule3_Click(object sender, EventArgs e)
        {
            LaunchRule(3);
        }

        private void btnRule4_Click(object sender, EventArgs e)
        {
            LaunchRule(4);
        }

        private void lbMuStrs_DoubleClick(object sender, EventArgs e)
        {
            SetNewWorkString();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            CancelRuleMode();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            SelectOK();
        }
    }
}
