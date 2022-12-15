import 'package:flutter/material.dart';

class CDialogTheme {
  final PreferredSizeWidget? appBar;
  final bool isShowFloatButton;
  final bool isShowDialCode;
  final bool isShowFlage;

  final TextStyle titlesStyle;
  final Color titlesBackground;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double tileHeight;

  final AlphabetsBar alphabetsBar;
  final CurrentLocationTileTheme currentLocationTile;
  final LastPickTileTheme lastPickTile;
  final SearchTileTheme searchTile;

  // final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);

  const CDialogTheme({
    this.alphabetsBar = const AlphabetsBar(),
    this.currentLocationTile = const CurrentLocationTileTheme(),
    this.lastPickTile = const LastPickTileTheme(),
    this.searchTile = const SearchTileTheme(),
    this.appBar,
    this.isShowFlage = true,
    this.isShowFloatButton = true,
    this.backgroundColor = Colors.transparent,
    this.titlesStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.titlesBackground = const Color(0xfff4f4f4),
    this.isShowDialCode = true,
    this.textStyle = const TextStyle(fontSize: 16),
    this.tileHeight = 50.0,
  });
}

class AlphabetsBar {
  final bool visible;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final TextStyle textStyle;
  final TextStyle selectedTextStyle;

  const AlphabetsBar({
    this.visible = true,
    this.backgroundColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.transparent,
    this.textStyle = const TextStyle(fontSize: 12),
    this.selectedTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  });
}

class CurrentLocationTileTheme {
  final bool visible;
  final String title;
  const CurrentLocationTileTheme({
    this.visible = true,
    this.title = "Current Location",
  });
}

class LastPickTileTheme {
  final bool visible;
  final String title;
  final Icon icon;
  const LastPickTileTheme({
    this.visible = true,
    this.title = "Last Pick",
    this.icon = const Icon(Icons.check),
  });
}

class SearchTileTheme {
  final bool visible;
  final String title;
  final String hint;
  const SearchTileTheme({
    this.visible = true,
    this.title = "Search",
    this.hint = "name/dial code...",
  });
}
