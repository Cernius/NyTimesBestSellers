import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Common/AppModule.dart';
import 'package:products/Domain/Models/Product.dart';
import 'package:products/Presentation/BaseStatelessWidget.dart';
import 'package:products/Presentation/Common/BottomBar/BottomBarType.dart';
import 'package:products/Presentation/Common/BottomBar/BottomNavigationBar.dart';
import 'package:products/Presentation/Common/HelperFunctions.dart';
import 'package:products/Presentation/ProductInfo/ProductInfo.dart';
import 'package:products/Presentation/Products/ProductsData.dart';
import 'package:loadmore/loadmore.dart';

import 'ProductsBloc/ProductsBloc.dart';

class Products extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocProvider<ProductsBloc>(create: (BuildContext context) {
      return injector.get<ProductsBloc>();
    }, child:
        BlocBuilder<ProductsBloc, ProductsData>(builder: (context, products) {
      log('Building ProductsBloc');

      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: Text(getStrings().newYorkTimes),
        ),
        bottomNavigationBar: MyBottomNavigationBar(BottomBarType.LIST),
        body: _buildBody(context, screenSize, products),
      );
    }));
  }

  Widget _buildBody(
      BuildContext context, Size screenSize, ProductsData productsData) {
    return Column(
      children: [
        SizedBox(
          height: 18,
        ),
        _buildTitle(context),
        SizedBox(
          height: 18,
        ),
        _buildListHeaders(context, screenSize),
        _buildContent(context, screenSize, productsData)
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      child: Text(getStrings().books,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          )),
    );
  }

  Widget _buildListHeaders(BuildContext context, Size screenSize) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 10),
                width: screenSize.width * 0.3,
                child: Text(getStrings().title,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ))),
            Container(
                padding: EdgeInsets.only(left: 8),
                width: screenSize.width * 0.3,
                child: Text(getStrings().author,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ))),
            Container(
                width: screenSize.width * 0.2,
                child: Text(getStrings().publisher,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ))),
            Container(
                padding: EdgeInsets.only(right: 5),
                width: screenSize.width * 0.1,
                child: Text(getStrings().price,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ))),
          ]),
    );
  }

  Widget _buildContent(
      BuildContext context, Size screenSize, ProductsData productsData) {
    return Expanded(
        child: Container(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 1),
            child: productsData.products.length == 0
                ? Container(
                    child: Text(getStrings().noDataFound),
                  )
                : LoadMore(
                    isFinish: productsData.offset >= productsData.numResults,
                    textBuilder: getLoadMoreTextBuilder(),
                    onLoadMore: () async {
                      await context.bloc<ProductsBloc>().getProducts();
                      return true;
                    },
                    child: ListView.builder(
                        itemCount: productsData.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildRow(context, screenSize,
                              productsData.products[index]);
                        }))));
  }

  Widget _buildRow(BuildContext context, Size screenSize, Product product) {
    return Card(
      margin: EdgeInsets.all(1),
      elevation: 1,
      child: Container(
        height: 65,
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductInfo(product, screenSize),
                ),
              );
            },
            contentPadding: EdgeInsets.only(left: 10),
            dense: true,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: screenSize.width * 0.3,
                      child: Text(product.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ))),
                  Container(
                      width: screenSize.width * 0.3,
                      child: Text(product.author,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ))),
                  Container(
                      width: screenSize.width * 0.2,
                      child: Text(product.publisher ?? getStrings().notDefined,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ))),
                  Container(
                      width: screenSize.width * 0.1,
                      child: Text(product.price.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ))),
                ])),
      ),
    );
  }
}
