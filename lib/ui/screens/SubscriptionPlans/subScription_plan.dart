import 'package:flutter/material.dart';
import 'package:topwinebar/controller/get_currency_lang_controller.dart';
import 'package:topwinebar/res/app_assets.dart';
import 'package:topwinebar/res/theme/theme.dart';
import 'package:topwinebar/ui/widget/common_button.dart';
import 'package:topwinebar/ui/widget/common_widget.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topwinebar/ui/widget/custom_dailogs.dart';
import 'package:url_launcher/url_launcher.dart';

class SubScriptionPlanScreen extends StatefulWidget {
  const SubScriptionPlanScreen({Key? key}) : super(key: key);

  @override
  State<SubScriptionPlanScreen> createState() => _SubScriptionPlanScreenState();
}

class _SubScriptionPlanScreenState extends State<SubScriptionPlanScreen> {
  final currLangController = Get.put(GetCurrencyLangController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // language variable
  // var savedLanguage;

  @override
  void initState() {
    super.initState();
    // getSavedLanguage();
  }

// for translated language
//   getSavedLanguage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     savedLanguage = prefs.getString('savedLanguage');
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
      color: Color(0xfff3f3f3),
      image: DecorationImage(
        image: AssetImage(
          AppAssets.hostBgShape,
        ),
        alignment: Alignment.topRight,
        fit: BoxFit.contain,
      ),
    ),
        child: Scaffold(
            key: _scaffoldKey,
            appBar: backAppBar(currLangController.model.value.data!.language!="en" ? "订阅计划": "Subscription Plan"),
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                int phone = 962770593839;
                var url = "whatsapp://send?phone=$phone";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  showError('there is no WhatsApp installed');}
              },child: Image.asset(AppAssets.whatsAppIcon),),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                    ),
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(14.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 0),
                              leading: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(AppAssets.whatsAppIcon),
                              ),
                              title: Text('Vine PLan',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),
                              subtitle: Text('\$25/user',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),
                    ),),
                          Divider(),
                          Padding(
                            padding:  EdgeInsets.only(left: 16.0),
                            child:  Row(
                              children: [
                                Icon(Icons.check),
                                addWidth(12),
                                Text('Lorem Ipsum has been the industry'),
                              ],
                            ),
                          ),
                          addHeight(12.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              children: [
                                Icon(Icons.check),
                                addWidth(12),
                                Text('Lorem Ipsum has been the industry'),
                              ],
                            ),
                          ),
                          addHeight(12.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              children: [
                                Icon(Icons.check),
                                addWidth(12),
                                Text('Lorem Ipsum has been the industry'),
                              ],
                            ),
                          ),
                          addHeight(12.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              children: [
                                Icon(Icons.check),
                                addWidth(12),
                                Text('Lorem Ipsum has been the industry'),
                              ],
                            ),
                          ),
                          addHeight(24.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                            child: CommonButton(
                                    buttonHeight: 6.5,
                                    buttonWidth: 100,
                                    text: currLangController.model.value.data!.language!= "en" ? "购买计划" :"PURCHASE PLAN",
                                    onTap: () async {},
                                    mainGradient: AppTheme.primaryGradientColor),
                          ),
                          addHeight(24.0),
                        ],
                      ),),

                  ],
                )

            )
        ));
  }
}
