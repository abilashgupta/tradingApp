import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'form_viewmodel.dart';

class FormOrder extends StatelessWidget {
  final Map<String, Object> list;
  final String orderType;

  FormOrder({
    Key? key,
    required this.list,
    required this.orderType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return ViewModelBuilder<FormOrderViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Container(
                child: Text(
                  'Order Type: $orderType',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 40.0,
                      ),
                      child: TextFormField(
                        controller: model.quantityTextController,
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.production_quantity_limits),
                          hintText: 'Quantity',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 12.0, 0.0, 0.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 25.0,
                      ),
                      child: TextFormField(
                        // model.list['stocks']?[_index]['current_price'].toString(),
                        controller: model.priceTextController,
                        style: TextStyle(
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.money),
                          hintText: 'Price',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 12.0, 0.0, 0.0),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        onPressed: () =>
                            model.navigateToOrders(list, orderType, context),
                        child: Text('Place Order'),
                      ),
                    )
                  ])),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => FormOrderViewModel(),
    );
  }
}
