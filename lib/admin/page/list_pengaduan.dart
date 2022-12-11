import 'package:flutter/material.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_pengaduan.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ListPengaduanPage extends StatefulWidget {
  const ListPengaduanPage({super.key, required this.index});
  final int index;
  
  @override
  State<ListPengaduanPage> createState() => _ListPengaduanPage(index);
}