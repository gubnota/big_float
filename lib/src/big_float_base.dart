import 'dart:math';

class BigFloat {
  late BigInt num;
  static int precision = 16;

  BigFloat(double value) {
    num = BigInt.from(value * pow(10, precision));
  }
  BigFloat.from(String input) {
    BigInt sign = input.contains("-") ? BigInt.from(-1) : BigInt.one;
    input = sign == BigInt.one ? input : input.substring(1);

    if (input.contains(".")) {
      List<String> a = input.split(".");
      num = sign *
          // (BigInt.parse(a[0].padRight(precision + 1, "0")) +
          BigInt.parse(a[0] + a[1].padRight(precision, "0"));
      return;
    }
    num = sign * BigInt.parse(input.padRight(precision, "0"));
  }

  double get value => num.toDouble() / pow(10, precision);

  // BigFloat operator +(BigFloat other) {
  //   BigInt result = num + other.num;
  //   return BigFloat._internal(result.toDouble() / pow(10, precision));
  // }
  BigFloat operator +(BigFloat other) {
    BigFloat e =
        BigFloat.from((num + other.num).toString().padRight(precision, "0"));
    return e;
  }

  BigFloat operator /(BigFloat other) {
    BigFloat e = BigFloat.from(
        (num / other.num).toString().padRight(precision - 1, "0"));
    return e;
  }

  BigFloat operator *(BigFloat other) {
    BigFloat e = BigFloat.from(
        (num * other.num ~/ BigInt.parse("1".padRight(precision + 1, "0")))
            .toString()
            .padRight(precision, "0"));
    return e;
  }

  BigFloat operator -(BigFloat other) {
    BigFloat e =
        BigFloat.from((num - other.num).toString().padRight(precision, "0"));
    return e;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BigFloat && num == other.num;

  @override
  toString() {
    var out = ["0", "0"];
    var str = num.abs().toString();
    if (str.length > precision) {
      out[0] = str.substring(0, str.length - precision);
      out[1] = str.substring(str.length - precision).padLeft(precision, "0");
    } else {
      out[1] = str;
    }
    return "${num < BigInt.zero ? "-" : ""}${out.join(".")}";
  }

  @override
  int get hashCode => num.hashCode;
}
