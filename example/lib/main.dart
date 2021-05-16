import 'package:flutter/material.dart';
import 'package:paymentez/paymentez.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paymentez',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Add card Paymentez'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              elevation: 10,
              color: Colors.amber,
              child: Text('Agregar tarjeta'),
              onPressed: (){

              showDialogPaymentez(
                  context: context,
                  isDebug: false,
                  uid: 'ec774d32-8c3d-4df5-af5e-77e5177f4d1d',
                  email: 'user@softnux.io',
                  environment: 'stg',
                  paymentClientAppCode: 'TPP3-EC-CLIENT',
                  paymentClientAppKey: '*********************',
                  background: 'F3F3F5',
                  btnBackground1: 'f02b6c',
                  btnBackground2: 'f02b6c',
                  textAddCard: 'Add card',
                  textProcessingCard: 'Processing card',
                  funReturnData: (DataModel data, controller) {
                    switch (data.status) {
                      case 'success':
                        print('success card with paymentez');
                        controller.goBack();
                        Navigator.of(context).pop();
                        break;

                      case 'review' :
                        print('review card with paymentez');
                        controller.goBack();
                        Navigator.of(context).pop();
                        break;

                      case 'failure':
                        print('failure card with paymentez');
                        controller.goBack();
                        Navigator.of(context).pop();
                        break;

                      case 'error':
                        print(data.error.type);
                        //todo se puede agregar una notificación que hay un error al querer agregar la tarjeta.
                        break;
                    }
                  }
              );
            },)
          ],
        ),
      )
    );
  }
}
