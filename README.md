# paymentez

Paquete para agregar tarjetas en paymentez, este sirve para proyectos que no cuentan con certificación PCI

Toda la información la puedes encontrar en la documentación de paymentez https://developers.paymentez.com/docs/payments/#javascript

## Instalación

Seguir las instrucciones en [here](https://pub.dev/packages/paymentez/install)

## Usar Demo

Antes de usar el ejempo, necesitas las credenciales de paymentez paymentClientAppCode, paymentClientAppKey
Para obtenerlas tienes que contactarte con Paymentez. Esos dos datos debes agregarlos en el archivo main.dart.

```dart
showDialogPaymentez(
context: context,
  isDebug: false,
  uid: 'ec774d32-8c3d-4df5-af5e-77e5177f4d1d',
  email: 'user@softnux.io',
  environment: 'stg', // stg -> developer or prod -> production
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

```

```bash
git clone https://github.com/Krysthyan/paymentez.git
cd paymentez/example
flutter run
```

![Capture 1](https://github.com/Krysthyan/paymentez/blob/main/screenshot/screenshot1.jpg)|

