class Picture {
  late int? id;
  late String? pictureName;

  Picture({
    required this.id,
    required this.pictureName,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'pictureName': pictureName,
    };
    return map;
  }

  Picture.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    pictureName = map['pictureName'];
  }
}
