class FriendsModel {
  int? id;
  String? name;
  int? mobNo;
  String? address;
  String? landmark;
  int? pincode;

  FriendsModel(
      {required this.id,
      required this.name,
      required this.mobNo,
      required this.address,
      required this.landmark,
      required this.pincode});

  factory FriendsModel.fromJson(Map<String, dynamic> json) => FriendsModel(
        id: json["id"],
        name: json["name"],
        mobNo: json["mobNo"],
        address: json["address"],
        landmark: json["landmark"],
        pincode: json["pincode"],
      );
}
