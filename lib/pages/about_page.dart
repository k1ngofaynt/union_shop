import 'package:flutter/material.dart';
import 'package:union_shop/utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            color: AppColors.background,
            padding: EdgeInsets.all(isMobile ? 16 : 48),
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'About us',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 48),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ParagraphSection(
                  content:
                      'Welcome to the Union Shop!\n\n'
                      'We\'re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!\n\n'
                      'All online purchases are available for delivery or instore collection!\n\n'
                      'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us at hello@upsu.net.\n\n'
                      'Happy shopping!\n\n'
                      'The Union Shop & Reception Team',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _ParagraphSection extends StatelessWidget {
  final String content;

  const _ParagraphSection({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        height: 1.8,
        fontSize: 16,
      ),
    );
  }
}