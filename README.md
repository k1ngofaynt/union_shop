# Union Shop - Flutter E-Commerce Application

A modern, responsive e-commerce application built with Flutter for selling university merchandise including hoodies, t-shirts, ties, and other apparel. This project demonstrates a full-featured online shop with product collections, shopping cart functionality, and a responsive user interface optimized for mobile and desktop devices.

## 📋 Table of Contents
- [Key Features](#key-features)
- [Installation and Setup](#installation-and-setup)
- [Usage Instructions](#usage-instructions)
- [Project Structure and Technologies](#project-structure-and-technologies)
- [Known Issues and Limitations](#known-issues-and-limitations)
- [Contact Information](#contact-information)

---

## ✨ Key Features

### Core Functionality
- **🏠 Home Page**: Dynamic landing page with slideshow carousel, promotional sale section, graduation collection showcase, signature range products, and custom print shack information
- **🛍️ Product Collections**: Three distinct collections (Signature, Limited Editions, Graduation) with detailed product listings
- **📦 Product Details**: Individual product pages with images, descriptions, pricing, size selection, and quantity controls
- **🛒 Shopping Cart**: Full cart management with add/remove items, quantity adjustment, and price calculations
- **💰 Sale Section**: Dedicated page showcasing discounted items with original and sale pricing
- **👤 User Authentication**: Login and registration interface with form validation
- **📱 Responsive Design**: Fully responsive layout adapting to mobile (< 768px), tablet (768px-1024px), and desktop (> 1024px) screens
- **🧭 Navigation**: Scrollable navbar with logo, menu links, search functionality, and cart icon with item count badge

---

## 📦 Installation and Setup

### Prerequisites

Before you begin, ensure you have the following installed:
- **Flutter SDK** (version 3.0 or higher)
- **Dart SDK** (comes with Flutter)
- **Git** for version control
- **IDE**: Visual Studio Code or Android Studio
- **Chrome** browser (recommended for web development)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/union_shop.git
   cd union_shop
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter Installation**
   ```bash
   flutter doctor
   ```
   This checks your environment and displays a report of your Flutter installation status.

4. **Run the Application**
   
   **For Web (Recommended):**
   ```bash
   flutter run -d chrome
   ```

   **For Mobile Emulator:**
   ```bash
   flutter run
   ```

5. **Enable Mobile View in Browser**
   - Open Chrome DevTools (`F12` or right-click → Inspect)
   - Click "Toggle device toolbar" icon
   - Select a mobile device preset (e.g., iPhone 12 Pro, Pixel 5)

### Running Tests

To run the unit tests:
```bash
flutter test
```

To run tests with coverage:
```bash
flutter test --coverage
```

---

## 🎯 Usage Instructions

### Main Features

#### 1. **Browsing Products**
- Navigate to the **Home Page** to see featured products and sales
- Click on **Collections** in the navbar to view all product collections
- Select a collection to browse products within that category
- Click on any product card to view detailed information

#### 2. **Shopping Cart**
- On any product page, select size and quantity
- Click **"Add to Cart"** button
- View cart by clicking the cart icon in the navbar
- In the cart:
  - Adjust quantities using +/- buttons
  - Remove items by clicking the remove button
  - View subtotal and proceed to checkout

#### 3. **Product Search**
- Use the search bar in the navbar (desktop view)
- Enter product name or keywords
- Press Enter to search

#### 4. **Viewing Sales**
- Click **"SALE!"** in the navbar to see all discounted products
- Sale items show both original and discounted prices
- Add sale items to cart with a single click

#### 5. **User Authentication**
- Click the user icon in the navbar
- Choose between **Login** or **Register**
- Fill in the required form fields
- Submit to authenticate

### Navigation Flow

```
Home Page
├── Collections Page
│   └── Collection Detail Page
│       └── Product Page
│           └── Cart Page
├── Sale Page
│   └── Product Page
│       └── Cart Page
├── About Page
└── Auth Page
```

### Configuration Options

#### Changing App Colors
Edit `lib/utils/constants.dart`:
```dart
class AppColors {
  static const primary = Color(0xFF003057);    // Change primary color
  static const secondary = Color(0xFF4d2963);  // Change secondary color
}
```

#### Adding New Products
Edit `lib/services/product_service.dart`:
```dart
Product(
  id: '9',
  name: 'Your Product Name',
  description: 'Product description',
  price: 29.99,
  image: ImageAssets.yourImage,
  collection: 'signature',
  isSale: false,
)
```

---

## 🏗️ Project Structure and Technologies

### Folder Organization

```
union_shop/
├── lib/
│   ├── main.dart                      # App entry point, routing, AppShell
│   ├── models/                        # Data models
│   │   ├── product.dart               # Product model (id, name, price, etc.)
│   │   ├── collection.dart            # Collection model
│   │   └── cart_item_model.dart       # Shopping cart item model
│   ├── pages/                         # Screen pages
│   │   ├── home_page.dart             # Landing page with sections
│   │   ├── about_page.dart            # About/company info page
│   │   ├── collections_page.dart      # All collections grid view
│   │   ├── collection_detail_page.dart # Single collection products
│   │   ├── product_page.dart          # Product details page
│   │   ├── cart_page.dart             # Shopping cart page
│   │   ├── sale_page.dart             # Sale items page
│   │   └── auth_page.dart             # Login/Register page
│   ├── services/                      # Business logic layer
│   │   └── product_service.dart       # Product data management
│   ├── widgets/                       # Reusable UI components
│   │   ├── navbar.dart                # Top navigation bar
│   │   ├── footer.dart                # Bottom footer
│   │   ├── product_card.dart          # Product display card
│   │   ├── cart_item.dart             # Cart item widget
│   │   └── slideshow_carousel.dart    # Image carousel
│   └── utils/                         # Helper utilities
│       ├── constants.dart             # App colors, theme constants
│       └── image_constants.dart       # Image asset paths
├── assets/
│   └── images/                        # Product images, banners
├── test/                              # Unit and widget tests
├── android/                           # Android platform config
├── ios/                               # iOS platform config
├── web/                               # Web platform config
└── pubspec.yaml                       # Dependencies and assets
```

### Key Files and Their Purposes

- **`lib/main.dart`**: Application entry point, defines routes and AppShell wrapper
- **`lib/services/product_service.dart`**: Manages product data, collections, and cart operations
- **`lib/utils/constants.dart`**: Centralizes app-wide color scheme and styling constants
- **`lib/widgets/navbar.dart`**: Main navigation component with responsive mobile/desktop layouts
- **`pubspec.yaml`**: Defines Flutter dependencies, assets, and project metadata

### Technologies Used

#### Framework & Language
- **Flutter** (3.0+) - Cross-platform UI framework
- **Dart** (2.17+) - Programming language

#### Key Dependencies
- `flutter/material.dart` - Material Design widgets
- `flutter/cupertino.dart` - iOS-style widgets

#### Development Tools
- **VS Code** / **Android Studio** - IDE
- **Git** - Version control
- **Chrome DevTools** - Debugging and inspection
- **Flutter DevTools** - Performance profiling

#### Architecture Pattern
- **MVC-like structure**: Models, Pages (Views), Services (Controllers)
- **Widget composition**: Reusable component-based UI
- **State management**: StatefulWidget for local state

### Product Collections

The app features **3 main product collections**:

### 1. **Signature Collection**
**Description:** Signature T-Shirt and Signature Hoodie

**Products:**
- **Signature T-Shirt** - $12.99
  - Classic signature design
  - Premium quality fabric
- **Signature Hoodie** - $32.99
  - Essential hoodie in classic colors
  - Comfortable fit

**Collection ID:** `signature`  
**Image:** `product_signature_hoodie.png`

### 2. **Limited Editions**
**Description:** Exclusive items including Crested Tie and Limited Edition Zip Hoodie

**Products:**
- **Limited Edition Zip Hoodie** - $45.00
  - Exclusive limited edition design
  - Premium zip-up style
- **Crested Tie** - $10.99 ~~$15.00~~ (ON SALE)
  - Elegant crested design
  - University logo

**Collection ID:** `limited-editions`  
**Image:** `product_zip_hoodies.png`

### 3. **Graduation Collection**
**Description:** Official graduation apparel

**Products:**
- **Graduation Hoodie** - $35.00
  - Premium graduation design
  - Embroidered logo

**Collection ID:** `graduation`  
**Image:** `product_graduation_hoodies.png`

---

## ⚠️ Known Issues and Limitations

### Current Limitations

1. **No Backend Integration**
   - All product data is hardcoded in `product_service.dart`
   - Cart data is not persisted (resets on app reload)
   - No real user authentication (UI only)

2. **Limited Search Functionality**
   - Search bar is present but not fully implemented
   - No filtering or sorting on collection pages

3. **Payment System**
   - No actual payment processing
   - Checkout button is non-functional

4. **Responsive Design**
   - Optimized primarily for mobile view
   - Desktop view works but could be enhanced
   - Some components may need adjustment for very large screens (> 1920px)

5. **Image Assets**
   - Using placeholder images
   - No image lazy loading or optimization

### Known Bugs

- None currently reported

### Future Improvements Planned

- [ ] **Backend Integration**: Connect to Firebase or REST API for real data
- [ ] **User Authentication**: Implement Firebase Auth or OAuth
- [ ] **Cart Persistence**: Save cart to local storage or database
- [ ] **Payment Gateway**: Integrate Stripe or PayPal
- [ ] **Advanced Search**: Full-text search with filters and sorting
- [ ] **Wishlist Feature**: Allow users to save favorite products
- [ ] **Product Reviews**: Add rating and review system
- [ ] **Order History**: Track past purchases
- [ ] **Push Notifications**: Order updates and promotions
- [ ] **Dark Mode**: Theme switching capability
- [ ] **Internationalization**: Multi-language support
- [ ] **Image Optimization**: Lazy loading and caching
- [ ] **Analytics**: User behavior tracking

---

## 👤 Contact Information

**Developer**: k1ngofaynt  
**GitHub**: [@k1ngofaynt](https://github.com/k1ngofaynt)  
**Project Repository**: [union_shop](https://github.com/k1ngofaynt/union_shop)

For questions, bug reports, or feature requests, please open an issue on GitHub.

---

**Built with ❤️ using Flutter**

### Product Images
- `product_graduation_hoodies.png` - Graduation Hoodie
- `product_signature_hoodie.png` - Signature Hoodie
- `product_signature_tshirt.png` - Signature T-Shirt
- `product_essential_tshirt.png` - Essential T-Shirt
- `product_zip_hoodies.png` - Limited Edition Zip Hoodie
- `product_crested_tie.png` - Crested Tie
- `product_sale_tshirt.png` - Sale T-Shirt

### Adding New Images

1. **Add image file** to `assets/images/` directory
2. **Register in `pubspec.yaml`** under the `assets` section:
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```
3. **Add constant** in `lib/utils/image_constants.dart`:
   ```dart
   static const String yourImageName = 'assets/images/your_image.png';
   ```
4. **Reference in code**:
   ```dart
   Image.asset(ImageAssets.yourImageName)
   ```

---

## ⚙️ Configuration

### App Colors (`lib/utils/constants.dart`)
```dart
class AppColors {
  static const primary = Color(0xFF003057);      // Navy blue
  static const secondary = Color(0xFF4d2963);    // Purple
  static const background = Color(0xFFF5F5F5);   // Light gray
  static const border = Color(0xFFE0E0E0);       // Border gray
  static const text = Color(0xFF1A1A1A);         // Dark text
}
```

### Routes (`lib/main.dart`)
**Static Routes:**
```dart
routes: {
  '/': (context) => AppShell(),
  '/about': (context) => AppShell(page: 'about'),
  '/collections': (context) => AppShell(page: 'collections'),
  '/cart': (context) => AppShell(page: 'cart'),
  '/sale': (context) => AppShell(page: 'sale'),
  '/auth': (context) => AppShell(page: 'auth'),
}
```

**Dynamic Routes:**
- `/product/:id` - ProductPage with specific product ID
- `/collection/:id` - CollectionDetailPage with specific collection ID

### Product Service Methods (`lib/services/product_service.dart`)

```dart
// Get all products
static List<Product> get products

// Get all collections
static Future<List<Collection>> getAllCollections()

// Get specific collection by ID
static Future<Collection?> getCollectionById(String id)

// Get products in a collection
static Future<List<Product>> getProductsByCollection(String collectionId)

// Get all sale products
static Future<List<Product>> getSaleProducts()

// Get specific product by ID
static Future<Product?> getProductById(String id)
```

---

## 🎨 Customization Guide

### Adding a New Product

In `lib/services/product_service.dart`, add to the `_products` list:

```dart
Product(
  id: '9',
  name: 'New Product Name',
  description: 'Detailed product description',
  price: 29.99,
  originalPrice: 39.99,  // Optional, for sale items
  image: ImageAssets.yourProductImage,
  collection: 'signature',  // or 'limited-editions' or 'graduation'
  isSale: false,  // Set to true if on sale
)
```

### Adding a New Collection

1. **Add to `_collections` list** in `lib/services/product_service.dart`:
   ```dart
   Collection(
     id: 'new-collection',
     name: 'New Collection Name',
     description: 'Collection description',
     image: ImageAssets.collectionImage,
     productCount: 3,  // Number of products
   )
   ```

2. **Create products** with `collection: 'new-collection'`

3. **Add collection image** to assets and image constants

### Modifying Colors

Edit `lib/utils/constants.dart`:
```dart
class AppColors {
  static const primary = Color(0xFFYOURCOLOR);
  static const secondary = Color(0xFFYOURCOLOR);
  // Add more colors as needed
}
```

### Adding a New Page

1. **Create page file** in `lib/pages/` (e.g., `new_page.dart`)
2. **Add route** in `lib/main.dart`:
   ```dart
   '/newpage': (context) => AppShell(page: 'newpage'),
   ```
3. **Add case** in `_buildContent()` method of `AppShell`
4. **Add navigation link** in navbar

---

## 📱 Responsive Design

The application is fully responsive and adapts to different screen sizes:

- **Mobile** (< 768px): Single column layouts, hamburger menu
- **Tablet** (768px - 1024px): 2-column grids
- **Desktop** (> 1024px): 3-4 column grids, expanded navigation

**Testing Responsiveness:**
```dart
final isMobile = MediaQuery.of(context).size.width < 768;
```

---

## 🛠️ Development Commands

### Hot Reload
During development, use hot reload to see changes instantly:
- Press `r` in terminal for **hot reload** (preserves state)
- Press `R` for **hot restart** (resets state)

### Clean Build
```bash
flutter clean
flutter pub get
```

### Run in Debug Mode
```bash
flutter run --debug
```

### Run Tests
```bash
flutter test
```

### Build for Production

**Web:**
```bash
flutter build web
```

**Android APK:**
```bash
flutter build apk
```

**iOS:**
```bash
flutter build ios
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork** the repository
2. **Create** your feature branch
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit** your changes
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push** to the branch
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open** a Pull Request

### Code Style Guidelines
- Follow Dart's official style guide
- Use meaningful variable and function names
- Add comments for complex logic
- Format code with `flutter format .`
- Run `flutter analyze` before committing

---


## 🎯 Future Enhancements

Potential features for future development:

- [ ] **Payment Integration** - Stripe or PayPal checkout
- [ ] **User Profiles** - Profile management and order history
- [ ] **Reviews & Ratings** - Product review system
- [ ] **Wishlist** - Save favorite products
- [ ] **Advanced Search** - Filters and sorting options
- [ ] **Push Notifications** - Order updates and promotions
- [ ] **Dark Mode** - Theme switching
- [ ] **Multi-language** - Internationalization support
- [ ] **Analytics** - User behavior tracking
- [ ] **Backend API** - Connect to real database

---

## 👥 Contact & Support

**Project Repository:** [https://github.com/k1ngofaynt/union_shop](https://github.com/k1ngofaynt/union_shop)

For questions or support, please open an issue on GitHub.

---

**Built with ❤️ using Flutter**

---

