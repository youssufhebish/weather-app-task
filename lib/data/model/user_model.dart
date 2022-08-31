class UserModel {

  String? name;
  String? email;
  String? country;
  String? lat;
  String? lng;
  bool? locationEnabled;

  UserModel({
    this.name,
    this.email,
    this.country,
    this.lat,
    this.lng,
    this.locationEnabled,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    email = json['email']?.toString();
    country = json['country']?.toString();
    lat = json['lat']?.toString();
    lng = json['lng']?.toString();
    locationEnabled = json['location_enabled'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['country'] = country;
    data['lat'] = lat;
    data['lng'] = lng;
    data['location_enabled'] = locationEnabled;
    return data;
  }
}
