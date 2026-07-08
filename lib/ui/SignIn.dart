import 'package:flutter/material.dart';
import 'package:turtle_social/ui/LogIn.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFF151E2A),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            ShaderMask(
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  colors: <Color>[Color(0xFF0CA8DB), Color(0xFF4C76DB)],
                ).createShader(rect);
              },
              child: Text(
                "Hello!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hint: Text(
                          "email",
                          style: TextStyle(color: Colors.white.withAlpha(100)),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        hint: Text(
                          "password",
                          style: TextStyle(color: Colors.white.withAlpha(100)),
                        ),
                        border: OutlineInputBorder()
                      ),
                    ),
                  ),

                  SizedBox(height: 100),

                  Container(
                    width: 400,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text("註冊"),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return LinearGradient(
                          colors: <Color>[Color(0xFF0CA8DB), Color(0xFF4C76DB)],
                        ).createShader(rect);
                      },
                      child: Text(
                        "已經有帳號？ 點我登入！",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
