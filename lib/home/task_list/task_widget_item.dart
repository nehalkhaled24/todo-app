import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/my_theme.dart';

class TaskWidgetItem extends StatelessWidget {
  const TaskWidgetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: MyTheme.whiteColor),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.40,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),topLeft:Radius.circular(12) ),
              onPressed: (context){},
              backgroundColor:MyTheme.redColor,
              foregroundColor: MyTheme.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (context){},
              backgroundColor: MyTheme.primaryColor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: '  Edit',
            ),
          ],
        ),
        child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 5,
                height:80,
                color: MyTheme.primaryColor,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [Text('Task 1',style: Theme.of(context).textTheme.titleMedium!.copyWith(color:MyTheme.primaryColor )), Text('desc')],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical:4,horizontal: 18 ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)
                  ,color: MyTheme.primaryColor),
                child: Icon(Icons.check,color:MyTheme.whiteColor,size: 30, ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
