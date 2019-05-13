import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';

class TreeItem extends StatelessWidget {
  const TreeItem(this.model, {Key key}) : super(key: key);
  final TreeModel model;

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = model.children.map((TreeModel _model) {
      return Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        key: ValueKey(_model.name),
        backgroundColor: Utils.getChipBgColor(_model.name),
        label: Text(
          _model.name,
          style: TextStyle(fontSize: 14),          
        ),
      );
    }).toList();

    return InkWell(
      onTap: () {
        NavigatorUtil.pushTabPage(context,
        labelId: Ids.titleSystemTree,title: model.name, treeModel: model);
      },
      child: _ChipsTile(
        label: model.name,
        children: chips,
      ),
    );
  }
}

class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key key,
    this.label,
    this.children
  });
  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = [
      Text(label,
      style: TextStyles.listTitle,),
      Gaps.vGap10
    ];
    cardChildren.add(Wrap(
      children: children.map((Widget chip) {
        return Padding(padding: const EdgeInsets.all(3),
        child: chip,);
      }).toList(),
    ));

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: cardChildren,
      ),
      decoration: Decorations.bottom,
    );
  }
}