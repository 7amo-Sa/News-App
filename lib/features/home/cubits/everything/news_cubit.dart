import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/article_model.dart';
import '../../data/repos/news_repo.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState>{
  final NewsRepo repo;
  NewsCubit(this.repo): super(NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);
  FetchArticlesResponseModel? responseModel;
  String? error;
  List<ArticleModel> bookmarks = [] ;
  void toggleBookmark(ArticleModel article){
    emit(NewsLoadingState());
    if(bookmarks.contains(article)){
      bookmarks.remove(article);
    }else{
      bookmarks.add(article);
    }
    emit(NewsSuccessState(responseModel?.articles??[]));

  }
  fetchNews() async{
    emit(NewsLoadingState());
    var result = await repo.fetchArticles();
    result.fold(
            (error) {
          this.error = error;
          emit(NewsErrorState(error));
        },
            (model){
          responseModel = model;
          emit(NewsSuccessState(model.articles??[]));
        }
    );
  }


}