class BackModel {
  BackModel({
    required this.equipment,
    required this.gifUrl,
    required this.name,
    required this.target,
  });

  BackModel.fromJson(dynamic json) {
    equipment = json['equipment'];
    gifUrl = json['gifUrl'];
    name = json['name'];
    target = json['target'];
  }

  String? equipment;
  String? gifUrl;
  String? name;
  String? target;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['equipment'] = equipment;
    map['gifUrl'] = gifUrl;
    map['name'] = name;
    map['target'] = target;
    return map;
  }
}
