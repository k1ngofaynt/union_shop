import 'package:flutter/material.dart';
import 'package:union_shop/utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: const Color(0xFF2C2C2C),
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
             // Opening Hours
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  footerTitle('Opening Hours'),
                  const SizedBox(height: 16),
                  _footerText('❄️ Winter Break Closure Dates ❄️'),
                  const SizedBox(height: 8),
                  _footerText('Closing 4pm 19/12/2025'),
                  _footerText('Reopening 10am 05/01/2026'),
                  _footerText('Last post date: 12pm on 18/12/2025'),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerTitle('Newsletter'),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Subscribe'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(color: Colors.white30),
        const SizedBox(height: 16),
        Text(
          '© 2025 Union Shop. All rights reserved.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
              ),
        ),
      ],
    );
  }
  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _footerTitle('About Us'),
        const SizedBox(height: 12),
        _footerLink(context, 'About Union Shop'),
        _footerLink(context, 'Our Story'),
        const SizedBox(height: 24),
        _footerTitle('Shop'),
        const SizedBox(height: 12),
        _footerLink(context, 'Collections'),
        _footerLink(context, 'Sale Items'),
        const SizedBox(height: 24),
        _footerTitle('Newsletter'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
            const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Subscribe'),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '© 2025 Union Shop. All rights reserved.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
              ),
        ),
      ],
    );
  }
  Widget _footerTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _footerLink(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {},
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
  
  
  