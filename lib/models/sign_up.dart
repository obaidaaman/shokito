import 'dart:convert';

// Functions to convert JSON string to UserModel and vice versa
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

// UserModel class
class UserModel {
  int? id;
  String email;
  String username;
  String password;
  Name name;
  Address? address;
  String? phone;

  UserModel({
    this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    this.address,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: Name.fromJson(json["name"]),
    address: json["address"] != null ? Address.fromJson(json["address"]) : null,
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "username": username,
    "password": password,
    "name": name.toJson(),
    "address": address?.toJson(),
    "phone": phone,
  };
}

// Address class
class Address {
  String? city;
  String? street;
  int? number;
  String? zipcode;
  Geolocation? geolocation;

  Address({
    this.city,
    this.street,
    this.number,
    this.zipcode,
    this.geolocation,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
    geolocation: json["geolocation"] != null ? Geolocation.fromJson(json["geolocation"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "street": street,
    "number": number,
    "zipcode": zipcode,
    "geolocation": geolocation?.toJson(),
  };
}

// Geolocation class
class Geolocation {
  String? lat;
  String? long;

  Geolocation({
    this.lat,
    this.long,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

// Name class
class Name {
  String firstname;
  String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
  };
}
