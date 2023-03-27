class FirstModel {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  FirstModel({this.time, this.disclaimer, this.chartName, this.bpi});

  FirstModel.fromJson(Map<dynamic, dynamic> json) {
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    disclaimer = json['disclaimer'];
    chartName = json['chartName'];
    bpi = json['bpi'] != null ? new Bpi.fromJson(json['bpi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    data['disclaimer'] = this.disclaimer;
    data['chartName'] = this.chartName;
    if (this.bpi != null) {
      data['bpi'] = this.bpi!.toJson();
    }
    return data;
  }
}

class Time {
  String? updated;
  String? updatedISO;
  String? updateduk;

  Time({this.updated, this.updatedISO, this.updateduk});

  Time.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    updatedISO = json['updatedISO'];
    updateduk = json['updateduk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['updatedISO'] = this.updatedISO;
    data['updateduk'] = this.updateduk;
    return data;
  }
}

class Bpi {
  USD? uSD;
  USD? gBP;
  USD? eUR;

  Bpi({this.uSD, this.gBP, this.eUR});

  Bpi.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
    gBP = json['GBP'] != null ? new USD.fromJson(json['GBP']) : null;
    eUR = json['EUR'] != null ? new USD.fromJson(json['EUR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSD != null) {
      data['USD'] = this.uSD!.toJson();
    }
    if (this.gBP != null) {
      data['GBP'] = this.gBP!.toJson();
    }
    if (this.eUR != null) {
      data['EUR'] = this.eUR!.toJson();
    }
    return data;
  }
}

class USD {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  USD({this.code, this.symbol, this.rate, this.description, this.rateFloat});

  USD.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    description = json['description'];
    rateFloat = json['rate_float'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['rate'] = this.rate;
    data['description'] = this.description;
    data['rate_float'] = this.rateFloat;
    return data;
  }
}
