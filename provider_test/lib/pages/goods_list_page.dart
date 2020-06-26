import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart' as prefix0;
import 'package:provider_test/model/goods_list_model.dart';

class GoodsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GoodsListModel(),
      child: goodsList(context),
    );
  }

  Widget goodsList(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goods List Page'),
      ),
      body: Selector<GoodsListModel, GoodsListModel>(
        shouldRebuild: (pre, next) => false,
        selector: (context, provider) => provider,
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.total,
            itemBuilder: (context, index) {
              return Selector<GoodsListModel, Goods>(
                selector: (context, provider) => provider.goodsList[index],
                builder: (context, data, child) {
                  print('No.${index + 1} rebulid');
                  return ListTile(
                    title: Text(data.goodsNo),
                    trailing: GestureDetector(
                      onTap: () => provider.collect(index),
                      child: Icon(
                        data.isCollection ? Icons.star : Icons.star_border,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
