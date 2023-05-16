import 'package:flutter/material.dart';
import 'package:not_ortalamasi_hesaplayici/data/consts.dart';
import 'package:not_ortalamasi_hesaplayici/model/ders.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

TextEditingController controller = TextEditingController();

class _MyAppState extends State<MyApp> {
  double value = 4;
  double kredi = 1;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Ortalama Hesaplayıcı",
          style: TextStyle(color: Constants.mainColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Divider(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) {
                            name = value;
                          },
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: "Ders Adı",
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                borderSide: BorderSide.none),
                            fillColor: Constants.mainColor,
                            filled: true,
                            focusColor: Constants.mainColor,
                            hoverColor: Constants.mainColor,
                          ),
                        ),
                      ),
                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Constants.mainColor,
                                ),
                                child: Center(
                                  child: DropdownButton<double>(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      dropdownColor: Constants.mainColor,
                                      value: value,
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text("AA"),
                                          value: 4,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("BA"),
                                          value: 3.5,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("BB"),
                                          value: 3,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("CB"),
                                          value: 2.5,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("CC"),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("DC"),
                                          value: 1.5,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("DD"),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("FD"),
                                          value: 0.5,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("FF"),
                                          value: 0,
                                        )
                                      ],
                                      onChanged: (items) {
                                        setState(() {
                                          value = items!;
                                        });
                                      }),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Constants.mainColor,
                                ),
                                child: Center(
                                  child: DropdownButton<double>(
                                      style:
                                          const TextStyle(color: Colors.white),
                                      dropdownColor: Constants.mainColor,
                                      value: kredi,
                                      items: const [
                                        DropdownMenuItem(
                                          child: Text("1"),
                                          value: 1,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("2"),
                                          value: 2,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("3"),
                                          value: 3,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("4"),
                                          value: 4,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("5"),
                                          value: 5,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("6"),
                                          value: 6,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("7"),
                                          value: 7,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("8"),
                                          value: 8,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("9"),
                                          value: 9,
                                        ),
                                        DropdownMenuItem(
                                          child: Text("10"),
                                          value: 10,
                                        )
                                      ],
                                      onChanged: (items) {
                                        setState(() {
                                          kredi = items!;
                                        });
                                      }),
                                )),
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  if (name.isNotEmpty) {
                                    dersler.add(Ders(
                                        ad: name,
                                        kredi: kredi.toInt(),
                                        not: value));
                                    setState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Lütfen Geçerli Bir Ders Adı Giriniz...")));
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward_ios)))
                      ])
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(dersler.isNotEmpty
                              ? dersler.length.toString() + " Adet Ders"
                              : "Ders Seçiniz",style: Constants.textStyleDondur(color: Constants.mainColor,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(ortalamaHesapla().toStringAsFixed(1),style: Constants.textStyleDondur(color: Constants.mainColor,fontSize: 60),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("Ortalama",style: Constants.textStyleDondur(color: Constants.mainColor,),),
                        )
                      ],
                    ))
              ],
            ),
          ),
          const Divider(
            height: 10,
          ),
          Expanded(
              flex: 3,
              child: ListView.builder(
                  itemCount: dersler.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: GlobalKey(),
                      onDismissed: (direction) {
                        dersler.removeAt(index);
                        setState(() {
                          
                        });
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(dersler[index].ad),
                          subtitle: Text(
                              "${dersler[index].kredi.toInt()} Kredi , Not Değeri ${dersler[index].not.toInt()}"),
                          leading: CircleAvatar(
                            backgroundColor: Constants.mainColor,
                            child: Text(
                              (dersler[index].not * dersler[index].kredi)
                                  .toInt()
                                  .toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

double ortalamaHesapla() {
  double ortalama = 0;
  for (int i = 0; i < dersler.length; i++) {
    ortalama += (dersler[i].not * dersler[i].kredi);
  }
  return (ortalama / dersler.length);
}

List<Ders> dersler = [
  Ders(ad: "Almanca", kredi: 2, not: 2.5),
  Ders(ad: "Matematik", kredi: 6, not: 4)
];
