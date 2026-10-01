import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

import '../../../core/routes/app_routes.dart';

class NewInBookmark extends StatelessWidget {
  final ArticleModel article;
  const NewInBookmark({super.key,
  required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Navigator.pushNamed(context, AppRoutes.article,arguments: article);
    },
      child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title??"",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'SchibstedGrotesk',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF231F20),
                  ),
                ),
                const SizedBox(height: 10),
                 Text(
                  article.source?.name??'',
                  style: TextStyle(
                    fontFamily: 'SchibstedGrotesk',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6265),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl : article.urlToImage??'https://via.placeholder.com/400x200?text=No+Image',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      ),
    );
  }
}