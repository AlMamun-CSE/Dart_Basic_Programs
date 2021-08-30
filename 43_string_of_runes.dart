void main() {
  String myStr = "Mask";

  ///Code unit at 0th position is M.
  ///UTF-16 decimal representation for ASCII character 'M' is 77
  ///Reference: https://www.fileformat.info/info/unicode/char/004d/index.htm
  print("Code Unit for Letter M: ${myStr.codeUnitAt(0)}");

  //printing 16 bit code units in word Mask
  print("Code Units for word Mask: ${myStr.codeUnits}");

  /// Runes for word Mask
  print("Runes for word Mask: ${myStr.runes}");

  //Representing Mask in hex
  String hexStr = "\u004D\u0061\u0073\u006B";
  print("From hex to String - maskStr: ${hexStr}");

  Runes codeUnits = Runes(hexStr);
  print("Code Units: ${codeUnits}");
  print("Code Units To String: ${String.fromCharCodes(codeUnits)}");

  //Unicode character encoding : https://www.compart.com/en/unicode/U+1F637
  //Decimal representation : 128567
  String smileyMask = "\u{1F637}"; //needs 32 bit
  print("Smiley with mask: ${smileyMask}");

  // Prints Code Points for smiley with mask
  print("Code Points in smily with mask: ${smileyMask.runes}");

  //Printing String for code points
  print(String.fromCharCodes(Runes(smileyMask)));
}