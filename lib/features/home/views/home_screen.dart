import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/features/home/cubits/everything/news_cubit.dart';
import 'package:news_app/features/home/cubits/everything/news_state.dart';
import 'package:news_app/features/home/widgets/featured_news_card.dart';
import 'package:news_app/features/home/widgets/popular_news_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(size: size,),
      body: BlocBuilder<NewsCubit,NewsState>(builder: (context,state){
        if(state is NewsSuccessState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.33,
                  child: PageView.builder(controller: _controller,
                    itemCount: state.articles.length > 5 ? 5 : state.articles
                        .length,
                    itemBuilder: (context, index) {
                      return FeaturedNewsCard(article: state
                          .articles[index],);
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.01,),
                Center(
                  child: SmoothPageIndicator(controller: _controller,
                    count: state.articles.length > 5 ? 5 : state.articles
                        .length,
                    effect: ScrollingDotsEffect(
                        activeDotColor: AppColors.primary,
                        dotColor: Colors.grey, dotWidth: 8, dotHeight: 8),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.01, bottom: size.height * 0.009,
                      right: size.width * 0.05, left: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Most Popular', style: TextStyle(
                        fontFamily: 'SchibstedGrotesk',
                        fontSize: 24,
                        color: Color(0xff231F20),
                        fontWeight: FontWeight.w600,
                      ),),
                      TextButton(
                        onPressed: () {},
                        child: Text('See More', style: TextStyle(
                          fontFamily: 'SchibstedGrotesk',
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),),)
                    ],

                  ),
                ),
                SizedBox(
                  height: 313,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 20),
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      return PopularNewsCard(
                        article: state.articles[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }else if (state is NewsErrorState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errMessage),
                ElevatedButton(onPressed: ()=> context.read<NewsCubit>().fetchNews(),
                    child: const Text('Retry'),
                ),
              ],
            ),
          );
        }else{
          return const Center(child:
              CircularProgressIndicator()
          );
        }
      },
      ),

      );
  }
}

