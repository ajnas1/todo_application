import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/view/settings_screen.dart';
import 'package:todo/viewModel/categoriesScreen_provider.dart';
import 'package:todo/widget/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
   const CategoriesScreen({super.key}); 
  @override
  Widget build(BuildContext context) {
    bool isFirst=true;
    return Consumer<CategoriesscreenProvider>(
      builder:(context, value, child) =>  Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 9),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => const SettingsScreen(),));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.CAbTaFvo9r1nh2uSZgd5yAAAAA?rs=1&pid=ImgDetMain',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          title: const Text('Categories'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Material(
                elevation: 4,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.network(
                            'https://th.bing.com/th/id/OIP.CAbTaFvo9r1nh2uSZgd5yAAAAA?rs=1&pid=ImgDetMain',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\"The memories is a shield and life helper\"",style: TextStyle(fontSize: categoriesScreenSmallTitleSize),),
                          Text('Tamim Al-barghouti',style: TextStyle(fontSize: categoriesScreenSmallTitleSize)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              StreamBuilder(
                stream: value.getTaskName(),
                builder:(context, snapshot) {
                  // if(!snapshot.hasData){
                  //   return categoriesWidget(context,null,value.addTaskController,value.addEmogieController,null,isNotFirst: false);
                  // }
                  
                  if(value.catergriesStatus == CatergriesStatus.loaded && snapshot.data !=null) {
                    List<TaskModel> task= snapshot.data?.docs
                      .map((doc) => TaskModel.fromJson(
                          doc.data() as Map<String, dynamic>))
                      .toList() ??
                  [];
                    
                    return Container(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: task.isNotEmpty? GridView.builder(
                    itemCount: task.isEmpty?0: task.length+1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                        crossAxisCount: 2,  
                        crossAxisSpacing: 15.0,  
                        mainAxisSpacing: 15.0  
                    ), 
                    itemBuilder:(context, index) {
                      if(isFirst&&index==0){
                       return categoriesWidget(context,task[index],value.addTaskController,value.addEmogieController,index,isNotFirst: false);
                      }
                      print(index);
                      
                      return categoriesWidget(context,task[index-1],value.addTaskController,value.addEmogieController,index-1);}
                  ):  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 150),
                    child: categoriesWidget(context,null,value.addTaskController,value.addEmogieController,null,isNotFirst: false),
                  ),
                );
                  }else if(value.catergriesStatus == CatergriesStatus.loading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
