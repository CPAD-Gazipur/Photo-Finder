import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_finder/fullview.dart';
import 'package:photo_finder/gallery_state.dart';
import 'package:photo_finder/main.dart';
import 'package:photo_finder/pages/developer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryView extends StatelessWidget {
  String searchdata = '';

  GalleryView({required this.searchdata});

  @override
  Widget build(BuildContext context) {
    context.read<GalleryState>().load(this.searchdata);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result',
        textAlign: TextAlign.center,
        style:  GoogleFonts.sedgwickAve(
    textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
  ),
  
      ),),
      body: Consumer<GalleryState>(
        builder: (context, state, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Eg Dogs, Cats & Bananas",
                      labelText: "Enter a category",
                      contentPadding:
                          const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 25.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      
                        state.load(value);
                      
                    },
                  ),
                ),
                state.links.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.links.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(state.links[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: (){
                                state.selectIndex(index);
                                Get.to(FullView());
                              },
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(icon: Icon(Icons.help), onPressed: () {}),
        Spacer(),
        IconButton(icon: Icon(Icons.people), onPressed: () {
          Get.to(DevContact());
        }),
      ],
    ),
  ),
  floatingActionButton:
      FloatingActionButton(child: Icon(Icons.search), onPressed: () {
        Get.back();
      }),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

