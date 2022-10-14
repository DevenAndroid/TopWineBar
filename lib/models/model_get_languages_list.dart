class ModelGetCurrenciesListResponse {
  ModelGetCurrenciesListResponse({
    this.status,
    this.currencies,
  });
  late final bool? status;
  late final List<String>? currencies;

  ModelGetCurrenciesListResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    currencies = List.castFrom<dynamic, String>(json['currencies']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['currencies'] = currencies;
    return _data;
  }
}