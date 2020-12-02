# experis
These 2 samples complete the required task of finding the first repeated character in a string.

Solution #1 passes an array to the function "Invoke-ReturnFirstDup".  The function reads the characters in the string, adding them to an arraylist until the a character is found to already exist in the arraylist.  That character is set as the value for the variable "$firstRepeatingChar" and is returned to the function call.
This solution displayed an execution time of 1.39 ms to complete using the "measure-command" cmdlet.

Solution #2 passes the string directly into the function "Invoke-ReturnFirstDup".  That string is converted to an array and the initial values for the indexes are initialized.  A double loop is then processed by reducing the "$lowStringIndex" index by 1 every time a character match is found.  Eventually, the loops complete and the character in the $stringArray at the $lowStringIndex is the first duplicate character in the original string.
This solution displayed an execution time of 1.5 ms to complete using the "measure-command" cmdlet.