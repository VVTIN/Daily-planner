class Task {
  int? id;
  String title;
  String content;
  String host;
  String status;
  String approver;
  String date;
  String startTime;
  String endTime;
  String remind;

  Task({
    this.id,
    required this.title,
    required this.content,
    required this.host,
    required this.status,
    required this.approver,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] is int ? json['id'] : null,
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      host: json['host'] as String? ?? '',
      status: json['status'] as String? ?? '',
      approver: json['approver'] as String? ?? '',
      date: json['date'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      remind: json['remind'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'host': host,
      'status': status,
      'approver': approver,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'remind': remind,
    };
  }
}
