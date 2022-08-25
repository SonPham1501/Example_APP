

class AppDataConfig {
  //danh sách môn học
  //static const List<ListItem> subjects;
  static const _LocalStorageKey storageKey = _LocalStorageKey();
}

class _LocalStorageKey {
  const _LocalStorageKey();
  final String USER_PROFILE = 'user_profile';
}

class ListItem {
  final int id;
  final String name;
  ListItem(this.id, this.name);
}
