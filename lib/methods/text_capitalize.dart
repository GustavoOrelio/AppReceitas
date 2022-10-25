import 'package:cardapio/extensions/extension.dart';

String getNewLineString(List<String> names, String emoji) {
  StringBuffer sb = StringBuffer();
  for (String line in names) {
    sb.write("$emoji${"$line\n\n".toTitleCase()}");
  }
  return sb.toString();
}