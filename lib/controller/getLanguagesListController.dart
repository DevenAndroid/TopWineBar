import 'package:topwinebar/models/model_get_currency_list.dart';
import 'package:topwinebar/repositories/get_currencies_list_repository.dart';
import 'package:get/get.dart';
class GetCurrenciesListController extends GetxController{
  Rx<ModelGetCurrenciesListResponse> model = ModelGetCurrenciesListResponse().obs;
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrencyListData();
  }

  getCurrencyListData(){
    getCurrenciesList(Get.context).then((value) {
      isDataLoading.value =true;
      model.value=value;
      return null;
    });
  }

}