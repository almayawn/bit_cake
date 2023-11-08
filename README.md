Nama: Alma Laras Bestari  
NPM: 2206082303  
Kelas: PBP E

# Bitcake 🍰

Cake lists. List cakes. Or something like that. It's just cakes.

## Directory
For easy access
-  [Tugas 7](#tugas-7)

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
    - **Text*** : Menampilkan text dalam suatu style
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



