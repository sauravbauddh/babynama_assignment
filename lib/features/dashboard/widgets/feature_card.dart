import 'package:flutter/material.dart';

class FeatureCard extends StatefulWidget {
  final IconData iconData;
  final String text;
  final Color cardColor;
  final VoidCallback cardOnTap;

  const FeatureCard({
    Key? key,
    required this.iconData,
    required this.text,
    required this.cardColor,
    required this.cardOnTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeatureCardState();
  }
}

class _FeatureCardState extends State<FeatureCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.cardOnTap,
      child: Card(
        color: widget.cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.iconData,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
