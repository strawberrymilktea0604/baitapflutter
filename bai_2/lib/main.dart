import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HotelListScreen(),
    );
  }
}

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF003580),
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header capsule laid over the blue top bar
              Container(
                width: double.infinity,
                color: const Color(0xFF003580),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xFFFFB700),
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Xung quanh vị trí hiện tại',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        '23 thg 10 – 24 thg 10',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Filter buttons
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSortButton(),
                    _buildFilterButton(Icons.filter_alt_outlined, 'Lọc'),
                    _buildFilterButton(Icons.map_outlined, 'Bản đồ'),
                  ],
                ),
              ),
              // Results count
              Container(
                width: double.infinity,
                color: Colors.grey[100],
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Text(
                  '757 chỗ nghỉ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
              // Hotel list
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: [
                      _buildHotelCard(
                        imagePath: 'assets/images/hotel1.jpg',
                        badgeText: 'Bao bữa sáng',
                        hotelName: 'aNhil Boutique',
                        rating: 9.5,
                        ratingText: 'Xuất sắc',
                        reviewCount: '95 đánh giá',
                        location: 'Huế',
                        distance: 'Cách bạn 0,6km',
                        roomInfo: '1 suite riêng tư',
                        guests: '1 giường',
                        price: 'US\$109',
                        priceNote: 'Đã bao gồm thuế và phí',
                      ),
                      _buildHotelCard(
                        imagePath: 'assets/images/hotel2.jpg',
                        badgeText: 'Bao bữa sáng',
                        hotelName: 'An Nam Hue Boutique',
                        rating: 9.2,
                        ratingText: 'Tuyệt hảo',
                        reviewCount: '34 đánh giá',
                        location: 'Cư Chính',
                        distance: 'Cách bạn 0,9km',
                        roomInfo: '1 phòng khách sạn',
                        guests: '1 giường',
                        price: 'US\$20',
                        priceNote: 'Đã bao gồm thuế và phí',
                      ),
                      _buildHotelCard(
                        imagePath: 'assets/images/hotel3.jpg',
                        badgeText: null,
                        hotelName: 'Huế Jade Hill Villa',
                        subtitle: 'Được quản lý bởi một chủ nhà cá nhân',
                        rating: 8.0,
                        ratingText: 'Rất tốt',
                        reviewCount: '1 đánh giá',
                        location: 'Cư Chính',
                        distance: 'Cách bạn 1,3km',
                        roomInfo: '1 biệt thự nguyên căn - 1.000 m²',
                        guests: '4 giường · 3 phòng ngủ · 1 phòng khách · 3 phòng tắm',
                        price: 'US\$285',
                        priceNote: 'Đã bao gồm thuế và phí',
                        bookingNote: 'Chỉ còn 1 căn với giá này trên Booking.com',
                        noPaymentRequired: true,
                        imageHeight: 160, // Taller image for villa
                      ),
                      _buildHotelCard(
                        imagePath: 'assets/images/hotel4.jpg',
                        badgeText: 'Bao bữa sáng',
                        hotelName: 'Em Villa',
                        subtitle: 'Được quản lý bởi một chủ nhà cá nhân',
                        rating: 8.5,
                        ratingText: 'Rất tốt',
                        reviewCount: '12 đánh giá',
                        location: 'Huế',
                        distance: 'Cách bạn 1,5km',
                        roomInfo: '1 biệt thự nguyên căn',
                        guests: '2 giường',
                        price: 'US\$150',
                        priceNote: 'Đã bao gồm thuế và phí',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSortButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.swap_vert, color: Colors.black54),
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
          const Text(
            'Sắp xếp',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(IconData icon, String label) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard({
    required String imagePath,
    String? badgeText,
    required String hotelName,
    String? subtitle,
    required double rating,
    required String ratingText,
    required String reviewCount,
    required String location,
    required String distance,
    required String roomInfo,
    required String guests,
    required String price,
    required String priceNote,
    String? bookingNote,
    bool noPaymentRequired = false,
    double imageHeight = 120, // Add parameter for custom image height
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    imagePath,
                    width: 120,
                    height: imageHeight,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120,
                        height: imageHeight,
                        color: Colors.grey[300],
                        child: const Icon(Icons.hotel, size: 40, color: Colors.grey),
                      );
                    },
                  ),
                ),
                if (badgeText != null)
                  Positioned(
                    top: 8,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF008009),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        badgeText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel name and favorite icon row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hotelName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // 5 Star rating
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star,
                        color: Color(0xFFFFB700),
                        size: 14,
                      );
                    }),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  // Rating
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF003580),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '$ratingText · $reviewCount',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '$location · $distance',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Room info
                  Text(
                    roomInfo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    guests,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Price and additional info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            priceNote,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      if (bookingNote != null) ...[
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          child: Text(
                            bookingNote,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                      ],
                      if (noPaymentRequired) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.check_circle,
                                size: 14, color: Colors.green[700]),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                'Không cần thanh toán trước',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
