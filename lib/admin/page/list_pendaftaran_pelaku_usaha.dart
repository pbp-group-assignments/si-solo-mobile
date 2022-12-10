import 'package:flutter/material.dart';
import 'package:si_solo/admin/page/detail_pendaftaran_pelaku_usaha.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_pendaftaran_pelaku_usaha.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ListPendaftaranPelakuUsahaPage extends StatefulWidget {
  const ListPendaftaranPelakuUsahaPage({super.key, required this.index});
  final int index;
  
  @override
  State<ListPendaftaranPelakuUsahaPage> createState() => _ListPendaftaranPelakuUsahaPage(index);
}

class _ListPendaftaranPelakuUsahaPage extends State<ListPendaftaranPelakuUsahaPage> {
  _ListPendaftaranPelakuUsahaPage(this._selectedIndex);
  int _selectedIndex;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Pendaftaran Pelaku Usaha'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: fetchPelakuUsaha(),
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
                                "Belum ada yang mendaftar sebagai pelaku usaha",
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
                        children: (snapshot.data![index].status == 'Diproses')?[
                          Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.amber, width: 2,),
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                            child: GFListTile(
                                              titleText: '${snapshot.data![index].namaPemilik}',
                                              subTitleText: '${snapshot.data![index].nomorTeleponPemilik}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranPelakuUsaha(
                                                        pelakuUsaha: snapshot.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                        ]:[],
                      )
                    ]
                    :[Column(
                      children: (_selectedIndex == 1)?[
                        Column(
                        children: (snapshot.data![index].status == 'Diterima')?[
                          Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.amber, width: 2,),
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                            child: GFListTile(
                                              titleText: '${snapshot.data![index].namaPemilik}',
                                              subTitleText: '${snapshot.data![index].nomorTeleponPemilik}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranPelakuUsaha(
                                                        pelakuUsaha: snapshot.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                        ]:[],
                      )
                      ]:[
                        Column(
                        children: (snapshot.data![index].status == 'Ditolak')?[
                          Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(color: Colors.amber, width: 2,),
                                          ),

                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                                            child: GFListTile(
                                              titleText: '${snapshot.data![index].namaPemilik}',
                                              subTitleText: '${snapshot.data![index].pesan}',
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                      DetailPendaftaranPelakuUsaha(
                                                        pelakuUsaha: snapshot.data![index],
                                                      )
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                        ]:[],
                      )
                      ],
                    )],
                  )
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
