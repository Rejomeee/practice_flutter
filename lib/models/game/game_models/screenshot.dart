class ScreenshotModel {
  final int id;
  final String imageId;

  ScreenshotModel(this.id, this.imageId);

  ScreenshotModel.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        imageId = json["image_id"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_id': imageId,
      };
}
