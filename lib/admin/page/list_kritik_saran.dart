import 'package:flutter/material.dart';
import 'package:si_solo/drawer_admin.dart';
import 'package:si_solo/admin/util/fetch_kritik_saran.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class ListKritikSaranPage extends StatefulWidget {
  const ListKritikSaranPage({super.key, required this.index});
  final int index;
  
  @override
  State<ListKritikSaranPage> createState() => _ListKritikSaranPage(index);
}