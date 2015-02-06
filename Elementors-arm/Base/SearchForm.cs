using System;
using System.Collections.Generic;
using System.Collections;
using DevExpress.XtraBars;

namespace Elementors_arm
{
    public partial class SearchForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public SearchForm()
        {
            InitializeComponent();
        }

        private void dxSearch_ItemClick(object sender, ItemClickEventArgs e)
        {
            Data.ValueOfSearch = dxTemplate.EditValue.ToString();
            DBOperator dbOperator = DBOperator.Instance;

            gridControl.DataSource = dbOperator.Search();
            gridView.BestFitColumns(); /* Оптимизированная ширина колонок */
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

        private void barButtonItem1_ItemClick(object sender, ItemClickEventArgs e)
        {
            string item = dxTemplate.EditValue.ToString();
            ((DevExpress.XtraEditors.Repository.RepositoryItemComboBox)this.dxTemplate.Edit).Items.Add(item);
        }

        private void SearchForm_Load(object sender, EventArgs e)
        {
            if (Properties.Settings.Default.cbCollection != null)
                ((DevExpress.XtraEditors.Repository.RepositoryItemComboBox)this.dxTemplate.Edit).Items.AddRange(Properties.Settings.Default.cbCollection.ToArray());
        }

        private void SearchForm_FormClosing(object sender, System.Windows.Forms.FormClosingEventArgs e)
        {
            ArrayList arraylist = new ArrayList(((DevExpress.XtraEditors.Repository.RepositoryItemComboBox)this.dxTemplate.Edit).Items);
            Properties.Settings.Default.cbCollection = arraylist;
            Properties.Settings.Default.Save();
        }

        private void barButtonItem2_ItemClick(object sender, ItemClickEventArgs e)
        {
            ((DevExpress.XtraEditors.Repository.RepositoryItemComboBox)this.dxTemplate.Edit).Items.Clear();
        }
    }
}