import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/home/task_list/task_widget_item.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/providers/list_provider.dart';

import '../../model/task.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {


  @override
  Widget build(BuildContext context) {
    var listProvider=Provider.of<ListProvider>(context);
    if(listProvider.taskList.isEmpty) {
      listProvider. getAllTasksFromFireStore();
    }
    return Column(
      children: [
        CalendarTimeline(
          initialDate: listProvider.selectDate,
          firstDate: DateTime.now().subtract(Duration(days: 356)),
          lastDate: DateTime.now().add(Duration(days: 356)),
          onDateSelected: (date) {
            listProvider.changeSelectedDate(date);
          },
          leftMargin: 20,
          monthColor: Theme.of(context).primaryColor,
          dayColor: MyTheme.blackColor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: MyTheme.blackColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskWidgetItem(task: listProvider.taskList[index]);
            },
            itemCount:listProvider. taskList.length,
          ),
        )
      ],
    );
  }

  void getAllTasksFromFireStore() {}


}
