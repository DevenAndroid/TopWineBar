import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:topwinebar/utils/ApiConstant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topwinebar/helper/Helpers.dart';
import 'package:http/http.dart' as http;
import 'package:topwinebar/models/model_get_currency_list.dart';

Future<ModelGetCurrenciesListResponse> getCurrenciesList(context) async {

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)?.insert(loader);

  http.Response response = await http.post(
      Uri.parse(ApiUrls.getCurrenciesList),
      headers: headers);

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    log("getCurrenciesList::" +
        response.body.toString());
    return ModelGetCurrenciesListResponse.fromJson(json.decode(response.body));
  } else {
    Helpers.hideLoader(loader);
    Helpers.createSnackBar(context, response.statusCode.toString());
    throw Exception(response.body);
  }
}
