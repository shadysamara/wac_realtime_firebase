class FirestoreTask {
  String title;
  String description;
  String date;
  bool isComplete;
  Periority periority;
  FirestoreTask(
      {this.date,
      this.description,
      this.isComplete,
      this.title,
      this.periority});

  FirestoreTask.fromJson(Map map) {
    this.title = map['title'] ?? '';
    this.description = map['description'] ?? '';
    this.date = map['date'] ?? '';
    this.isComplete = map['isComplete'] ?? true;
    this.periority = Periority.fromJson(map['periority']);
  }
  toJson() {
    Map<String, dynamic> map = {};
    map['date'] = this.date;
    map['isComplete'] = this.isComplete;
    map['description'] = this.description;
    map['title'] = this.title;
    map['periority'] = this.periority.toJson();
    return map;
  }
}

class Periority {
  String name;
  String color;
  Periority({this.name, this.color});
  Periority.fromJson(Map map) {
    this.name = map['name'];
    this.color = map['color'];
  }
  toJson() {
    return {'name': this.name, 'color': this.color};
  }
}
