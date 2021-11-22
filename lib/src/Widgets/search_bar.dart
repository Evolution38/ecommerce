// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter/material.dart';

// class SearchBar extends StatelessWidget {
//   const SearchBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//             IconButton(
//                 onPressed: () {
//                   showSearch(context: context, delegate: Search());
//                 },
//                 icon: const Icon(Icons.search)),
//         ]
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// class Search extends SearchDelegate {
//   List<String> data = [
//     "palak",
//     "pudina",
//     "chana dal",
//     "rajma",
//     "soyabean",
//     "chowli"
//   ];

//   List<String> recentSearch = [
//     "Fruits and Vegetables",
//     "Saples",
//     "Beverages",
//   ];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return <Widget>[
//       IconButton(
//           icon: const Icon(Icons.clear),
//           onPressed: () {
//             query = "";
//           })
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () => Navigator.pop(context));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query != null && data.contains(query.toLowerCase())) {
//       debugPrint('[SearchBar] Query: ' + query);
//       return ListTile(
//         title: Text(query),
//         onTap: () {},
//       );
//     } else if (query == "") {
//       return const Text("");
//     } else {
//       return ListTile(
//         title: const Text("No results found"),
//         onTap: () {},
//       );
//     }
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ListView.builder(
//         itemCount: recentSearch.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(recentSearch[index]),
//             trailing: const Icon(
//               Icons.arrow_forward_ios,
//             ),
//             onTap: () {},
//           );
//         });
//   }
// }

// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class SearchBar extends StatefulWidget {
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
// //Step 3
//   _SearchBarState() {
//     _filter.addListener(() {
//       if (_filter.text.isEmpty) {
//         setState(() {
//           _searchText = "";
//           filteredNames = names;
//         });
//       } else {
//         setState(() {
//           _searchText = _filter.text;
//         });
//       }
//     });
//   }

// //Step 1
//   final TextEditingController _filter = TextEditingController();
//   final dio = Dio(); // for http requests
//   String _searchText = "";
//   List names = []; // names we get from API
//   List filteredNames = []; // names filtered by search text
//   Icon _searchIcon = Icon(Icons.search);
//   Widget _appBarTitle = Text('Search Example');

//   //step 2.1
//   void _getNames() async {
//     final response =
//         await dio.get('https://jsonplaceholder.typicode.com/users');
//     print(response.data);
//     List tempList = [];
//     for (int i = 0; i < response.data.length; i++) {
//       tempList.add(response.data[i]);
//     }
//     setState(() {
//       names = tempList;
//       filteredNames = names;
//     });
//   }

// //Step 2.2
//   void _searchPressed() {
//     setState(() {
//       if (_searchIcon.icon == Icons.search) {
//         _searchIcon = Icon(Icons.close);
//         _appBarTitle = TextField(
//           controller: _filter,
//           decoration: InputDecoration(
//               prefixIcon: Icon(Icons.search), hintText: 'Search...'),
//         );
//       } else {
//         _searchIcon = Icon(Icons.search);
//         _appBarTitle = Text('Search Example');
//         filteredNames = names;
//         _filter.clear();
//       }
//     });
//   }

//   //Step 4
//   Widget _buildList() {
//     if (_searchText.isEmpty) {
//       List tempList = [];
//       for (int i = 0; i < filteredNames.length; i++) {
//         if (filteredNames[i]['name']
//             .toLowerCase()
//             .contains(_searchText.toLowerCase())) {
//           tempList.add(filteredNames[i]);
//         }
//       }
//       filteredNames = tempList;
//     }
//     return ListView.builder(
//       itemCount: names == null ? 0 : filteredNames.length,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           title: Text(filteredNames[index]['name']),
//           onTap: () => print(filteredNames[index]['name']),
//         );
//       },
//     );
//   }

//   //STep6
//   // Widget _buildBar(BuildContext context) {
//   //   return AppBar(
//   //     centerTitle: true,
//   //     title: _appBarTitle,
//   //     leading: IconButton(
//   //       icon: _searchIcon,
//   //       onPressed: _searchPressed,
//   //     ),
//   //   );
//   // }

//   @override
//   void initState() {
//     _getNames();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: _appBarTitle,
//         leading: IconButton(
//           icon: _searchIcon,
//           onPressed: _searchPressed,
//         ),
//       ),
//       body: Container(
//         child: _buildList(),
//       ),
//       resizeToAvoidBottomInset: false,
// //      floatingActionButton: FloatingActionButton(
// //        onPressed: _postName,
// //        child: Icon(Icons.add),
// //      ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SearchBar extends StatefulWidget {
//   const SearchBar({Key? key}) : super(key: key);

//   @override
//   State<SearchBar> createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {

//   final List<Map<String, dynamic>> _allUsers = [
//     {"id": 1, "name": "Andy", "age": 29},
//     {"id": 2, "name": "Aragon", "age": 40},
//     {"id": 3, "name": "Bob", "age": 5},
//     {"id": 4, "name": "Barbara", "age": 35},
//     {"id": 5, "name": "Candy", "age": 21},
//     {"id": 6, "name": "Colin", "age": 55},
//     {"id": 7, "name": "Audra", "age": 30},
//     {"id": 8, "name": "Banana", "age": 14},
//     {"id": 9, "name": "Caversky", "age": 100},
//     {"id": 10, "name": "Becky", "age": 32},
//   ];

//   // This list holds the data for the list view
//   List<Map<String, dynamic>> _foundUsers = [];
//   @override
//   initState() {
//     // at the beginning, all users are shown
//     _foundUsers = _allUsers;
//     super.initState();
//   }

//   // This function is called whenever the text field changes
//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       // if the search field is empty or only contains white-space, we'll display all users
//       results = _allUsers;
//     } else {
//       results = _allUsers
//           .where((user) =>
//               user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//       // we use the toLowerCase() method to make it case-insensitive
//     }

//     // Refresh the UI
//     setState(() {
//       _foundUsers = results;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               onChanged: (value) => _runFilter(value),
//               decoration: const InputDecoration(
//                   labelText: 'Search', suffixIcon: Icon(Icons.search)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: _foundUsers.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: _foundUsers.length,
//                       itemBuilder: (context, index) => Card(
//                         key: ValueKey(_foundUsers[index]["id"]),
//                         color: Colors.amberAccent,
//                         elevation: 4,
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         child: ListTile(
//                           leading: Text(
//                             _foundUsers[index]["id"].toString(),
//                             style: const TextStyle(fontSize: 24),
//                           ),
//                           title: Text(_foundUsers[index]['name']),
//                           subtitle: Text(
//                               '${_foundUsers[index]["age"].toString()} years old'),
//                         ),
//                       ),
//                     )
//                   : const Text(
//                       'No results found',
//                       style: TextStyle(fontSize: 24),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/src/models/search_model.dart';
// import 'package:ecommerce/src/services/http_service.dart';
// import 'package:ecommerce/src/test.dart';
// import 'package:flutter/material.dart';

// class SearchBar extends StatefulWidget {
//   SearchBar({Key? key}) : super(key: key);

//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   List<SearchModel> result = [];
//   Timer? debouncer;
//   String query = '';

//   void debounce(
//     VoidCallback callback, {
//     Duration duration = const Duration(milliseconds: 1000),
//   }) {
//     if (debouncer != null) {
//       debouncer!.cancel();
//     }
//     debouncer = Timer(duration, callback);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Company Name'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           SearchWidget(
//               text: query, onChanged: searched, hintText: 'Search you product')
//         ],
//       ),
//     );
//   }

//   Future searched(String query) async => debounce(() async {
//         final result = await HttpService.getSearchProduct(query);

//         if (!mounted) return;

//         setState(() {
//           this.query = query;
//           this.result = result;
//         });
//       });

//       Widget buildBook(Result book) => ListTile(
//         leading: CachedNetworkImage(
//           imageUrl:result.images.imgProdut,
//           fit: BoxFit.cover,
//           width: 50,
//           height: 50,
//         ),
//         title: Text(book.title),
//         subtitle: Text(book.author),
//       );
// }
