import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

import '../../../core/routes/app_routes.dart';

class PopularNewsCard extends StatelessWidget {
  final ArticleModel? article;
  const PopularNewsCard({
    super.key,
    required this.article
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.article,arguments: article);
      },
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl : article!.urlToImage??'https://via.placeholder.com/400x200?text=No+Image',
                height: 220,
                width: 240,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.broken_image),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article!.title??'No title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xff231F20),
                fontWeight: FontWeight.w600,
                fontFamily: 'SchibstedGrotesk',
              ),
            ),
            const SizedBox(height: 5),
            Text(
              article!.source!.name??'no category',
              style: const TextStyle(
                  fontFamily: 'SchibstedGrotesk',
                color: Color(0xff6D6265),
                fontSize: 14,fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}