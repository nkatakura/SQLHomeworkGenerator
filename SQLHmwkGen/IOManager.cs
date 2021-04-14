using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*

    FILE:           IOManager.cs
    DATE:           2021-02-11
    AUTHOR:         Naoki Katakura
    DESCRIPTION:    This class manages the console inputs and outputs for the SQLHmwkGen program.

*/

namespace SQLHmwkGen
{
    class IOManager
    {

        // Method Name: DisplayMenu()
        // Description: This method displays the main menu for the program.
        // Arguments:   None
        // Returns:     Nothing

        public void DisplayMenu()
        {
            Console.WriteLine("\n1. Set/Change Chapter");
            Console.WriteLine("2. Set/Change excersise numbers");
            Console.WriteLine("3. Set/Change assignment name");
            Console.WriteLine("4. Create file and auto-exit");
        }

        // Method Name: GetChoice()
        // Description: This method takes, validates, and returns an input from the user
        //              It is written specifically for the main menu method written above.
        // Arguments:   None
        // Returns:     string choice - the menu choice the user input (1 through 4)

        public string GetChoice()
        {
            string choice = "";

            while (choice != "1" && choice != "2" && choice != "3" && choice != "4")
            {
                Console.Write("\n\nPlease enter a selection: ");
                choice = Console.ReadLine();
                if (choice != "1" && choice != "2" && choice != "3" && choice != "4")
                {
                    Console.WriteLine("Error: please enter a valid selection");
                }
            }

            return choice;
        }

        // Method Name: SetChapter()
        // Description: Gets a chapter number from the user and returns it
        //              Non-numerical inputs are not valid
        // Arguments:   None
        // Returns:     string choice - the chapter number the user input.

        public string SetChapter()
        {
            int i = 0;
            bool valid = false;
            string chapter = "";

            while (valid == false)
            {
                Console.Write("Enter chapter: ");
                chapter = Console.ReadLine();
                chapter.Trim();
                if (!int.TryParse(chapter, out i))
                {
                    Console.WriteLine("Error: Please enter a number.");
                }
                else
                {
                    valid = true;
                }
            }
            return chapter;
        }

        // Method Name: SetExercises()
        // Description: This method, based on an input from the user, creates a string array
        //              consisting of the exercise numbers on an assignment.
        //              The user must input consecutive numbers deliminated by a single comma (,)
        //              with NO spaces.
        //              Inputs with spaces will be invalid.
        // Arguments:   None
        // Returns:     string[] exercises - array containing exercises

        public string[] SetExercises()
        {
            bool valid = false;
            string input = "";
            char[] separators = { ',' };
            while (valid == false)
            {
                Console.WriteLine("Enter exercise numbers separated by a comma (NO SPACES): ");
                input = Console.ReadLine();
                if (input.Contains(' '))
                {
                    Console.WriteLine("Error: Do not enter any spaces");
                }
                else if (!input.Contains(' '))
                {
                    valid = true;
                }
            }
            string[] exercises = input.Split(separators);
            return exercises;
        }

        // Method Name: SetFileName()
        // Description: 
        // Arguments:   
        // Returns:     

        public string SetFileName()
        {
            bool valid = false;
            string filename = "";

            while (valid == false)
            {
                Console.WriteLine("Enter assignment name.  Be sure to use underscore format (Like_This.sql).  Don't forget the file extension: ");
                filename = Console.ReadLine();
                filename.Trim();
                if (!filename.Contains(".sql"))
                {
                    Console.WriteLine("Error: Invalid file extension.  Please use \".sql\" ");
                }
                else
                {
                    valid = true;
                }
            }
            return filename;
        }

        public void Pause()
        {
            Console.WriteLine("Press a key to continue...");
            Console.ReadLine();
        }
    }
}
