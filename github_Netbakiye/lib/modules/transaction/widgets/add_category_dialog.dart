import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gelir_gider_uygulamasi/utils/icon_helper.dart';
import 'package:gelir_gider_uygulamasi/services/db_service.dart';
import 'package:gelir_gider_uygulamasi/services/auth_service.dart';

class AddCategoryDialog extends StatefulWidget {
  final String transactionType;

  const AddCategoryDialog({super.key, required this.transactionType});

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedIcon = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final List<String> currentIconList =
        getIconListByType(widget.transactionType);

    final bool isIncome = (widget.transactionType == 'income' ||
        widget.transactionType == 'Gelir' ||
        widget.transactionType == 'gelir');
    final Color typeColor = isIncome ? Colors.green : Colors.redAccent;

    return AlertDialog(
      title: Text(
        '${isIncome ? "Gelir" : "Gider"} Kategorisi Ekle',
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Kategori Adı',
                  hintText: 'Örn: Yol Parası',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Lütfen kategori adını girin'
                    : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Simge Seç',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.emoji_objects_outlined),
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Lütfen bir simge seçin'
                    : null,
                menuMaxHeight: 300,
                items: currentIconList
                    .map((iconName) => DropdownMenuItem(
                          value: iconName,
                          child: Row(
                            children: [
                              // Kizilay
                              if (iconName.toLowerCase().contains('sağlık') ||
                                  iconName.toLowerCase().contains('kizilay'))
                                Image.asset('assets/images/kizilay.png',
                                    width: 24, height: 24, fit: BoxFit.contain)
                              else
                                Icon(getAppIcon(iconName),
                                    color: typeColor, size: 24),

                              const SizedBox(width: 12),
                              Text(iconName),
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedIcon = value;
                    });
                  }
                },
                value: currentIconList.contains(_selectedIcon)
                    ? _selectedIcon
                    : null,
              ),
              const SizedBox(height: 16),

              // Butonlar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('İptal',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: typeColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _isLoading ? null : _saveCategory,
                    child: _isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white))
                        : const Text('Ekle'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveCategory() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final dbService = Get.find<DBService>();
      final authService = Get.find<AuthService>();

      final String tur = (widget.transactionType == 'income' ||
              widget.transactionType == 'gelir')
          ? 'gelir'
          : 'gider';

      await dbService.kategoriEkle(
          ad: _nameController.text.trim(),
          tur: tur,
          ikon: _selectedIcon,
          userId: authService.currentUser.value?.id);
      Get.back(result: _nameController.text.trim());
      Get.snackbar("Başarılı", "Kategori eklendi.",
          backgroundColor: Colors.green.shade700,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Hata", "Kategori eklenemedi: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
