class OutputModel {
  String? uid;
  String? hasil;
  String? jenis;
  String? persen;

  OutputModel({
    this.uid,
    this.hasil,
    this.jenis,
    this.persen,
  });

  factory OutputModel.fromMap(map) {
    return OutputModel(
      uid: map['uid'],
      hasil: map['hasil'],
      jenis: map['jenis'],
      persen: map['persen'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'hasil': hasil,
      'jenis': jenis,
      'persen': persen,
    };
  }
}
