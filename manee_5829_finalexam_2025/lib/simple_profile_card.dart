import 'package:flutter/material.dart';

class SimpleProfileCard extends StatefulWidget {
  // Required parameter - the user's name
  final String name;
  final String program;

  // Optional parameter - the theme color
  final Color themeColor;

  const SimpleProfileCard({
    Key? key,
    required this.name,
    this.program = "DME",
    this.themeColor = Colors.blue,
  }) : super(key: key);

  @override
  State<SimpleProfileCard> createState() => _SimpleProfileCardState();
}

class _SimpleProfileCardState extends State<SimpleProfileCard> {
  @override
  Widget build(BuildContext context) {
    // Get current screen width to determine layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine layout based on screen width
    // Wide layout for tablets/desktop: width > 600
    // Narrow layout for phones: width <= 600
    final isWideLayout = screenWidth > 600;

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: widget.themeColor.withOpacity(0.3), width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            isWideLayout
                ? _buildWideLayout() // Horizontal layout for wide screens
                : _buildNarrowLayout(), // Vertical layout for narrow screens
      ),
    );
  }

  // Horizontal layout for tablets and larger screens
  Widget _buildWideLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildProfileImage(),
        const SizedBox(width: 20),
        _buildTextWidget(widget.name),
        const SizedBox(width: 20),
        _buildTextWidget(widget.program),
      ],
    );
  }

  // Vertical layout for phones and smaller screens
  Widget _buildNarrowLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage(),
        const SizedBox(height: 16),
        _buildTextWidget(widget.name),
        const SizedBox(height: 16),
        _buildTextWidget(widget.program),
      ],
    );
  }

  // Profile image widget
  Widget _buildProfileImage() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: widget.themeColor.withOpacity(0.2),
      child: Text(
        widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '?',
        style: TextStyle(
          fontSize: 36,
          color: widget.themeColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Name widget
  Widget _buildTextWidget(String textVal) {
    return Text(
      textVal,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
