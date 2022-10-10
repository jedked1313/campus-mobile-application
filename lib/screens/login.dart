import 'package:flutter/material.dart';

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
            Colors.cyan.shade500,
            Colors.cyan.shade300,
            Colors.cyan.shade400,
          ])),
        ),
      ),
      body: Container(
        height: 900,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
            Colors.cyan.shade500,
            Colors.cyan.shade300,
            Colors.cyan.shade400,
          ]),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              children: const [
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome To Our App",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10)
              ],
            ),
            Container(
              height: 800,
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
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: "Enter your password",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.cyan[500],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
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
