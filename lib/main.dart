import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/countPro.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
final directory= await getApplicationDocumentsDirectory();
Hive.init(directory.path.toString());

  runApp( ChangeNotifierProvider<CountPro>(
      create: (BuildContext context)=>CountPro(),
  child: const MaterialApp(home: MyApp(),))

  );

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int count=0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
fun();

}
void fun()async{
  print('i am called');
  final box=await Hive.openBox('vikas');
  if(box.containsKey('count')){
    count=box.get('count');


  }
  else {
    count=0;

  }

}


  @override
  Widget build(BuildContext context) {
    final ref=Provider.of<CountPro>(context,listen: false);
    ref.fun(count);
print('again and again');
 return Scaffold(
   body:Center(child: Consumer<CountPro>(builder: (context,value,child){
     return Text(value.count.toString());

   },),),

 floatingActionButton: FloatingActionButton(onPressed: ()async{
  var boxes=await Hive.openBox('vikas');

count++;
  boxes.put('count', count);
ref.fun(count);
  print(count.toString());
},
 child: Icon(Icons.add),),);



}
}

