import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScaffold extends StatefulWidget {
  const WebScaffold({
    Key key,
    this.title,
    this.titleId,
    this.url
  }): super(key: key);

  final String title;
  final String titleId;
  final String url;
  @override
  State<StatefulWidget> createState() {
    return WebScaffoldState();
  }
}

class WebScaffoldState extends State<WebScaffold> {
  void _onPopSelected(String value) {
    switch (value) {
      case "browser":
        NavigatorUtil.launchInBrowser(widget.url, title:
        widget.title ?? IntlUtil.getString(context, widget.titleId));
        break;
      case "collection":
      case "share":
        break;
      default:
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? IntlUtil.getString(context, widget.titleId,),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      actions: <Widget>[
        LikeButton(
          width: 56.0,
          duration: Duration(milliseconds: 500),
        ),
        PopupMenuButton(
          padding: const EdgeInsets.all(0.0),
          onSelected: _onPopSelected,
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(
              value: "browser",
              child: ListTile(
                contentPadding: EdgeInsets.all(0.0),
                dense: false,
                title: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.language,color: Colours.gray_66,size: 22),
                      Gaps.hGap10,
                      Text("浏览器打开", style: TextStyles.listContent,)
                    ],
                  ),
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: "share",
              child: ListTile(
                contentPadding: EdgeInsets.all(0.0),
                dense: false,
                title: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.share, color: Colours.gray_66, size: 22),
                      Gaps.hGap10,
                      Text("分享", style: TextStyles.listContent)
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
    body: WebView(
      onWebViewCreated: (WebViewController webViewController) {

      },
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
    ),
    );
  }
}