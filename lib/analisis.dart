import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jagungku/output_camera.dart';
import 'package:jagungku/output_model.dart';

class HasilAnalisis extends StatefulWidget {
  const HasilAnalisis({Key? key}) : super(key: key);

  @override
  State<HasilAnalisis> createState() => _HasilAnalisisState();
}

class _HasilAnalisisState extends State<HasilAnalisis> {
  String? downloadUrl;
  final ref =
      FirebaseStorage.instance.ref().child("masking.png").getDownloadURL();

  OutputModel hasil = OutputModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("output")
        .doc("hasil")
        .get()
        .then((value) {
      this.hasil = OutputModel.fromMap(value.data());
      print(hasil);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20),
                  child: SizedBox(
                    height: 50,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Gallery()),
                          );
                        },
                        child: Image(image: AssetImage('assets/back.png'))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, right: 20),
                  child: SizedBox(
                    height: 80,
                    child: Image(image: AssetImage('assets/logojagungku.png')),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hasil Analisis',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff505410),
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 400,
                  child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/jagungku-8b732.appspot.com/o/masking.png?alt=media&token=3b52ee2d-de83-485a-860b-23f5ea60d35e')),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Jenis:  ',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff505410),
                            fontSize: 16)),
                    Text('${hasil.jenis}',
                        style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            color: Color(0xff505410),
                            fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Akurasi:  ',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff505410),
                            fontSize: 16)),
                    Text('${hasil.persen}',
                        style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            color: Color(0xff505410),
                            fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Keterangan:  ',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff505410),
                            fontSize: 16)),
                    Text('${hasil.hasil}',
                        style: TextStyle(
                            fontFamily: 'PoppinsRegular',
                            color: Color(0xff505410),
                            fontSize: 16)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
