import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String imageUrl;
  final String title;
  final String caption;

  SlideInfo({
    required this.imageUrl,
    required this.title,
    required this.caption,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Search for the food',
    imageUrl: 'assets/images/1.png',
    caption:
        'Ea eiusmod labore occaecat anim dolore cillum. Duis aute mollit ut pariatur ipsum veniam. Quis ipsum ea elit ad eu eu. Aliquip excepteur aliquip amet occaecat in qui aute dolor in consectetur cillum labore Lorem deserunt.',
  ),
  SlideInfo(
    title: 'Fast Delivery',
    imageUrl: 'assets/images/2.png',
    caption:
        'Ea eiusmod labore occaecat anim dolore cillum. Duis aute mollit ut pariatur ipsum veniam. Quis ipsum ea elit ad eu eu. Aliquip excepteur aliquip amet occaecat in qui aute dolor in consectetur cillum labore Lorem deserunt.',
  ),
  SlideInfo(
    title: 'Enjoy the food',
    imageUrl: 'assets/images/3.png',
    caption:
        'Ea eiusmod labore occaecat anim dolore cillum. Duis aute mollit ut pariatur ipsum veniam. Quis ipsum ea elit ad eu eu. Aliquip excepteur aliquip amet occaecat in qui aute dolor in consectetur cillum labore Lorem deserunt.',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'AppTutorialScreen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= slides.length - 1) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => Slide(
                      imageUrl: slide.imageUrl,
                      title: slide.title,
                      caption: slide.caption,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Skip'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 40,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    duration: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Start'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String caption;

  const Slide(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.caption});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
