import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javier_dicoding_final/property/svg_property.dart';

class HalamanKecepatan extends StatefulWidget {
  const HalamanKecepatan({Key? key}) : super(key: key);

  @override
  State<HalamanKecepatan> createState() => _HalamanKecepatanState();
}

class _HalamanKecepatanState extends State<HalamanKecepatan> {
  num? drdBerat1, drdBerat2;
  num input = 0;
  num hasil = 0;

  void resultNum() {
    setState(() {
      if (drdBerat1 == null || drdBerat2 == null) {
        hasil = input;
      } else if (drdBerat1 == 0 && drdBerat2 == 1) {
        hasil = input / 3600;
      } else if (drdBerat1 == 0 && drdBerat2 == 2) {
        hasil = input / 3.6;
      } else if (drdBerat1 == 1 && drdBerat2 == 0) {
        hasil = input * 3600;
      } else if (drdBerat1 == 1 && drdBerat2 == 2) {
        hasil = input * 1000;
      } else if (drdBerat1 == 2 && drdBerat2 == 0) {
        hasil = input * 3.6;
      } else if (drdBerat1 == 2 && drdBerat2 == 1) {
        hasil = input / 1000;
      } else {
        hasil = input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
                fit: BoxFit.cover,
                child: SvgPicture.asset(background_kecepatan)),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 18, left: 22),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                  ),
                  SizedBox(height: 46),
                  Hero(
                      tag: 'kecepatan',
                      child: SvgPicture.asset(logo_kecepatan)),
                  SizedBox(height: 126),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Masukkan angka",
                              border: OutlineInputBorder()),
                          onChanged: (value) {
                            input = num.parse(value);
                            resultNum();
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 110,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          items: <DropdownMenuItem<num>>[
                            DropdownMenuItem(child: Text("KM/h"), value: 0),
                            DropdownMenuItem(child: Text("KM/s"), value: 1),
                            DropdownMenuItem(child: Text("M/s"), value: 2),
                          ],
                          value: drdBerat1,
                          hint: Text("kecepatan"),
                          onChanged: (num? value) {
                            setState(() {
                              drdBerat1 = value;
                              resultNum();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              labelText: hasil.toString(),
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 110,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          items: <DropdownMenuItem<num>>[
                            DropdownMenuItem(child: Text("KM/h"), value: 0),
                            DropdownMenuItem(child: Text("KM/s"), value: 1),
                            DropdownMenuItem(child: Text("M/s"), value: 2),
                          ],
                          value: drdBerat2,
                          hint: Text("Kecepatan"),
                          onChanged: (num? value) {
                            setState(() {
                              drdBerat2 = value;
                              resultNum();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
