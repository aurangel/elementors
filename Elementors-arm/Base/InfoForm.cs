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
            //Устанавливает источник данных для сетки из возвращенного значения функции
            gridView.BestFitColumns();
            //Регулирует ширину столбцов так, чтобы столбцы соответствовали их содержанию оптимальным образом
        }

    }
}