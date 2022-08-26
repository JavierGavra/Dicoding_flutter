import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javier_dicoding_final/property/svg_property.dart';

class HalamanWaktu extends StatefulWidget {
  const HalamanWaktu({Key? key}) : super(key: key);

  @override
  State<HalamanWaktu> createState() => _HalamanWaktuState();
}

class _HalamanWaktuState extends State<HalamanWaktu> {
  num? drdBerat1, drdBerat2;
  num input = 0;
  num hasil = 0;

  void resultNum() {
    setState(() {
      if (drdBerat1 == null || drdBerat2 == null) {
        hasil = input;
      } else if (drdBerat1 == 0 && drdBerat2 == 1) {
        hasil = detikToMenit(input);
      } else if (drdBerat1 == 0 && drdBerat2 == 2) {
        hasil = detikToJam(input);
      } else if (drdBerat1 == 0 && drdBerat2 == 3) {
        hasil = detikToHari(input);
      } else if (drdBerat1 == 0 && drdBerat2 == 4) {
        hasil = detikToTahun(input);
      } else if (drdBerat1 == 1 && drdBerat2 == 0) {
        hasil = menitToDetik(input);
      } else if (drdBerat1 == 1 && drdBerat2 == 2) {
        hasil = detikToJam(menitToDetik(input));
      } else if (drdBerat1 == 1 && drdBerat2 == 3) {
        hasil = detikToHari(menitToDetik(input));
      } else if (drdBerat1 == 1 && drdBerat2 == 4) {
        hasil = detikToTahun(menitToDetik(input));
      } else if (drdBerat1 == 2 && drdBerat2 == 0) {
        hasil = jamToDetik(input);
      } else if (drdBerat1 == 2 && drdBerat2 == 1) {
        hasil = detikToMenit(jamToDetik(input));
      } else if (drdBerat1 == 2 && drdBerat2 == 3) {
        hasil = detikToHari(jamToDetik(input));
      } else if (drdBerat1 == 2 && drdBerat2 == 4) {
        hasil = detikToTahun(jamToDetik(input));
      } else if (drdBerat1 == 3 && drdBerat2 == 0) {
        hasil = hariToDetik(input);
      } else if (drdBerat1 == 3 && drdBerat2 == 1) {
        hasil = detikToMenit(hariToDetik(input));
      } else if (drdBerat1 == 3 && drdBerat2 == 2) {
        hasil = detikToJam(hariToDetik(input));
      } else if (drdBerat1 == 3 && drdBerat2 == 4) {
        hasil = detikToTahun(hariToDetik(input));
      } else if (drdBerat1 == 4 && drdBerat2 == 0) {
        hasil = tahunToDetik(input);
      } else if (drdBerat1 == 4 && drdBerat2 == 1) {
        hasil = detikToMenit(tahunToDetik(input));
      } else if (drdBerat1 == 4 && drdBerat2 == 2) {
        hasil = detikToJam(tahunToDetik(input));
      } else if (drdBerat1 == 4 && drdBerat2 == 3) {
        hasil = detikToHari(tahunToDetik(input));
      } else {
        hasil = input;
      }
    });
  }

  // all to Detik
  num tahunToDetik(num tahun) {
    return (((tahun * 365.25) * 24) * 60) * 60;
  }

  num mingguToDetik(num minggu) {
    return (((minggu * 7) * 24) * 60) * 60;
  }

  num hariToDetik(num hari) {
    return ((hari * 24) * 60) * 60;
  }

  num jamToDetik(num jam) {
    return (jam * 60) * 60;
  }

  num menitToDetik(num menit) {
    return menit * 60;
  }

  // Detik to all
  num detikToMenit(num detik) {
    return detik / 60;
  }

  num detikToJam(num detik) {
    return (detik / 60) / 60;
  }

  num detikToHari(num detik) {
    return ((detik / 60) / 60) / 24;
  }

  num detikToMinggu(num detik) {
    return (((detik / 7) / 24) / 60) / 60;
  }

  num detikToTahun(num detik) {
    return (((detik / 365.25) / 24) / 60) / 60;
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
                fit: BoxFit.cover, child: SvgPicture.asset(background_waktu)),
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
                  Hero(tag: 'waktu', child: SvgPicture.asset(logo_waktu)),
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
                            DropdownMenuItem(child: Text("detik"), value: 0),
                            DropdownMenuItem(child: Text("menit"), value: 1),
                            DropdownMenuItem(child: Text("jam"), value: 2),
                            DropdownMenuItem(child: Text("hari"), value: 3),
                            DropdownMenuItem(child: Text("tahun"), value: 4),
                          ],
                          value: drdBerat1,
                          hint: Text("Waktu"),
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
                            DropdownMenuItem(child: Text("detik"), value: 0),
                            DropdownMenuItem(child: Text("menit"), value: 1),
                            DropdownMenuItem(child: Text("jam"), value: 2),
                            DropdownMenuItem(child: Text("hari"), value: 3),
                            DropdownMenuItem(child: Text("tahun"), value: 4),
                          ],
                          value: drdBerat2,
                          hint: Text("Waktu"),
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
