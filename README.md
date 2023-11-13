Nama: Alma Laras Bestari  
NPM: 2206082303  
Kelas: PBP E

# Bitcake 🍰

Cake lists. List cakes. Or something like that. It's just cakes.

## Directory
For easy access
- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)

## Tugas 7

### Pertanyaan
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

   Stateless widget seperti namanya, tidak memiliki state. Stateless widget hanya dapat berubah melalui event eksternal dari parent widget. Properties stateless widget bersifat final. Contoh dari stateless widget adalah icon.
   Stateful widget bersifat dinamis, dimana mereka dapat berubah dari events dikarenakan user interaction atau input data. Stateful widget bersifat immutable. Contohnya adalah checkbox, slider, form.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

    - **AppBar** : Container yang menampilkan konten dan actions di bagian atas layar
    - **Scaffold** : Widget yang mengimplementasikan basic material design visual
    - **SingleChildScrollView** : Box dimana satu widget dapat di scroll
    - **Padding** : Widget yang memberikan insets berdasarkan padding yang diberikan.
    - **Column** : Melayout widgets secara vertical
    - **Text** : Menampilkan text dalam suatu style
    - **GridView** : Sebuah gridlist yang berisi cell. Menampilkan secara vertical dan horizontal dengan grid
    - **Icon** : Material Design icon
    - **InkWell** : Area dari sebuah Material yang responsive terhadap sentuhan user
    - **MaterialApp** : Widget yang me-wrap sejumlah widget yang mengimplementasikan Desain Material
    - **Theme** : Memberikan theme to widget turunan
    - **Container** : Widget yang mengkombinasi *painting*, *positioning*, dan *sizing* widget
    - **SnackBar** : Menampilkan pesan singkat pada layar bagian bawah

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

    - [x] Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

    **Implementasi**

    Pada bagian ini saya melalukan command ```flutter create bit_cake```. Saya rencanya ingin membuat aplikasi inventori yang mendata kue yang telah dibuat.
    - [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:
        
        - Melihat daftar item (Lihat Item)
        - Menambah item (Tambah Item)
        - Logout (Logout)

        **Implementasi**

        Saya membuat class CakeItem
        ```dart
        class CakeItem {
            final String name;
            final IconData icon;
            final Color color;

            CakeItem(this.name, this.icon, this.color);
            }
        ```

        Setelah saya membuat class ```MyHomePage``` dengan list CakeItem

        ```dart
          final List<CakeItem> items = [
            CakeItem("View Cakes", Icons.cake, Colors.pinkAccent.shade100),
            CakeItem("Bake Cakes", Icons.egg, Colors.teal.shade200),
            CakeItem("Logout", Icons.logout, Colors.black38),
        ];
        ```

        ```dart
        dan untuk menampilkannya saya menggunakan gridview.

        Widget build(BuildContext context) {
            ...
            body: SingleChildScrollView(
                ...
                    GridView.count(
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((CakeItem item) {
                        return CakeCard(item);
                        }).toList(),
                    )
                ...
            )
            ...
        }
        ```

        Untuk class ```CakeCard```, saya menambahkan constructor seperti ini sehingga setiap 

        ```dart
        class CakeCard extends StatelessWidget {
            final CakeItem item;

            const CakeCard(this.item, {super.key}); 
        }
        ```

    - [x] Memunculkan Snackbar dengan tulisan:
    
        - "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
        - "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
        - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

         **Implementasi**

         Saya menggunakan SnackBar untuk menampilkan sebuah pesan ketika diklik. Untuk ini kita dapat memanfaatkan inkwell yang sebelumnya telah dijelaskan bahwa inkwell membuat widget responsive terhadap sentuhan. Saya menambahkannya pada class ```CakeCard```.

         ```dart
        child: InkWell(
         onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You have clicked ${item.name}!")));
        },
         ```

         Taking creative liberties, saya mengubah textnya agar lebih cocok dengan aplikasi saya
    
    - [x] Melakukan add-commit-push ke GitHub.
    
### Bonus

Untuk implementasi bonus, saya menambahkan instance variable baru yaitu ```Color``` dan menambahkan constructor argumen sehingga warnanya dapat berbeda ada class ```CakeItem```

```dart
class CakeItem {
  final String name;
  final IconData icon;
  final Color color; //saya tambahkan ini

  CakeItem(this.name, this.icon, this.color);
}
```

Setelah itu saya memilih warna yang saya suka agar memiliki warna-warna yang berbeda

```dart
    final List<CakeItem> items = [
    CakeItem("View Cakes", Icons.cake, Colors.pinkAccent.shade100),
    CakeItem("Bake Cakes", Icons.egg, Colors.teal.shade200),
    CakeItem("Logout", Icons.logout, Colors.black38),
];
```

Untuk menampilkan warna seusuai object class yang kita buat, pada ```CakeCard``` saya menambahkan ini

```dart
...
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      ...
```

## Tugas 8

### Pertanyaan
1. Jelaskan perbedaan antara ```Navigator.push()``` dan Navigator.```pushReplacement()```, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

    Method ```push()``` menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator dan akan ditampilkan kepada pengguna (karena di top of stack). Sedangkan Method ```pushReplacement()``` menghapus route yang sedang ditampilkan kepada pengguna (top of stack) dan menggantinya dengan suatu route.

    Contoh penggunaan metode ```push()``` adalah perpindahan tampilan dari home ke salah satu fitur. Misal pada aplikasi ini terdapat pada ```menu_card.dart```
    
    ```dart
     if (item.name == "Add Cake") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BakeryFormPage(cakes : cakes),
                ),
              );
            }

    ```

    Sedangkan contoh penggunaan metode ```pushReplacement()``` dapat untuk menampilkan home setelah pengguna login karena route (page) login tidak akan ditampilkan lagi walaupun di back kecuali jika pengguna memencet tombol logout. Selain itu, pada aplikasi ini,  ```pushReplacement()``` juga digunakan pada ```left_drawer.dart``` sehingga pengguna tidak dapat kembali ke menu sebelumnya jika menekan tombol Main Menu.

    ```dart
    onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(cakes : cakes),
                  ));
            },
    ```

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

    Terdapat tiga jenis layout widget dalam Flutter. Berikut beberapa layout yang sering digunakan pada pengembangan aplikasi Flutter

    - Single-child layout widgets

        - **Padding** : Widget yang memberikan insets berdasarkan padding yang diberikan. Dapat digunakan saat ingin memberikan "spacing" disekitar text atau gambar.
        - **Align** : Widget yang menempatkan child widgetnya ke dalam suatu posisi tertentu dalam parent widget. Dapat digunakan saat kita ingin menempatkan suatu text di kanan atas atau kiri bawah.
        - **Expanded** : Membungkus child widget Row, Column, atau Flex sehingga childnya akan mengisi ruang yang tersedia secara proporsional. Dapat digunakan jika ingin memberikan proporsi ruang yang berbeda kepada child widget dalam suatu layout.
        - **CustomSingleChildLayout** : Menentukan posisi dan ukuran dari satu child widget secara custom. Dapat digunakan jika ingin menempatkan suatu widget di tempat yang spesifik.
        - **Container** : Widget yang mengkombinasi *painting*, *positioning*, dan *sizing* widget. ocok untuk mengatur tata letak widget dengan lebih kompleks dan mengatur properti-properti seperti warna, padding, dan margin.


    - Multi-child layout widgets

        - **Column** : Melayout widgets secara vertical. Digunakan  Dapat digunakan saat ingin menyusun widget secara berurutan dari atas ke bawah.
        - **Row** : Melayout widgets secara horizontal. Dapat digunakan saat ingin menyusun widget secara berurutan dari kiri ke kanan.
        - **GridView** : Membuat grid dari child widget. Dapat digunakan saat kita memiliki data yang ingin ditampilkan dalam format grid seperti galeri.
        - **ListView** : Membuat list dari child widget. Dapat digunakan saat kita memiliki daftar atau koleksi data dan ingin menampilkannya semua secara horizonta ataupun vertical (continuous).
        - **Stack** : Menempatkan child widget di atas satu sama lain. Dapat digunakan untuk menampilkan teks di atas gambar.

    - Sliver widgets
        
        Generally speaking, Sliver adalah bagian scrollable area yang memiliki custom scrolling effect. Contohnya adalah SliverAppBar, SliverGrid, SilierList.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

     Elemen input digunakan untuk mengambil informasi mengenai cake yang akan ditambah. Elemen input yang digunakan pada form yang saya pakai adalah

    - Cake Name

        Menggunakan TextFormField untuk mendapatkan nama kue (*cake name*) dari input pengguna. Juga dilengkapi dengan validator sehingga nama tidak bisa kosong.onChanged akan mengupdate ```_name``` variable sesuai input user.
    - Amount

        Menggunakan TextFormField untuk mendapatkan banyak kue (*amount*) dari input pengguna. Juga dilengkapi dengan validator sehingga amoount tidak bisa kosong, memiliki alfabet, ataupun angka minus. onChanged akan mengupdate ```_amount``` (int) variable sesuai input user.
    - Description

        Menggunakan TextFormField untuk mendapatkan deksripsi kue (*description*) dari input pengguna. Juga dilengkapi dengan validator sehingga nama tidak bisa kosong. onChanged akan mengupdate ```_description``` variable sesuai input user.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

    Link referensi: [Clean Architecture](#https://medium.com/@samra.sajjad0001/flutter-clean-architecture-5de5e9b8d093)

    Seperti pada Django, Flutter menerapkan Seperation of Concerns yang sebelumnya pernah disinggung. Pada Flutter, penerapan Clean Architecture membagi menjadi tiga layer yaitu Presentation/Feature Layer (UI), Domain Layer (Business Logic), dan Data Layer.

    - Presentation/Feature Layer

        Layer ini berupa komponen UI seperti widgets. Layer ini berisi UI dan event handler.
    - Domain Layer

        Layer paling dalam, tidak ada dependensi dengan layer lain. Pada layer ini tidak ada elemen flutter sama sekali dan fokus dengan bussiness logic aplikasi. Domain layer memilki use case, entitiy, dan bussiness rule. 
    - Data Layer

        Layer ini yang bertanggung jawab atas tempat data storage dan pengambilan data. Repositori menyediakan lapisan abstraksi untuk mengakses dan memanipulasi data. Sumber data dapat berupa API, database lokal, atau penyedia data eksternal lainnya.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

    (karena checklistnya lumayan banyak dan kodenya panjang, saya akan menjelaskan langkah saya dalam mengimplementasikan, untuk kodenya dapat dicek direpo)

    1. Sebelumnya saya melakukan refactoring karena berencana untuk mengimplementasikan bonus dan karena akan ada card untuk menampilkan cakes yang telah dibuat, saya memgubah ```cake_card.dart``` menjadi ```menu_card.dart``` dan membuat ```cake_card.dart``` yang baru sehingga penamaan filenya tidak membingungkan.
    2. Membuat ```cake_form.dart``` pada folder ```screens``` dan membuat elemen input yang sesuai (cake name, amount, description) dengan validasi sesuai ketentuan soal. Menambahkan tombol save yang akan membuat object Cake yang baru.
    Potongan kode salah satunya:
    ```dart
     Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Description",
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _description = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                }
                return null;
              },
            ),
          ),
    ```
    3. Membuat ```left_drawer.dart``` untuk menampilkan drawer pada folder ```widgets``` dan menambahkan pemanggilan drawer pada ```cake_form.dart``` dan ```cake_list.dart``` dengan ```drawer: LeftDrawer(cakes: cakes),```
    4. Menggunakan method ```push()``` dan ```pushReplacement()``` pada ```menu_card.dart``` dan ```left_drawer.dart``` untuk menampilkan halaman yang sesuai jika area tertentu ditekan.

### Bonus

Untuk implementasi bonus, saya membuat Class ```Cake``` pada directory ```models``` dengan nama ```cake.dart```. Ini akan diimport oleh file dart yang lain. Selanjutnya saya membuat ```cake_card.dart``` pada directory ```widgets``` yang berisi bagaimana cake akan ditampilkan ke pengguna. Saya menggunakan ListTile dengan bantuan [template](#https://api.flutter.dev/flutter/material/ListTile-class.html) dari Flutter sendiri. 

```dart
import 'package:flutter/material.dart';
import 'package:bit_cake/models/cake.dart';

class CakeCard extends StatelessWidget {
  final Cake cake;

  const CakeCard(this.cake, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.cake),
          title: Text(cake.name),
          subtitle: Text(cake.description),
          trailing: Text("Amount: ${cake.amount}"),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
```
Kemudian saya membuat ```cake_list.dart``` sebagai page dimana cakes card widget yang sebelumnya dibuat akan ditampilkan.

```dart
import 'package:flutter/material.dart';

import 'package:bit_cake/models/cake.dart';
import 'package:bit_cake/widgets/cake_card.dart';
import 'package:bit_cake/widgets/left_drawer.dart';

class CakeListPage extends StatelessWidget {
  final List<Cake> cakes;

  const CakeListPage({Key? key, required this.cakes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cake List',
        ),
        centerTitle: false,
        backgroundColor: Colors.teal.shade200,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(cakes: cakes),
      body: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cakes.length,
                  itemBuilder: (context, index) {
                    return CakeCard(cakes[index]);
                  },
                ),
              )
            ],
          ),
      ),
    );
  }
}
```

Terakhir saya membuat ```List<Cake> cakes``` pada setiap constructor class agar cake list dapat tersimpan antar halaman/route.