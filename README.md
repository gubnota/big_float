<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

**BigFloat** allows to use double numbers with desired precision after decimal point.

## Features

- **BigFloat** allows to use double numbers with desired precision after decimal point.

## Getting started

```sh
flutter pub add big_float
```

## Usage

```dart
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
```
