import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;

PImage ayelock;

int boxXSize = 300;
int boxYSize = 100;

void setup() {
 size(800, 800);
 surface.setResizable(true);
 surface.setTitle("AyeLock");
 
 ayelock = loadImage("AyeLock.png");
 
 textAlign(CENTER);
 rectMode(CENTER);
}

void draw() {
  background(176, 11, 64);

  imageMode(CENTER);
  image(ayelock, width / 2, 60, 380, 130);

  //Weak Box
  fill(255);
  rect(width / 2, 200, boxXSize, boxYSize, 10);

  //Weak Text
  textSize(25);
  fill(0);
  text("Weak: \n" + weak, width / 2, 180);

  // Recommended Box
  fill(255);
  rect(width / 2, 330, boxXSize, boxYSize, 10);
  
  //Recommended Text
  textSize(25);
  fill(0);
  text("Recommended: \n" + rec, width / 2, 310);
  
  //Strong Box
  fill(255);
  rect(width / 2, 460, boxXSize, boxYSize, 10);
  
  //Strong Text
  textSize(25);
  fill(0);
  text("Strong: \n" + strong, width / 2, 440);
  
  //Easy Box
  fill(255);
  rect(width / 2, 590, boxXSize, boxYSize, 10);
  
  //Easy Text
  textSize(25);
  fill(0);
  text("Easy to read: \n" + easy, width / 2, 570);
  
  textSize(15);
  fill(0);
  text("Press R to generate new passwords. \n Press 1 - 4 to copy a certain password.", width / 2, 700);
}

void keyPressed() {
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
  
  switch(key) {
    case 'r':
      weak = genPassw(true, true, true, true, 12);
      rec = genPassw(true, true, true, true, 15);
      strong = genPassw(true, true, true, true, 18);
      easy = genPassw(true, true, false, false, 16);
      break;
      
    case '1':
      StringSelection selectWeak = new StringSelection(weak);
      clipboard.setContents(selectWeak, selectWeak);
      break;
      
    case '2':
      StringSelection selectRec = new StringSelection(rec);
      clipboard.setContents(selectRec, selectRec);
      break;
      
    case '3':
      StringSelection selectStrong = new StringSelection(strong);
      clipboard.setContents(selectStrong, selectStrong);
      break;
      
    case '4':
      StringSelection selectEasy = new StringSelection(easy);
      clipboard.setContents(selectEasy, selectEasy);
      break;
      
    default:
      println("That is not an option");
      break;
  }
}
