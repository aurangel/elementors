using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Windows.Forms;
using DevExpress.UserSkins;
using DevExpress.Skins;
using DevExpress.LookAndFeel;

namespace Elementors_arm
{
    static class Data
    {
        public static string ValueOfDoc { get; set; }
        public static int ValueOfPrepod { get; set; }
        public static string ValueOfReport { get; set; }
        public static string ValueOfSearch { get; set; }
    }

    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            DevExpress.UserSkins.BonusSkins.Register();
            DevExpress.Skins.SkinManager.EnableFormSkins();
            DevExpress.Skins.SkinManager.EnableMdiFormSkins();
            DevExpress.LookAndFeel.UserLookAndFeel.Default.SetSkinStyle("Visual Studio 2013 Dark");

            Application.Run(new Base.Login());
        }

    }
}
