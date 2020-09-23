class ModeModel {
  final int id;
  final String name;
  final String slug;

  ModeModel(this.id, this.name, this.slug);

  ModeModel.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        slug = json["slug"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
      };
}
