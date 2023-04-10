class task {
  S1? s1;
  String? vd1;
  S2? s2;

  task({this.s1, this.vd1, this.s2});

  task.fromJson(Map<dynamic, dynamic> json) {
    s1 = json['s1'] != null ? new S1.fromJson(json['s1']) : null;
    vd1 = json['vd1'];
    s2 = json['s2'] != null ? new S2.fromJson(json['s2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.s1 != null) {
      data['s1'] = this.s1!.toJson();
    }
    data['vd1'] = this.vd1;
    if (this.s2 != null) {
      data['s2'] = this.s2!.toJson();
    }
    return data;
  }
}

class S1 {
  String? m1;
  String? m2;
  String? m3;
  String? m4;
  String? m5;

  S1({this.m1, this.m2, this.m3, this.m4, this.m5});

  S1.fromJson(Map<String, dynamic> json) {
    m1 = json['m1'];
    m2 = json['m2'];
    m3 = json['m3'];
    m4 = json['m4'];
    m5 = json['m5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m1'] = this.m1;
    data['m2'] = this.m2;
    data['m3'] = this.m3;
    data['m4'] = this.m4;
    data['m5'] = this.m5;
    return data;
  }
}

class S2 {
  String? m1;
  String? m2;
  String? m3;
  String? m4;
  String? m5;
  String? m6;
  String? m7;
  String? m8;
  String? m9;
  String? m10;
  String? m11;
  String? m12;

  S2(
      {this.m1,
      this.m2,
      this.m3,
      this.m4,
      this.m5,
      this.m6,
      this.m7,
      this.m8,
      this.m9,
      this.m10,
      this.m11,
      this.m12});

  S2.fromJson(Map<String, dynamic> json) {
    m1 = json['m1'];
    m2 = json['m2'];
    m3 = json['m3'];
    m4 = json['m4'];
    m5 = json['m5'];
    m6 = json['m6'];
    m7 = json['m7'];
    m8 = json['m8'];
    m9 = json['m9'];
    m10 = json['m10'];
    m11 = json['m11'];
    m12 = json['m12'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m1'] = this.m1;
    data['m2'] = this.m2;
    data['m3'] = this.m3;
    data['m4'] = this.m4;
    data['m5'] = this.m5;
    data['m6'] = this.m6;
    data['m7'] = this.m7;
    data['m8'] = this.m8;
    data['m9'] = this.m9;
    data['m10'] = this.m10;
    data['m11'] = this.m11;
    data['m12'] = this.m12;
    return data;
  }
}
