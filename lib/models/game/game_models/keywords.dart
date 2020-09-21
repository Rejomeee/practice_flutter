class KeywordsModel {
  final int id;
  final String name;
  final String slug;

  KeywordsModel(this.id, this.name, this.slug);

  KeywordsModel.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        slug = json["slug"];
}
