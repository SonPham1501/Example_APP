import 'package:test_app/features/test/domain/models/test/quill_content/quill_content.dart';

import 'models/test_content_operator_model.dart';

class TestUltis {
  static stringToOperators(String text) {
    List<ITestContentOperatorModel> _arr = [];
    var _text = text.trim();

    //  const _regex = type == 'correct_form' ? new RegExp(/\((.*?)\)/, 'g') : new RegExp(/_{2,}/, 'g');
    final _regex = RegExp(r'_{2,}');

    const _placeholder = r"$__$";

    _text = _text.replaceAll(_regex, _placeholder);
    var _matches = _regex.allMatches(_text).toList();
    //  const _input_length = _matches?.length ?? 0;
    if (_matches.isNotEmpty) {
      while (_text.contains(_placeholder)) {
        var _parts = _text.split(_placeholder);
        if (_parts[0].isNotEmpty) {
          _arr.add(ITestContentOperatorModel(type: 'text', value: _parts[0]));
        }
        _arr.add(
          ITestContentOperatorModel(
            type: 'input',
            value: "",
            index: _arr.where((x) => x.type == 'input').length,
          ),
        );
        if (_parts[1].isNotEmpty) {
          _arr.add(ITestContentOperatorModel(type: 'text', value: _parts[1]));
        }
        var _length = _parts[0].length + _parts[1].length + _placeholder.length;
        _text = _text.substring(_length);
      }
    }
    return _arr;
  }

  static quillContentToString(QuillContent? value) {
    if (value == null) return "";
    return value.operations.map((e) => e.content ?? "").join("");
  }
}
