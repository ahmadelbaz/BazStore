import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/core/veiw_model/home_view_model.dart';
import 'package:baz_store_new/view/details_view.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value == true
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(
                    top: _size.height * 0.12,
                    left: _size.height * 0.025,
                    right: _size.height * 0.025),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _searchTextFormField(context),
                      SizedBox(
                        height: _size.height * 0.05,
                      ),
                      CustomText(
                        'Categories',
                        _size.height * 0.02,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      _listViewCategory(_size),
                      SizedBox(
                        height: _size.height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText('Best Selling', _size.height * 0.02),
                          CustomText('See all', _size.height * 0.02),
                        ],
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      _listViewProducts(_size),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory(Size _size) {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return SizedBox(
        height: _size.height * 0.12,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: _size.height * 0.07,
                  width: _size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: Colors.grey.shade100,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(_size.height * 0.012),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.015,
                ),
                CustomText(
                    controller.categoryModel[index].name, _size.height * 0.02)
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: _size.width * 0.05,
          ),
        ),
      );
    });
  }

  Widget _listViewProducts(Size _size) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) {
        return SizedBox(
          height: _size.height * 0.40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.productModel.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(DetailsView(
                    model: controller.productModel[index],
                  ));
                },
                child: SizedBox(
                  width: _size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        width: _size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          color: Colors.grey.shade100,
                        ),
                        child: SizedBox(
                          height: _size.height * 0.28,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      CustomText(
                        controller.productModel[index].name,
                        _size.height * 0.02,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: _size.height * 0.02,
                      ),
                      Expanded(
                        child: CustomText(
                          controller.productModel[index].description,
                          _size.height * 0.02,
                          color: Colors.grey,
                          alignment: Alignment.topLeft,
                          maxLine: 2,
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      CustomText(
                        controller.productModel[index].price.toString() +
                            '  \$',
                        _size.height * 0.02,
                        color: primaryColor,
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: _size.width * 0.055,
            ),
          ),
        );
      },
    );
  }
}





// logout 

// ElevatedButton(
//             onPressed: () {
//               _auth.signOut();
//               _googleSignIn.signOut();
//               Get.offAll(() => AuthScreen());
//             },
//             child: const Text('Log out')),
