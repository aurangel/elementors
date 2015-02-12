using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Windows.Forms;
using DevExpress.XtraBars;

namespace Elementors_arm
{
    public partial class InfoForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public InfoForm()
        {
            InitializeComponent();
        }

        private void InfoForm_Load(object sender, EventArgs e)
        {
            DBOperator dbOperator = DBOperator.Instance;
            gridControl.DataSource = dbOperator.Information();
            gridView.BestFitColumns(); /* Оптимизированная ширина колонок */
        }

    }
}