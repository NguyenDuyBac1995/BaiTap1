import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Common {
  TextFormField textFromField({
    String labelValue = "",
    String hintValue = "",
    bool? validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? textStyle,
    String? validationError,
    bool obscureText = false,
    bool isReadOnly = false,
    Widget? icons,
    Widget? suffixIcon,
    FocusNode? fn,
    VoidCallback? callBackSearch,
    VoidCallback? callback,
    String? text,
  }) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: TextStyles.textSize22,
      controller: controller,
      obscureText: obscureText,
      focusNode: fn,
      onChanged: (String? val) {
        val = text;
        callBackSearch;
      },
      validator: (String? val) {
        if (validation!) {
          if (val!.isEmpty) {
            return validationError;
          }
        }
      },
      decoration: InputDecoration(
        hintText: hintValue,
        hintStyle: TextStyles.textAppBar,
        prefixIcon: icons,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.black38),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
    return textFormField;
  }

  GestureDetector ButtonStyle({
    String? textValue,
    Color? color,
    double? width,
    VoidCallback? callback,
    bool icon = true,
  }) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textValue ?? '',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(width: 5),
            icon == true ?Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ): Text(''),
          ],
        ),
      ),
      onTap: () {
        callback;
      },
    );
  }

  Container FolderFont({
    int? color,
    String? name,
    String? date,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      decoration: BoxDecoration(
          color: Color(color!).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Stack(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Container(
                          padding: EdgeInsets.only(left: 1),
                          child: SvgPicture.asset(
                            'assets/svg/Vector (2).svg',
                            color: Color(color),
                          )),
                    ),
                    Transform.scale(
                      scale: 1.2,
                      child: Container(
                        padding: EdgeInsets.only(top: 3),
                        child: SvgPicture.asset(
                          'assets/svg/Vector (1).svg',
                          color: Color(color).withOpacity(0.65),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Transform.scale(
                  scale: 1.2,
                  child: SvgPicture.asset(
                    'assets/svg/More Option.svg',
                    color: Color(color),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            name ?? '',
            style: TextStyles.textAppBar.copyWith(color: Color(color)),
          ),
          SizedBox(height: 5),
          Text(
            date ?? "",
            style: TextStyles.textSize13.copyWith(color: Color(color)),
          )
        ],
      )),
    );
  }
  ListTile ItemList(
  {
  String? strName,
  bool value = false,
    VoidCallback? callback,
}
      ){
    return ListTile(
      leading: Container(
          padding: EdgeInsets.only(right: 20),
          height: 50,
          width: 4,
          color:
        value == true ? Color(0xFF567DF4) : Color(0xffE5E5E5),
      ),
      title: Text(
        strName??'',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'gilroy',
          fontWeight:
          value == true ? FontWeight.bold : FontWeight.w400
        ),
      ),
      onTap: callback,
    );
  }
}
