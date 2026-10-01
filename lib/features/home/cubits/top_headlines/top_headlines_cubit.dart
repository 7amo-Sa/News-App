import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/cubits/top_headlines/top_headlnes_states.dart';

import '../../data/models/article_model.dart';
import '../../data/repos/news_repo.dart';

class HeadlinesCubit extends Cubit<TopHeadlinesStates>{
  HeadlinesCubit() : super(TopHeadlinesInitialState());
  static HeadlinesCubit get(context)=> BlocProvider.of(context);

  FetchArticlesResponseModel? responseModel;
  String? error;
  NewsRepo repo = NewsRepo();
  fetchArticles() async{
    emit(TopHeadlinesLoadingState());
    var result = await repo.fetchTopHeadlines();
    result.fold(
            (error) {
          this.error = error;
          emit(TopHeadlinesErrorState());
        },
            (model){
          responseModel = model;
          emit(TopHeadlinesSuccessState());
        }
    );
  }
}