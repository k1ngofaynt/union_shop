import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/utils/constants.dart';

class CollectionCard extends StatefulWidget {
  final Collection collection;
  final VoidCallback onTap;

  const CollectionCard({
    Key? key,
    required this.collection,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CollectionCard> createState() => _CollectionCardState();
}
class _CollectionCardState extends State<CollectionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.15 : 0.08),
                blurRadius: _isHovered ? 12 : 8,
                offset: Offset(0, _isHovered ? 6 : 4),
              ),
            ],
          ),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Section
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        widget.collection.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.background,
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 48,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
