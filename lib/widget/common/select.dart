import 'package:flutter/material.dart';
import 'package:flutter_base/constant/color.dart';
import 'package:flutter_base/library/array.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDialog extends StatefulWidget {
  final List data;

  /// 已经选中的id, 单选时
  final dynamic valueId;
  final String idKey;
  final String nameKey;
  final Function nameWidgetFunc;
  final bool filterable;

  // filter的function: fun(){return bool;}
  final Function filterFun;

  // screen的计算值-screenUtil
  final num height;

  // 多选
  final bool multiple;

  /// 多选已选的
  final List selects;

  const SelectDialog(
      {Key key,
      this.data,
      this.valueId,
      this.idKey = "id",
      this.nameKey = "name",
      // 生成nameWidget的函数, 不用nameKey
      this.nameWidgetFunc,
      this.height = 700,
      this.multiple = false,
      this.selects,
      this.filterable = false,
      // eg: (text){ return (element){ text } }
      this.filterFun})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectState();
}

class _SelectState extends State<SelectDialog> {
  TextEditingController initVal = TextEditingController();
  String text = "";

  @override
  Widget build(BuildContext context) {
    List selects0 = this.widget.selects;
    if (selects0 == null) selects0 = [];
    List<Widget> children = [];
    List filteredData = this.widget.data;
    if (this.widget.filterable) {
      filteredData = ArrayUtils.filter(
          this.widget.data,
          this.widget.filterFun != null ? this.widget.filterFun(text) : (
              element) {
            return element[this.widget.nameKey].contains(text);
          });
      children.add(TextField(
        decoration: new InputDecoration(
          hintText: "请输入筛选关键字",
        ),
        controller: initVal,
        onChanged: (val) {
          setState(() {
            text = val;
          });
        },
      ));
    }

    /// dialog中使用list_view 需要在container中确定宽高
    children.add(Expanded(child: Container(
      width: ScreenUtil().setWidth(650),
//      height: sa.height(this.widget.height),
      alignment: Alignment.center,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          /// 选中高亮
          bool highlight;
          if (this.widget.multiple) {
            highlight = selects0.firstWhere(
                    (element) => element["id"] == filteredData[index]["id"],
                    orElse: () => null) !=
                null;
          } else {
            highlight = this.widget.valueId != null &&
                this.widget.valueId ==
                    filteredData[index][this.widget.idKey];
          }
          return TextButton(
            onPressed: () {
              if (this.widget.multiple) {
                if ((selects0.isEmpty ||
                    selects0.firstWhere(
                            (element) =>
                                element["id"] == filteredData[index]["id"],
                            orElse: () => null) ==
                        null))
                  selects0.add(filteredData[index]);
                else {
                  // 点下删除
                  selects0.removeWhere(
                      (element) => element["id"] == filteredData[index]["id"]);
                }
                // 刷新
                setState(() {});
              } else {
                Navigator.of(context).pop(filteredData[index]);
              }
            },
            child: this.widget.nameWidgetFunc != null
                ? this.widget.nameWidgetFunc(filteredData[index])
                : Text(filteredData[index][this.widget.nameKey]),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return highlight ? AppBaseColor.blue1 : null;
              }),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                return highlight ? AppBaseColor.blue6 : null;
              }),
            ),
          );
        },
        shrinkWrap: true,
        itemCount: filteredData.length,
        physics: BouncingScrollPhysics(),
      ),)));
    return AlertDialog(
      actions: <Widget>[
        this.widget.multiple
            ? new TextButton(
                onPressed: () => Navigator.of(context).pop(selects0),
                child: new Text("确定"))
            : new Container(),
      ],
      content: Container(
        height: ScreenUtil().setHeight(this.widget.height),
        child: Column(
          children: children,
        ),
      ),
    );
  }

}