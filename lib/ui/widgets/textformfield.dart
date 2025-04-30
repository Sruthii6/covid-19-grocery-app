import 'package:flutter/material.dart';
import 'package:grocery/ui/widgets/responsive_ui.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;

  CustomTextField(
    {this.hint,
      this.textEditingController,
      this.keyboardType,
      this.icon,
      this.obscureText= false,
     });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  double _width;

  double _pixelRatio;

  bool large;

  bool medium;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium=  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: large? 12 : (medium? 10 : 8),
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.orange[200], size: 20),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
      ),
    );
  }
}
