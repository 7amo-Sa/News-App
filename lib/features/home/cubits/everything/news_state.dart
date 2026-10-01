import 'package:news_app/features/home/data/models/article_model.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final List<ArticleModel> articles;

  NewsSuccessState(this.articles);
}

class NewsErrorState extends NewsState {
  final String errMessage;

  NewsErrorState(this.errMessage);
}