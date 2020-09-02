class BarbersModel {
  String uid;
  String name;
  String startHour;
  String endHour;

  BarbersModel({this.uid, this.name, this.startHour, this.endHour});

  BarbersModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    startHour = json['startHour'];
    endHour = json['endHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['uid'] = this.uid;
    data['name'] = this.name;
    data['startHour'] = this.startHour;
    data['endHour'] = this.endHour;

    return data;
  }
}
