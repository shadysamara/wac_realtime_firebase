class FirestoreTask {
  String title;
  String description;
  String date;
  bool isComplete;
  FirestoreTask({this.date, this.description, this.isComplete, this.title});

  FirestoreTask.fromJson(Map map) {
    this.title = map['title'] ?? '';
    this.description = map['description'] ?? '';
    this.date = map['date'] ?? '';
    this.isComplete = map['isComplete'] ?? true;
  }
  toJson() {
    Map<String, dynamic> map = {};
    map['date'] = this.date;
    map['isComplete'] = this.isComplete;
    map['description'] = this.description;
    map['title'] = this.title;
    return map;
  }
}
