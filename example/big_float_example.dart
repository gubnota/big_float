import 'package:big_float/big_float.dart';

void main() {
  BigFloat.precision = 16;
  var a = BigFloat.from("100000.01");
  var b = BigFloat.from("-3.4200000000000001");
  print("a+b = ${a + b}"); // 99996.5899999999999999
  print("a-b = ${a - b}"); // 100003.4300000000000001
  print("a*b = ${a * b}"); // -342000.0342000000100000
  print("b/a = ${b / a}"); // -0.3419999658000034
}
