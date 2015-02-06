using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Windows.Forms;
using DevExpress.XtraBars;

namespace Elementors_arm.Base
{
    public partial class AboutForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public AboutForm()
        {
            InitializeComponent();
        }

        private void pictureEdit2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}