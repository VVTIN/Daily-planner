import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/config/colors.dart';
import 'package:flutter_application_1/config/sizes.dart';
import 'package:flutter_application_1/model/db_helper/db_helper.dart';
import 'package:flutter_application_1/model/db_model/task.dart';
import 'package:flutter_application_1/widget/home/selected_color.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key, this.task});
  final Task? task;
  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  List<Task> _taskList = [];
  final DatabaseHelper _dbHelper = DatabaseHelper.internal();

  late String _title,
      _content,
      _host,
      _status,
      _approver,
      _startTime,
      _endTime,
      _date,
      _remind;

  void initState() {
    super.initState();
    if (widget.task != null) {
      _title = widget.task!.title;
      _content = widget.task!.content;
      _host = widget.task!.host;
      _status = widget.task!.status;
      _approver = widget.task!.approver;
      _startTime = widget.task!.startTime;
      _endTime = widget.task!.endTime;
      _date = widget.task!.date;
      _remind = widget.task!.remind;
    } else {
      _title = '';
      _content = '';
      _host = '';
      _status = 'Tạo mới';
      _approver = '';
      _startTime = '';
      _endTime = '';
      _date = '';
      _remind = '';
    }
  }

  void saveTask() {
    final task = Task(
      title: _title,
      content: _content,
      host: _host,
      status: _status,
      approver: _approver,
      startTime: _startTime,
      endTime: _endTime,
      date: _date,
      id: widget.task?.id,
      remind: _remind,
    );

    Navigator.pop(context, task);
  }

  void _dateTime() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000, 12, 12),
      lastDate: DateTime(2222, 12, 31),
      initialDate: DateTime.now(),
    );
    if (pickerDate != null) {
      setState(() {
        _date =
            'Thứ ${pickerDate.weekday + 1}, ngày ${pickerDate.day}/${pickerDate.month}/${pickerDate.year}';
      });
    }
  }

  void _timeStart() async {
    TimeOfDay? pickerStart = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickerStart != null) {
      setState(() {
        _startTime = '${pickerStart.hour}:${pickerStart.minute}';
      });
    }
  }

  void _timeEnd() async {
    TimeOfDay? pickerEnd = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickerEnd != null) {
      setState(() {
        _endTime = '${pickerEnd.hour}:${pickerEnd.minute}';
      });
    }
  }

  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.task != null ? 'Thông tin kế hoạch' : 'Tạo mới kế hoạch'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.spaceBtwItem),
          child: Column(
            children: [
              //title
              TextFormField(
                controller: TextEditingController(text: _title),
                onChanged: (value) => _title = value,
                decoration: InputDecoration(
                  labelText: 'Chủ đề',
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              //content
              TextFormField(
                controller: TextEditingController(text: _content),
                onChanged: (value) => _content = value,
                decoration: InputDecoration(
                  labelText: 'Nội dung',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                maxLines: null,
                minLines: 3,
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              //host
              TextFormField(
                controller: TextEditingController(text: _host),
                onChanged: (value) => _host = value,
                decoration: InputDecoration(
                  labelText: 'Chủ trì',
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItem),
              TextFormField(
                controller: TextEditingController(text: _approver),
                onChanged: (value) => _approver = value,
                decoration: InputDecoration(
                  labelText: 'Người phê duyệt',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              // //status
              DropdownButtonFormField(
                items: ['Tạo mới', 'Thực hiện', 'Kết thúc']
                    .map((status) => DropdownMenuItem(
                          child: Text(status),
                          value: status,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
                value: _status,
                decoration: InputDecoration(
                  labelText: 'Trạng thái',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              //time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Thời gian:'),
                  Container(
                    child: ElevatedButton(
                      onPressed: _timeStart,
                      child: Text(_startTime.isEmpty ? 'Bắt đầu' : _startTime),
                    ),
                  ),
                  Icon(Icons.trending_flat),
                  Container(
                    child: ElevatedButton(
                      onPressed: _timeEnd,
                      child: Text(_endTime.isEmpty ? 'Kết thúc' : _endTime),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              //date
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(_date.isEmpty ? 'Ngày lên kế hoạch' : _date),
                  onPressed: _dateTime,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              //Remind
              SelectedColor(
                onColorSelected: (index) {
                  setState(() {
                    _selectedColor = index;
                  });
                },
                onRemindSelected: (minute) {
                  setState(() {
                    _remind = minute;
                  });
                },
                selectedColor: _selectedColor,
              ),
              SizedBox(height: TSizes.spaceBtwItem),

              //button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: saveTask,
                  child: Text(
                    widget.task != null ? 'Cập nhật' : 'Thêm kế hoạch',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: TColors.white,
                        ),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: TColors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
