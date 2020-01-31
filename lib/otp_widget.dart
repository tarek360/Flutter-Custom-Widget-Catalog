import 'package:flutter/material.dart';

class OtpWidget extends StatefulWidget {
  OtpWidget(this.materialColor);

  final int otpFieldsNumber = 4;
  final MaterialColor materialColor;

  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  List<String> otpFieldsValues;

  @override
  void initState() {
    super.initState();
    otpFieldsValues = List.generate(widget.otpFieldsNumber, (i) => '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.materialColor.shade900,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: otpFieldsValues
                    .map((value) => _OtpField(value, widget.materialColor))
                    .toList()),
            FlatButton(
              child: Text(
                'Resend code',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: widget.materialColor.shade50),
              ),
              onPressed: onResendTap,
            ),
            SizedBox(height: 8),
            _RowKeys(onKeyTap, widget.materialColor, '1', '2', '3'),
            _RowKeys(onKeyTap, widget.materialColor, '4', '5', '6'),
            _RowKeys(onKeyTap, widget.materialColor, '7', '8', '9'),
            _RowKeys(onKeyTap, widget.materialColor, '', '0', 'backspace'),
          ],
        ),
      ),
    );
  }

  void onResendTap() {
    otpFieldsValues = List.generate(widget.otpFieldsNumber, (i) => '');
    setState(() {});
  }

  void onKeyTap(String key) {
    if (key == 'backspace') {
      for (var i = otpFieldsValues.length - 1; i >= 0; --i) {
        if (otpFieldsValues[i].isNotEmpty) {
          otpFieldsValues[i] = '';
          break;
        }
      }
    } else {
      for (var i = 0; i < otpFieldsValues.length; ++i) {
        if (otpFieldsValues[i].isEmpty) {
          otpFieldsValues[i] = key;
          break;
        }
      }
    }
    setState(() {});
  }
}

typedef _KeyCallback = void Function(String key);

class _RowKeys extends StatelessWidget {
  _RowKeys(
      this.callback, this.materialColor, this.start, this.center, this.end);

  final _KeyCallback callback;
  final MaterialColor materialColor;
  final String start;
  final String center;
  final String end;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DigitKey(start, callback, materialColor),
        DigitKey(center, callback, materialColor),
        DigitKey(end, callback, materialColor),
      ],
    );
  }
}

class _OtpField extends StatelessWidget {
  _OtpField(this.text, this.materialColor);

  final String text;
  final MaterialColor materialColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 48,
        height: 48,
        decoration: ShapeDecoration(
          color: materialColor.shade500,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DigitKey extends StatelessWidget {
  DigitKey(this.text, this.callback, this.materialColor);

  final String text;
  final _KeyCallback callback;
  final MaterialColor materialColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: SizedBox(
        width: 64,
        height: 42,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          color: materialColor.shade800,
          highlightColor: materialColor.shade600,
          child: text == 'backspace'
              ? Icon(
                  Icons.backspace,
                  color: Colors.white,
                  size: 18,
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.button.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
          onPressed: text.isEmpty ? null : () => callback(text),
        ),
      ),
    );
  }
}
