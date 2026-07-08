import 'package:flutter/material.dart';
import 'package:turtle_social/ui/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151E2A),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (Rect rect) {
              return LinearGradient(
                colors: <Color>[Color(0xFF0CA8DB), Color(0xFF4C76DB)],
              ).createShader(rect);
            },
            child: Text(
              "Welcome back!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
          ),

          Container(width: 350, height: 50, child: TextField()),

          Container(width: 350, height: 50, child: TextField()),

          Container(
            width: 400,
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => home()),
                );
              },
              child: Text("login"),
            ),
          ),
        ],
      ),
    );
  }
}
