import 'package:get/get.dart';
import 'package:school_home/service/product_service.dart';

import '../Model/product/ShowPriceModel.dart';
import '../pages/constant.dart';

class PriceController extends GetxController{

  var isLoading = false.obs;
  var showPriceModel = Rxn<ShowPriceModel>(); //
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void  showPriceApi() async {
    try {

      isLoading(true);


      var data = await ProductService.showPriceApi();


      if(data['status'] == "Success"){

        showPriceModel.value= ShowPriceModel.fromJson(data);

        print("url-->");


        isLoading(false);

      }else if(data['status'] == "failed" && (data['data'] as List).isEmpty ){


        showPriceModel.value=null;
      }else{
        ToastMessage.msg(data['message'] ??"SomeThing went wrong");
      }


    } catch (e) {
      print("Error GetNewsByIdModel: $e");

      ToastMessage.msg("SomeThing went wrong");
      isLoading(false);
    } finally {

      isLoading(false);
    }
  }

}