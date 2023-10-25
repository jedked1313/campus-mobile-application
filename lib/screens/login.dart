import 'package:flutter/material.dart';
import 'package:flutter_p/api/requests.dart';
import 'package:flutter_p/main.dart';
import 'package:flutter_p/screens/teacher_screens/teacher_home.dart';
import 'package:flutter_p/standerds/standerds.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final Requests _requests = Requests();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            color1.withOpacity(0.6),
            color1.withOpacity(0.7),
            color1.withOpacity(0.9),
          ])),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            color1.withOpacity(0.6),
            color1.withOpacity(0.7),
            color1.withOpacity(0.9),
          ]),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 15,
            ),
            Column(
              children: const [
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome To Our App",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10)
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formState,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(70, 147, 153, 1)))),
                            child: TextFormField(
                              validator: (value) {
                                return validInput(value!, 6, 20);
                              },
                              controller: username,
                              decoration: const InputDecoration(
                                  hintText: "Enter Your Number",
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(70, 147, 153, 1),
                                      fontSize: 12),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(70, 147, 153, 1)))),
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) {
                                return validInput(value!, 6, 20);
                              },
                              controller: password,
                              decoration: const InputDecoration(
                                  hintText: "Enter Your Password",
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(70, 147, 153, 1),
                                      fontSize: 12),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Color.fromRGBO(70, 147, 153, 1),
                              fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: (() {
                        login();
                      }),
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              colors: [
                                color1.withOpacity(0.8),
                                color1,
                              ]),
                          color: color1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  login() async {
    if (formState.currentState!.validate()) {
      var response = await _requests.postRequest(linkLogin, {
        "username": username.text,
        "password": password.text,
      });
      if (response['status'] == "success") {
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString("username", response['data']['username']);
        sharedPref.setString("password", response['data']['password']);
        sharedPref.setString(
            "isTeacher", response['data']['isTeacher'].toString());
        if (!mounted) return;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    sharedPref.getString("isTeacher").toString() == "1"
                        ? const TeacherHome()
                        : const Home()));
      } else {
        if (!mounted) return;
        showAlertDialog(context, "Invalied Information..!",
            "Wrong uesrname or password or you'r unregistered");
      }
    }
  }
}
