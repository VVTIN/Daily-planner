import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/config/colors.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/model/db_helper/db_helper.dart';
import 'package:flutter_application_1/widget/home/task_form.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/db_model/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> _listTask = [];
  DatabaseHelper _dbHelper = DatabaseHelper.internal();

  List<String> _status = ['Tất cả', 'Tạo mới', 'Thực hiện', 'Kết thúc'];
  String _selectedStatus = 'Tất cả';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    List<Task> _task = await _dbHelper.getAllTasks();
    setState(() {
      _listTask = _task;
    });
  }

  void addTask(Task task) async {
    await _dbHelper.addTask(task);
    _loadData();
  }

  void updateTask(Task task) async {
    await _dbHelper.updateTask(task);
    _loadData();
  }

  void deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    List<Task> _filteredTasks = _listTask;
    if (_selectedStatus != 'Tất cả') {
      _filteredTasks =
          _listTask.where((task) => task.status == _selectedStatus).toList();
    }
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              child: DropdownButtonFormField(
                value: _selectedStatus,
                items: _status.map((String status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
            ),
          ),
          Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: _filteredTasks.length,
            itemBuilder: (context, index) {
              final task = _filteredTasks[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: BehindMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Xác nhận xoá'),
                            content:
                                Text('Bạn có chắc muốn xoá công việc này?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  deleteTask(task.id!);
                                  Navigator.pop(context);
                                },
                                child: Text('Xoá'),
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
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TColors.third,
                    ),
                    child: ListTile(
                      title: Text(
                        task.title!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trạng thái: ' + task.status!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            task.date!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      onTap: () async {
                        final Task? _updateTask = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskForm(task: task)));
                        if (_updateTask != null) {
                          updateTask(_updateTask);
                        }
                      },
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTasks = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => TaskForm()));
          if (newTasks != null) {
            addTask(newTasks);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
