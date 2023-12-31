import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
   TaskTitle({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  final bool isChecked;
  final String taskTitle;
  final Function? checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback as Function()?,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback as void Function(bool?)?,
        // toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}

//
// class TaskTitle extends StatefulWidget {
//   const TaskTitle({super.key});
//
//   @override
//   State<TaskTitle> createState() => _TaskTitleState();
// }
//
// class _TaskTitleState extends State<TaskTitle> {
//   bool isChecked = true;
//
//   void checkboxCallback(bool newValue) {
//     setState(() {
//       isChecked = newValue;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         'This is a task',
//         style: TextStyle(
//             decoration: isChecked ? TextDecoration.lineThrough : null),
//       ),
//       trailing: TaskCheckbox(
//         checkboxState: isChecked,
//         toggleCheckboxState: checkboxCallback,
//       ),
//     );
//   }
// }
//
class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox(
      {super.key,
      required this.checkboxState,
      required this.toggleCheckboxState});

  final bool checkboxState;
  final Function toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: (bool? newValue) => toggleCheckboxState(newValue),
    );
  }
}
