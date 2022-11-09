import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daniel Sandoval',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Convertidor de Moneda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class calculadora{
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1="USD";
String op2="COP";

List<DropdownMenuItem<String>>listaMoneda=<DropdownMenuItem<String>>[
  
  DropdownMenuItem(value:"USD" ,child: Text("USD")),
  DropdownMenuItem(value:"EUR" ,child: Text("EUR")),
  DropdownMenuItem(value:"COP" ,child: Text("COP")),

];

List<calculadora> cal = <calculadora>[
  calculadora("9", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("8", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("7", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("6", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("5", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("4", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("3", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("2", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("1", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("Limpiar", Colors.orange, Icon(Icons.cleaning_services)),
  calculadora("0", Color.fromARGB(255, 219, 219, 219), Icon(Icons.abc)),
  calculadora("=", Colors.orange, Icon(Icons.abc)),

];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 179, 179),
      appBar: AppBar(
        title: new Center(child: new Text(widget.title, textAlign: TextAlign.center))
      ),
      body:  Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(children: [
              Text("Moneda Origen: "),
              DropdownButton(
                value: op1,items: listaMoneda, onChanged:(String? x){
                  setState(() {
                    op1=x.toString();
                  });
                }),
              Text("Moneda Destino: "),
              DropdownButton(
                value: op2, items: listaMoneda, onChanged:(String? x){
                  setState(() {
                    op2=x.toString();
                  });
                }),
              ],
            ),
            TextField(
              controller: textOrigen,
              decoration: InputDecoration(
                labelText: "Origen",
                hintText: "0",
                icon: Icon(Icons.monetization_on_outlined)),
                ),
            TextField(
              controller: textDestino,
              decoration: InputDecoration(
                labelText: "Destino",
                hintText: "0",
                icon: Icon(Icons.monetization_on_rounded)),
                ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: cal[index].color ,
                    shape: CircleBorder(),
                    
                    child: ListTile(
                        title: Center(
                          child: index==9? cal[index].icono: Text(
                          cal[index].titulo,
                          style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                      ),
                      onTap: (){
                        if (index<9 || index==10){
                          textOrigen.text=textOrigen.text+cal[index].titulo;
                        }else if (index ==9){
                          textOrigen.clear();
                          // textOrigen.text="";// se puede usar tambier para limpiar
                          textDestino.clear();
                        }else{
                          if(op1=="USD" && op2=="COP"){
                            textDestino.text=
                            (double.parse(textOrigen.text)*5100)
                            .toString();
                          }
                          else if(op1=="COP" && op2=="USD"){
                            textDestino.text=
                            (double.parse(textOrigen.text)/5100)
                            .toString();
                          }
                          else if(op1=="EUR" && op2=="COP"){
                            textDestino.text=
                            (double.parse(textOrigen.text)*4930)
                            .toString();
                          }
                          else if(op1=="COP" && op2=="EUR"){
                            textDestino.text=
                            (double.parse(textOrigen.text)/4930)
                            .toString();
                          }
                          else if(op1=="USD" && op2=="EUR"){
                            textDestino.text=
                            (double.parse(textOrigen.text)*1.2)
                            .toString();
                          }
                          else if(op1=="EUR" && op2=="USD"){
                            textDestino.text=
                            (double.parse(textOrigen.text)/1.2)
                            .toString();
                          }else{
                            textDestino.text==textDestino.text;
                          }
                        
                        }                      
                        print(cal[index].titulo);
                      },
                    ),
                  ) ;
                },
              ),
            ),
          ],
        ),
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
