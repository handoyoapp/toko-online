//belajaraplikasi.com
//2020-06-11
//Membuat Detail Produk Seperti Aplikasi Tokopedia

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProdukDetail extends StatelessWidget {
  ProdukDetail({
    this.imageUrl,
    this.title,
    this.price,
  });
  final String imageUrl;
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    final double headerTop = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: headerTop,
                    child: Image.network('$imageUrl', fit: BoxFit.cover),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildHeaderProduk(),
                              SizedBox(height: 12),
                              Divider(height: 1),
                              SizedBox(height: 6),
                              _buildUlasanProduk(),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 16,
                          color: Colors.grey[200],
                        ),
                        SizedBox(height: 12),
                        _buildInformasiProduk(),
                        SizedBox(height: 12),
                        Container(
                          height: 8,
                          color: Colors.grey[200],
                        ),
                        SizedBox(height: 12),
                        _buildDeskripsiProduk(),
                        SizedBox(height: 12),
                        Container(
                          height: 8,
                          color: Colors.grey[200],
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.keyboard_arrow_left),
                ),
                flexibleSpace: Container(
                  height: AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(0.4),
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.all(4),
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 10,
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          'Beli Sekarang',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildDeskripsiProduk() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Deskripsi Produk',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
              'Terobosan baru untuk smartphone berbasis android dengan spesifikasi yang sangar luar biasa diera 2020. Wow briliant ide untuk membuat smartphone se power full ini. Sehingga...',
              style: TextStyle(fontSize: 12)),
          SizedBox(height: 12),
          Text('Baca Selengkapnya',
              style: TextStyle(fontSize: 12, color: Colors.green)),
        ],
      ),
    );
  }

  Padding _buildInformasiProduk() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Informasi Produk',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Berat', style: TextStyle(fontSize: 12)),
              Text('100 Gram', style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Kondisi', style: TextStyle(fontSize: 12)),
              Text('Baru', style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Asuransi', style: TextStyle(fontSize: 12)),
              Text('Ya', style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Pemesanan Min', style: TextStyle(fontSize: 12)),
              Text('1 Buah', style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Kategori', style: TextStyle(fontSize: 12)),
              Text('Smartphone Handphone',
                  style: TextStyle(fontSize: 12, color: Colors.green)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Etalase', style: TextStyle(fontSize: 12)),
              Text('Hydrogel',
                  style: TextStyle(fontSize: 12, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildUlasanProduk() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Stok tersedia', style: TextStyle(fontSize: 11)),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '4.7',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Text('/5', style: TextStyle(fontSize: 10)),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  '375 Ulasan',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Q&A',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '210 Diskusi',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.train, color: Colors.green, size: 18),
                SizedBox(height: 6),
                Text(
                  'Pengiriman',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Dilihat',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '30,7rb',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Transaksi Berhasil',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '99,2% (1.246)',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Wishlist',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '827',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _buildHeaderProduk() {
    final formater = NumberFormat('#,##0.00', 'id');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('$title', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(
          'Rp ' + formater.format(int.parse(price)),
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: <Widget>[
            Text('Produk dari', style: TextStyle(fontSize: 11)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                Icons.tonality,
                color: Colors.green,
                size: 14,
              ),
            ),
            Text(
              'Power Merchant',
              style: TextStyle(
                fontSize: 11,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
