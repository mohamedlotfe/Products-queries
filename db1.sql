/*
 Navicat MySQL Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : db1

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 23/01/2021 15:42:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'cars', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (2, 'mobiles', NULL, NULL, NULL);
INSERT INTO `categories` VALUES (3, 'labtops', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for product_providers
-- ----------------------------
DROP TABLE IF EXISTS `product_providers`;
CREATE TABLE `product_providers`  (
  `product_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `available` int NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`, `provider_id`) USING BTREE,
  INDEX `products_id`(`product_id`) USING BTREE,
  INDEX `provider_id`(`provider_id`) USING BTREE,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `provider_id` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_providers
-- ----------------------------
INSERT INTO `product_providers` VALUES (1, 1, 100.00, 1);
INSERT INTO `product_providers` VALUES (1, 2, 150.00, 1);
INSERT INTO `product_providers` VALUES (2, 1, 200.00, 1);
INSERT INTO `product_providers` VALUES (2, 3, 250.00, 1);
INSERT INTO `product_providers` VALUES (3, 1, 220.00, 1);
INSERT INTO `product_providers` VALUES (3, 3, 180.00, 1);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `category_id` int NULL DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Aston Martin', NULL, 1, NULL, NULL);
INSERT INTO `products` VALUES (2, 'Samsung S10', NULL, 2, NULL, NULL);
INSERT INTO `products` VALUES (3, 'Audi', NULL, 1, NULL, NULL);
INSERT INTO `products` VALUES (4, 'Oneplus 8', NULL, 2, NULL, NULL);
INSERT INTO `products` VALUES (5, 'HP Probook', NULL, 3, NULL, NULL);
INSERT INTO `products` VALUES (6, 'Macbook Pro', NULL, 3, NULL, NULL);

-- ----------------------------
-- Table structure for providers
-- ----------------------------
DROP TABLE IF EXISTS `providers`;
CREATE TABLE `providers`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of providers
-- ----------------------------
INSERT INTO `providers` VALUES (1, 'B2B');
INSERT INTO `providers` VALUES (2, 'M2');
INSERT INTO `providers` VALUES (3, 'Btech');
INSERT INTO `providers` VALUES (4, 'Carfour');
INSERT INTO `providers` VALUES (5, 'Careem');

SET FOREIGN_KEY_CHECKS = 1;
