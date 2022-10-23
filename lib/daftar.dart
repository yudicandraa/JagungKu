import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jagungku/login.dart';
import 'package:jagungku/user_model.dart';

class DaftarAkun extends StatefulWidget {
  const DaftarAkun({Key? key}) : super(key: key);

  @override
  State<DaftarAkun> createState() => _DaftarAkunState();
}

class _DaftarAkunState extends State<DaftarAkun> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nama = new TextEditingController();
  TextEditingController noHp = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image(image: AssetImage('assets/bolalogin.png')),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage('assets/slmtdatang.png')),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width: 180,
                      margin: EdgeInsets.only(bottom: 30),
                      //alignment: Alignment(0.0, -1.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image(image: AssetImage('assets/fb.png')),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Color(0xffff364715),
                                  fontSize: 14,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Center(
                    child: Container(
                      height: 50,
                      width: 180,
                      margin: EdgeInsets.only(bottom: 30),
                      //alignment: Alignment(0.0, -1.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child:
                                  Image(image: AssetImage('assets/google.png')),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                  color: Color(0xffff364715),
                                  fontSize: 14,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Image(image: AssetImage('assets/ataudaftardisini.png')),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: TextFormField(
                controller: emailController,
                onSaved: (value) {
                  emailController.text = value!;
                },
                decoration: InputDecoration(
                  //fillColor: Color(0xffF1F0F5),
                  //filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Color(0xff989898),
                      fontFamily: 'PoppinsRegular',
                      fontSize: 14),
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.only(right: 20.0, left: 20, bottom: 10),
              child: TextFormField(
                controller: passwordController,
                onSaved: (value) {
                  passwordController.text = value!;
                },
                decoration: InputDecoration(
                  //fillColor: Color(0xffF1F0F5),
                  //filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  labelText: 'Kata Sandi',
                  labelStyle: TextStyle(
                      color: Color(0xff989898),
                      fontFamily: 'PoppinsRegular',
                      fontSize: 12),
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.only(right: 20.0, left: 20, bottom: 10),
              child: TextFormField(
                controller: nama,
                onSaved: (value) {
                  nama.text = value!;
                },
                decoration: InputDecoration(
                  //fillColor: Color(0xffF1F0F5),
                  //filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  labelText: 'Nama Lengkap',
                  labelStyle: TextStyle(
                      color: Color(0xff989898),
                      fontFamily: 'PoppinsRegular',
                      fontSize: 12),
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.only(right: 20.0, left: 20, bottom: 10),
              child: TextFormField(
                controller: noHp,
                onSaved: (value) {
                  noHp.text = value!;
                },
                decoration: InputDecoration(
                  //fillColor: Color(0xffF1F0F5),
                  //filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  labelText: 'No. Hp',
                  labelStyle: TextStyle(
                      color: Color(0xff989898),
                      fontFamily: 'PoppinsRegular',
                      fontSize: 12),
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.only(right: 20.0, left: 20, bottom: 10),
              child: TextFormField(
                controller: alamat,
                onSaved: (value) {
                  alamat.text = value!;
                },
                decoration: InputDecoration(
                  //fillColor: Color(0xffF1F0F5),
                  //filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: Color(0xff364715), width: 2.0),
                  ),
                  labelText: 'Alamat',
                  labelStyle: TextStyle(
                      color: Color(0xff989898),
                      fontFamily: 'PoppinsRegular',
                      fontSize: 12),
                ),
              ),
            ),

            //Expanded(
            //  child: Container(
            //    height: 100,
            //  ),
            //),
            Container(
                margin: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Container(
                    height: 50,
                    width: 220,
                    margin: EdgeInsets.only(bottom: 10),
                    //alignment: Alignment(0.0, -1.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff796512),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      onPressed: () {
                        signUp(emailController.text, passwordController.text);
                      },
                      child: Center(
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 14,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah Ada Akun?',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'PoppinsRegular',
                      fontSize: 11),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SignInPage()),
                    );
                  },
                  child: Text(
                    'Masuk Disini',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'Poppins',
                        fontSize: 11),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                height: 100,
              ),
            ),

            // Container(
            //   child: Image(
            //    image: AssetImage('assets/buttom.png'),
            //   fit: BoxFit.cover,
            //   ),
            // )
          ],
        ),
      )),
    );
  }

  void signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.namaLengkap = nama.text;
    userModel.noHp = noHp.text;
    userModel.alamat = alamat.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Pendaftaran Berhasil");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const SignInPage()),
        (route) => false);
  }
}
