import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';

class ReposItem extends StatelessWidget {

  const ReposItem(this.model, {Key key, this.isHome}): super(key: key);

  final ReposModel model;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigatorUtil.pushWeb(context, title: model.title, url: model.link, isHome: isHome);
      },
      child: Container(
        height: 160,
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listTitle,
                    ),
                  Gaps.vGap10,
                  Expanded(
                    flex: 1,
                    child: Text(
                      model.desc,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.listContent,
                    ),
                  ),
                  Gaps.vGap5,
                  Row(children: <Widget>[
                    Text(
                      model.author,
                      style: TextStyles.listExtra,
                    ),
                    Gaps.hGap10,
                    Text(
                      Utils.getTimeLine(context, model.publishTime)
                    )
                  ],)
                ],
              ),
            ),
            Container(
              width: 72,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10),
              child: CachedNetworkImage(
                width: 72,
                height: 128,
                fit: BoxFit.fill,
                imageUrl: model.envelopePic,
                placeholder: (context, url) => ProgressView(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.33,
              color: Colours.divider
            )
          )
        ),
      ),
    );
  }
}