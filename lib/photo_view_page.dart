import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'photo_filters.dart';

class PhotoViewPage extends StatefulWidget {
  final List<String> photos;
  final int index;

  const PhotoViewPage({
    Key? key,
    required this.photos,
    required this.index,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SetState(index, photos);
}

class _SetState extends State<PhotoViewPage> {
  int _selectedIndex = 0;
  var index;
  var photos;
  _SetState(this.index, this.photos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Without filter',
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Greyscale',
              backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Sepia',
              backgroundColor: Colors.brown
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Inverted colors',
              backgroundColor: Colors.purple
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (currentIndex) {
          setState(() {
            _selectedIndex = currentIndex;
          });
        },
      ),

      body: PhotoViewGallery.builder(
        itemCount: photos.length,
        builder: (context, index) => PhotoViewGalleryPageOptions.customChild(

          child: _selectedIndex == 0? Container(
            decoration: BoxDecoration(
              image: photos[index].contains("http")
                  ? DecorationImage(
                image: CachedNetworkImageProvider(photos[index]),
              )
                  : DecorationImage(
                image: AssetImage(photos[index]),
              ),
            ),

          ): _selectedIndex == 1? Container(
            decoration: BoxDecoration(
              image: photos[index].contains("http")
                  ? DecorationImage(
                colorFilter: ColorFilters.greyscale,
                image: CachedNetworkImageProvider(photos[index]),
              )
                  : DecorationImage(
                colorFilter: ColorFilters.greyscale,
                image: AssetImage(photos[index]),
              ),
            ),

          ): _selectedIndex == 2? Container(
            decoration: BoxDecoration(
              image: photos[index].contains("http")
                  ? DecorationImage(
                colorFilter: ColorFilters.sepia,
                image: CachedNetworkImageProvider(photos[index]),
              )
                  : DecorationImage(
                colorFilter: ColorFilters.sepia,
                image: AssetImage(photos[index]),
              ),
            ),

          ): Container(
            decoration: BoxDecoration(
              image: photos[index].contains("http")
                  ? DecorationImage(
                colorFilter: ColorFilters.invert,
                image: CachedNetworkImageProvider(photos[index]),
              )
                  : DecorationImage(
                colorFilter: ColorFilters.invert,
                image: AssetImage(photos[index]),
              ),
            ),
          ),

          minScale: PhotoViewComputedScale.covered,
          heroAttributes: PhotoViewHeroAttributes(tag: photos[index]),
        ),

        pageController: PageController(initialPage: index),
        enableRotation: true,
      ),
    );
  }
}
