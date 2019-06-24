import 'package:fl_bloc_playground/src/utils/enum_from_string.dart';

enum Source { terminal, kisok, concierge }

class Terminal {
  String id;
  String name;
  String token;
  bool cityConnectPass;
  dynamic locale;
  Source source;

  Terminal.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['name'],
        token = parsedJson['token'],
        cityConnectPass = parsedJson['city_connect_pass'],
        locale = parsedJson['locale'],
        source = EnumUtil.fromStringEnum(Source.values, parsedJson['source']);
}
