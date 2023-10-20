import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text('Add new Task',
                  style: Theme.of(context).textTheme.titleMedium)),
          SizedBox(
            height: 23,
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please enter task';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'enter your task',
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text('Select Date', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                showCalendar();
              },
              child: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          Center(
              child: Container(
            width: 600,
            height: 38,
            child: ElevatedButton(
              style: ButtonStyle(iconSize: MaterialStatePropertyAll(34)),
              onPressed: () {
                addTask();
              },
              child: Text('Add', style: Theme.of(context).textTheme.titleLarge),
            ),
          ))
        ],
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 356)));
    if (chosenDate != null) selectedDate = chosenDate;
    setState(() {});
  }

  void addTask() {
    if (_formKey.currentState!.validate()==true) {
      //add task to firebase
    }
  }
}
