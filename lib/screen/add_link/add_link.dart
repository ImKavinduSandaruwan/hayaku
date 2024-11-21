import 'package:flutter/material.dart';
import 'package:hayaku_app/screen/add_link/widget/add_link_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../config/textstyle/textstyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddLinkScreen extends StatefulWidget {
  const AddLinkScreen({super.key});

  @override
  State<AddLinkScreen> createState() => _AddLinkScreenState();
}

class _AddLinkScreenState extends State<AddLinkScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController linkController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;
  Map<String, String> userLinks = {};

  // List of social media items
  final List<Map<String, String>> socialItems = [
    {
      "title": "Facebook",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733547.png"
    },
    {
      "title": "Instagram",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733558.png"
    },
    {
      "title": "Twitter",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733579.png"
    },
    {
      "title": "Pinterest",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733564.png"
    },
    {
      "title": "LinkedIn",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733561.png"
    },
    {
      "title": "YouTube",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733646.png"
    },
    {
      "title": "Snapchat",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733576.png"
    },
    {
      "title": "Reddit",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733609.png"
    },
    {
      "title": "WhatsApp",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733585.png"
    },
    {
      "title": "TikTok",
      "img": "https://cdn-icons-png.flaticon.com/512/3046/3046123.png"
    },
    {
      "title": "Telegram",
      "img": "https://cdn-icons-png.flaticon.com/512/733/733641.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    loadUserLinks();
  }

  Future<void> loadUserLinks() async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId != null) {
        final doc = await _firestore
            .collection('user_links')
            .doc(userId)
            .get();

        if (doc.exists) {
          setState(() {
            userLinks = Map<String, String>.from(doc.data() as Map<String, dynamic>);
          });
        }
      }
    } catch (e) {
      print('Error loading user links: $e');
    }
  }

  Future<void> saveSocialLink(String platform, String link) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) {
        throw 'User not logged in';
      }

      // Validate the link
      if (!link.startsWith('http://') && !link.startsWith('https://')) {
        link = 'https://$link';
      }

      // Save to Firestore
      await _firestore.collection('user_links').doc(userId).set({
        platform.toLowerCase(): link,
      }, SetOptions(merge: true));

      // Update local state
      setState(() {
        userLinks[platform.toLowerCase()] = link;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$platform link saved successfully')),
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to save link: $e';
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage ?? 'An error occurred')),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> showLinkInputDialog(String platform) async {
    linkController.text = userLinks[platform.toLowerCase()] ?? '';

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add $platform Link'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: linkController,
              decoration: InputDecoration(
                labelText: 'Enter your $platform profile link',
                hintText: 'https://$platform.com/yourprofile',
              ),
              keyboardType: TextInputType.url,
            ),
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: isLoading
                ? null
                : () {
              if (linkController.text.isNotEmpty) {
                saveSocialLink(platform, linkController.text)
                    .then((_) => Navigator.pop(context));
              }
            },
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              title24('Add Link', context),
              body16('Add your social media link', isCenter: true, context),
              20.height,
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: 155,
                  ),
                  itemCount: socialItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = socialItems[index];
                    final hasLink = userLinks.containsKey(item["title"]!.toLowerCase());

                    return LinkButtonWidget(
                      img: item["img"]!,
                      title: item["title"]!,
                      isActive: hasLink,
                      press: () => showLinkInputDialog(item["title"]!),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    linkController.dispose();
    super.dispose();
  }
}