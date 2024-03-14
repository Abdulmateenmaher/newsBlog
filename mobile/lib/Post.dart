import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  const SinglePost({super.key});

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      title: const Text('View Single Post'),
    )
    );
  }
}
