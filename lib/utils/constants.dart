import 'package:flutter/material.dart';

String homeNav = "assets/icons/home.png";
String categoryNav = "assets/icons/menu.png";
Color homeColorNav = Colors.black;
Color menuColorNav = Colors.black;
int currentIndex = 0;

// bool themeColor = false;
bool newValue = true;
bool bottomNavRes = false;

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

List freshFruits = [
  {
    "price": "115 BDT",
    "name": "Black Grapes",
    "quantity": "250 gm",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "25 BDT",
    "name": "Cherry Pineapple",
    "quantity": "each",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "145 BDT",
    "name": "Laal Angur",
    "quantity": "250 gm",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "275 BDT",
    "name": "Watermelon Medium 4kg ",
    "quantity": "each",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "185 BDT",
    "name": "Shada Nashpati",
    "quantity": "2 pcs",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List oil = [
  {
    "price": "906 BDT",
    "name": "Teer Fortified Soyabean Oil",
    "quantity": "5 ltr",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "374 BDT",
    "name": "Fresh Fortified Soyabean Oil",
    "quantity": "2 ltr",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "185 BDT",
    "name": "Radhuni Pure Mustard Oil",
    "quantity": "500 ml",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "185 BDT",
    "name": "Teer Fortified Soyabean Oil ",
    "quantity": "1 ltr",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "1620 BDT",
    "name": "Suffola Active Plus Edible oil",
    "quantity": "5 ltr",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List saltNSugar = [
  {
    "price": "120 BDT",
    "name": "Loose White Sugar",
    "quantity": "1 kg",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "22 BDT",
    "name": "ACI Pure Salt",
    "quantity": "500 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "42 BDT",
    "name": "Fresh Super Premium",
    "quantity": "1 Kg",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "55 BDT",
    "name": "Sugar Candy(Tal Misri) ",
    "quantity": "200 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "559 BDT",
    "name": "Sis Brown Sugar",
    "quantity": "800 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List biscuits = [
  {
    "price": "10 BDT",
    "name": "Haque Mr. Cookie Butter",
    "quantity": "39 gm",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "15 BDT",
    "name": "Olympic Energy Plus Biscuit",
    "quantity": "62 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "20 BDT",
    "name": "Bangas Grand Choice Salted Biscuit",
    "quantity": "70 gm",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "20 BDT",
    "name": "Cocola Champion Chocolate biscuit",
    "quantity": "65 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "35 BDT",
    "name": "Pran Potata Spicy Biscuit",
    "quantity": "100 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];
