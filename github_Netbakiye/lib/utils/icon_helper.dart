import 'package:flutter/material.dart';

List<String> getIconListByType(String type) {
  final cleanType = type.toLowerCase().trim();
  if (cleanType == 'income' || cleanType == 'gelir') {
    return [
      'Maaş',
      'Harçlık',
      'Burs',
      'Ek Ders',
      'Ek Gelir',
      'Yatırım',
      'Prim',
      'Satış',
      'Kira Geliri',
      'Döviz',
      'Değerli Maden',
      'Nakit',
      'Alacak',
      'Kredi Kartı',
      'Diğer'
    ];
  } else {
    return [
      'Market',
      'Fatura',
      'Ulaşım',
      'Benzin',
      'Kira',
      'Mutfak',
      'Restoran',
      'Sağlık',
      'Eğitim',
      'Eğlence',
      'Hobi',
      'Giyim',
      'Spor',
      'Borç',
      'Kredi Kartı',
      'Aidat',
      'Araba',
      'Tamirat',
      'Teknoloji',
      'Telefon',
      'Tatil',
      'Çocuk',
      'Sigorta',
      'Vergi',
      'Bağış',
      'Diğer'
    ];
  }
}

// Türkçe karakter temizleyici
String _normalize(String input) {
  if (input.isEmpty) return "";
  return input
      .toLowerCase()
      .trim()
      .replaceAll('ğ', 'g')
      .replaceAll('ü', 'u')
      .replaceAll('ş', 's')
      .replaceAll('ı', 'i')
      .replaceAll('i̇', 'i')
      .replaceAll('ö', 'o')
      .replaceAll('ç', 'c');
}

// Kelimeye gore ikon bulma
IconData getAppIcon(String? iconName) {
  if (iconName == null || iconName.isEmpty || iconName == "null") {
    return Icons.receipt_long;
  }

  final String cleanName = _normalize(iconName);
  final String rawName = iconName.toLowerCase().trim();

  // YENİ EKLENEN İKONLAR
  if (cleanName.contains('harclik') || cleanName.contains('harçlık')) {
    return Icons.wallet_giftcard;
  }
  if (cleanName.contains('burs')) {
    return Icons.emoji_events;
  }

  if (cleanName.contains('kredi karti') ||
      cleanName.contains('card') ||
      cleanName.contains('credit')) {
    return Icons.credit_card;
  }
  if (cleanName.contains('benzin') || cleanName.contains('yakit'))
    return Icons.local_gas_station;
  if (cleanName.contains('ulasim') || cleanName.contains('otobus'))
    return Icons.directions_bus;
  if (cleanName.contains('taksi') || cleanName.contains('araba'))
    return Icons.directions_car;

  if (cleanName.contains('telefon') || cleanName.contains('iletisim'))
    return Icons.phone_android;
  if (cleanName.contains('teknoloji') || cleanName.contains('bilgisayar'))
    return Icons.devices;

  if (cleanName.contains('ek ders') || cleanName.contains('ekders'))
    return Icons.history_edu;
  if (cleanName.contains('doviz') ||
      cleanName.contains('euro') ||
      cleanName.contains('dolar') ||
      cleanName.contains('currency')) return Icons.euro;

  if (cleanName.contains('altin') ||
      cleanName.contains('degerli') ||
      cleanName.contains('maden') ||
      cleanName.contains('gumus') ||
      cleanName.contains('silver') ||
      cleanName.contains('gold') ||
      cleanName.contains('gram') ||
      cleanName.contains('ceyrek')) return Icons.view_agenda;
  // -------------------------------

  if (cleanName.contains('prim') || cleanName.contains('bonus'))
    return Icons.workspace_premium;
  if (cleanName.contains('satis') || cleanName.contains('magaza'))
    return Icons.store;
  if (cleanName.contains('nakit') || cleanName.contains('cash'))
    return Icons.payments;

  if (cleanName.contains('ek gelir') || cleanName.contains('arti'))
    return Icons.add_circle_outline;

  if (cleanName.contains('maas') || cleanName.contains('salary'))
    return Icons.work;
  if (cleanName.contains('lira') || cleanName.contains('tl'))
    return Icons.currency_lira;
  if (cleanName.contains('yatirim') ||
      cleanName.contains('borsa') ||
      cleanName.contains('hisse') ||
      cleanName.contains('coin')) return Icons.trending_up;
  if (cleanName.contains('alacak')) return Icons.account_balance_wallet;

  if (cleanName.contains('kira') || cleanName.contains('ev')) return Icons.home;
  if (cleanName.contains('aidat') || cleanName.contains('bina'))
    return Icons.domain;
  if (cleanName.contains('mutfak') || cleanName.contains('yemek'))
    return Icons.restaurant_menu;
  if (cleanName.contains('restoran') || cleanName.contains('kafe'))
    return Icons.restaurant;
  if (cleanName.contains('market') || cleanName.contains('pazar'))
    return Icons.shopping_cart;
  if (cleanName.contains('giyim') || cleanName.contains('moda'))
    return Icons.checkroom;
  if (cleanName.contains('tamirat') || cleanName.contains('teknik'))
    return Icons.build;

  if (cleanName.contains('cocuk') || cleanName.contains('bebek'))
    return Icons.child_care;
  if (cleanName.contains('hobi')) return Icons.favorite;

  if (cleanName.contains('eglence') ||
      cleanName.contains('sinema') ||
      cleanName.contains('oyun')) return Icons.movie;

  if (cleanName.contains('tatil') || cleanName.contains('seyahat'))
    return Icons.flight_takeoff;
  if (cleanName.contains('spor') || cleanName.contains('fitness'))
    return Icons.fitness_center;
  if (cleanName.contains('egitim') ||
      cleanName.contains('okul') ||
      cleanName.contains('kurs') ||
      cleanName.contains('kitap')) return Icons.school;

  if (cleanName.contains('borc') ||
      rawName.contains('borç') ||
      cleanName.contains('debt')) return Icons.handshake;
  if (cleanName.contains('sigorta')) return Icons.security;
  if (cleanName.contains('vergi')) return Icons.account_balance;
  if (cleanName.contains('bagis')) return Icons.volunteer_activism;
  if (cleanName.contains('saglik') ||
      cleanName.contains('doktor') ||
      cleanName.contains('eczane')) return Icons.local_hospital;
  if (cleanName.contains('fatura') ||
      cleanName.contains('elektrik') ||
      cleanName.contains('internet')) return Icons.receipt_long;

  if (cleanName.contains('diger')) return Icons.more_horiz;

  return Icons.category;
}
