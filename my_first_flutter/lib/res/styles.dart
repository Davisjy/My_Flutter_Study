import 'package:flutter/widgets.dart';
import 'package:my_first_flutter/res/res_index.dart';

class TextStyles {
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colours.text_dark,
    fontWeight: FontWeight.bold
  );

  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.text_normal,
  );

  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray
  );
}

class Decorations {
  static Decoration bottom = BoxDecoration(
    border: Border(bottom: BorderSide(width: 0.33, color: Colours.divider))
  );
}

class Gaps {
  // 水平间距
  static Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static Widget hGap15 = new SizedBox(width: Dimens.gap_dp15);

  // 垂直间距
  static Widget vGap5 = new SizedBox(height: Dimens.gap_dp5);
  static Widget vGap10 = new SizedBox(height: Dimens.gap_dp10);
  static Widget vGap15 = new SizedBox(height: Dimens.gap_dp15);
}