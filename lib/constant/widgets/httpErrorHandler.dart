import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_flutter/constant/widgets/snack_bar.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode){
    case 200:
      onSuccess();
      break;
    case 401:
      showSnackBar(context: context, content: jsonDecode(response.body));
      break;
    case 500:
      showSnackBar(context: context, content:jsonDecode(response.body));
      break;
    default:
      showSnackBar(context: context, content: jsonDecode(response.body));
  }
}
