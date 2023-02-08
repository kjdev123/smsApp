import 'package:flutter/material.dart';

MaterialButton longButtons(String title, Function() fun,
    {Color color: const Color(0xfff063057), Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}
//Color(0xFFFFFF)
// label(String title) => Text(title, style: const TextStyle(color: Color(0xe0ffffff)),);
//
// InputDecoration buildInputDecoration(String hintText, IconData icon) {
//   return InputDecoration(
//     prefixIcon: Icon(icon, color: Color.fromRGBO(255, 255, 255, 1.0)),
//     // hintText: hintText,
//     contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
//     enabledBorder: const OutlineInputBorder(
//       // width: 0.0 produces a thin "hairline" border
//       borderSide: BorderSide(color: Color(0xe0ffffff), width: 1.0),
//     ),
//   );
// }

label(String title) => Text(title);

labelHeader(String header) => Text(
      header,
      style: TextStyle(
          fontSize: 30, color: Colors.blue[900], fontWeight: FontWeight.bold),
    );

labelHeaderWhite(String header) => Text(
      header,
      style: const TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    // hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}
