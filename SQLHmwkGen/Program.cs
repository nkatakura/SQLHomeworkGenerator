using System;
using System.Collections.Generic;

/*

    FILE:           Program.cs
    DATE:           2021-02-11
    AUTHOR:         Naoki Katakura
    DESCRIPTION:    This program was created to streamline the homework process for my Relational Databases and SQL course.
                    Each homework assignment follows a specific format that I realized could be easily generated using a program to improve
                    efficiency and reduce errors.
                    The program takes a chapter, exercise numbers, and assignment name from the user to automatically generate a template
                    to use for an assignment.

*/

namespace SQLHmwkGen
{
    class Program
    {
        static void Main(string[] args)
        {
            // Variable and Object Declarations

            IOManager iomanager = new IOManager();              // IOManager object for console input/output management
            DataAccessor dataAccessor = new DataAccessor();     // DataAccessor object for writing data to file
            string choice = "";                                 // Stores input taken from user
            string currentChapter = "";                         // Stores the currently selected chapter
            string[] currentExercises = new string[0];          // String array for storing all exercise numbers in an assignment
            string filename = "";                               // Filename to be given to the output file
            bool done = false;                                  // Boolean to change to false in order to exit the program


            while (done == false)                               // Main program loop
            {
                Console.Clear();                                // The following lines displays the currently selected
                Console.WriteLine("Current chapter: "           // chapter, exercises, and file name
                                    + currentChapter);
                Console.Write("Current exercises: ");
                if (currentExercises.Length == 0)
                {
                    Console.Write("none selected");
                }
                else
                {
                    foreach (string i in currentExercises)
                    {
                        Console.Write(i + " ");
                    }
                }
                Console.WriteLine("\nCurrent file name: " + filename);

                iomanager.DisplayMenu();
                choice = iomanager.GetChoice();

                if (choice == "1")                              // The following lines execute code based on the user's input
                {
                    currentChapter = iomanager.SetChapter();
                }
                else if (choice == "2")
                {
                    currentExercises = iomanager.SetExercises();
                }
                else if (choice == "3")
                {
                    filename = iomanager.SetFileName();
                }
                else if (choice == "4")                         // This block of code executes when the user choses to create the
                {                                               // assignment file.  The boolean blocks of code are there to check
                    bool worked = false;                        // whether the user has actually entered a chapter, exercises,
                    while (worked == false)                     // and file name.
                    {
                        if (currentChapter == "")
                        {
                            Console.WriteLine("Error: Please enter a chapter");
                            break;
                        }
                        else if (currentExercises.Length == 0)
                        {
                            Console.WriteLine("Error: Please enter some exercises");
                            break;
                        }
                        else if (filename == "")
                        {
                            Console.WriteLine("Error: Please enter an assignment name");
                            break;
                        }
                        else
                        {
                            try
                            {
                                dataAccessor.writeData(currentChapter, currentExercises, filename);
                                worked = true;
                                Console.WriteLine("File writing done");
                                iomanager.Pause();
                            }
                            catch
                            {
                                Console.WriteLine("Error, something went wrong");
                            }
                            done = true;
                        }
                    }
                }
            }
        }
    }
}
