import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../paymentez.dart';

/// Method to open a dialog and display the Paymentez html form: https://developers.paymentez.com/docs/payments/#javascript
void showDialogPaymentez(
    {
      @required BuildContext context,
      @required Function(DataModel, InAppWebViewController) funReturnData,
      @required String uid,
      @required String email,
      @required String environment,
      @required String paymentClientAppCode,
      @required String paymentClientAppKey,
      String background,
      String btnBackground1,
      String btnBackground2,
      String textAddCard,
      String textProcessingCard,
      String btnTextCancel,
      Color btnColorCancel,
      bool isDebug
    }) async {

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          elevation: 10,
          insetPadding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: btnColorCancel??Colors.black45,
                  child: TextButton(
                    child: Text(
                      btnTextCancel??"Cancelar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  child: InAppWebView(
                    initialFile:
                        "packages/paymentez/assets/html_paymentez2021/index.html",
                    initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(
                        useHybridComposition: true,
                      ),
                    ),
                    onWebViewCreated: (controller) {
                      controller.addJavaScriptHandler(
                          handlerName: 'sendDataUser',
                          callback: (args) {
                            print('099999999999999');
                            print(email);
                            print(paymentClientAppKey);
                            return {
                              'uid':  uid,
                              'email': email,
                              'environment': environment,
                              'paymentClientAppCode': paymentClientAppCode,
                              'paymentClientAppKey': paymentClientAppKey,
                              'background': background??'c9b608',
                              'text_add_card': textAddCard??'Add card',
                              'btn_background1': btnBackground1??'614ea3',
                              'btn_background2': btnBackground2??'382578',
                              'message_processing_card': textProcessingCard??'Procesando tarjeta'
                            };
                          });
                      controller.addJavaScriptHandler(
                          handlerName: 'return_data',
                          callback: (args) {
                            funReturnData(DataModel.fromMap(args[0]), controller);
                          });


                    },
                    onConsoleMessage:(isDebug) ? (controller, consoleMessage) {
                      print(consoleMessage.message);
                    } : null,

                  ),
                )
              ],
            ),
          ),
        );
      });
}
