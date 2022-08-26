import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:javier_dicoding_final/halamanBerat.dart';
import 'package:javier_dicoding_final/halamanData.dart';
import 'package:javier_dicoding_final/halamanKecepatan.dart';
import 'package:javier_dicoding_final/halamanLuas.dart';
import 'package:javier_dicoding_final/halamanPanjang.dart';
import 'package:javier_dicoding_final/halamanTemperatur.dart';
import 'package:javier_dicoding_final/halamanWaktu.dart';
import 'package:javier_dicoding_final/property/svg_property.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 218,
              backgroundColor: Color(0xffff0000),
              flexibleSpace: FlexibleSpaceBar(
                background: SvgPicture.asset(banner_image),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(27),
              sliver: SliverGrid.count(
                crossAxisSpacing: 34,
                mainAxisSpacing: 41,
                crossAxisCount: 2,
                childAspectRatio: (140 / 100),
                children: [
                  MenuButton(
                      tag: 'berat',
                      img: berat_button,
                      pageDestination: HalamanBerat()),
                  MenuButton(
                      tag: 'panjang',
                      img: panjang_button,
                      pageDestination: HalamanPanjang()),
                  MenuButton(
                      tag: 'temper',
                      img: temperatur_button,
                      pageDestination: HalamanTemperatur()),
                  MenuButton(
                      tag: 'waktu',
                      img: waktu_button,
                      pageDestination: HalamanWaktu()),
                  MenuButton(
                      tag: 'kecepatan',
                      img: kecepatan_button,
                      pageDestination: HalamanKecepatan()),
                  MenuButton(
                      tag: 'luas',
                      img: luas_button,
                      pageDestination: HalamanLuas()),
                  MenuButton(
                      tag: 'data',
                      img: data_button,
                      pageDestination: HalamanData()),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height / 2 / 2,
                color: Color(0xffececec),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Color(0xffff0000),
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "by : Javier Gavra A.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        // bottomNavigationBar: ,
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  MenuButton(
      {Key? key,
      required this.img,
      required this.pageDestination,
      required this.tag})
      : super(key: key);
  var tag, img, pageDestination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pageDestination));
      },
      splashColor: Color(0xffff0000),
      borderRadius: BorderRadius.circular(6),
      child: Card(child: Hero(tag: tag, child: SvgPicture.asset(img))),
    );
  }
}

Future<bool> showExitPopup(context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text("Yakin ingin keluar?", style: TextStyle(fontSize: 15)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No", style: TextStyle(color: Color(0xffff0000))),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text("Yes", style: TextStyle(color: Color(0xffff0000))),
          ),
        ],
      );
    },
  );
}
