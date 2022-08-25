class StringUltis {
  static String removeHtmlEntities(String str) {
    return str.replaceAll(RegExp(r"<(.|\n)*?>"), "");
  }

  static bool isContainHtmlTag(String str) =>
      str.contains(RegExp("<(.|\n)*?>"));
  static String toABC(int i) => String.fromCharCode(i + 65);
}

extension RegExpExtension on RegExp {
  List<String> allMatchesWithSep(String input, [int start = 0]) {
    var result = <String>[];
    for (var match in allMatches(input, start)) {
      result.add(input.substring(start, match.start));
      result.add(match[0] ?? "");
      start = match.end;
    }
    result.add(input.substring(start));
    return result.where((element) => element.length > 0).toList();
  }
}
