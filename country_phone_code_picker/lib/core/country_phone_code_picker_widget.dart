import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:country_phone_code_picker/models/country.dart';
import 'package:country_phone_code_picker/core/country_phone_code_picker_sheet.dart';
import 'package:country_phone_code_picker/controller/country_controller.dart';
import 'package:country_phone_code_picker/constants/country_flag_image.dart';
import 'package:country_phone_code_picker/constants/country_codes.dart';

//the default dropdownwidget for picking the country code
// ignore: must_be_immutable
class CountryPhoneCodePicker extends StatelessWidget {
  CountryController countryController;
  // ignore: use_key_in_widget_constructors
  CountryPhoneCodePicker({
    required this.countryController,
    this.height = 45,
    this.width = 80,
    this.flagHeight = 30,
    this.flagWidth = 30,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 15,
    this.flagBorderRadius = 5,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    this.countryNameTextStyle =
        const TextStyle(fontSize: 14, color: Colors.black),
    this.countryPhoneCodeTextStyle =
        const TextStyle(color: Colors.black, fontSize: 14),
    this.showFlag = true,
    this.showName = false,
    this.showPhoneCode = false,
    this.actionIcon = const Icon(Icons.arrow_drop_down_rounded),
    this.searchSheetBackground = const Color(0xfffafafa),
    this.searchBarLeadingIcon =
        const Icon(Icons.arrow_back_outlined, color: Colors.black),
    this.searchBarHintText,
    this.searchBarHintStyle = const TextStyle(),
    this.searchBarLabelText,
    this.searchBarLabelStyle = const TextStyle(),
    this.searchBarHelperText,
    this.searchBarHelperStyle = const TextStyle(),
    this.searchBarPrefixText,
    this.searchBarPrefixStyle = const TextStyle(),
    this.searchBarPrefixIcon = const Icon(Icons.search, color: Colors.black),
    this.searchBarContentPadding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.border = const OutlineInputBorder(borderSide: BorderSide.none),
    this.errorBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.focusedBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.disabledBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.focusedErrorBorder =
        const OutlineInputBorder(borderSide: BorderSide.none),
    this.enabledBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.searchBarCursorColor = Colors.black,
    this.searchBarCursorHeight = 20,
    this.searchBarCursorWidth = 2,
    this.style = const TextStyle(),
    this.searchBarInitialValue = '',
    this.keyboardType = TextInputType.text,
    this.showCursor = true,
  });

  // ignore: use_key_in_widget_constructors
  CountryPhoneCodePicker.withDefaultSelectedCountry({
    required this.countryController,
    required this.defaultCountryCode,
    this.height = 45,
    this.width = 80,
    this.flagHeight = 30,
    this.flagWidth = 30,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 15,
    this.flagBorderRadius = 5,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    this.countryNameTextStyle =
        const TextStyle(fontSize: 14, color: Colors.black),
    this.countryPhoneCodeTextStyle =
        const TextStyle(color: Colors.black, fontSize: 14),
    this.showFlag = true,
    this.showName = false,
    this.showPhoneCode = false,
    this.actionIcon = const Icon(Icons.arrow_drop_down_rounded),
    this.searchSheetBackground = const Color(0xfffafafa),
    this.searchBarLeadingIcon =
        const Icon(Icons.arrow_back_outlined, color: Colors.black),
    this.searchBarHintText,
    this.searchBarHintStyle = const TextStyle(),
    this.searchBarLabelText,
    this.searchBarLabelStyle = const TextStyle(),
    this.searchBarHelperText,
    this.searchBarHelperStyle = const TextStyle(),
    this.searchBarPrefixText,
    this.searchBarPrefixStyle = const TextStyle(),
    this.searchBarPrefixIcon = const Icon(Icons.search, color: Colors.black),
    this.searchBarContentPadding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.border = const OutlineInputBorder(borderSide: BorderSide.none),
    this.errorBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.focusedBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.disabledBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.focusedErrorBorder =
        const OutlineInputBorder(borderSide: BorderSide.none),
    this.enabledBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.searchBarCursorColor = Colors.black,
    this.searchBarCursorHeight = 20,
    this.searchBarCursorWidth = 2,
    this.style = const TextStyle(),
    this.searchBarInitialValue = '',
    this.keyboardType = TextInputType.text,
    this.showCursor = true,
  });

  Country defaultCountryCode = countries[0];

  //height of the drop down button widget
  final double height;

  //width of the drop down button widget
  final double width;

  //height of the flag
  final double flagHeight;

  //width of flag
  final double flagWidth;

  //background color of the drop down widget
  final Color backgroundColor;

  //border radius of the curve around the drop down widget
  final double borderRadius;

  //border radius of the curve around the flag
  final double flagBorderRadius;

  //color of the border
  final Color borderColor;

  //width of the custom border
  final double borderWidth;

  //space between the border of the drop down widget and the elements inside the widget
  final EdgeInsetsGeometry contentPadding;

  //textstyle of the name of the country inside drop down widget
  final TextStyle countryNameTextStyle;

  //textstyle of the phone code of the country inside drop down widget
  final TextStyle countryPhoneCodeTextStyle;

  //if want to show flag in drop down button then set to true
  final bool showFlag;

  //if want to show name in drop down button then set to true
  final bool showName;

  //if want to show phone code in drop down button then set to true
  final bool showPhoneCode;

  //icon for drop down button
  final Icon actionIcon;

  //-------------------------------------------------------------------------------------------------

  //color of the background of the sheet
  Color searchSheetBackground;

  //leading icon in the appbar that exits the modal sheet page
  Icon searchBarLeadingIcon;

  //hint text for search bar
  String? searchBarHintText;

  //styling for hint text
  TextStyle searchBarHintStyle;

  //label text for search bar
  String? searchBarLabelText;

  //styling for label text
  TextStyle searchBarLabelStyle;

  //helper text for search bar
  String? searchBarHelperText;

  //styling for helper text
  TextStyle searchBarHelperStyle;

  //prefix text for search bar
  String? searchBarPrefixText;

  //styling for prefix text
  TextStyle searchBarPrefixStyle;

  //prefix icon for search bar
  Icon searchBarPrefixIcon;

  //padding inside the search bar text field
  EdgeInsetsGeometry searchBarContentPadding;

  //border of search bar text field
  InputBorder border;

  //error border for search bar text field
  InputBorder errorBorder;

  //focused border for search bar text field
  InputBorder focusedBorder;

  //disabled border for search bar text field
  InputBorder disabledBorder;

  //focused error border for search bar text field
  InputBorder focusedErrorBorder;

  //enabled border for search bar text field
  InputBorder enabledBorder;

  //color of cursor of search bar text field
  Color searchBarCursorColor;

  //height of cursor of search bar text field
  double searchBarCursorHeight;

  //width of cursor of search bar text field
  double searchBarCursorWidth;

  //text style of the input inside search bar text field
  TextStyle style;

  //initial value of the input in search bar text field
  String searchBarInitialValue;

  //keyboard type of search bar text field
  TextInputType keyboardType;

  //show cursor if the value is set to true
  bool showCursor;

  @override
  Widget build(BuildContext context) {
    countryController.updateSelectedCountry(defaultCountryCode);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => CountryPhoneCodePickerModalSheet(
              searchSheetBackground: searchSheetBackground,
              searchBarLeadingIcon: searchBarLeadingIcon,
              searchBarHintText: searchBarHintText,
              searchBarHintStyle: searchBarHintStyle,
              searchBarLabelText: searchBarLabelText,
              searchBarLabelStyle: searchBarLabelStyle,
              searchBarHelperText: searchBarHelperText,
              searchBarHelperStyle: searchBarHelperStyle,
              searchBarPrefixText: searchBarPrefixText,
              searchBarPrefixStyle: searchBarPrefixStyle,
              searchBarPrefixIcon: searchBarPrefixIcon,
              searchBarContentPadding: searchBarContentPadding,
              border: border,
              errorBorder: errorBorder,
              focusedBorder: focusedBorder,
              disabledBorder: disabledBorder,
              focusedErrorBorder: focusedErrorBorder,
              enabledBorder: enabledBorder,
              searchBarCursorColor: searchBarCursorColor,
              searchBarCursorHeight: searchBarCursorHeight,
              searchBarCursorWidth: searchBarCursorWidth,
              style: style,
              searchBarInitialValue: searchBarInitialValue,
              keyboardType: keyboardType,
              showCursor: showCursor,
            ),
          ),
        );
      },
      child: GetBuilder<CountryController>(
        builder: (controller) {
          return Container(
            height: height,
            width: width,
            padding: contentPadding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor, width: borderWidth),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showFlag == true
                    ? Container(
                        height: flagHeight,
                        width: flagWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(flagBorderRadius),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              countryFlagApi + controller.selectedCountry.code,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                showName == true
                    ? Expanded(
                        child: Text(
                          controller.selectedCountry.name,
                          style: countryNameTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox(),
                showPhoneCode == true
                    ? Text(
                        controller.selectedCountry.phoneCode,
                        style: countryPhoneCodeTextStyle,
                      )
                    : const SizedBox(),
                actionIcon,
              ],
            ),
          );
        },
      ),
    );
  }
}
