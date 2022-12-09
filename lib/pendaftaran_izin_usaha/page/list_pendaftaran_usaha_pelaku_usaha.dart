import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:si_solo/drawer_pelaku_usaha.dart';
import 'package:si_solo/main-page/model/user.dart';
import 'package:si_solo/pendaftaran_izin_usaha/util/fetch_usaha.dart';
import 'package:si_solo/pendaftaran_izin_usaha/page/detail_pendaftaran_usaha.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPendaftaranUsahaPelakuUsahaPage extends StatefulWidget{
  const ListPendaftaranUsahaPelakuUsahaPage({super.key, required this.index});
  final int index;

  State<ListPendaftaranUsahaPelakuUsahaPage> createState() => _ListPendaftaranUsahaPelakuUsahaPage(index);
}

class _ListPendaftaranUsahaPelakuUsahaPage extends State<ListPendaftaranUsahaPelakuUsahaPage>{
  _ListPendaftaranUsahaPelakuUsahaPage(this._selectedIndex);
  int _selectedIndex;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pendaftaran Usaha'),
      ),
      drawer: buildDrawer(context),
      
      body: FutureBuilder(
                  future: fetchUsaha(UserLogin.listUserLogin[0].role, UserLogin.listUserLogin[0].namaLengkap, UserLogin.listUserLogin[0].nomorTeleponPemilik, UserLogin.listUserLogin[0].alamatPemilik),
                  builder: (context, AsyncSnapshot snapshot2){
                    if (snapshot2.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    }else{
                      if (snapshot2.data!.length == 0) {
                        return Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 15,),
                              Text(
                                "Belum ada usaha yang didaftarkan",
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
                          itemCount: snapshot2.data!.length,
                          itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.all(8.0),

                            child: Column(
                              children: (_selectedIndex == 0)?
                              [
                                Column(
                                  children: (snapshot2.data![index].statusPendaftaran == 'Diajukan')?
                                  [
                                    Column(
                                      children: (snapshot2.data![index].jenisUsaha == 'Kuliner')?[
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
                                              titleText: '${snapshot2.data![index].namaUsaha}',
                                              subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot2.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot2.data![index].jenisUsaha == 'Tempat Wisata')?[
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                  children: (_selectedIndex == 1)?[
                                    Column(
                                  children: (snapshot2.data![index].statusPendaftaran == 'Diproses')?
                                  [
                                    Column(
                                      children: (snapshot2.data![index].jenisUsaha == 'Kuliner')?[
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
                                              titleText: '${snapshot2.data![index].namaUsaha}',
                                              subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot2.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot2.data![index].jenisUsaha == 'Tempat Wisata')?[
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                  children: (snapshot2.data![index].statusPendaftaran == 'Diterima')?
                                  [
                                    Column(
                                      children: (snapshot2.data![index].jenisUsaha == 'Kuliner')?[
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
                                              titleText: '${snapshot2.data![index].namaUsaha}',
                                              subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot2.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot2.data![index].jenisUsaha == 'Tempat Wisata')?[
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                  children: (snapshot2.data![index].statusPendaftaran == 'Ditolak')?
                                  [
                                    Column(
                                      children: (snapshot2.data![index].jenisUsaha == 'Kuliner')?[
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
                                              titleText: '${snapshot2.data![index].namaUsaha}',
                                              subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranUsaha(
                                                        usaha: snapshot2.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]:[
                                        Column(
                                          children: (snapshot2.data![index].jenisUsaha == 'Tempat Wisata')?[
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                                  titleText: '${snapshot2.data![index].namaUsaha}',
                                                  subTitleText: '${snapshot2.data![index].jenisUsaha}',
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                          DetailPendaftaranUsaha(
                                                            usaha: snapshot2.data![index],
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
                                      ]
                                    ),
                                  ],
                                ),
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