# java-Password-Generator
Processing 3 GUI for randomly generated passwords.


## how it works
it draws text and put it in a box. The text contains the variable for the different types of randomly generated passwords (weak, recommended, strong, etc.).

## The actual Random Generator
I made a function with certain parameters that change how to generate the password  

```java
// import SecureRandom. I did not use the random() that comes with processing because for some reason, I kept on getting errors
// and it would not open the window
import java.security.SecureRandom;

String genPassw(boolean isLetters, boolean isUpperCase, boolean isNumbers, boolean isSpecial, double numlen) {
  String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz"; //all lowercase letters
  String upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; //all uppercase letters
  String numbers = "0123456789"; //all numbers
  String special = "@#=+!£$%&?[](){}`:;,./-*^"; //all special characters except for \
  
  String allowedChars = "";
  
  allowedChars += (isLetters ? lowerCaseLetters : ""); //if isLetters is true, then add lowercase letters to allowedchars
  allowedChars += (isUpperCase ? upperCaseLetters : ""); //if isUpperCase is true, then add uppercase letters
  allowedChars += (isNumbers ? numbers : ""); // if isNumbers is true, then add numbers
  allowedChars += (isSpecial ? special : ""); // if isSpecial is true, then add special
  
  String result = "";
  
  for (int i = 0, n = allowedChars.length(); i < numlen; i++) { // while i is smaller than the length of the password that we wanna generate
    int rnd = new SecureRandom().nextInt(n);
    
    result += allowedChars.charAt(rnd); // add the character at rnd of allowedChars to result
  }
  
  return result;
}
```
## Copying the password and how to generate new passwords without re-opening
Make a function for keypressed and use a switch statement to check the letters.

```java
void keyPressed() {
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard(); // object for copying to clipboard
  
  switch(key) {
    case 'r':
      weak = genPassw(true, true, true, true, 12); // take the variable and redo the function
      rec = genPassw(true, true, true, true, 15);
      strong = genPassw(true, true, true, true, 18);
      easy = genPassw(true, true, false, false, 16);
      break;
      
    case '1':
      //if they click 1, copy the 1st generated password (1st from the top of the window) (which is weak)
      StringSelection selectWeak = new StringSelection(weak); //select the string weak
      clipboard.setContents(selectWeak, selectWeak); // copy weak
      break;
      
    case '2':
      // if they click 2, copy the 2nd generated password (rec)
      StringSelection selectRec = new StringSelection(rec);
      clipboard.setContents(selectRec, selectRec);
      break;
      
    case '3':
      // if they click 3, copy the 3rd generated password (strong)
      StringSelection selectStrong = new StringSelection(strong);
      clipboard.setContents(selectStrong, selectStrong);
      break;
      
    case '4':
      //if they click 4, copy the 4th generated password (easy)
      StringSelection selectEasy = new StringSelection(easy);
      clipboard.setContents(selectEasy, selectEasy);
      break;
      
    default:
      println("That is not an option"); //for testing, print "That is not an option" by default
      break;
  }
}
```
