import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jagungku/user_model.dart';

class Card1 extends StatefulWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loginUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loginUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 90, bottom: 20),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage('assets/fotoprofil.png')),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              'Akun',
              style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: 18),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/iconprofil.png')),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'nama lengkap',
                              style: TextStyle(
                                  color: Color(0xff989898),
                                  fontFamily: 'PoppinsRegular',
                                  fontSize: 12),
                            ),
                            Text(
                              '${loginUser.namaLengkap}',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage('assets/icontelp.png')),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'no. Hp',
                              style: TextStyle(
                                  color: Color(0xff989898),
                                  fontFamily: 'PoppinsRegular',
                                  fontSize: 12),
                            ),
                            Text(
                              '${loginUser.noHp}',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage('assets/iconemail.png')),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'email',
                              style: TextStyle(
                                  color: Color(0xff989898),
                                  fontFamily: 'PoppinsRegular',
                                  fontSize: 12),
                            ),
                            Text(
                              '${loginUser.email}',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage('assets/peta.png')),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'alamat',
                              style: TextStyle(
                                  color: Color(0xff989898),
                                  fontFamily: 'PoppinsRegular',
                                  fontSize: 12),
                            ),
                            Text(
                              '${loginUser.alamat}',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
