import 'package:flutter/material.dart';

class mezunLogin extends StatefulWidget {
  @override
  _mezunLogin createState() => _mezunLogin();
}

class _mezunLogin extends State<mezunLogin> {
  String _adSoyad, _sifre, _emailAdres;
  bool otomatikKontrol = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.indigo, errorColor: Colors.red),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "MEZUN TRAKYA",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            autovalidate: otomatikKontrol,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_balance),
                    hintText: "Adınız ve Soyadınız",
                    labelText: "Ad Soyad",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal[700])),
                  ),
                  // initialValue: "nesibe",
                  validator: _ismiOnayla,
                  onSaved: (deger) => _adSoyad = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "E-mail Adresiniz",
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal[700]))),
                  validator: _emailKontrol,
                  onSaved: (deger) => _emailAdres = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Şifreniz",
                      labelText: "Şifre",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal[700]))),
                  validator: (String girilenVeri) {
                    if (girilenVeri.length != 10) {
                      return "Geçersiz Şifre";
                    } else
                      return null;
                  },
                  onSaved: (deger) => _sifre = deger,
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("GİRİŞ"),
                  color: Colors.teal,
                  disabledColor: Colors.indigo,
                  onPressed: _girilenBilgileriOnayla,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _girilenBilgileriOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Girilen Mail: $_emailAdres Şifre: $_sifre Ad Soyad: $_adSoyad");
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return "Geçersiz Email";
    else
      return null;
  }

  String _ismiOnayla(String isim) {
    RegExp regex = RegExp("^[a-zA-Z]+\$");
    if (!regex.hasMatch(isim))
      return "İsim Numara İçermemeli";
    else
      return null;
  }
}
