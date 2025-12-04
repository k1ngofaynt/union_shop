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
  Widget _buildDesktopFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // About
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerTitle('About Us'),
                  const SizedBox(height: 12),
                  _footerLink(context, 'About Union Shop'),
                  _footerLink(context, 'Our Story'),
                  _footerLink(context, 'Contact Us'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerTitle('Shop'),
                  const SizedBox(height: 12),
                  _footerLink(context, 'Collections'),
                  _footerLink(context, 'Sale Items'),
                  _footerLink(context, 'New Arrivals'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerTitle('Customer Service'),
                  const SizedBox(height: 12),
                  _footerLink(context, 'FAQ'),
                  _footerLink(context, 'Shipping Info'),
                  _footerLink(context, 'Returns'),
                ],
              ),
            ),