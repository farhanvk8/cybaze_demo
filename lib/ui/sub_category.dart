// import 'package:flutter/material.dart';

// class SubCategoryScreen extends StatefulWidget {
//   const SubCategoryScreen({Key? key}) : super(key: key);

//   @override
//   State<SubCategoryScreen> createState() => _SubCategoryScreenState();
// }

// class _SubCategoryScreenState extends State<SubCategoryScreen> {
//    bool isLoading = true;
//   CategoryResponse? response;
//   @override
//   void initState() {
//     apiCall();
//     super.initState();
//   }

//   apiCall() async {
//     var json = await sendRequest('get_categories');
//     if (json != null) {
//       response = CategoryResponse.fromJson(json);
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ,
//     );
//   }
// }