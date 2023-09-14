import 'package:flutter/material.dart';
import 'package:untitled2/shared%20pref.dart';
import 'componants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  var descriptionController=TextEditingController(),
      headController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var descriptionController=TextEditingController(),
        headController=TextEditingController();
    var formKey=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('app',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),elevation: 0.0,
        actions:  [IconButton(icon:const Icon(Icons.search), onPressed: () { },)],),
      body: ListView.builder(itemBuilder:(context,index)=> card(tags[index],des[index],index),
        itemCount: tags.length,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SizedBox(
                    height: 330,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                onFieldSubmitted:(value){
                                  if(formKey.currentState!.validate()){
                                  }
                                },
                                validator: (value){
                                  if(value!.isEmpty){return 'enter valid password';}
                                  return null;
                                },
                                controller: headController,
                                decoration:const InputDecoration(label:   Text('New Password') ,
                                  prefixIcon:  Icon(Icons.lock) ,
                                  border:  OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              Container(
                                  decoration:const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                                  ),
                                  child: const SizedBox(height: 30,)),
                              TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){return 'enter valid password';}
                                  return null;
                                },
                                controller: descriptionController,
                                decoration: const InputDecoration(label:  Text('Confirm new Password') ,
                                  border:  OutlineInputBorder(),
                                  prefixIcon:  Icon(Icons.lock) ,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                width: double.infinity,
                                color: Colors.deepPurple,child: MaterialButton(onPressed: (){
                                if(formKey.currentState!.validate()){
                                  Navigator.pop(context);
                                  setState(() {
                                    tags.add(headController.text);
                                    des.add(descriptionController.text);
                                  });
                                  Save.savedata( key: 'tags', value: tags);
                                  Save.savedata( key: 'des', value: des);
                                  toasts('Added successfully',Colors.green);
                                }
                              },
                                child:  const Text('ADD'  , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 25,color: Colors.white)),
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  Widget card(head, description, index)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      width: double.infinity,
      height: 120,
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('$head',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,
                    style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('$description',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,
                      style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
                ),
              ],),
          ),
          IconButton(icon: const Icon(Icons.delete,size: 30,color: Colors.white), onPressed: () {
            setState(() {
              tags.removeAt(index );
              des.removeAt(index );
            });
            Save.savedata( key: 'tags', value: tags);
            Save.savedata( key: 'des', value: des);
            toasts('Removed successfully',Colors.green);
          },)
        ],),
      ),),
  );
}