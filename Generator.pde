import java.security.SecureRandom;

String genPassw(boolean _isLetters, boolean _isUpperCase, boolean _isNumbers, boolean _isSpecial, double _numlen) {
  String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String numbers = "0123456789";
  String special = "@#=+!£$%&?[](){}`:;,./-*^";
  
  String allowedChars = "";
  
  allowedChars += (_isLetters ? lowerCaseLetters : "");
  allowedChars += (_isUpperCase ? upperCaseLetters : "");
  allowedChars += (_isNumbers ? numbers : "");
  allowedChars += (_isSpecial ? special : "");
  
  String _result = "";
  
  for (int i = 0, n = allowedChars.length(); i < _numlen; i++) {
    int rnd = new SecureRandom().nextInt(n);
    
    _result += allowedChars.charAt(rnd);
  }
  
  return _result;
}

String weak = genPassw(true, true, true, true, 12), rec = genPassw(true, true, true, true, 15), strong = genPassw(true, true, true, true, 18), easy = genPassw(true, true, false, false, 16);
