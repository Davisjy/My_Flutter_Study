import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';
import 'package:my_first_flutter/ui/pages/language_page.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    LanguageModel languageModel = SpHelper.getObject<LanguageModel>(Constant.keyLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          IntlUtil.getString(context, Ids.titleSetting)
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.color_lens, color: Colours.gray_66,),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    IntlUtil.getString(context, Ids.titleTheme)
                  ),
                )
              ],
            ),
            children: <Widget>[
              Wrap(
                children: themeColorMap.keys.map((String key) {
                  Color value = themeColorMap[key];
                  return InkWell(
                    onTap: () {
                      SpHelper.putObject(Constant.key_theme_color, key);
                      bloc.sendAppEvent(Constant.type_sys_update);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 36,
                      height: 36,
                      color: value,
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.language,color: Colours.gray_66,),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(IntlUtil.getString(context, Ids.titleLanguage)),
                )
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  languageModel == null ? IntlUtil.getString(context, Ids.languageAuto):
                  IntlUtil.getString(context, languageModel.titleId,
                            languageCode: 'zh', countryCode: 'CH'),
                  style: TextStyle(fontSize: 14,color: Colours.gray_99),
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
            onTap: () {
              NavigatorUtil.pushPage(context, LanguagePage(), pageName: Ids.titleLanguage);
            },
          )
        ],
      ),
    );
  }
}