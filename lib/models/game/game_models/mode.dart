class ModeModel {
  final int id;
  final String name;

  ModeModel(this.id, this.name);

  ModeModel.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];
}
