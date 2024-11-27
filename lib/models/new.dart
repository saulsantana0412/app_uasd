class New {
    String id;
    String title;
    String img;
    String url;
    String date;

    New({
        required this.id,
        required this.title,
        required this.img,
        required this.url,
        required this.date,
    });

    factory New.fromJson(Map<String, dynamic> json) => New(
        id: json["id"],
        title: json["title"],
        img: json["img"],
        url: json["url"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "img": img,
        "url": url,
        "date": date,
    };
}