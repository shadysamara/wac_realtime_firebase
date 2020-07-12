class FirebaseTask {
  String title;
  String description;
  bool isComplete;
  FirebaseTask({this.title, this.description, this.isComplete = false});
  FirebaseTask.fromJson(Map map) {
    print(map);
  }
  toJson() {
    return {
      'title': this.title,
      'description': this.description,
      'isComplete': this.isComplete
    };
  }
}
