import 'package:flutter/material.dart';
import 'package:flutter_base/constant/color.dart';

class SelectWidget {
  static Future<dynamic> dialog({
    @required BuildContext context,
    @required List data,

    /// 已经选中的id
    dynamic valueId,
    String idKey = "id",
    String nameKey = "name",
    bool multiple = false,
  }) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(null),
                    child: new Text("取消")),
              ],
              content: Column(
                children: <Widget>[
                  ListView.separated(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    itemBuilder: (BuildContext context, int index) {
                      Widget ch;

                      /// 选中高亮
                      if (valueId != null && valueId == data[index][idKey]) {
                        ch = Text(
                          data[index][nameKey],
                          style: TextStyle(color: AppBaseColor.green5),
                        );
                      } else {
                        ch = Text(data[index][nameKey]);
                      }
                      return FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(data[index]);
                        },
                        child: Center(
                          child: ch,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    shrinkWrap: true,
                    itemCount: data.length,
                    physics: BouncingScrollPhysics(),
                  )
                ],
              ),
            ));
  }
}
