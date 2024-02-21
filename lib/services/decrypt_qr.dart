import 'dart:convert';
import 'dart:typed_data';

import 'package:chronos/models/transaction.dart';

Transaction? decryptQRJson(String string) {
  Map data = jsonDecode(string);
  Transaction transaction = Transaction.fromJson(data);
  return transaction;
}

Transaction? decryptQrString(String string) {
  const Base64Decoder base64decoder = Base64Decoder();
  Uint8List bytes = (base64decoder.convert(string));
  // String taxAmount =
  //     ((double.parse(amount) * 1.15) - double.parse(amount)).toStringAsFixed(2);
  // BytesBuilder bytesBuilder = BytesBuilder();

  // //---seller name
  // bytesBuilder.addByte(1);
  // List<int> sellerNameBytes = utf8.encode(names);
  // bytesBuilder.addByte(sellerNameBytes.length);
  // bytesBuilder.add(sellerNameBytes);

  // //---tax number
  // bytesBuilder.addByte(2);
  // List<int> numBytes = utf8.encode(num);
  // bytesBuilder.addByte(numBytes.length);
  // bytesBuilder.add(numBytes);

  // //---date
  // bytesBuilder.addByte(3);
  // List<int> dateBytes = utf8.encode(date);
  // bytesBuilder.addByte(dateBytes.length);
  // bytesBuilder.add(dateBytes);

  // //---amount
  // bytesBuilder.addByte(4);
  // List<int> amountBytes = utf8.encode(amount);
  // bytesBuilder.addByte(amountBytes.length);
  // bytesBuilder.add(amountBytes);

  // //---taxAmounts
  // bytesBuilder.addByte(5);
  // List<int> taxAmountsBytes = utf8.encode(taxAmount);
  // bytesBuilder.addByte(taxAmountsBytes.length);
  // bytesBuilder.add(taxAmountsBytes);

  // Uint8List uint8list = bytesBuilder.toBytes();
  // const Base64Encoder base64encoder = Base64Encoder();
  // return base64encoder.convert(uint8list);
}
