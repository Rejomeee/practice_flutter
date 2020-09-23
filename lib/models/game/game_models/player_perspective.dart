class PlayerPerspectiveModel {
  final int id;
  final String name;

  PlayerPerspectiveModel(this.id, this.name);

  PlayerPerspectiveModel.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
