import 'package:flutter/material.dart';
import 'package:si_solo/admin/page/detail_pendaftaran_usaha.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_usaha.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ListPendaftaranUsahaPage extends StatefulWidget {
  const ListPendaftaranUsahaPage({super.key, required this.index});
  final int index;

  @override
  State<ListPendaftaranUsahaPage> createState() => _ListPendaftaranUsahaPage(index);
}

class _ListPendaftaranUsahaPage extends State<ListPendaftaranUsahaPage> {
  _ListPendaftaranUsahaPage(this._selectedIndex);
  int _selectedIndex;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pendaftaran Usaha'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: fetchSemuaUsaha(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }else{
            if (snapshot.data!.length == 0) {
              return Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 15,),
                              Text(
                                "Belum ada pendaftaran usaha",
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.headline3,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]
                          ),
                        )
                        );
            }else{
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),

                  child: Column(
                    children: (_selectedIndex == 0)?[
                      Column(
                        children: (snapshot.data![index].statusPendaftaran == 'Diajukan')?[
                          Column(
                                      children: (snapshot.data![index].jenisUsaha == 'Kuliner')?[
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.amber, width: 2,),
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                            child: GFListTile(
                                              avatar: GFAvatar(
                                                child: Image.asset('assets/images/food_icon.png'),
                                                backgroundColor: Colors.white,
                                              ),
                                              titleText: '${snapshot.data![index].namaUsaha}',
                                              subTitleText: '${snapshot.data![index].namaPemilik}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot.data![index].jenisUsaha == 'Tempat Wisata')?[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/tempat_wisata_icon.jpg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ]:[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/toko_icon.jpeg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                        ]:[],
                      ),
                    ]:[
                      Column(
                            children: (_selectedIndex == 1)?[
                              Column(
                                children: (snapshot.data![index].statusPendaftaran == 'Diproses')?[
                                  Column(
                                      children: (snapshot.data![index].jenisUsaha == 'Kuliner')?[
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.amber, width: 2,),
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                            child: GFListTile(
                                              avatar: GFAvatar(
                                                child: Image.asset('assets/images/food_icon.png'),
                                                backgroundColor: Colors.white,
                                              ),
                                              titleText: '${snapshot.data![index].namaUsaha}',
                                              subTitleText: '${snapshot.data![index].namaPemilik}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot.data![index].jenisUsaha == 'Tempat Wisata')?[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/tempat_wisata_icon.jpg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ]:[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/toko_icon.jpeg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                ]:[],
                              )
                            ]:[
                              Column(
                            children: (_selectedIndex == 2)?[
                              Column(
                                children: (snapshot.data![index].statusPendaftaran == 'Diterima')?[
                                  Column(
                                      children: (snapshot.data![index].jenisUsaha == 'Kuliner')?[
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.amber, width: 2,),
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                            child: GFListTile(
                                              avatar: GFAvatar(
                                                child: Image.asset('assets/images/food_icon.png'),
                                                backgroundColor: Colors.white,
                                              ),
                                              titleText: '${snapshot.data![index].namaUsaha}',
                                              subTitleText: '${snapshot.data![index].namaPemilik}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot.data![index].jenisUsaha == 'Tempat Wisata')?[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/tempat_wisata_icon.jpg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ]:[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/toko_icon.jpeg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                ]:[],
                              )
                            ]:[
                              Column(
                            children: (_selectedIndex == 3)?[
                              Column(
                                children: (snapshot.data![index].statusPendaftaran == 'Ditolak')?[
                                  Column(
                                      children: (snapshot.data![index].jenisUsaha == 'Kuliner')?[
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.amber, width: 2,),
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                            child: GFListTile(
                                              avatar: GFAvatar(
                                                child: Image.asset('assets/images/food_icon.png'),
                                                backgroundColor: Colors.white,
                                              ),
                                              titleText: '${snapshot.data![index].namaUsaha}',
                                              subTitleText: '${snapshot.data![index].namaPemilik}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot.data![index].jenisUsaha == 'Tempat Wisata')?[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/tempat_wisata_icon.jpg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ]:[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(color: Colors.amber, width: 2,),
                                              ),

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                                child: GFListTile(
                                                  avatar: GFAvatar(
                                                    child: Image.asset('assets/images/toko_icon.jpeg'),
                                                    backgroundColor: Colors.white,
                                                  ),
                                                  titleText: '${snapshot.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot.data![index].namaPemilik}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot.data![index],
                                                          )
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                ]:[],
                              )
                            ]:[]
                          )
                            ]
                          )
                            ]
                          )
                    ],
                  ),
                )
              );
            }
          }
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.amber,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.touch_app_rounded),
              label: 'Diajukan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update_rounded),
              label: 'Diproses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_rounded),
              label: 'Diterima',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cancel),
              label: 'Ditolak',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.purpleAccent,
          selectedItemColor: Colors.orange,
          onTap: ((value) {
            setState(() {
              _selectedIndex = value;
            });
          }),
        ),
    );
  }
}
