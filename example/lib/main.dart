import 'package:country_list_picker/country_list_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(const CountryListPickerApp());
}

class CountryListPickerApp extends StatelessWidget {
  const CountryListPickerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country List Picker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(title: 'Country List Picker Demo'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextFormField(
          //   inputFormatters: [
          //     MaskTextInputFormatter(mask: "### #### ####", filter: {"#": RegExp(r'[0-9]')}),
          //   ],
          //   onChanged: (value) => print(value),
          // ),
          CountryListPicker(
            // textFieldTextStyle: TextStyle(color: Colors.red),
            border: Border.all(width: 2, color: Theme.of(context).primaryColor),
            inputTheme: const InputTheme(border: OutlineInputBorder()),
          ),
          CountryListPicker(
            // border: const Border(
            //   left: BorderSide(),
            //   bottom: BorderSide(width: 1)),
            isShowTitle: false,
            onChanged: (value) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text(value.englishName.official), Text(value.callingCode)],
                ),
                duration: const Duration(seconds: 1),
                backgroundColor: Theme.of(context).primaryColor,
              ));
            },
            dialogTheme: const CountryListDialogTheme(
              alphabetsBar: AlphabetsBarThemes(
                visible: true,
                backgroundColor: Colors.transparent,
                textStyle: TextStyle(color: Colors.black),
                selectedBackgroundColor: Colors.redAccent,
                selectedTextStyle: TextStyle(color: Colors.white),
              ),

              //LastPickTileTheme
              lastPickTile: LastPickTileTheme(
                title: "Last Pick",
                icon: Icon(Icons.check_circle_outline_outlined),
              ),

              //CurrentLocationTileTheme
              currentLocationTile: CurrentLocationTileTheme(
                visible: true,
                title: "Current Location",
              ),

              //SearchTileTheme
              searchTile: SearchTileTheme(
                visible: true,
                title: "my search",
                hint: "by code/name",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
