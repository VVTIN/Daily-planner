import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/config/colors.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/model/db_helper/db_helper.dart';
import 'package:flutter_application_1/widget/home/task_form.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/db_model/task.dart';
import '../widget/home/task_list.dart';

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
            child: TaskList(
              tasks: _filteredTasks,
              onUpdate: updateTask,
              onDelete: deleteTask,
            ),
          ),
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
