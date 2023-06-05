
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeftView extends StatelessWidget {

  List<DemoBean> list = [];

  LeftView({super.key});

  void initList() {
    for (int i = 0; i < 10; i++) {
      DemoBean demoBean = DemoBean();
      demoBean.title = "测试$i";
      demoBean.png = i;
    }
  }

  @override
  Widget build(BuildContext context) {
    initList();
    return Container(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        childAspectRatio: 1.0,
        shrinkWrap: true,
        children: List.generate(list.length, (index) {
          return _itemView(list[index]);
        }),
      ),
    );
  }

  Widget _itemView(DemoBean demoBean) {
    return InkWell(
      onTap: () {

      },
      child: Column(
        children: [
          Icon(
            demoBean.iconData ?? Icons.share,
            color: Colors.white,
          ),
          Text(demoBean.title ?? "标题"),
        ],
      ),
    );
  }
}

class DemoBean {
  String? title;
  int? png;
  IconData? iconData;
}