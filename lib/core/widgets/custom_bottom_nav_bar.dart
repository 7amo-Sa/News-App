import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final List<IconData> icons = const [
    Icons.home_outlined,
    Icons.public,
    Icons.bookmark_border,
    Icons.wb_cloudy_outlined,
  ];

  final List<String> labels = const [
    "Home",
    "Explore",
    "Bookmark",
    "Weather",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xffFCE9EE),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final isActive = selectedIndex == index;

          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                horizontal: isActive ? 16 : 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF231F20) : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Icon(
                    icons[index],
                    color: isActive ? Colors.white : const Color(0xFF231F20),
                    size: 24,
                  ),
                  if (isActive) ...[
                    const SizedBox(width: 8),
                    Text(
                      labels[index],
                      style: const TextStyle(
                        fontFamily: 'SchibstedGrotesk',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}