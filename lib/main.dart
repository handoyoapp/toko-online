//belajaraplikasi.com
//2020-06-06
//Cara Menghubungkan Backend dengan Android

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toko_online/produk_detail.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Toko Online'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Produk> daftarProduk;

  Future<Produk> fetchProduk() async {
    final response = await http
        .get('https://demo.belajaraplikasi.com/backend-ci/index.php/produk');

    if (response.statusCode == 200) {
      debugPrint('Produk : ' + response.body);
      return Produk.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load produk');
    }
  }

  Future<void> refreshProduk() async {
    setState(() {
      daftarProduk = fetchProduk();
    });
  }

  @override
  void initState() {
    super.initState();
    daftarProduk = fetchProduk();
  }

  final formater = NumberFormat('#,##0.00', 'id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return RefreshIndicator(
      onRefresh: () => refreshProduk(),
      child: _listProduk(),
    );
  }

  Widget _listProduk() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        FutureBuilder<Produk>(
          future: daftarProduk,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final produk = snapshot.data.daftarProduk;
              return GridView.builder(
                padding: const EdgeInsets.only(bottom: 6),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: produk.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildProdukImage(produk, index),
                          buildProdukTitle(produk, index),
                          buildProdukSubtitle(produk, index),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProdukDetail(
                              imageUrl: produk[index].image,
                              title: produk[index].namaBarang,
                              price: produk[index].harga,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }

  Padding buildProdukSubtitle(List<DaftarProduk> produk, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 6),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Rp ' + formater.format(int.parse(produk[index].harga)),
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildProdukTitle(List<DaftarProduk> produk, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 6),
      child: Text(
        '${produk[index].namaBarang}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  GridTile buildProdukImage(List<DaftarProduk> produk, int index) {
    return GridTile(
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            '${produk[index].image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class Produk {
  final bool error;
  final String message;
  final List<DaftarProduk> daftarProduk;

  Produk({
    this.error,
    this.message,
    this.daftarProduk,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    final List<DaftarProduk> daftarProduk = [];
    for (final daftar in json['data']) {
      daftarProduk.add(DaftarProduk.fromJson(daftar));
    }
    return Produk(
      error: json['error'],
      message: json['message'],
      daftarProduk: daftarProduk,
    );
  }
}

class DaftarProduk {
  final String idBarang;
  final String namaBarang;
  final String harga;
  final String stok;
  final String image;

  DaftarProduk({
    this.idBarang,
    this.namaBarang,
    this.harga,
    this.stok,
    this.image,
  });

  factory DaftarProduk.fromJson(Map<String, dynamic> json) {
    return DaftarProduk(
      idBarang: json['id_barang'],
      namaBarang: json['nama_barang'],
      harga: json['harga'],
      stok: json['stok'],
      image: json['img'],
    );
  }
}
