import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/core/veiw_model/home_view_model.dart';
import 'package:baz_store_new/view/auth/auth_screen.dart';
import 'package:baz_store_new/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeView extends StatelessWidget {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  List<String> defList = ['s', 's', 's', 's', 's', 's'];
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: _size.height * 0.12,
            left: _size.height * 0.025,
            right: _size.height * 0.025),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _searchTextFormField(),
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
    );
  }

  Widget _searchTextFormField() {
    return Container(
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
    return Container(
      height: _size.height * 0.12,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: defList.length,
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
                  child: Image.asset('assets/images/icons/men_shoe.png'),
                ),
              ),
              SizedBox(
                height: _size.height * 0.015,
              ),
              CustomText(defList[index], _size.height * 0.02)
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: _size.width * 0.05,
        ),
      ),
    );
  }

  Widget _listViewProducts(Size _size) {
    return Container(
      height: _size.height * 0.45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: defList.length,
        itemBuilder: (context, index) {
          return Container(
            width: _size.width * 0.4,
            child: Column(
              children: [
                Container(
                  width: _size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: Colors.grey.shade100,
                  ),
                  child: Container(
                    height: _size.height * 0.28,
                    child: Image.asset(
                      'assets/images/icons/watch.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.01,
                ),
                CustomText(
                  'BeoPlay Speaker',
                  _size.height * 0.02,
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: _size.height * 0.02,
                ),
                CustomText(
                  'Bang and Olufsen',
                  _size.height * 0.02,
                  color: Colors.grey,
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: _size.height * 0.02,
                ),
                CustomText(
                  '\$755',
                  _size.height * 0.02,
                  color: kMainColor,
                  alignment: Alignment.bottomLeft,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: _size.width * 0.055,
        ),
      ),
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
