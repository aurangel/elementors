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
            //Устанавливает источник данных для сетки из возвращенного значения функции
            gridView.BestFitColumns();
            //Регулирует ширину столбцов так, чтобы столбцы соответствовали их содержанию оптимальным образом
        }

        private void dxTemplate_EditValueChanged(object sender, EventArgs e)
        {
            if (dxTemplate.EditValue == null) //Проверяет значение, указывающее, является ли элемент пустым
                dxSearch.Enabled = false; //Запрет на активацию кнопки
            else
                dxSearch.Enabled = true; //Доступ
        }

        private void dxHome_ItemClick(object sender, ItemClickEventArgs e)
        {
            this.Close();
        }

        private void barButtonItem1_ItemClick(object sender, ItemClickEventArgs e)
        {
            string item = dxTemplate.EditValue.ToString();
            //Отредактированное значение в текущем редакторе преобразуется в строку
            ((DevExpress.XtraEditors.Repository.RepositoryItemComboBox)this.dxTemplate.Edit).Items.Add(item);
            //Добавляет новый элемент в текущую коллекцию шаблонов преподавателей
        }

        private void SearchForm_Load(object sender, EventArgs e)
        {
            if (Properties.Settings.Default.cbCollection != null)
                ((DevExpress.XtraEditors.Repository.RepositoryItemComboBox)this.dxTemplate.Edit).Items.AddRange(Properties.Settings.Default.cbCollection.ToArray());
                //Копирование элементов списка в массив коллекции
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
            //Удаляет все объекты из экземпляра класса
        }
    }
}