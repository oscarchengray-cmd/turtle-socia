// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _signIn = GoogleSignIn();
//
//   Future<User?> signInGoogle() async{
//     try {
//       //觸發 Google 選擇帳號視窗
//       final GoogleSignInAccount? googleUser = await _signIn.signIn();
//       if(googleUser == null) return null;
//
//       //取得身份驗證詳細資料
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//       //建立 Firebase 憑證
//       final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken
//       );
//
//       //登入 Firebase
//       final UserCredential userCredential = await _auth.signInWithCredential(credential);
//       return userCredential.user;
//     } catch(e){
//       print(e);
//       return null;
//     }
//   }
//
//   Future<void> signOut() async {
//     await _signIn.signOut();
//     await _auth.signOut();
//   }
// }