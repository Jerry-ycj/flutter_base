import 'package:flutter/material.dart';
import 'package:flutter_base/constant/color.dart';
import 'package:flutter_base/library/screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDialog extends StatefulWidget {
  final List data;

  /// 已经选中的id, 单选时
  final dynamic valueId;
  final String idKey;
  final String nameKey;

  /// screen的计算值-screenUtil
  final int height;

  /// 多选
  final bool multiple;

  // 多选已选的
  final List selects;

  const SelectDialog({
    Key key, this.data, this.valueId,
    this.idKey = "id",
    this.nameKey = "name",
    this.height = 700,
    this.multiple = false,
    this.selects,
  }) :super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectState();
}

class _SelectState extends State<SelectDialog> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapt.init(context);
    List selects0 = this.widget.selects;
    if (selects0 == null) selects0 = [];
    return AlertDialog(
      actions: <Widget>[
        this.widget.multiple ? new FlatButton(
            onPressed: () => Navigator.of(context).pop(selects0),
            child: new Text("确定")) : null,
      ],
      content: Container(
        height: ScreenUtil().setHeight(this.widget.height),
        child: Column(
          children: <Widget>[

            /// dialog中使用listview需要在container中确定宽高
            Container(
              width: ScreenUtil().setWidth(650),
              height: ScreenUtil().setHeight(this.widget.height),
              alignment: Alignment.center,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (BuildContext context, int index) {
                  /// 选中高亮
                  bool highlight;
                  if (this.widget.multiple) {
                    highlight =
                        selects0.firstWhere((element) => element["id"] ==
                            this.widget.data[index]["id"],
                            orElse: () => null) != null;
                  }
                  else
                    highlight = this.widget.valueId != null &&
                        this.widget.valueId ==
                            this.widget.data[index][this.widget.idKey];
                  return FlatButton(
                    onPressed: () {
                      if (this.widget.multiple) {
                        if ((selects0.isEmpty ||
                            selects0.firstWhere((element) =>
                            element["id"] == this.widget.data[index]["id"],
                                orElse: () => null) == null))
                          selects0.add(this.widget.data[index]);
                        else {
                          // 点下删除
                          selects0.removeWhere((element) =>
                          element["id"] == this.widget.data[index]["id"]);
                        }
                        // 刷新
                        setState(() {});
                      } else {
                        Navigator.of(context).pop(this.widget.data[index]);
                      }
                    },
                    child: Text(this.widget.data[index][this.widget.nameKey]),
                    color: highlight ? AppBaseColor.blue1 : null,
                    textColor: highlight ? AppBaseColor.blue6 : null,
                  );
                },
//                      separatorBuilder: (BuildContext context, int index) {
//                        return Divider();
//                      },
                shrinkWrap: true,
                itemCount: this.widget.data.length,
                physics: BouncingScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }

}