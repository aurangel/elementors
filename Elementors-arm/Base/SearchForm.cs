using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.Data;
using System.Linq;
using DevExpress.XtraBars;

namespace Elementors_arm
{
    public partial class SearchForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public SearchForm()
        {
            InitializeComponent();
        }

        private string connectionString; /* Переменная для строки подключения */

        private void dxSearch_ItemClick(object sender, ItemClickEventArgs e)
        {
            Data.ValueOfSearch = dxTemplate.EditValue.ToString();
            DBOperator dbOperator = DBOperator.Instance;

            gridControl.DataSource = dbOperator.Search();
            gridView.BestFitColumns(); /* Оптимизированная ширина колонок */
        }

        private void dxReset_ItemClick(object sender, ItemClickEventArgs e)
        {
            dxTemplate.EditValue = "";
            gridControl.DataSource = null;
        }

        private void dxTemplate_EditValueChanged(object sender, EventArgs e)
        {
            if (dxTemplate.EditValue == null) /* Проверка доступности */
                dxSearch.Enabled = false;
            else
                dxSearch.Enabled = true;
        }

        private void dxHome_ItemClick(object sender, ItemClickEventArgs e)
        {
            this.Close();
        }
    }
}