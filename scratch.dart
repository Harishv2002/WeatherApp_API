import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String fromTask2 = await task2();
  task3(fromTask2);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration time = Duration(seconds: 4);
  String data = "";
  await Future.delayed(time, () {
    data = 'Task2';
    String result = 'task 2 data';
    print('Task 2 complete');
  });
  return data;
}

void task3(String fromTask2) {
  String result = 'task 3 data';
  print('Task 3 complete with input from $fromTask2');
}
