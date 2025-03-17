import 'dart:async';
import 'dart:math';

void main() async {
  bool finished = false;

  // First future with random timing
  Future.delayed(Duration(milliseconds: Random().nextInt(50) + 50), () {
    if (!finished) {
      print("The result1 is 3");
      print("The result2 is 6");
      finished = true;
    }
  });

  // Second future with different random timing
  Future.delayed(Duration(milliseconds: Random().nextInt(50) + 50), () {
    if (!finished) {
      print("The result2 is 6");
      print("The result1 is 3");
      finished = true;
    }
  });
}
