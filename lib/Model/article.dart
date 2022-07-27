class Article {
  String? title;
  String? description;
  String? urlToImg;

  Article({
    this.title,
    this.description,
    this.urlToImg
  });

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      //title: json["title"] as String,
      title: json["title"] == null ? null : json["title"],
      //description: json["description"] as String,
      description: json["description"] == null ? null : json["description"],
      urlToImg: json["urlToimg"]  == null ? null : json["urlToimg"],
    );
  }

}
