// To parse this JSON data, do
//
//     final dataModel = dataModelFromMap(jsonString);

import 'dart:convert';

/// class return data of paymentez
class DataModel {
  DataModel({
    this.status,
    this.card,
    this.error,
  });

  /// status of package is: success, review, failure, error
  String status;

  /// model return add card of paymentez
  Card card;

  // model error if error request paymentez
  Error error;

  DataModel copyWith({
    String status,
    Card card,
    Error error,
  }) =>
      DataModel(
        status: status ?? this.status,
        card: card ?? this.card,
        error: error ?? this.error,
      );

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
    status: json["status"] == null ? null : json["status"],
    card: json["card"] == null ? null : Card.fromMap(json["card"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "card": card == null ? null : card.toMap(),
    "error": error == null ? null : error.toMap(),
  };
}

/// model return add card of paymentez
class Card {
  Card({
    this.bin,
    this.status,
    this.token,
    this.message,
    this.expiryYear,
    this.expiryMonth,
    this.transactionReference,
    this.type,
    this.number,
    this.origin,
  });

  /// bin
  String bin;

  /// status
  String status;

  /// token
  String token;

  /// message
  String message;

  /// expiryYear
  String expiryYear;

  /// expiryMount
  String expiryMonth;

  /// transactionReference
  String transactionReference;

  /// type
  String type;

  /// number
  String number;

  ///origin
  String origin;

  Card copyWith({
    String bin,
    String status,
    String token,
    String message,
    String expiryYear,
    String expiryMonth,
    String transactionReference,
    String type,
    String number,
    String origin,
  }) =>
      Card(
        bin: bin ?? this.bin,
        status: status ?? this.status,
        token: token ?? this.token,
        message: message ?? this.message,
        expiryYear: expiryYear ?? this.expiryYear,
        expiryMonth: expiryMonth ?? this.expiryMonth,
        transactionReference: transactionReference ?? this.transactionReference,
        type: type ?? this.type,
        number: number ?? this.number,
        origin: origin ?? this.origin,
      );

  factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Card.fromMap(Map<String, dynamic> json) => Card(
    bin: json["bin"] == null ? null : json["bin"],
    status: json["status"] == null ? null : json["status"],
    token: json["token"] == null ? null : json["token"],
    message: json["message"] == null ? null : json["message"],
    expiryYear: json["expiry_year"] == null ? null : json["expiry_year"],
    expiryMonth: json["expiry_month"] == null ? null : json["expiry_month"],
    transactionReference: json["transaction_reference"] == null ? null : json["transaction_reference"],
    type: json["type"] == null ? null : json["type"],
    number: json["number"] == null ? null : json["number"],
    origin: json["origin"] == null ? null : json["origin"],
  );

  Map<String, dynamic> toMap() => {
    "bin": bin == null ? null : bin,
    "status": status == null ? null : status,
    "token": token == null ? null : token,
    "message": message == null ? null : message,
    "expiry_year": expiryYear == null ? null : expiryYear,
    "expiry_month": expiryMonth == null ? null : expiryMonth,
    "transaction_reference": transactionReference == null ? null : transactionReference,
    "type": type == null ? null : type,
    "number": number == null ? null : number,
    "origin": origin == null ? null : origin,
  };
}

/// class error return paymentez
class Error {
  Error({
    this.type,
    this.help,
  });

  /// type
  String type;

  // help
  String help;

  Error copyWith({
    String type,
    String help,
  }) =>
      Error(
        type: type ?? this.type,
        help: help ?? this.help,
      );

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error(
    type: json["type"] == null ? null : json["type"],
    help: json["help"] == null ? null : json["help"],
  );

  Map<String, dynamic> toMap() => {
    "type": type == null ? null : type,
    "help": help == null ? null : help,
  };
}
