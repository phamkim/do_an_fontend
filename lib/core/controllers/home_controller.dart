import 'package:get/get.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../services/category_service.dart';
import '../services/product_service.dart';

class HomeController extends GetxController {
  HomeController(
      {required this.productService,
      required this.categoryService});

  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  var selectedCategoryIndex = 0.obs;

  final ICategoryService categoryService;
  final IProductService productService;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCategories();
  }

  void changeSelectedCategoryIndex(int index) {
    selectedCategoryIndex.value = index;
    var query =
        'categoryId=${categories.elementAt(selectedCategoryIndex.value).sId}';
    getAllProducts(query);
  }

  void getAllCategories() async {
    await categoryService.getAll().then((value) {
      categories(value);
      var query =
          'categoryId=${categories.elementAt(selectedCategoryIndex.value).sId}';
      getAllProducts(query);
    }).catchError((onError) {});
  }

  void getAllProducts(String query) async {
    var listProduct = await productService.getAll(query: query);
    products(listProduct);
  }
}
