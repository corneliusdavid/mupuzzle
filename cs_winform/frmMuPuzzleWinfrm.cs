using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MU_Puzzle_WinForm
{
    public partial class frmMUPuzzle : Form
    {
        const int NoRule = 0;
        const int Rule3 = 1;
        const int Rule4 = 2;
        int RuleMode = NoRule;
        int SelectorPos = 0;
        string WorkStr = "I";

        private void UpdateMuStr()
        {
            if (RuleMode == NoRule)
                MuStr.Text = "M" + WorkStr;
            else
                MuStr.Text = "M" + WorkStr.Substring(0, SelectorPos - 1) + ">" +
                                   WorkStr.Substring(SelectorPos);

            lbMuStrs.Items.Add(MuStr.Text);
        }

        public frmMUPuzzle()
        {
            InitializeComponent();
            UpdateMuStr();
        }

        private void btnPrev_Click(object sender, EventArgs e)
        {
            string RuleStr = "";
            int NewSelectorPos = -1;

            if (RuleMode == Rule3)
                RuleStr = "III";
            else if (RuleMode == Rule4)
                RuleStr = "MU";
            
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            string RuleStr = "";
            int NewSelectorPos = -1;

            if (RuleMode == Rule3)
                RuleStr = "III";
            else if (RuleMode == Rule4)
                RuleStr = "MU";

            NewSelectorPos = MuStr.Text.Substring(SelectorPos + 1).IndexOf(RuleStr);
            if (NewSelectorPos >= 0)
                SelectorPos += NewSelectorPos;
        }

        private void btnRule1_Click(object sender, EventArgs e)
        {
            // if the last character is "I", add a "U"
            if(WorkStr.EndsWith("I"))
                WorkStr += "U";
            UpdateMuStr();
        }

        private void btnRule2_Click(object sender, EventArgs e)
        {
            // add the whole string to the end of itself
            WorkStr += WorkStr;
            UpdateMuStr();
        }

        private void btnRule3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("rule 3 not yet finished");
        }

        private void btnRule4_Click(object sender, EventArgs e)
        {
            MessageBox.Show("rule 4 not yet finished");
        }
    }
}
