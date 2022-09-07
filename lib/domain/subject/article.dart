import 'package:json_annotation/json_annotation.dart';

// manual import of generated file
part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article{

  Article(this.title, this.titleUI,this.content);

  final String title;

  final String titleUI;

  final List<Map<String, dynamic>> content;

  factory Article.fromJson(Map<String, Object?> json) => _$ArticleFromJson(json);

  Map<String, Object?> toJson() => _$ArticleToJson(this);
}