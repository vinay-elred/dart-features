import 'dart:math' as math;

void main() {
  ScientificCalculator().currentModel("Scientific");
  ScientificCalculator().multi(4, 5);
  print(ScientificCalculator().add(5, 4));
  print(ScientificCalculator().random(5));
  //
  Calculator().currentModel("Normal");
  Calculator().multi(4, 5);
  print(Calculator().add(5, 4));
  print(Calculator().double2X(5));
}

class ScientificCalculator with Common, Other {
  int random(int max) {
    return math.Random().nextInt(max);
  }
}

class Calculator with Common, Other {
  int double2X(int val) {
    return val * 2;
  }
}

mixin Common {
  int add(int a, int b) {
    return a + b;
  }

  int sub(int a, int b) {
    return a - b;
  }

  int multi(int a, int b) {
    return a * b;
  }

  double divide(int a, int b) {
    return a / b;
  }

  int remainder(int a, int b) {
    return a % b;
  }
}

mixin Other {
  void currentModel(String val) {
    print("Current model $val");
  }

  int multi(int a, int b) {
    final val = a * b;
    print("Other mixin $val");
    return val;
  }
}
