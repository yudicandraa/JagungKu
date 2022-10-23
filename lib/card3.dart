import 'package:flutter/material.dart';
import 'camera_page.dart';
import 'package:camera/camera.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 20),
      padding: new EdgeInsets.all(30.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo apa kabar?',
                      style: TextStyle(
                          color: Color(0xff989898),
                          fontFamily: 'PoppinsRegular',
                          fontSize: 12),
                    ),
                    Text(
                      'Yudi Candra',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'Poppins',
                          fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image(image: AssetImage('assets/alarm.png')),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(
                height: 180,
                width: 340,
                child: IconButton(
                  onPressed: () async {
                    await availableCameras().then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Camera(),
                        ),
                      ),
                    );
                  },
                  icon: Image(image: AssetImage('assets/jagungku.png')),
                  iconSize: 200,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: Image(image: AssetImage('assets/line.png'))),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: Image(image: AssetImage('assets/informasi.png'))),
            Container(
                margin: const EdgeInsets.only(top: 15),
                child: Image(image: AssetImage('assets/tentang.png'))),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image(image: AssetImage('assets/bantuan.png'))),
          ],
        ),
      ),
    ));
  }
}
