import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'orders_viewmodel.dart';

class Orders extends StatelessWidget {
  final Map<dynamic, dynamic> list;
  final String orderType;
  final int quantity;
  final double orderPrice;
  Orders({
    Key? key,
    required this.list,
    required this.orderType,
    required this.quantity,
    required this.orderPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List orders = [];
    orders.add(list);
    orders.add(orderType);
    orders.add(quantity);
    orders.add(orderPrice);
    // displayOrder.addAll(orders);
    int extraIndex = -4;
    return ViewModelBuilder<OrdersViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Orders',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0,
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: (list == {} || orderType == '')
            ? Center(child: Text('My Orders'))
            : Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                child: Container(
                    child: ListView.builder(
                        itemCount: model.displayOrder.length ~/ 4,
                        itemBuilder: (BuildContext context, int index) {
                          extraIndex += 4;
                          return Column(
                            children: [
                              if (extraIndex + 1 <
                                  model.displayOrder.length ~/ 4)
                                Row(
                                  children: [
                                    Text(
                                      'Company :  ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      model.displayOrder[extraIndex]['name'],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('Price :  ',
                                      style: TextStyle(fontSize: 18)),
                                  Text(model.displayOrder[extraIndex + 3]
                                      .toString()),
                                  SizedBox(width: 20),
                                  Text('Quantity :  ',
                                      style: TextStyle(fontSize: 18)),
                                  Text(model.displayOrder[extraIndex + 2]
                                      .toString()),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: (model.displayOrder[
                                                    extraIndex + 1] ==
                                                'Buy')
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      child: Text(
                                          model.displayOrder[extraIndex + 1])),
                                  SizedBox(width: 30),
                                  Text('Exchange:  ',
                                      style: TextStyle(fontSize: 18)),
                                  Text(model.displayOrder[extraIndex]
                                      ['exchange']),
                                ],
                              ),
                              Divider(color: Colors.white, height: 25),
                            ],
                          );
                        }))),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.refreshOrders(orders),
          child: Icon(Icons.refresh),
        ),
      ),
      viewModelBuilder: () => OrdersViewModel(),
    );
  }
}
