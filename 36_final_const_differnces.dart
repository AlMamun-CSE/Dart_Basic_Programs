//Al Mamun CSE.................


void main() {
  //Constant Value not set
  const int ruhul = 5;
  var foo = const [];
  final bar = const [];

  //Final Value
  final int al = 5 * ruhul;

  foo = [1, 2, 3]; // Was const []
 
  //baz = [42]; // Error: Constant variables can't be assigned a value.

  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: "int"}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
  
   print('foo $foo');
   print('bar $bar');
   print('al $al');
   print('map $map');
   print('set $set');
  
}