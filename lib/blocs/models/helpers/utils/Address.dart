import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class Address extends MapObject {
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;

  String get streetAddress1 => map["streetAddress1"] as String;
  set streetAddress1(String value) => map["streetAddress1"] = value;

  String get streetAddress2 => map["streetAddress2"] as String;
  set streetAddress2(String value) => map["streetAddress2"] = value;


  Country get unitLocation {
    if (map['unitLocation'] is Country) return map['unitLocation'] as Country;
    return map['unitLocation'] = Country.fromMap(map['unitLocation'] as Map<String, dynamic>);
  }
  set unitLocation(Country value) => map['unitLocation'] = value;


  String get suburb => map["suburb"] as String;
  set suburb(String value) => map["suburb"] = value;

  String get postalCode => map["postalCode"] as String;
  set postalCode(String value) => map["postalCode"] = value;

  String get city => map["city"] as String;
  set city(String value) => map["city"] = value;

  static Address fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Address()..map = map;
  }

  Address clone() => Address.fromMap(toJson() as Map<String, dynamic>, true);
}