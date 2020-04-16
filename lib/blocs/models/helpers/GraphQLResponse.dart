import 'package:meta/meta.dart';


class GraphQLResponse<T> extends MapObject {
  GraphQLResponse(this.dataCreator, Map<String, dynamic> mapObject) {
    super.map = mapObject;
  }

  Function dataCreator;

  T get data => dataCreator(super.map) as T;

  List<GraphQLExceptionErrorEntry> _errors;
  List<GraphQLExceptionErrorEntry> get errors {
    if (_errors != null) return _errors;

    _errors = [];
    List<Map<String, dynamic>> errList =
        (MapObject.get(this, "errors") as List<dynamic>)
            ?.cast<Map<String, dynamic>>();
    for (Map<String, dynamic> err in errList ?? []) {
      _errors.add(GraphQLExceptionErrorEntry());
      _errors.last.message = err["message"] as String;
      _errors.last.locations = [];
      for (Map<String, dynamic> location in err["locations"] ?? []) {
        _errors.last.locations.add(GraphQLExceptionErrorLocation(
            location["line"] as int, location["column"] as int));
      }
    }
    return _errors;
  }

  bool hasError() => errors.isNotEmpty;
}


class MapObject {
  @protected
  Map<String, dynamic> map = <String, dynamic>{};

  MapObject();
  MapObject.fromMap(this.map) {
    compact();
  }

  static dynamic get(dynamic obj, String key) => obj[key];

  void compact() {
    List<String> keys = [];
    List<dynamic> values = <dynamic>[];
    map.forEach((key, dynamic value) {
      if (value != null) {
        keys.add(key);
        values.add(value);
      }
    });
    map = Map<String, dynamic>.fromIterables(keys, values);
  }

  dynamic operator [](String key) => map[key];

  dynamic toJson() => map;

  @override
  String toString() => map.toString();
}

class GraphQLExceptionErrorEntry {
  String message;
  List<GraphQLExceptionErrorLocation> locations = [];

  GraphQLExceptionErrorEntry([this.message, this.locations]);

  @override
  String toString() {
    if (message != null && locations != null && locations.isNotEmpty) {
      return "$message at (${locations.join(",")})";
    }

    if (message == null && locations != null && locations.isNotEmpty) {
      return "${locations.join(",")}";
    }

    return message;
  }
}

class GraphQLExceptionErrorLocation {
  int line;
  int column;

  GraphQLExceptionErrorLocation([this.line, this.column]);

  @override
  String toString() {
    if (line != null && column != null) return "$line:$column";
    if (line != null) return "$line";
    if (column != null) return "$column";
    return "";
  }
}