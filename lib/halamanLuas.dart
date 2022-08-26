import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javier_dicoding_final/property/svg_property.dart';

class HalamanLuas extends StatefulWidget {
  const HalamanLuas({Key? key}) : super(key: key);

  @override
  State<HalamanLuas> createState() => _HalamanLuasState();
}

class _HalamanLuasState extends State<HalamanLuas> {
  num? drdBerat1, drdBerat2;
  num input = 0;
  num hasil = 0;

  void resultNum() {
    setState(() {
      if (drdBerat1 == null || drdBerat2 == null) {
        hasil = input;
      } else if (drdBerat1! > drdBerat2!) {
        hasil = input * (drdBerat1! / drdBerat2!);
      } else if (drdBerat1! < drdBerat2!) {
        hasil = input / (drdBerat2! / drdBerat1!);
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
                fit: BoxFit.cover, child: SvgPicture.asset(background_luas)),
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
                  Hero(tag: 'luas', child: SvgPicture.asset(logo_luas)),
                  SizedBox(height: 126),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 140,
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
                        width: 100,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          items: <DropdownMenuItem<num>>[
                            DropdownMenuItem(
                                child: Text("km²"), value: 1000000000000),
                            DropdownMenuItem(
                                child: Text("Hektar"), value: 10000000000),
                            DropdownMenuItem(child: Text("m²"), value: 1000000),
                            DropdownMenuItem(child: Text("cm²"), value: 100),
                            DropdownMenuItem(child: Text("mm²"), value: 1),
                          ],
                          value: drdBerat1,
                          hint: Text("Luas"),
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
                        width: MediaQuery.of(context).size.width - 140,
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
                        width: 100,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          items: <DropdownMenuItem<num>>[
                            DropdownMenuItem(
                                child: Text("km²"), value: 1000000000000),
                            DropdownMenuItem(
                                child: Text("Hektar"), value: 10000000000),
                            DropdownMenuItem(child: Text("m²"), value: 1000000),
                            DropdownMenuItem(child: Text("cm²"), value: 100),
                            DropdownMenuItem(child: Text("mm²"), value: 1),
                          ],
                          value: drdBerat2,
                          hint: Text("Luas"),
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
