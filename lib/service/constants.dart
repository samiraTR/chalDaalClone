import 'package:flutter/material.dart';

String homeNav = "assets/icons/home.png";
String categoryNav = "assets/icons/menu.png";
Color homeColorNav = Colors.black;
Color menuColorNav = Colors.black;

List categories = [
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
];

List noodles = [
  {
    "price": "20BDT",
    "name": "Cocola Egg Noodles",
    "quantity": "130 gm",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "160BDT",
    "name": "Nestle Maggie 2-Minute Masala Noodles",
    "quantity": "8 pack",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "20BDT",
    "name": "Doodles Stick Noodles",
    "quantity": "150 gm",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "65BDT",
    "name": "Sajib Coook Noodles Chicken Tandoori 8 Pcs",
    "quantity": "300 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "180BDT",
    "name": "Nestle Maggie Masala Blast Noodles",
    "quantity": "8 pack",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List pharmacy = [
  {
    "price": "20BDT",
    "name": "Cocola Egg Noodles",
    "quantity": "130 gm",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "160BDT",
    "name": "Nestle Maggie 2-Minute Masala Noodles",
    "quantity": "8 pack",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "20BDT",
    "name": "Doodles Stick Noodles",
    "quantity": "150 gm",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "65BDT",
    "name": "Sajib Coook Noodles Chicken Tandoori 8 Pcs",
    "quantity": "300 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "180BDT",
    "name": "Nestle Maggie Masala Blast Noodles",
    "quantity": "8 pack",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];
