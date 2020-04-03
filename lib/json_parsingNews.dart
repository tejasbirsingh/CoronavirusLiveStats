class News{
  final String Status;
  final int totalResults;

  final List<sources> source;

  News({this.Status, this.totalResults, this.source});

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      Status: json["status"],
      totalResults: json["totalResults"],
//      articles: parseArticle(json['articles']),
      source: parseSource(json)


    );
  }
  static List<String> parseArticle(articles){
    List<String> arc = new List<String>.from(articles);
    return arc;
  }
  static List<sources> parseSource(jsona){
    var list =jsona['articles'] as List;
    List<sources> alist = list.map((data) => sources.fromJson(data)).toList();
    return alist;
  }
}
class sources{

  String author;
  String title;
  String desc;
  String url;
  String published;
  String content;

  sources({this.author, this.title, this.desc, this.url, this.published,
      this.content});
  factory sources.fromJson(Map<String , dynamic> parsedJson){
    return sources(
      author:parsedJson['author'],
      title:parsedJson['title'],
      desc:parsedJson['description'],
      url:parsedJson['url'],
      published:parsedJson['publishedAt'],
      content:parsedJson['content'],
    );
  }
}