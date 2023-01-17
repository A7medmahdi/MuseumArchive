class Imageinfo {
  final int? imageId;
  final String path;
  final int itemId;

  Imageinfo({required this.imageId, required this.path, required this.itemId});

  factory Imageinfo.fromJson(Map<String, dynamic> json) {
    return Imageinfo(
      imageId: json["imageId"],
      path: json["path"],
      itemId: json["itemId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "imageId": imageId,
      "path": path,
      "itemId": itemId,
    };
  }
}
