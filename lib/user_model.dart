class UserModel {
  String? uid;
  String? namaLengkap;
  String? email;
  String? noHp;
  String? alamat;

  UserModel({this.uid, this.email, this.namaLengkap, this.noHp, this.alamat});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      namaLengkap: map['namaLengkap'],
      noHp: map['noHp'],
      alamat: map['alamat'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'namaLengkap': namaLengkap,
      'noHp': noHp,
      'alamat': alamat,
    };
  }
}
