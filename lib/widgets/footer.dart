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
                  _footerText('------------------------'),
                  const SizedBox(height: 12),
                   _footerText('(Term Time)'),
                  _footerText('Monday - Friday 10am - 4pm'),
                  const SizedBox(height: 8),
                  _footerText('(Outside of Term Time / Consolidation Weeks)'),
                  _footerText('Monday - Friday 10am - 3pm'),
                  const SizedBox(height: 8),
                  _footerText('Purchase online 24/7'),
                  
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 _footerTitle('Latest Offers'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                         borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                    ),
                  ),
                  const SizedBox(width: 8),
                   ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text('SUBSCRIBE'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Social Media
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        onPressed: () {},
                        tooltip: 'Facebook',
                      ),
                      IconButton(
                        icon: const Icon(Icons.tag, color: Colors.white),
                    onPressed: () {},
                    tooltip: 'Twitter',
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(color: Colors.white30),
        const SizedBox(height: 16),
        // Payment methods
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            _paymentIcon('Apple Pay'),
            _paymentIcon('Mastercard'),
            _paymentIcon('Visa'),
            _paymentIcon('PayPal'),
            _paymentIcon('Google Pay'),
            _paymentIcon('Shop Pay'),
          ],
        ),
        Text(
          '© 2025, upsu-store',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Powered by Shopify',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
                fontSize: 12,
              ),
        ),
      ],
    );
  }
  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _footerTitle('Opening Hours'),
        const SizedBox(height: 12),
        _footerText('❄️ Winter Break Closure Dates ❄️'),
        const SizedBox(height: 8),
        _footerText('Closing 4pm 19/12/2025'),
        _footerText('Reopening 10am 05/01/2026'),
        const SizedBox(height: 8),
        _footerText('(Term Time)'),
        _footerText('Monday - Friday 10am - 4pm'),
        const SizedBox(height: 8),
        _footerText('Purchase online 24/7'),
        const SizedBox(height: 24),
        _footerTitle('Help and Information'),
        const SizedBox(height: 12),
        _footerLink(context, 'Search'),
        _footerLink(context, 'Terms & Conditions'),
        const SizedBox(height: 24),
        _footerTitle('Latest Offers'),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: TextStyle(color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
               borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
            const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text('SUBSCRIBE'),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.facebook, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.tag, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 24),
          Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _paymentIcon('Apple Pay'),
            _paymentIcon('Mastercard'),
            _paymentIcon('Visa'),
            _paymentIcon('PayPal'),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          '© 2025, upsu-store',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
              ),
        ),
         const SizedBox(height: 4),
        Text(
          'Powered by Shopify',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
                fontSize: 12,
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
  
  
  