import 'package:big_float/big_float.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests to qualify BigFloat', () {
    BigFloat.precision = 16;
    var a = BigFloat.from("100000.01");
    var b = BigFloat.from("-3.4200000000000001");
    setUp(() {
      print("preparing environment…");
    });

    test("equal, not equal, identical operator test", () {
      final a1 = BigFloat.from("0.0000000000000003");
      final a2 = BigFloat.from("0.0000000000000003");
      final a3 = BigFloat.from("0.0000000000000001");
      final a4 = BigFloat.from("-0.0000000000000003");
      final a5 = BigFloat.from("0");
      final a6 = BigFloat.from("-0");
      print("a1 == a2: ${a1 == a2}");
      print("a2 == a3: ${a2 == a3}");
      print("a3 == a4: ${a4 == a3}");
      print("a5 == a6: ${a6 == a5}");
      expect(a1, equals(a2));
      expect(a2, isNot(equals(a3)));
      expect(a3, isNot(equals(a4)));
      expect(a5, equals(a6));
    });

    test('addition', () {
      print("a+b = ${a + b}");
      expect((a + b).toString(), equals("99996.5899999999999999"));
    });

    test("division", () {
      print("b/a = ${b / a}");
      expect((b / a).toString(), equals("-0.3419999658000034"));
    });
    test("multiplication", () {
      print("b*a = ${b * a}");
      expect((b * a).toString(), equals("-342000.0342000000100000"));
    });
    test("subtraction", () {
      print("a-b = ${a - b}");
      expect((a - b).toString(), equals("100003.4300000000000001"));
    });
  });
}
