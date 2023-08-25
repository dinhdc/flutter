import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromRGBO(79, 99, 172, 1);
const secondaryColor = Color.fromRGBO(218, 218, 218, 1);
const grayLightColor = Color.fromRGBO(245, 245, 245, 1);
const grayLabelColor = Color.fromRGBO(153, 153, 153, 1);
const gray2LabelColor = Color.fromRGBO(96, 96, 96, 1);

const darkLightColor = Color.fromRGBO(63, 74, 89, 1);
const blueColor = Color.fromRGBO(79, 99, 172, 1);
const darkColor = Color.fromRGBO(48, 48, 48, 1);
var montserratFFW500 = GoogleFonts.montserrat(
    color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500);
var montserratFFW600 = GoogleFonts.montserrat(
    color: primaryColor, fontSize: 14, fontWeight: FontWeight.w600);
var montserratHeader = GoogleFonts.montserrat(
    color: darkColor, fontSize: 16, fontWeight: FontWeight.w700);

var categoryNormalStyle = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: grayLabelColor
);

var categorySelectedStyle =  GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: primaryColor
);

var productNameStyle = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: gray2LabelColor
);

var productPriceStyle = GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: darkColor
);