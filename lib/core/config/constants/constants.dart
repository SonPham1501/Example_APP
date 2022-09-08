// ignore_for_file: constant_identifier_names

import '../../common/models/models.dart';

class AppFont {
  static const Roboto = 'Roboto';
  static const GoogleSans = 'GoogleSans';
}

class AppStaticData {
  static String defaultAvt = "https://yodo.edu.vn/assets/images/noavatar.gif";
  static String defaultCover =
      "https://storage.googleapis.com/yofun/f2d23b12-1d90-4a34-9913-8233f82ec653.jpg";

  static List<CommonFilterListItem> get testDurations => [
        CommonFilterListItem(id: 10, name: '10 phút'),
        CommonFilterListItem(id: 15, name: '15 phút'),
        CommonFilterListItem(id: 20, name: '20 phút'),
        CommonFilterListItem(id: 30, name: '30 phút'),
        CommonFilterListItem(id: 45, name: '45 phút'),
        CommonFilterListItem(id: 60, name: '60 phút'),
      ];

  static List<CommonFilterListItem> get subjects => [
        CommonFilterListItem(id: 1, name: 'Toán'),
        CommonFilterListItem(id: 2, name: 'Lý'),
        CommonFilterListItem(id: 3, name: 'Hóa'),
        CommonFilterListItem(id: 4, name: 'Ngữ Văn'),
        CommonFilterListItem(id: 5, name: 'Tiếng Anh', description: 'T.Anh'),
        CommonFilterListItem(id: 6, name: 'Địa Lý'),
        CommonFilterListItem(id: 7, name: 'Lịa sử'),
      ];
}
