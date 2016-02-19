Code Dojo 10
============
This is my worked example from the 10th meeting of the London Code Dojo in Aug 2012. Feel free to play around with it. You can run the code (assuming you have node and coffeescript installed) with:

    jasmine-node --coffee --verbose test-*

I set up a watchr file (kata.watchr) so that the tests are run automatically every time you save a file in your editor, simply run watchr (if you have it installed) with:

    watchr kata.watchr

The source of the kata is the Noughts and Crosses Kata. The rules of Noughts and Crosses (or Tic-Tac-Toe as it is known in the USA) are as follows:

*  The game is played on a 3x3 grid
*  There are two players
*  The two players take turns to place their mark in one empty square on the grid
*  One player marks their squares on the grid with a 'X' (Cross)
*  The second player marks their squares on the grid with a '0' (Nought)
*  The 'X' (Crosses) player goes first
*  The goal is to be the first player to get three of their marked squares in a row
*  The game ends when one player gets three in a row, or when all spaces are used up
*  If all the spaces are used up and there is no winner, then the game is declared a draw

Noughts and Crosses has been around a very long time, there was a version played in ancient Rome from around the first century BC called 'Terni Lapilli' and the game's grid markings have been found scrawled all across ancient Rome's archaelogical remains.

You can find out more about the London Code Dojo at our [homepage](http://www.meetup.com/London-Code-Dojo/).

# License
The code samples are licensed under the CC-SA-NC-4.0 license, as shown in the [LICENSE](/LICENSE) file.
