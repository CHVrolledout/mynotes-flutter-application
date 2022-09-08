import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _email,
                enableSuggestions: true,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(255, 255, 132, 0)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _password,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(255, 255, 132, 0)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  labelText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.blue))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    // ignore: avoid_print
                    print(userCredential);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      debugPrint('User not found');
                    } else if (e.code == 'wrong-password') {
                      // ignore: avoid_print
                      print("wrong password");
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(45, 3, 35, 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an Account"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/register/', (route) => false);
                  },
                  child: Text("Register Now"),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
