import 'package:flutter/material.dart';
import 'package:project_demo/pages/home/main_food_page.dart';
import 'package:project_demo/utils/colors.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();   
}
class _HomePageState extends State<HomePage>{
  int _currentIndex = 0;
  List pages=[
    MainFoodPage(),
    Container(child: Center(child: Text("Next page"),),),
    Container(child: Center(child: Text("Next next page"),),),
    Container(child: Center(child: Text("Next next next page"),),),
  ];
  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, //
        selectedItemColor: AppColors.mainColor,
        selectedFontSize: 0,
        
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap : _onItemTapped, // đây là hàm sẽ được gọi khi người dùng chọn một tab
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}