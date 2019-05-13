import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LanguagePageState();
  }
}

class _LanguagePageState extends State<LanguagePage> {
  List<LanguageModel> _list = List();

  LanguageModel _currentLanguage;

  @override
  void initState() {
    super.initState();
    _list.add(LanguageModel(Ids.languageAuto, '', ''));
    _list.add(LanguageModel(Ids.languageZH, 'zh', 'CH'));
    _list.add(LanguageModel(Ids.languageTW, 'zh', 'TW'));
    _list.add(LanguageModel(Ids.languageHK, 'zh', 'HK'));
    _list.add(LanguageModel(Ids.languageEN, 'en', 'US'));

    _currentLanguage = SpHelper.getObject<LanguageModel>(Constant.keyLanguage);
    if (ObjectUtil.isEmpty(_currentLanguage)) {
      _currentLanguage = _list[0];
    }
    _updateData();
  }

  void _updateData() {
    LogUtil.e("currentLanguage:" + _currentLanguage.toString());
    String language = _currentLanguage.countryCode;
    for (int i = 0, length = _list.length; i < length; i++) {
      _list[i].isSelected = (_list[i].countryCode == language);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          IntlUtil.getString(context, Ids.titleLanguage),
          style: TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(12),
            child: SizedBox(
              width: 64,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.indigoAccent,
                child: Text(
                  IntlUtil.getString(context, Ids.save),
                  style: TextStyle(fontSize: 12),
                ),
                onPressed: () {
                  SpHelper.putObject(Constant.keyLanguage, 
                    ObjectUtil.isEmpty(_currentLanguage.languageCode)?null:_currentLanguage
                  );
                  bloc.sendAppEvent(Constant.type_sys_update);
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          LanguageModel model = _list[index];
          return ListTile(
            title: Text(
              (model.titleId == Ids.languageAuto ? IntlUtil.getString(context, model.titleId):
              IntlUtil.getString(context, model.titleId, languageCode: "zh", countryCode: "CH"))
            ),
            trailing: Radio(
              value: true,
              groupValue: model.isSelected == true,
              activeColor: Colors.indigoAccent,
              onChanged: (value) {
                setState(() {
                  _currentLanguage = model;
                  _updateData();
                });
              },
            ),
            onTap: () {
              setState(() {
                _currentLanguage = model;
                _updateData();
              });
            },
          );
        },
      ),
    );
  }
}