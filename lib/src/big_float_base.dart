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
      num = sign * BigInt.parse(a[0] + a[1].padRight(precision, "0"));
      return;
    }
    num = sign * BigInt.parse(input.padRight(precision, "0"));
  }

  double get value => num.toDouble() / pow(10, precision);

  BigFloat operator +(BigFloat other) {
    BigFloat e =
        BigFloat.from((num + other.num).toString().padRight(precision, "0"));
    return e;
  }

  BigFloat operator /(BigFloat other) {
    BigFloat e = BigFloat.from(
        (num * BigInt.from(pow(10, precision)) ~/ other.num)
            .toString()
            .padRight(precision, "0"));
    return e;
  }

  BigFloat operator *(BigFloat other) {
    BigFloat e = BigFloat.from(
        (num * other.num ~/ BigInt.from(pow(10, precision)))
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
  String toString() {
    var out = ["0", "0"];
    var str = num.abs().toString();
    if (str.length > precision) {
      out[0] = str.substring(0, str.length - precision);
      out[1] = str.substring(str.length - precision).padLeft(precision, "0");
    } else {
      out[1] = str.padLeft(precision, "0");
    }
    return "${num < BigInt.zero ? "-" : ""}${out.join(".")}";
  }

  /// Returns a string representation of this number with [fractionDigits]
  /// digits after the decimal point.
  ///
  /// If [fractionDigits] is 0, the decimal point is omitted.
  ///
  /// Throws an [ArgumentError] if [fractionDigits] is negative.
  String toStringAsFixed(int fractionDigits) {
    if (fractionDigits < 0) {
      throw ArgumentError("Negative fractionDigits");
    }

    BigInt absNum = num.abs();
    String sign = num.isNegative ? '-' : '';

    if (fractionDigits > precision) {
      // Scale up the number
      BigInt scaledNum =
          absNum * BigInt.from(10).pow(fractionDigits - precision);
      String scaledNumStr = scaledNum.toString();
      String integerPart = '0';
      String fractionalPart = scaledNumStr.padLeft(fractionDigits, '0');
      return sign + integerPart + '.' + fractionalPart;
    } else {
      // Rounding
      BigInt roundingFactor = BigInt.from(10).pow(precision - fractionDigits);
      BigInt roundingOffset = roundingFactor ~/ BigInt.two;
      BigInt roundedNum = (absNum + roundingOffset) ~/ roundingFactor;

      String roundedNumStr =
          roundedNum.toString().padLeft(fractionDigits + 1, '0');
      String integerPart =
          roundedNumStr.substring(0, roundedNumStr.length - fractionDigits);
      String fractionalPart =
          roundedNumStr.substring(roundedNumStr.length - fractionDigits);

      if (fractionDigits == 0) {
        return sign + integerPart;
      } else {
        return sign + integerPart + '.' + fractionalPart;
      }
    }
  }

  @override
  int get hashCode => num.hashCode;
}
