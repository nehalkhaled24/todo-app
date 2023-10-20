import 'package:flutter/material.dart';
import 'package:todo_app/home/settings/settings_tab.dart';
import 'package:todo_app/home/task_list/add_task_bottom_sheet.dart';
import 'package:todo_app/home/task_list/task_list_tab.dart';
import 'package:todo_app/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'TO DO List ',
            style: Theme.of(context).textTheme.titleLarge,
          )),
      bottomNavigationBar: BottomAppBar(
        shape:CircularNotchedRectangle() ,
        notchMargin: 9,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex=index;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list, size: 30), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30), label: '')
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNewTask();
          }, child: Icon(Icons.add, size: 30)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
  List<Widget>tabs=[TaskListTab(),SettingsTab()];

  void addNewTask() {
    showModalBottomSheet(context: context, builder: (context) => AddTaskBottomSheet());
  }
}
