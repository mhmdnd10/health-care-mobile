import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcareapp/controllers/healthController.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthView extends StatefulWidget {
  const HealthView({super.key});

  @override
  State<HealthView> createState() => _HealthViewState();
}

class _HealthViewState extends State<HealthView> {
  HealthController controller=Get.put(HealthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Upload a File',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value ? Center(child: CircularProgressIndicator(color: Colors.green,strokeWidth: 4,),) : Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap:
                      controller.uploadFile,
                   
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Choose from Files',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            
            Obx(
              () {
                if(controller.uploadedFiles.isEmpty){
                  return Expanded(child: Center(child: Text('No files uploaded yet',style: TextStyle(color: Colors.grey),),),);
                }
                return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.uploadedFiles.length,
                itemBuilder: (context, index) {
                    final file = controller.uploadedFiles[index];
                    final fileUrl = file['file_url'];
                    final fileName = file['file_name'];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('file name'),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: ()async{
                            if(fileUrl!=null){
                              final Uri url=Uri.parse(fileUrl!);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url, mode: LaunchMode.externalApplication);
                              } else {
                                Get.snackbar('Error', 'Could not launch file URL',
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                                );
                              }
                            }else {
                              Get.snackbar('Error', 'File path is not available',
                              colorText: Colors.white,
                              backgroundColor: Colors.red,
                              );
                            }
                          },
                          child: Container(
                                   padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          
                              child: Text(
                              fileName??'no file',
                               style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                                ),
                          
                          ),
                        ),
                      ),
                   
                  ],
                );
              },
              );
              }
            ),
            // Expanded(
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       Expanded(
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(10)),
            //               backgroundColor: Colors.blue,
            //               foregroundColor: Colors.white),
            //           onPressed: () {},
            //           child: Text('Save File'),
            //         ),
            //       ),
                 
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    ));
  }
}
