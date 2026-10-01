import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../data/models/article_model.dart';
class FeaturedNewsCard extends StatelessWidget {
  final ArticleModel? article;

  const FeaturedNewsCard({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.article,arguments: article);
      },
      child: Container(
        margin: EdgeInsets.only(left: size.width*0.05,right:size.width*0.04,
        top: size.height*0.02,bottom:size.height*0.01, ),
        height: size.height*0.3,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height*0.3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                 child: CachedNetworkImage(
                   imageUrl : article!.urlToImage??'https://via.placeholder.com/400x200?text=No+Image',
                   height: size.height*0.3,
                   width: double.infinity,
                   fit: BoxFit.cover,
                   placeholder: (context, url) => Container(
                     color: Colors.grey[300],
                     child: const Center(child: CircularProgressIndicator()),
                   ),
                   errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                 ),
                // Image.asset(AppAssets.japan,
                //   fit: BoxFit.cover,
                //   ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height:size.height*0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) ,bottomLeft:Radius.circular(10)  ),
                  boxShadow:[ BoxShadow(
                    color: Colors.black54.withValues(alpha: 0.3),
                  ),],
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top:size.height*0.015 ,bottom:size.height*0.005,
                      right:size.width*0.03 ,left:size.width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(article!.title??'No title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:TextStyle(
                            fontFamily: 'SchibstedGrotesk',
                            fontSize:15 ,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w500,
                          ) ,
                        ),
                      ),
                      Text( article!.author??'Unknown Author',
                        maxLines: 1,style:TextStyle(
                          fontFamily: 'SchibstedGrotesk',
                          fontSize:14 ,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                        ) ,),
                    ],

                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
