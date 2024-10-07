import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/colors.dart';
import 'package:flutter_application_1/model/db_model/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'task_form.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onUpdate;
  final Function(int) onDelete;

  const TaskList({
    Key? key,
    required this.tasks,
    required this.onUpdate,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Xác nhận yêu cầu'),
                      content: Text('Bạn có chắc muốn xoá công việc này?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            onDelete(task.id!);
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 70.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: TColors.red,
                            ),
                            child: Text(
                              'Xóa',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Hủy'),
                        ),
                      ],
                    );
                  },
                ),
                icon: Icons.delete,
                backgroundColor: Colors.red,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.5, vertical: 6.0),
            margin: EdgeInsets.symmetric(horizontal: 3.5, vertical: 7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: TColors.slateGray,
            ),
            child: ListTile(
              title: Text(
                task.title!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trạng thái: ' + task.status!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    task.date!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              onTap: () async {
                final Task? _updateTask = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskForm(task: task)));
                if (_updateTask != null) {
                  onUpdate(_updateTask);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
