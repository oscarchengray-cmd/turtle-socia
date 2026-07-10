import 'package:flutter/material.dart';
import 'package:turtle_social/ui/SignIn.dart';
import 'package:turtle_social/ui/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFF303F7D),
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 130),
            ShaderMask(
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  colors: <Color>[Color(0xFFB4B2D5), Color(0xFF4C76DB)],
                ).createShader(rect);
              },
              child: Text(
                "Welcome back!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "請輸入您的email",
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _email.clear(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Color(0xFFB4B2D5),
                    ),
                  ),

                  SizedBox(height: 30),

                  Container(
                    width: 350,
                    height: 50,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hint: Text(
                          "password",
                          style: TextStyle(color: Colors.white.withAlpha(100)),
                        ),
                        border: OutlineInputBorder(),
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
                          MaterialPageRoute(builder: (context) => home()),
                        );
                      },
                      child: Text("登入"),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()),);
                    },
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return LinearGradient(
                          colors: <Color>[Color(0xFF0CA8DB), Color(0xFF4C76DB)],
                        ).createShader(rect);
                      },
                      child: Text(
                        "沒有帳號？ 點我註冊！",
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
