class Task {
  String title;
  String description;
  bool isComplete;
  Task({this.title, this.description, this.isComplete});
  Task.fromJson(Map<String, dynamic> map) {
    this.title = map['title'];
    this.description = map['description'];
    this.isComplete = map['isComplete'];
  }
  toJson() {
    return {
      'title': this.title,
      'description': this.description,
      'isComplete': this.isComplete
    };
  }

  toggleTask() {
    this.isComplete = !this.isComplete;
  }
}
