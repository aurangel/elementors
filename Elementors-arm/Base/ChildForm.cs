/*

Copyright © 2015 Vlasenko Roman

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful, 
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, see <http://www.gnu.org/licenses>.

    Additional permission under GNU GPL version 3 section 7

    If you modify this Program, or any covered work, by linking or
    combining it with DevExpress (or a modified version of 
    that library), containing parts covered by the terms of Developer Express Inc., 
    the licensors of this Program grant you
    additional permission to convey the resulting work.

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace Elementors_arm
{

    public partial class ChildForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        private string tableName;
        //Строковая переменная для хранения имени таблицы
        public ChildForm(string dtName)
        {
            InitializeComponent();
            this.Load += new EventHandler(ChildForm_Load);
            //Генерация события до первоначального отображения формы
            tableName = dtName;
            //В глобальную переменную вносится имя таблицы
        }

        void ChildForm_Load(object sender, EventArgs e)
        {
            DBOperator dbOperator = DBOperator.Instance;
            gridControl.DataSource = dbOperator.GetTableByName(tableName);
            //Устанавливает источник данных для сетки из возвращенного значения функции
            gridView.BestFitColumns();
            //Регулирует ширину столбцов так, чтобы столбцы соответствовали их содержанию оптимальным образом
        }

        private void gridView_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            if (Data.ValueOfDoc == "Преподаватели")
            { //Проверка условия на таблицу, с которой сейчас взаимодействует пользователь
                if (e.Button == MouseButtons.Right)
                    popupMenu.ShowPopup(Control.MousePosition);
                    //Показывает всплывающее меню в заданной точке экрана
            }

            else return;

            Data.ValueOfPrepod = e.RowHandle + 1;
            //Передача указателя строки сетки в глобальную переменную
        }

        private void barInfoItem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            InfoForm infoForm = new InfoForm();
            infoForm.Show();
            //Отображает форму о конкретном преподавателе для пользователя
        }
    }
}
    