import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/cubits/everything/news_cubit.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
class NewDetailsScreen extends StatefulWidget {
  final ArticleModel? article;
  const NewDetailsScreen({super.key, required this.article});

  @override
  State<NewDetailsScreen> createState() => _NewDetailsScreenState();
}

class _NewDetailsScreenState extends State<NewDetailsScreen> {
  bool isBookmarked = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:Stack(
        children: [
          Positioned(
            top:0,
              right: 0,
              left: 0,
              height: size.height*0.33,
              child: CachedNetworkImage(imageUrl: widget.article?.urlToImage??
                  'https://via.placeholder.com/400x200?text=No+Image'),
              //Image.asset('assets/images/new_details.jpg',fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height*0.72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight:Radius.circular(24) ,topLeft:Radius.circular(24) )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight:Radius.circular(24) ,topLeft:Radius.circular(24) ),
                child: Scaffold(
                  appBar: AppBar(
                      backgroundColor: const Color(0xffF3EBE9).withOpacity(0.6),
                      elevation: 0,
                      toolbarHeight: 60,
                      leading: IconButton(onPressed: (){
                        Navigator.pop(context);
                      },
                         icon: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      actions: [
                        IconButton(
                           icon: Icon(
                               isBookmarked? Icons.bookmark_outline_rounded :Icons.bookmark_rounded,color: Colors.black,),
                               onPressed: (){
                             setState(() {
                               isBookmarked =!isBookmarked;
                             });
                             context.read<NewsCubit>().toggleBookmark(widget.article!);
                               },
                        ),
                        const SizedBox(width: 10,),
                        const Icon(Icons.shortcut_outlined, color: Colors.black),
                        const SizedBox(width: 20,)
                      ],
                    ),
                  body: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 5,right: 32,left: 32,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.article?.title??'',
                        maxLines: 2, style: TextStyle(
                              fontFamily: 'SchibstedGrotesk',
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: Color(0xff231F20)
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(radius: 12,
                              backgroundImage: const AssetImage('assets/images/auther1.jpg',),
                            ),

                            SizedBox(width: 10,),
                            Text('${widget.article?.author??''} · ${widget.article?.publishedAt??''}',
                              style: TextStyle(
                                  fontFamily: 'SchibstedGrotesk',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xff6D6265)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text(widget.article?.content??'',textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'SchibstedGrotesk',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff231F20)
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
              ),
            ),

        ],
      ) ,

    );
  }
}
