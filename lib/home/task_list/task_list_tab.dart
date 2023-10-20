import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/home/task_list/task_widget_item.dart';
import 'package:todo_app/my_theme.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 356)),
          lastDate:  DateTime.now().add(Duration(days: 356)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Theme.of(context).primaryColor,
          dayColor: MyTheme.blackColor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor:MyTheme.blackColor ,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context,index){
                return TaskWidgetItem();
              },itemCount: 30,

          ),
        )
      ],
    );
  }
}
