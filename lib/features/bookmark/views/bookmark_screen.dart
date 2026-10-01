import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_colors.dart';
import '../../home/cubits/everything/news_cubit.dart';
import '../../home/cubits/everything/news_state.dart';
import '../widgets/new_in_bookmark.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        toolbarHeight: size.height * 0.13,
        title: Padding(
          padding: const EdgeInsets.only(top: 55),
          child: const Text(
            'Bookmark',
            style: TextStyle(
              fontFamily: 'SchibstedGrotesk',
              fontSize: 32,
              color: Color(0xff231F20),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          final bookmarkedNews = context.read<NewsCubit>().bookmarks;

          if (bookmarkedNews.isEmpty) {
            return const Center(
              child: Text(
                "No items in bookmark",
                style: TextStyle(fontFamily: 'SchibstedGrotesk', fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: bookmarkedNews.length,
            itemBuilder: (context, index) {
              final item = bookmarkedNews[index];

              return Dismissible(
                key: Key(item.title ?? index.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.red.withOpacity(0.1),
                  child: const Icon(Icons.delete, color: Colors.red),
                ),
                confirmDismiss: (direction) async {
                  return await _showDeleteDialog(context, item);
                },
                onDismissed: (direction) {
                  context.read<NewsCubit>().toggleBookmark(item);
                },
                child: NewInBookmark(article: item),
              );
            },
          );
        },
      ),
    );
  }
  Future<bool?> _showDeleteDialog(BuildContext context, dynamic item) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Sure You want to delete this item?",
              style: TextStyle(
                fontFamily: 'SchibstedGrotesk',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
               // border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'SchibstedGrotesk',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff231F20),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.author ?? 'Unknown Author',
                          style: const TextStyle(
                            fontFamily: 'SchibstedGrotesk',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6D6265),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.urlToImage ?? '',
                      height: 65,
                      width: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 60),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
                  ),
                  child: const Text("Yes, Delete", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(128)),
                  ),
                  child: const Text("No", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
