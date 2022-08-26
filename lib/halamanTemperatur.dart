import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javier_dicoding_final/property/svg_property.dart';

class HalamanTemperatur extends StatefulWidget {
  const HalamanTemperatur({Key? key}) : super(key: key);

  @override
  State<HalamanTemperatur> createState() => _HalamanTemperaturState();
}

class _HalamanTemperaturState extends State<HalamanTemperatur> {
  String? drdBerat1, drdBerat2;
  num input = 0;
  num hasil = 0;

  void resultNum() {
    setState(() {
      if (drdBerat1 == null || drdBerat2 == null) {
        hasil = input;
      } else if (drdBerat1 == "f" && drdBerat2 == "c") {
        hasil = FtoC(input);
      } else if (drdBerat1 == "f" && drdBerat2 == "k") {
        hasil = FtoK(input);
      } else if (drdBerat1 == "c" && drdBerat2 == "f") {
        hasil = CtoF(input);
      } else if (drdBerat1 == "c" && drdBerat2 == "k") {
        hasil = CtoK(input);
      } else if (drdBerat1 == "k" && drdBerat2 == "f") {
        hasil = KtoF(input);
      } else if (drdBerat1 == "k" && drdBerat2 == "c") {
        hasil = KtoC(input);
      } else {
        hasil = input;
      }
    });
  }

  // F to all
  num FtoC(num F) {
    return (F - 32) * 5 / 9;
  }

  num FtoK(num F) {
    return (F - 32) * 5 / 9 + 273.15;
  }

  // C to all
  num CtoF(num C) {
    return (C * 9 / 5) + 32;
  }

  num CtoK(num C) {
    return C + 273.15;
  }

  // K to all
  num KtoF(num K) {
    return (K - 273.15) * 9 / 5 + 32;
  }

  num KtoC(num K) {
    return K - 273.15;
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
                child: SvgPicture.asset(background_temperatur)),
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
                  Hero(tag: 'temper', child: SvgPicture.asset(logo_temperatur)),
                  SizedBox(height: 126),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 160,
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
                        width: 120,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem(
                                child: Text("Fahrenheit"), value: "f"),
                            DropdownMenuItem(
                                child: Text("Celcius"), value: "c"),
                            DropdownMenuItem(child: Text("Kelvin"), value: "k"),
                          ],
                          value: drdBerat1,
                          hint: Text("Temperatur"),
                          onChanged: (String? value) {
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
                        width: MediaQuery.of(context).size.width - 160,
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
                        width: 120,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem(
                                child: Text("Fahrenheit"), value: "f"),
                            DropdownMenuItem(
                                child: Text("Celcius"), value: "c"),
                            DropdownMenuItem(child: Text("Kelvin"), value: "k"),
                          ],
                          value: drdBerat2,
                          hint: Text("Temperatur"),
                          onChanged: (String? value) {
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
