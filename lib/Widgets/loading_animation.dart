import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAnimationScreen extends StatefulWidget {
  @override
  _RiveAnimationScreenState createState() => _RiveAnimationScreenState();
}

class _RiveAnimationScreenState extends State<RiveAnimationScreen> {
  final riveFileName =
      'assets/images/loading.riv'; // Update the file name and path accordingly
  late RiveAnimationController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation(
        'State Machine 1'); // Update the animation name accordingly
    _controller.isActive = true; // Start the animation

    // Simulate loading state
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false; // Update the loading state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rive Animation'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : RiveAnimation.asset(
                riveFileName,
                controllers: [_controller],
              ),
      ),
    );
  }
}
