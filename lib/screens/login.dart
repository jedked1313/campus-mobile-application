import 'package:flutter/material.dart';
import 'package:flutter_p/main.dart';
import 'package:flutter_p/standerds/standerds.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Standerds.color1.withOpacity(0.6),
            Standerds.color1.withOpacity(0.7),
            Standerds.color1.withOpacity(0.9),
          ])),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Standerds.color1.withOpacity(0.6),
            Standerds.color1.withOpacity(0.7),
            Standerds.color1.withOpacity(0.9),
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
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(70, 147, 153, 1)))),
                          child: const TextField(
                            decoration: InputDecoration(
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
                                      color: Color.fromRGBO(70, 147, 153, 1)))),
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: "Enter Your Password",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(70, 147, 153, 1),
                                    fontSize: 12),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              colors: [
                                Standerds.color1.withOpacity(0.8),
                                Standerds.color1,
                              ]),
                          color: Standerds.color1,
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
}
