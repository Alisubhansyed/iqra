import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';
import 'Quranview.dart';

class Surah extends StatefulWidget {
  const Surah({Key? key}) : super(key: key);

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  static const _num = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];
  List<int> numberofayat = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(
                "assets/quran_kareem/urdu_translation/quranmetadata.json"),
            builder: (context, snapshot) {
              var qdata = json.decode(snapshot.data.toString());
              if (snapshot.hasData) {
                for (int i = 0; i < 114; i++) {
                  numberofayat.add(int.parse(
                    qdata["quran"]["suras"]["sura"][i]["ayas"],
                  ));
                }
                print(numberofayat.length);
              }

              return (snapshot.hasData)
                  ? ListView.builder(
                      itemCount: 114,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuranView(
                                              ayatInSura: numberofayat,
                                              ayatCount: qdata["quran"]["suras"]
                                                  ["sura"][index]["ayas"],
                                              surahCount: qdata["quran"]
                                                      ["suras"]["sura"][index]
                                                  ["index"],
                                              surahName: qdata["quran"]["suras"]
                                                  ["sura"][index]["name"],
                                            )));
                              },
                              child: ListTile(
                                title: Text(
                                  qdata["quran"]["suras"]["sura"][index]
                                      ["tname"],
                                  // "Ali",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                subtitle: Text(
                                  "${qdata["quran"]["suras"]["sura"][index]["type"]}-Verses:${qdata["quran"]["suras"]["sura"][index]["ayas"]}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Color(0xff005d66),
                                  child: Center(
                                      child: Text(
                                    qdata["quran"]["suras"]["sura"][index]
                                        ["index"],
                                    // "5",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                      qdata["quran"]["suras"]["sura"][index]
                                          ["name"],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primayColor,
                        ),
                      ),
                    );
            }));
  }
}
