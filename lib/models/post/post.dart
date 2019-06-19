class Post {
  int id;
  String description;

  Post({
    this.id,
    this.description,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["ID"],
        description: json["LISTDESC"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
      };
}
