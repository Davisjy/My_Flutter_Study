import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/common.dart';
import 'package:my_first_flutter/res/res_index.dart';
import 'package:lpinyin/lpinyin.dart';

class Utils {
  static String getImgPath(String name, {String format: "png"}) {
    return "assets/images/$name.$format";
  }

  static String getPinyin(String str){
    return PinyinHelper.getShortPinyin(str).substring(0, 1).toUpperCase();
  }

  static Color GetCircleBg(String str) {
    String pinyin = getPinyin(str);
    return getCircleAvatarBg(str);
  }

  static Color getCircleAvatarBg(String key) {
    return circleAvatarMap[key];
  }

  static Color getChipBgColor(String name) {
    String pinyin = PinyinHelper.getFirstWordPinyin(name);
    pinyin = pinyin.substring(0, 1).toUpperCase();
    return nameToColor(name);
  }

  static Color nameToColor(String name) {
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  static String getTimeLine(BuildContext context, int timeMillis) {
    return TimelineUtil.format(timeMillis, locale: Localizations.localeOf(context).languageCode,
    dayFormat: DayFormat.Common);
  }

  static double getTitleFontSize(String title) {
    if (ObjectUtil.isEmpty(title) || title.length < 10) {
      return 18.0;
    }
    int count = 0;
    List<String> list = title.split("");
    for (int i = 0, length = list.length; i<length; i++) {
      String ss = list[i];
      if (RegexUtil.isZh(ss)) {
        count++;
      }
    }
    return (count >= 10 || title.length > 16) ? 14:18;
  }

  static int getUpdateStatus(String version) {
    String locVersion = AppConfig.version;
    int remote = int.tryParse(version.replaceAll(".", ""));
    int loc = int.tryParse(locVersion.replaceAll(".", ""));
    if (remote <= loc) {
      return 0;
    } else {
      return (remote - loc >= 2) ? -1 : 1;
    }
  }
}