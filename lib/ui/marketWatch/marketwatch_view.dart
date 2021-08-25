import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'marketwatch_viewmodel.dart';

class MarketWatch extends StatelessWidget {
  const MarketWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketWatchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Market Watch',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0,
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: ListView.builder(
              itemCount: model.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white))),
                  child: ListTile(
                    minVerticalPadding: 10,
                    title: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text((model.list['stocks']?[index]['name'])
                              .toString()),
                          // SizedBox(width: 50),
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  onPressed: () =>
                                      model.navigateToFormOrder(index, 'Buy'),
                                  child: Text('Buy')),
                              SizedBox(width: 10),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                  ),
                                  onPressed: () =>
                                      model.navigateToFormOrder(index, 'Sell'),
                                  child: Text('Sell')),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              (model.list['stocks']?[index]['current_price'])
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        (model.list['stocks']?[index]['exchange']).toString(),
                      ),
                    ),
                  ),
                );
              }),
          //  print(model.list['stocks']?[0]['name']),
        ),
      ),
      viewModelBuilder: () => MarketWatchViewModel(),
    );
  }
}
