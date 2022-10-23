import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:jagungku/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome(), debugShowCheckedModeBanner: false);
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover)),
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.topCenter,
                    child: Image(image: AssetImage('assets/logojagungku.png')),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 180,
                      margin: EdgeInsets.only(bottom: 25),
                      //alignment: Alignment(0.0, -1.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffEF920F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SignInPage()),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Getting Started',
                            style: TextStyle(
                                color: Color(0xffff364715),
                                fontSize: 14,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
