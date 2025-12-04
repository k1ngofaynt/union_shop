import 'package:flutter/material.dart';
import 'package:union_shop/utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      child: isMobile ? _buildMobileFooter(context) : _buildDesktopFooter(context),
    );
  }