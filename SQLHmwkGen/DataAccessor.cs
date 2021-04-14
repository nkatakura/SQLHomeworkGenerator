using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace SQLHmwkGen
{
    class DataAccessor
    {
        private string appPath = AppContext.BaseDirectory;
        const string dataFolder = "outputFolder\\";
        string fileName = "";

        public DataAccessor()
        {
            string path = appPath + dataFolder;

            try
            {
                if (Directory.Exists(path) == false)
                {
                    Directory.CreateDirectory(path);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("There was a problem creating the output folder." + 
                    "\n\n" + ex.Message);
            }
        }

        public void writeData(string chapter, string[] exercises, string filename)
        {
            DateTime date = DateTime.Today;
            string todaysDate = date.ToString("yyyy-MM-dd");
            todaysDate = todaysDate.Substring(0, 10);
            
            if (chapter.Length == 1)
            {
                chapter = "0" + chapter;
            }

            string spNameHeader = "sp_Chapter_" + chapter + "_Exercise_";

            try
            {
                StreamWriter fileWriter = new StreamWriter(appPath + dataFolder + filename);

                fileWriter.WriteLine("/* **************************************************************************** \n" +
                                     "\tFILE:\t" + filename + "\n" + 
                                     "\tAUTHOR:\tNaoki Katakura\n" +
                                     "\tDESCRIPTION:\n" +
                                     "\t\t*** ENTER DESCRIPTION HERE *** (Copy/paste assignment description from talon)\n" +
                                     "**************************************************************************** */\n");
                fileWriter.WriteLine("USE ap;\n");

                foreach (string s in exercises)
                {
                    string exercise = s;
                    if (s.Length == 1)
                    {
                        exercise = "0" + exercise;
                    }

                    fileWriter.WriteLine("/* **************************************************************************** \n" +
                                         "\tExercise" + exercise + ":" +
                                         "\n\t\t*** ENTER EXERCISE DESCRIPTION HERE*** (copy from textbook)" +
                                         "\n**************************************************************************** */\n");
                    fileWriter.WriteLine("DELIMITER $$\n" +
                                         "DROP PROCEDURE IF EXISTS " + spNameHeader + exercise + "$$\n" +
                                         "CREATE PROCEDURE " + spNameHeader + exercise + "()\n" +
                                         "COMMENT '*** CHANGE THIS ***'\n" +
                                         "BEGIN\n" +
                                         "\t/*\n" +
                                         "\t\tCopyright statement\n" +
                                         "\t\tAuthor: Naoki Katakura\n" +
                                         "\t\tFile: " + filename + "\n" +
                                         "\t\tDESCRIPTION:\n" +
                                         "\t\t\t*** CHANGE THIS TO DESCRIBE THE EXERCISE ***\n" +
                                         "\n" +
                                         "\t\tModification History\n" +
                                         "\t\t" + todaysDate + "\tNaoki Katakura\t\tInitial Creation\n" +
                                         "\t*/\n" +
                                         "\n" +
                                         "\t -- ENTER CODE HERE\n\n" +
                                         "END$$\n" +
                                         "DELIMITER ;\n\n" +
                                         "CALL " + spNameHeader + exercise + "();\n\n");
                }

                fileWriter.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: Something went wrong" + ex.Message);
            }
        }
    }
}
