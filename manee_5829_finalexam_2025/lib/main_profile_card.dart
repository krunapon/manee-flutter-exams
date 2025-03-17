import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProfileCard(
        name: "Manee Jaidee",
        bio: "Teacher, Coach, Project Manager",
        avatarUrl: "https://gear.kku.ac.th/~krunapon/icons/kanda2021.jpeg",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String bio;
  final String avatarUrl;

  ProfileCard({required this.name, required this.bio, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    // Use this to determine the current orientation
    final orientation = MediaQuery.of(context).orientation;

    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        // Choose different layouts based on orientation
        child:
            orientation == Orientation.portrait
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_buildAvatar(), Center(child: _buildUserInfo())],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAvatar(),
                    SizedBox(width: 16),
                    _buildUserInfo(),
                  ],
                ),
      ),
    );
  }

  // Create a widget for the avatar
  Widget _buildAvatar() {
    return CircleAvatar(radius: 100, backgroundImage: NetworkImage(avatarUrl));
  }

  // Create a widget for the user info (name, title, bio)
  Widget _buildUserInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 16),
        Text(
          bio,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ],
    );
  }
}
