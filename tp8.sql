/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : tp8

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 19/01/2025 17:38:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限节点',
  `createtime` bigint(16) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for continents
-- ----------------------------
DROP TABLE IF EXISTS `continents`;
CREATE TABLE `continents`  (
  `code` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of continents
-- ----------------------------
INSERT INTO `continents` VALUES ('AF', 'Africa');
INSERT INTO `continents` VALUES ('AN', 'Antarctica');
INSERT INTO `continents` VALUES ('AS', 'Asia');
INSERT INTO `continents` VALUES ('EU', 'Europe');
INSERT INTO `continents` VALUES ('NA', 'North America');
INSERT INTO `continents` VALUES ('OC', 'Oceania');
INSERT INTO `continents` VALUES ('SA', 'South America');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `code` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `native` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `continent` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `capital` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `currency` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `languages` varchar(29) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `continent`(`continent`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('AD', 'Andorra', 'Andorra', '376', 'EU', 'Andorra la Vella', 'EUR', 'ca');
INSERT INTO `countries` VALUES ('AE', 'United Arab Emirates', 'دولة الإمارات العربية المتحدة', '971', 'AS', 'Abu Dhabi', 'AED', 'ar');
INSERT INTO `countries` VALUES ('AF', 'Afghanistan', 'افغانستان', '93', 'AS', 'Kabul', 'AFN', 'ps,uz,tk');
INSERT INTO `countries` VALUES ('AG', 'Antigua and Barbuda', 'Antigua and Barbuda', '1268', 'NA', 'Saint John\'s', 'XCD', 'en');
INSERT INTO `countries` VALUES ('AI', 'Anguilla', 'Anguilla', '1264', 'NA', 'The Valley', 'XCD', 'en');
INSERT INTO `countries` VALUES ('AL', 'Albania', 'Shqipëria', '355', 'EU', 'Tirana', 'ALL', 'sq');
INSERT INTO `countries` VALUES ('AM', 'Armenia', 'Հայաստան', '374', 'AS', 'Yerevan', 'AMD', 'hy,ru');
INSERT INTO `countries` VALUES ('AO', 'Angola', 'Angola', '244', 'AF', 'Luanda', 'AOA', 'pt');
INSERT INTO `countries` VALUES ('AQ', 'Antarctica', 'Antarctica', '672', 'AN', '', '', '');
INSERT INTO `countries` VALUES ('AR', 'Argentina', 'Argentina', '54', 'SA', 'Buenos Aires', 'ARS', 'es,gn');
INSERT INTO `countries` VALUES ('AS', 'American Samoa', 'American Samoa', '1684', 'OC', 'Pago Pago', 'USD', 'en,sm');
INSERT INTO `countries` VALUES ('AT', 'Austria', 'Österreich', '43', 'EU', 'Vienna', 'EUR', 'de');
INSERT INTO `countries` VALUES ('AU', 'Australia', 'Australia', '61', 'OC', 'Canberra', 'AUD', 'en');
INSERT INTO `countries` VALUES ('AW', 'Aruba', 'Aruba', '297', 'NA', 'Oranjestad', 'AWG', 'nl,pa');
INSERT INTO `countries` VALUES ('AX', 'Aland', 'Åland', '358', 'EU', 'Mariehamn', 'EUR', 'sv');
INSERT INTO `countries` VALUES ('AZ', 'Azerbaijan', 'Azərbaycan', '994', 'AS', 'Baku', 'AZN', 'az');
INSERT INTO `countries` VALUES ('BA', 'Bosnia and Herzegovina', 'Bosna i Hercegovina', '387', 'EU', 'Sarajevo', 'BAM', 'bs,hr,sr');
INSERT INTO `countries` VALUES ('BB', 'Barbados', 'Barbados', '1246', 'NA', 'Bridgetown', 'BBD', 'en');
INSERT INTO `countries` VALUES ('BD', 'Bangladesh', 'Bangladesh', '880', 'AS', 'Dhaka', 'BDT', 'bn');
INSERT INTO `countries` VALUES ('BE', 'Belgium', 'België', '32', 'EU', 'Brussels', 'EUR', 'nl,fr,de');
INSERT INTO `countries` VALUES ('BF', 'Burkina Faso', 'Burkina Faso', '226', 'AF', 'Ouagadougou', 'XOF', 'fr,ff');
INSERT INTO `countries` VALUES ('BG', 'Bulgaria', 'България', '359', 'EU', 'Sofia', 'BGN', 'bg');
INSERT INTO `countries` VALUES ('BH', 'Bahrain', '‏البحرين', '973', 'AS', 'Manama', 'BHD', 'ar');
INSERT INTO `countries` VALUES ('BI', 'Burundi', 'Burundi', '257', 'AF', 'Bujumbura', 'BIF', 'fr,rn');
INSERT INTO `countries` VALUES ('BJ', 'Benin', 'Bénin', '229', 'AF', 'Porto-Novo', 'XOF', 'fr');
INSERT INTO `countries` VALUES ('BL', 'Saint Barthelemy', 'Saint-Barthélemy', '590', 'NA', 'Gustavia', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('BM', 'Bermuda', 'Bermuda', '1441', 'NA', 'Hamilton', 'BMD', 'en');
INSERT INTO `countries` VALUES ('BN', 'Brunei', 'Negara Brunei Darussalam', '673', 'AS', 'Bandar Seri Begawan', 'BND', 'ms');
INSERT INTO `countries` VALUES ('BO', 'Bolivia', 'Bolivia', '591', 'SA', 'Sucre', 'BOB,BOV', 'es,ay,qu');
INSERT INTO `countries` VALUES ('BQ', 'Bonaire', 'Bonaire', '5997', 'NA', 'Kralendijk', 'USD', 'nl');
INSERT INTO `countries` VALUES ('BR', 'Brazil', 'Brasil', '55', 'SA', 'Brasília', 'BRL', 'pt');
INSERT INTO `countries` VALUES ('BS', 'Bahamas', 'Bahamas', '1242', 'NA', 'Nassau', 'BSD', 'en');
INSERT INTO `countries` VALUES ('BT', 'Bhutan', 'ʼbrug-yul', '975', 'AS', 'Thimphu', 'BTN,INR', 'dz');
INSERT INTO `countries` VALUES ('BV', 'Bouvet Island', 'Bouvetøya', '47', 'AN', '', 'NOK', 'no,nb,nn');
INSERT INTO `countries` VALUES ('BW', 'Botswana', 'Botswana', '267', 'AF', 'Gaborone', 'BWP', 'en,tn');
INSERT INTO `countries` VALUES ('BY', 'Belarus', 'Белару́сь', '375', 'EU', 'Minsk', 'BYN', 'be,ru');
INSERT INTO `countries` VALUES ('BZ', 'Belize', 'Belize', '501', 'NA', 'Belmopan', 'BZD', 'en,es');
INSERT INTO `countries` VALUES ('CA', 'Canada', 'Canada', '1', 'NA', 'Ottawa', 'CAD', 'en,fr');
INSERT INTO `countries` VALUES ('CC', 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', '61', 'AS', 'West Island', 'AUD', 'en');
INSERT INTO `countries` VALUES ('CD', 'Democratic Republic of the Congo', 'République démocratique du Congo', '243', 'AF', 'Kinshasa', 'CDF', 'fr,ln,kg,sw,lu');
INSERT INTO `countries` VALUES ('CF', 'Central African Republic', 'Ködörösêse tî Bêafrîka', '236', 'AF', 'Bangui', 'XAF', 'fr,sg');
INSERT INTO `countries` VALUES ('CG', 'Republic of the Congo', 'République du Congo', '242', 'AF', 'Brazzaville', 'XAF', 'fr,ln');
INSERT INTO `countries` VALUES ('CH', 'Switzerland', 'Schweiz', '41', 'EU', 'Bern', 'CHE,CHF,CHW', 'de,fr,it');
INSERT INTO `countries` VALUES ('CI', 'Ivory Coast', 'Côte d\'Ivoire', '225', 'AF', 'Yamoussoukro', 'XOF', 'fr');
INSERT INTO `countries` VALUES ('CK', 'Cook Islands', 'Cook Islands', '682', 'OC', 'Avarua', 'NZD', 'en');
INSERT INTO `countries` VALUES ('CL', 'Chile', 'Chile', '56', 'SA', 'Santiago', 'CLF,CLP', 'es');
INSERT INTO `countries` VALUES ('CM', 'Cameroon', 'Cameroon', '237', 'AF', 'Yaoundé', 'XAF', 'en,fr');
INSERT INTO `countries` VALUES ('CN', 'China', '中国', '86', 'AS', 'Beijing', 'CNY', 'zh');
INSERT INTO `countries` VALUES ('CO', 'Colombia', 'Colombia', '57', 'SA', 'Bogotá', 'COP', 'es');
INSERT INTO `countries` VALUES ('CR', 'Costa Rica', 'Costa Rica', '506', 'NA', 'San José', 'CRC', 'es');
INSERT INTO `countries` VALUES ('CU', 'Cuba', 'Cuba', '53', 'NA', 'Havana', 'CUC,CUP', 'es');
INSERT INTO `countries` VALUES ('CV', 'Cape Verde', 'Cabo Verde', '238', 'AF', 'Praia', 'CVE', 'pt');
INSERT INTO `countries` VALUES ('CW', 'Curacao', 'Curaçao', '5999', 'NA', 'Willemstad', 'ANG', 'nl,pa,en');
INSERT INTO `countries` VALUES ('CX', 'Christmas Island', 'Christmas Island', '61', 'AS', 'Flying Fish Cove', 'AUD', 'en');
INSERT INTO `countries` VALUES ('CY', 'Cyprus', 'Κύπρος', '357', 'EU', 'Nicosia', 'EUR', 'el,tr,hy');
INSERT INTO `countries` VALUES ('CZ', 'Czech Republic', 'Česká republika', '420', 'EU', 'Prague', 'CZK', 'cs');
INSERT INTO `countries` VALUES ('DE', 'Germany', 'Deutschland', '49', 'EU', 'Berlin', 'EUR', 'de');
INSERT INTO `countries` VALUES ('DJ', 'Djibouti', 'Djibouti', '253', 'AF', 'Djibouti', 'DJF', 'fr,ar');
INSERT INTO `countries` VALUES ('DK', 'Denmark', 'Danmark', '45', 'EU', 'Copenhagen', 'DKK', 'da');
INSERT INTO `countries` VALUES ('DM', 'Dominica', 'Dominica', '1767', 'NA', 'Roseau', 'XCD', 'en');
INSERT INTO `countries` VALUES ('DO', 'Dominican Republic', 'República Dominicana', '1809,1829,1849', 'NA', 'Santo Domingo', 'DOP', 'es');
INSERT INTO `countries` VALUES ('DZ', 'Algeria', 'الجزائر', '213', 'AF', 'Algiers', 'DZD', 'ar');
INSERT INTO `countries` VALUES ('EC', 'Ecuador', 'Ecuador', '593', 'SA', 'Quito', 'USD', 'es');
INSERT INTO `countries` VALUES ('EE', 'Estonia', 'Eesti', '372', 'EU', 'Tallinn', 'EUR', 'et');
INSERT INTO `countries` VALUES ('EG', 'Egypt', 'مصر‎', '20', 'AF', 'Cairo', 'EGP', 'ar');
INSERT INTO `countries` VALUES ('EH', 'Western Sahara', 'الصحراء الغربية', '212', 'AF', 'El Aaiún', 'MAD,DZD,MRU', 'es');
INSERT INTO `countries` VALUES ('ER', 'Eritrea', 'ኤርትራ', '291', 'AF', 'Asmara', 'ERN', 'ti,ar,en');
INSERT INTO `countries` VALUES ('ES', 'Spain', 'España', '34', 'EU', 'Madrid', 'EUR', 'es,eu,ca,gl,oc');
INSERT INTO `countries` VALUES ('ET', 'Ethiopia', 'ኢትዮጵያ', '251', 'AF', 'Addis Ababa', 'ETB', 'am');
INSERT INTO `countries` VALUES ('FI', 'Finland', 'Suomi', '358', 'EU', 'Helsinki', 'EUR', 'fi,sv');
INSERT INTO `countries` VALUES ('FJ', 'Fiji', 'Fiji', '679', 'OC', 'Suva', 'FJD', 'en,fj,hi,ur');
INSERT INTO `countries` VALUES ('FK', 'Falkland Islands', 'Falkland Islands', '500', 'SA', 'Stanley', 'FKP', 'en');
INSERT INTO `countries` VALUES ('FM', 'Micronesia', 'Micronesia', '691', 'OC', 'Palikir', 'USD', 'en');
INSERT INTO `countries` VALUES ('FO', 'Faroe Islands', 'Føroyar', '298', 'EU', 'Tórshavn', 'DKK', 'fo');
INSERT INTO `countries` VALUES ('FR', 'France', 'France', '33', 'EU', 'Paris', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('GA', 'Gabon', 'Gabon', '241', 'AF', 'Libreville', 'XAF', 'fr');
INSERT INTO `countries` VALUES ('GB', 'United Kingdom', 'United Kingdom', '44', 'EU', 'London', 'GBP', 'en');
INSERT INTO `countries` VALUES ('GD', 'Grenada', 'Grenada', '1473', 'NA', 'St. George\'s', 'XCD', 'en');
INSERT INTO `countries` VALUES ('GE', 'Georgia', 'საქართველო', '995', 'AS', 'Tbilisi', 'GEL', 'ka');
INSERT INTO `countries` VALUES ('GF', 'French Guiana', 'Guyane française', '594', 'SA', 'Cayenne', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('GG', 'Guernsey', 'Guernsey', '44', 'EU', 'St. Peter Port', 'GBP', 'en,fr');
INSERT INTO `countries` VALUES ('GH', 'Ghana', 'Ghana', '233', 'AF', 'Accra', 'GHS', 'en');
INSERT INTO `countries` VALUES ('GI', 'Gibraltar', 'Gibraltar', '350', 'EU', 'Gibraltar', 'GIP', 'en');
INSERT INTO `countries` VALUES ('GL', 'Greenland', 'Kalaallit Nunaat', '299', 'NA', 'Nuuk', 'DKK', 'kl');
INSERT INTO `countries` VALUES ('GM', 'Gambia', 'Gambia', '220', 'AF', 'Banjul', 'GMD', 'en');
INSERT INTO `countries` VALUES ('GN', 'Guinea', 'Guinée', '224', 'AF', 'Conakry', 'GNF', 'fr,ff');
INSERT INTO `countries` VALUES ('GP', 'Guadeloupe', 'Guadeloupe', '590', 'NA', 'Basse-Terre', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('GQ', 'Equatorial Guinea', 'Guinea Ecuatorial', '240', 'AF', 'Malabo', 'XAF', 'es,fr');
INSERT INTO `countries` VALUES ('GR', 'Greece', 'Ελλάδα', '30', 'EU', 'Athens', 'EUR', 'el');
INSERT INTO `countries` VALUES ('GS', 'South Georgia and the South Sandwich Islands', 'South Georgia', '500', 'AN', 'King Edward Point', 'GBP', 'en');
INSERT INTO `countries` VALUES ('GT', 'Guatemala', 'Guatemala', '502', 'NA', 'Guatemala City', 'GTQ', 'es');
INSERT INTO `countries` VALUES ('GU', 'Guam', 'Guam', '1671', 'OC', 'Hagåtña', 'USD', 'en,ch,es');
INSERT INTO `countries` VALUES ('GW', 'Guinea-Bissau', 'Guiné-Bissau', '245', 'AF', 'Bissau', 'XOF', 'pt');
INSERT INTO `countries` VALUES ('GY', 'Guyana', 'Guyana', '592', 'SA', 'Georgetown', 'GYD', 'en');
INSERT INTO `countries` VALUES ('HK', 'Hong Kong', '香港', '852', 'AS', 'City of Victoria', 'HKD', 'zh,en');
INSERT INTO `countries` VALUES ('HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', '61', 'AN', '', 'AUD', 'en');
INSERT INTO `countries` VALUES ('HN', 'Honduras', 'Honduras', '504', 'NA', 'Tegucigalpa', 'HNL', 'es');
INSERT INTO `countries` VALUES ('HR', 'Croatia', 'Hrvatska', '385', 'EU', 'Zagreb', 'EUR', 'hr');
INSERT INTO `countries` VALUES ('HT', 'Haiti', 'Haïti', '509', 'NA', 'Port-au-Prince', 'HTG,USD', 'fr,ht');
INSERT INTO `countries` VALUES ('HU', 'Hungary', 'Magyarország', '36', 'EU', 'Budapest', 'HUF', 'hu');
INSERT INTO `countries` VALUES ('ID', 'Indonesia', 'Indonesia', '62', 'AS', 'Jakarta', 'IDR', 'id');
INSERT INTO `countries` VALUES ('IE', 'Ireland', 'Éire', '353', 'EU', 'Dublin', 'EUR', 'ga,en');
INSERT INTO `countries` VALUES ('IL', 'Israel', 'יִשְׂרָאֵל', '972', 'AS', 'Jerusalem', 'ILS', 'he,ar');
INSERT INTO `countries` VALUES ('IM', 'Isle of Man', 'Isle of Man', '44', 'EU', 'Douglas', 'GBP', 'en,gv');
INSERT INTO `countries` VALUES ('IN', 'India', 'भारत', '91', 'AS', 'New Delhi', 'INR', 'hi,en');
INSERT INTO `countries` VALUES ('IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', '246', 'AS', 'Diego Garcia', 'USD', 'en');
INSERT INTO `countries` VALUES ('IQ', 'Iraq', 'العراق', '964', 'AS', 'Baghdad', 'IQD', 'ar,ku');
INSERT INTO `countries` VALUES ('IR', 'Iran', 'ایران', '98', 'AS', 'Tehran', 'IRR', 'fa');
INSERT INTO `countries` VALUES ('IS', 'Iceland', 'Ísland', '354', 'EU', 'Reykjavik', 'ISK', 'is');
INSERT INTO `countries` VALUES ('IT', 'Italy', 'Italia', '39', 'EU', 'Rome', 'EUR', 'it');
INSERT INTO `countries` VALUES ('JE', 'Jersey', 'Jersey', '44', 'EU', 'Saint Helier', 'GBP', 'en,fr');
INSERT INTO `countries` VALUES ('JM', 'Jamaica', 'Jamaica', '1876', 'NA', 'Kingston', 'JMD', 'en');
INSERT INTO `countries` VALUES ('JO', 'Jordan', 'الأردن', '962', 'AS', 'Amman', 'JOD', 'ar');
INSERT INTO `countries` VALUES ('JP', 'Japan', '日本', '81', 'AS', 'Tokyo', 'JPY', 'ja');
INSERT INTO `countries` VALUES ('KE', 'Kenya', 'Kenya', '254', 'AF', 'Nairobi', 'KES', 'en,sw');
INSERT INTO `countries` VALUES ('KG', 'Kyrgyzstan', 'Кыргызстан', '996', 'AS', 'Bishkek', 'KGS', 'ky,ru');
INSERT INTO `countries` VALUES ('KH', 'Cambodia', 'Kâmpŭchéa', '855', 'AS', 'Phnom Penh', 'KHR', 'km');
INSERT INTO `countries` VALUES ('KI', 'Kiribati', 'Kiribati', '686', 'OC', 'South Tarawa', 'AUD', 'en');
INSERT INTO `countries` VALUES ('KM', 'Comoros', 'Komori', '269', 'AF', 'Moroni', 'KMF', 'ar,fr');
INSERT INTO `countries` VALUES ('KN', 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', '1869', 'NA', 'Basseterre', 'XCD', 'en');
INSERT INTO `countries` VALUES ('KP', 'North Korea', '북한', '850', 'AS', 'Pyongyang', 'KPW', 'ko');
INSERT INTO `countries` VALUES ('KR', 'South Korea', '대한민국', '82', 'AS', 'Seoul', 'KRW', 'ko');
INSERT INTO `countries` VALUES ('KW', 'Kuwait', 'الكويت', '965', 'AS', 'Kuwait City', 'KWD', 'ar');
INSERT INTO `countries` VALUES ('KY', 'Cayman Islands', 'Cayman Islands', '1345', 'NA', 'George Town', 'KYD', 'en');
INSERT INTO `countries` VALUES ('KZ', 'Kazakhstan', 'Қазақстан', '7', 'AS', 'Astana', 'KZT', 'kk,ru');
INSERT INTO `countries` VALUES ('LA', 'Laos', 'ສປປລາວ', '856', 'AS', 'Vientiane', 'LAK', 'lo');
INSERT INTO `countries` VALUES ('LB', 'Lebanon', 'لبنان', '961', 'AS', 'Beirut', 'LBP', 'ar,fr');
INSERT INTO `countries` VALUES ('LC', 'Saint Lucia', 'Saint Lucia', '1758', 'NA', 'Castries', 'XCD', 'en');
INSERT INTO `countries` VALUES ('LI', 'Liechtenstein', 'Liechtenstein', '423', 'EU', 'Vaduz', 'CHF', 'de');
INSERT INTO `countries` VALUES ('LK', 'Sri Lanka', 'śrī laṃkāva', '94', 'AS', 'Colombo', 'LKR', 'si,ta');
INSERT INTO `countries` VALUES ('LR', 'Liberia', 'Liberia', '231', 'AF', 'Monrovia', 'LRD', 'en');
INSERT INTO `countries` VALUES ('LS', 'Lesotho', 'Lesotho', '266', 'AF', 'Maseru', 'LSL,ZAR', 'en,st');
INSERT INTO `countries` VALUES ('LT', 'Lithuania', 'Lietuva', '370', 'EU', 'Vilnius', 'EUR', 'lt');
INSERT INTO `countries` VALUES ('LU', 'Luxembourg', 'Luxembourg', '352', 'EU', 'Luxembourg', 'EUR', 'fr,de,lb');
INSERT INTO `countries` VALUES ('LV', 'Latvia', 'Latvija', '371', 'EU', 'Riga', 'EUR', 'lv');
INSERT INTO `countries` VALUES ('LY', 'Libya', '‏ليبيا', '218', 'AF', 'Tripoli', 'LYD', 'ar');
INSERT INTO `countries` VALUES ('MA', 'Morocco', 'المغرب', '212', 'AF', 'Rabat', 'MAD', 'ar');
INSERT INTO `countries` VALUES ('MC', 'Monaco', 'Monaco', '377', 'EU', 'Monaco', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('MD', 'Moldova', 'Moldova', '373', 'EU', 'Chișinău', 'MDL', 'ro');
INSERT INTO `countries` VALUES ('ME', 'Montenegro', 'Црна Гора', '382', 'EU', 'Podgorica', 'EUR', 'sr,bs,sq,hr');
INSERT INTO `countries` VALUES ('MF', 'Saint Martin', 'Saint-Martin', '590', 'NA', 'Marigot', 'EUR', 'en,fr,nl');
INSERT INTO `countries` VALUES ('MG', 'Madagascar', 'Madagasikara', '261', 'AF', 'Antananarivo', 'MGA', 'fr,mg');
INSERT INTO `countries` VALUES ('MH', 'Marshall Islands', 'M̧ajeļ', '692', 'OC', 'Majuro', 'USD', 'en,mh');
INSERT INTO `countries` VALUES ('MK', 'North Macedonia', 'Северна Македонија', '389', 'EU', 'Skopje', 'MKD', 'mk');
INSERT INTO `countries` VALUES ('ML', 'Mali', 'Mali', '223', 'AF', 'Bamako', 'XOF', 'fr');
INSERT INTO `countries` VALUES ('MM', 'Myanmar (Burma)', 'မြန်မာ', '95', 'AS', 'Naypyidaw', 'MMK', 'my');
INSERT INTO `countries` VALUES ('MN', 'Mongolia', 'Монгол улс', '976', 'AS', 'Ulan Bator', 'MNT', 'mn');
INSERT INTO `countries` VALUES ('MO', 'Macao', '澳門', '853', 'AS', '', 'MOP', 'zh,pt');
INSERT INTO `countries` VALUES ('MP', 'Northern Mariana Islands', 'Northern Mariana Islands', '1670', 'OC', 'Saipan', 'USD', 'en,ch');
INSERT INTO `countries` VALUES ('MQ', 'Martinique', 'Martinique', '596', 'NA', 'Fort-de-France', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('MR', 'Mauritania', 'موريتانيا', '222', 'AF', 'Nouakchott', 'MRU', 'ar');
INSERT INTO `countries` VALUES ('MS', 'Montserrat', 'Montserrat', '1664', 'NA', 'Plymouth', 'XCD', 'en');
INSERT INTO `countries` VALUES ('MT', 'Malta', 'Malta', '356', 'EU', 'Valletta', 'EUR', 'mt,en');
INSERT INTO `countries` VALUES ('MU', 'Mauritius', 'Maurice', '230', 'AF', 'Port Louis', 'MUR', 'en');
INSERT INTO `countries` VALUES ('MV', 'Maldives', 'Maldives', '960', 'AS', 'Malé', 'MVR', 'dv');
INSERT INTO `countries` VALUES ('MW', 'Malawi', 'Malawi', '265', 'AF', 'Lilongwe', 'MWK', 'en,ny');
INSERT INTO `countries` VALUES ('MX', 'Mexico', 'México', '52', 'NA', 'Mexico City', 'MXN', 'es');
INSERT INTO `countries` VALUES ('MY', 'Malaysia', 'Malaysia', '60', 'AS', 'Kuala Lumpur', 'MYR', 'ms');
INSERT INTO `countries` VALUES ('MZ', 'Mozambique', 'Moçambique', '258', 'AF', 'Maputo', 'MZN', 'pt');
INSERT INTO `countries` VALUES ('NA', 'Namibia', 'Namibia', '264', 'AF', 'Windhoek', 'NAD,ZAR', 'en,af');
INSERT INTO `countries` VALUES ('NC', 'New Caledonia', 'Nouvelle-Calédonie', '687', 'OC', 'Nouméa', 'XPF', 'fr');
INSERT INTO `countries` VALUES ('NE', 'Niger', 'Niger', '227', 'AF', 'Niamey', 'XOF', 'fr');
INSERT INTO `countries` VALUES ('NF', 'Norfolk Island', 'Norfolk Island', '672', 'OC', 'Kingston', 'AUD', 'en');
INSERT INTO `countries` VALUES ('NG', 'Nigeria', 'Nigeria', '234', 'AF', 'Abuja', 'NGN', 'en');
INSERT INTO `countries` VALUES ('NI', 'Nicaragua', 'Nicaragua', '505', 'NA', 'Managua', 'NIO', 'es');
INSERT INTO `countries` VALUES ('NL', 'Netherlands', 'Nederland', '31', 'EU', 'Amsterdam', 'EUR', 'nl');
INSERT INTO `countries` VALUES ('NO', 'Norway', 'Norge', '47', 'EU', 'Oslo', 'NOK', 'no,nb,nn');
INSERT INTO `countries` VALUES ('NP', 'Nepal', 'नेपाल', '977', 'AS', 'Kathmandu', 'NPR', 'ne');
INSERT INTO `countries` VALUES ('NR', 'Nauru', 'Nauru', '674', 'OC', 'Yaren', 'AUD', 'en,na');
INSERT INTO `countries` VALUES ('NU', 'Niue', 'Niuē', '683', 'OC', 'Alofi', 'NZD', 'en');
INSERT INTO `countries` VALUES ('NZ', 'New Zealand', 'New Zealand', '64', 'OC', 'Wellington', 'NZD', 'en,mi');
INSERT INTO `countries` VALUES ('OM', 'Oman', 'عمان', '968', 'AS', 'Muscat', 'OMR', 'ar');
INSERT INTO `countries` VALUES ('PA', 'Panama', 'Panamá', '507', 'NA', 'Panama City', 'PAB,USD', 'es');
INSERT INTO `countries` VALUES ('PE', 'Peru', 'Perú', '51', 'SA', 'Lima', 'PEN', 'es');
INSERT INTO `countries` VALUES ('PF', 'French Polynesia', 'Polynésie française', '689', 'OC', 'Papeetē', 'XPF', 'fr');
INSERT INTO `countries` VALUES ('PG', 'Papua New Guinea', 'Papua Niugini', '675', 'OC', 'Port Moresby', 'PGK', 'en');
INSERT INTO `countries` VALUES ('PH', 'Philippines', 'Pilipinas', '63', 'AS', 'Manila', 'PHP', 'en');
INSERT INTO `countries` VALUES ('PK', 'Pakistan', 'Pakistan', '92', 'AS', 'Islamabad', 'PKR', 'en,ur');
INSERT INTO `countries` VALUES ('PL', 'Poland', 'Polska', '48', 'EU', 'Warsaw', 'PLN', 'pl');
INSERT INTO `countries` VALUES ('PM', 'Saint Pierre and Miquelon', 'Saint-Pierre-et-Miquelon', '508', 'NA', 'Saint-Pierre', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('PN', 'Pitcairn Islands', 'Pitcairn Islands', '64', 'OC', 'Adamstown', 'NZD', 'en');
INSERT INTO `countries` VALUES ('PR', 'Puerto Rico', 'Puerto Rico', '1787,1939', 'NA', 'San Juan', 'USD', 'es,en');
INSERT INTO `countries` VALUES ('PS', 'Palestine', 'فلسطين', '970', 'AS', 'Ramallah', 'ILS', 'ar');
INSERT INTO `countries` VALUES ('PT', 'Portugal', 'Portugal', '351', 'EU', 'Lisbon', 'EUR', 'pt');
INSERT INTO `countries` VALUES ('PW', 'Palau', 'Palau', '680', 'OC', 'Ngerulmud', 'USD', 'en');
INSERT INTO `countries` VALUES ('PY', 'Paraguay', 'Paraguay', '595', 'SA', 'Asunción', 'PYG', 'es,gn');
INSERT INTO `countries` VALUES ('QA', 'Qatar', 'قطر', '974', 'AS', 'Doha', 'QAR', 'ar');
INSERT INTO `countries` VALUES ('RE', 'Reunion', 'La Réunion', '262', 'AF', 'Saint-Denis', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('RO', 'Romania', 'România', '40', 'EU', 'Bucharest', 'RON', 'ro');
INSERT INTO `countries` VALUES ('RS', 'Serbia', 'Србија', '381', 'EU', 'Belgrade', 'RSD', 'sr');
INSERT INTO `countries` VALUES ('RU', 'Russia', 'Россия', '7', 'AS', 'Moscow', 'RUB', 'ru');
INSERT INTO `countries` VALUES ('RW', 'Rwanda', 'Rwanda', '250', 'AF', 'Kigali', 'RWF', 'rw,en,fr');
INSERT INTO `countries` VALUES ('SA', 'Saudi Arabia', 'العربية السعودية', '966', 'AS', 'Riyadh', 'SAR', 'ar');
INSERT INTO `countries` VALUES ('SB', 'Solomon Islands', 'Solomon Islands', '677', 'OC', 'Honiara', 'SBD', 'en');
INSERT INTO `countries` VALUES ('SC', 'Seychelles', 'Seychelles', '248', 'AF', 'Victoria', 'SCR', 'fr,en');
INSERT INTO `countries` VALUES ('SD', 'Sudan', 'السودان', '249', 'AF', 'Khartoum', 'SDG', 'ar,en');
INSERT INTO `countries` VALUES ('SE', 'Sweden', 'Sverige', '46', 'EU', 'Stockholm', 'SEK', 'sv');
INSERT INTO `countries` VALUES ('SG', 'Singapore', 'Singapore', '65', 'AS', 'Singapore', 'SGD', 'en,ms,ta,zh');
INSERT INTO `countries` VALUES ('SH', 'Saint Helena', 'Saint Helena', '290', 'AF', 'Jamestown', 'SHP', 'en');
INSERT INTO `countries` VALUES ('SI', 'Slovenia', 'Slovenija', '386', 'EU', 'Ljubljana', 'EUR', 'sl');
INSERT INTO `countries` VALUES ('SJ', 'Svalbard and Jan Mayen', 'Svalbard og Jan Mayen', '4779', 'EU', 'Longyearbyen', 'NOK', 'no');
INSERT INTO `countries` VALUES ('SK', 'Slovakia', 'Slovensko', '421', 'EU', 'Bratislava', 'EUR', 'sk');
INSERT INTO `countries` VALUES ('SL', 'Sierra Leone', 'Sierra Leone', '232', 'AF', 'Freetown', 'SLL', 'en');
INSERT INTO `countries` VALUES ('SM', 'San Marino', 'San Marino', '378', 'EU', 'City of San Marino', 'EUR', 'it');
INSERT INTO `countries` VALUES ('SN', 'Senegal', 'Sénégal', '221', 'AF', 'Dakar', 'XOF', 'fr');
INSERT INTO `countries` VALUES ('SO', 'Somalia', 'Soomaaliya', '252', 'AF', 'Mogadishu', 'SOS', 'so,ar');
INSERT INTO `countries` VALUES ('SR', 'Suriname', 'Suriname', '597', 'SA', 'Paramaribo', 'SRD', 'nl');
INSERT INTO `countries` VALUES ('SS', 'South Sudan', 'South Sudan', '211', 'AF', 'Juba', 'SSP', 'en');
INSERT INTO `countries` VALUES ('ST', 'Sao Tome and Principe', 'São Tomé e Príncipe', '239', 'AF', 'São Tomé', 'STN', 'pt');
INSERT INTO `countries` VALUES ('SV', 'El Salvador', 'El Salvador', '503', 'NA', 'San Salvador', 'SVC,USD', 'es');
INSERT INTO `countries` VALUES ('SX', 'Sint Maarten', 'Sint Maarten', '1721', 'NA', 'Philipsburg', 'ANG', 'nl,en');
INSERT INTO `countries` VALUES ('SY', 'Syria', 'سوريا', '963', 'AS', 'Damascus', 'SYP', 'ar');
INSERT INTO `countries` VALUES ('SZ', 'Eswatini', 'Eswatini', '268', 'AF', 'Lobamba', 'SZL', 'en,ss');
INSERT INTO `countries` VALUES ('TC', 'Turks and Caicos Islands', 'Turks and Caicos Islands', '1649', 'NA', 'Cockburn Town', 'USD', 'en');
INSERT INTO `countries` VALUES ('TD', 'Chad', 'Tchad', '235', 'AF', 'N\'Djamena', 'XAF', 'fr,ar');
INSERT INTO `countries` VALUES ('TF', 'French Southern Territories', 'Territoire des Terres australes et antarctiques fr', '262', 'AN', 'Port-aux-Français', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('TG', 'Togo', 'Togo', '228', 'AF', 'Lomé', 'XOF', 'fr');
INSERT INTO `countries` VALUES ('TH', 'Thailand', 'ประเทศไทย', '66', 'AS', 'Bangkok', 'THB', 'th');
INSERT INTO `countries` VALUES ('TJ', 'Tajikistan', 'Тоҷикистон', '992', 'AS', 'Dushanbe', 'TJS', 'tg,ru');
INSERT INTO `countries` VALUES ('TK', 'Tokelau', 'Tokelau', '690', 'OC', 'Fakaofo', 'NZD', 'en');
INSERT INTO `countries` VALUES ('TL', 'East Timor', 'Timor-Leste', '670', 'OC', 'Dili', 'USD', 'pt');
INSERT INTO `countries` VALUES ('TM', 'Turkmenistan', 'Türkmenistan', '993', 'AS', 'Ashgabat', 'TMT', 'tk,ru');
INSERT INTO `countries` VALUES ('TN', 'Tunisia', 'تونس', '216', 'AF', 'Tunis', 'TND', 'ar');
INSERT INTO `countries` VALUES ('TO', 'Tonga', 'Tonga', '676', 'OC', 'Nuku\'alofa', 'TOP', 'en,to');
INSERT INTO `countries` VALUES ('TR', 'Turkey', 'Türkiye', '90', 'AS', 'Ankara', 'TRY', 'tr');
INSERT INTO `countries` VALUES ('TT', 'Trinidad and Tobago', 'Trinidad and Tobago', '1868', 'NA', 'Port of Spain', 'TTD', 'en');
INSERT INTO `countries` VALUES ('TV', 'Tuvalu', 'Tuvalu', '688', 'OC', 'Funafuti', 'AUD', 'en');
INSERT INTO `countries` VALUES ('TW', 'Taiwan', '臺灣', '886', 'AS', 'Taipei', 'TWD', 'zh');
INSERT INTO `countries` VALUES ('TZ', 'Tanzania', 'Tanzania', '255', 'AF', 'Dodoma', 'TZS', 'sw,en');
INSERT INTO `countries` VALUES ('UA', 'Ukraine', 'Україна', '380', 'EU', 'Kyiv', 'UAH', 'uk');
INSERT INTO `countries` VALUES ('UG', 'Uganda', 'Uganda', '256', 'AF', 'Kampala', 'UGX', 'en,sw');
INSERT INTO `countries` VALUES ('UM', 'U.S. Minor Outlying Islands', 'United States Minor Outlying Islands', '1', 'OC', '', 'USD', 'en');
INSERT INTO `countries` VALUES ('US', 'United States', 'United States', '1', 'NA', 'Washington D.C.', 'USD,USN,USS', 'en');
INSERT INTO `countries` VALUES ('UY', 'Uruguay', 'Uruguay', '598', 'SA', 'Montevideo', 'UYI,UYU', 'es');
INSERT INTO `countries` VALUES ('UZ', 'Uzbekistan', 'O\'zbekiston', '998', 'AS', 'Tashkent', 'UZS', 'uz,ru');
INSERT INTO `countries` VALUES ('VA', 'Vatican City', 'Vaticano', '379', 'EU', 'Vatican City', 'EUR', 'it,la');
INSERT INTO `countries` VALUES ('VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', '1784', 'NA', 'Kingstown', 'XCD', 'en');
INSERT INTO `countries` VALUES ('VE', 'Venezuela', 'Venezuela', '58', 'SA', 'Caracas', 'VES', 'es');
INSERT INTO `countries` VALUES ('VG', 'British Virgin Islands', 'British Virgin Islands', '1284', 'NA', 'Road Town', 'USD', 'en');
INSERT INTO `countries` VALUES ('VI', 'U.S. Virgin Islands', 'United States Virgin Islands', '1340', 'NA', 'Charlotte Amalie', 'USD', 'en');
INSERT INTO `countries` VALUES ('VN', 'Vietnam', 'Việt Nam', '84', 'AS', 'Hanoi', 'VND', 'vi');
INSERT INTO `countries` VALUES ('VU', 'Vanuatu', 'Vanuatu', '678', 'OC', 'Port Vila', 'VUV', 'bi,en,fr');
INSERT INTO `countries` VALUES ('WF', 'Wallis and Futuna', 'Wallis et Futuna', '681', 'OC', 'Mata-Utu', 'XPF', 'fr');
INSERT INTO `countries` VALUES ('WS', 'Samoa', 'Samoa', '685', 'OC', 'Apia', 'WST', 'sm,en');
INSERT INTO `countries` VALUES ('XK', 'Kosovo', 'Republika e Kosovës', '377,381,383,386', 'EU', 'Pristina', 'EUR', 'sq,sr');
INSERT INTO `countries` VALUES ('YE', 'Yemen', 'اليَمَن', '967', 'AS', 'Sana\'a', 'YER', 'ar');
INSERT INTO `countries` VALUES ('YT', 'Mayotte', 'Mayotte', '262', 'AF', 'Mamoudzou', 'EUR', 'fr');
INSERT INTO `countries` VALUES ('ZA', 'South Africa', 'South Africa', '27', 'AF', 'Pretoria', 'ZAR', 'af,en,nr,st,ss,tn,ts,ve,xh,zu');
INSERT INTO `countries` VALUES ('ZM', 'Zambia', 'Zambia', '260', 'AF', 'Lusaka', 'ZMW', 'en');
INSERT INTO `countries` VALUES ('ZW', 'Zimbabwe', 'Zimbabwe', '263', 'AF', 'Harare', 'USD,ZAR,BWP,GBP,AUD,CNY,INR,JPY', 'en,sn,nd');

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '币种 ID',
  `code` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ISO 4217 货币代码（如 USD, CNY）',
  `numeric_code` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货币名称',
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币符号（如 $, ¥）',
  `minus_unit` tinyint(3) NOT NULL DEFAULT 2 COMMENT '最小单位 2表示小数点后两位 0表示整数 -1 N.A.',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '币种表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'AFN', '971', 'Afghani', 'AFN', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (2, 'EUR', '978', 'Euro', '€', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (3, 'ALL', '008', 'Lek', 'L', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (4, 'DZD', '012', 'Algerian Dinar', 'د.ج', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (5, 'USD', '840', 'US Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (6, 'AOA', '973', 'Kwanza', 'Kz', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (7, 'XCD', '951', 'East Caribbean Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (8, 'ARS', '032', 'Argentine Peso', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (9, 'AMD', '051', 'Armenian Dram', 'դր.', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (10, 'AWG', '533', 'Aruban Florin', 'ƒ', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (11, 'AUD', '036', 'Australian Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (12, 'AZN', '944', 'Azerbaijan Manat', 'դր.', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (13, 'BSD', '044', 'Bahamian Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (14, 'BHD', '048', 'Bahraini Dinar', NULL, 3, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (15, 'BDT', '050', 'Taka', '৳', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (16, 'BBD', '052', 'Barbados Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (17, 'BYN', '933', 'Belarusian Ruble', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (18, 'BZD', '084', 'Belize Dollar', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (19, 'XOF', '952', 'CFA Franc BCEAO', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (20, 'BMD', '060', 'Bermudian Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (21, 'INR', '356', 'Indian Rupee', '₨', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (22, 'BTN', '064', 'Ngultrum', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (23, 'BOB', '068', 'Boliviano', 'Bs.', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (24, 'BOV', '984', 'Mvdol', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (25, 'BAM', '977', 'Convertible Mark', 'KM', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (26, 'BWP', '072', 'Pula', 'P', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (27, 'NOK', '578', 'Norwegian Krone', 'kr', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (28, 'BRL', '986', 'Brazilian Real', 'R$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (29, 'BND', '096', 'Brunei Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (30, 'BGN', '975', 'Bulgarian Lev', 'лв', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (31, 'BIF', '108', 'Burundi Franc', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (32, 'CVE', '132', 'Cabo Verde Escudo', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (33, 'KHR', '116', 'Riel', '៛', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (34, 'XAF', '950', 'CFA Franc BEAC', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (35, 'CAD', '124', 'Canadian Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (36, 'KYD', '136', 'Cayman Islands Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (37, 'CLP', '152', 'Chilean Peso', '$', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (38, 'CLF', '990', 'Unidad de Fomento', NULL, 4, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (39, 'CNY', '156', 'Yuan Renminbi', '¥', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (40, 'COP', '170', 'Colombian Peso', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (41, 'COU', '970', 'Unidad de Valor Real', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (42, 'KMF', '174', 'Comorian Franc ', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (43, 'CDF', '976', 'Congolese Franc', 'Fr', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (44, 'NZD', '554', 'New Zealand Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (45, 'CRC', '188', 'Costa Rican Colon', '₡', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (46, 'CUP', '192', 'Cuban Peso', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (47, 'CUC', '931', 'Peso Convertible', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (48, 'ANG', '532', 'Netherlands Antillean Guilder', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (49, 'CZK', '203', 'Czech Koruna', 'Kč', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (50, 'DKK', '208', 'Danish Krone', 'kr', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (51, 'DJF', '262', 'Djibouti Franc', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (52, 'DOP', '214', 'Dominican Peso', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (53, 'EGP', '818', 'Egyptian Pound', 'ج.م', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (54, 'SVC', '222', 'El Salvador Colon', '₡', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (55, 'ERN', '232', 'Nakfa', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (56, 'SZL', '748', 'Lilangeni', 'L', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (57, 'ETB', '230', 'Ethiopian Birr', 'ETB', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (58, 'FKP', '238', 'Falkland Islands Pound', '£', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (59, 'FJD', '242', 'Fiji Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (60, 'XPF', '953', 'CFP Franc', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (61, 'GMD', '270', 'Dalasi', 'D', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (62, 'GEL', '981', 'Lari', 'ლ', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (63, 'GHS', '936', 'Ghana Cedi', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (64, 'GIP', '292', 'Gibraltar Pound', '£', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (65, 'GTQ', '320', 'Quetzal', 'Q', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (66, 'GBP', '826', 'Pound Sterling', '£', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (67, 'GNF', '324', 'Guinean Franc', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (68, 'GYD', '328', 'Guyana Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (69, 'HTG', '332', 'Gourde', 'G', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (70, 'HNL', '340', 'Lempira', 'L', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (71, 'HKD', '344', 'Hong Kong Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (72, 'HUF', '348', 'Forint', 'Ft', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (73, 'ISK', '352', 'Iceland Krona', 'kr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (74, 'IDR', '360', 'Rupiah', '₨', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (75, 'XDR', '960', 'SDR (Special Drawing Right)', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (76, 'IRR', '364', 'Iranian Rial', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (77, 'IQD', '368', 'Iraqi Dinar', NULL, 3, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (78, 'ILS', '376', 'New Israeli Sheqel', '₪', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (79, 'JMD', '388', 'Jamaican Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (80, 'JPY', '392', 'Yen', '¥', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (81, 'JOD', '400', 'Jordanian Dinar', NULL, 3, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (82, 'KZT', '398', 'Tenge', 'Т', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (83, 'KES', '404', 'Kenyan Shilling', 'Sh', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (84, 'KPW', '408', 'North Korean Won', '₩', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (85, 'KRW', '410', 'Won', '₩', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (86, 'KWD', '414', 'Kuwaiti Dinar', NULL, 3, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (87, 'KGS', '417', 'Som', 'KGS', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (88, 'LAK', '418', 'Lao Kip', '₭', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (89, 'LBP', '422', 'Lebanese Pound', 'ل.ل', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (90, 'LSL', '426', 'Loti', 'L', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (91, 'ZAR', '710', 'Rand', 'R', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (92, 'LRD', '430', 'Liberian Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (93, 'LYD', '434', 'Libyan Dinar', NULL, 3, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (94, 'CHF', '756', 'Swiss Franc', 'CHF', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (95, 'MOP', '446', 'Pataca', 'P', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (96, 'MKD', '807', 'Denar', 'ден', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (97, 'MGA', '969', 'Malagasy Ariary', 'MGA', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (98, 'MWK', '454', 'Malawi Kwacha', 'MK', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (99, 'MYR', '458', 'Malaysian Ringgit', 'RM', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (100, 'MVR', '462', 'Rufiyaa', 'MVR', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (101, 'MRU', '929', 'Ouguiya', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (102, 'MUR', '480', 'Mauritius Rupee', '₨', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (103, 'XUA', '965', 'ADB Unit of Account', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (104, 'MXN', '484', 'Mexican Peso', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (105, 'MXV', '979', 'Mexican Unidad de Inversion (UDI)', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (106, 'MDL', '498', 'Moldovan Leu', 'L', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (107, 'MNT', '496', 'Tugrik', '₮', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (108, 'MAD', '504', 'Moroccan Dirham', 'د.م.', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (109, 'MZN', '943', 'Mozambique Metical', 'MTn', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (110, 'MMK', '104', 'Kyat', 'K', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (111, 'NAD', '516', 'Namibia Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (112, 'NPR', '524', 'Nepalese Rupee', '₨', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (113, 'NIO', '558', 'Cordoba Oro', 'C$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (114, 'NGN', '566', 'Naira', '₦', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (115, 'OMR', '512', 'Rial Omani', NULL, 3, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (116, 'PKR', '586', 'Pakistan Rupee', '₨', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (117, 'PAB', '590', 'Balboa', 'B/.', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (118, 'PGK', '598', 'Kina', 'K', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (119, 'PYG', '600', 'Guarani', '₲', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (120, 'PEN', '604', 'Sol', 'S/.', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (121, 'PHP', '608', 'Philippine Peso', '₱', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (122, 'PLN', '985', 'Zloty', 'zł', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (123, 'QAR', '634', 'Qatari Rial', 'ر.ق', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (124, 'RON', '946', 'Romanian Leu', 'Kr', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (125, 'RUB', '643', 'Russian Ruble', 'р.', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (126, 'RWF', '646', 'Rwanda Franc', 'Fr', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (127, 'SHP', '654', 'Saint Helena Pound', '£', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (128, 'WST', '882', 'Tala', 'T', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (129, 'STN', '930', 'Dobra', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (130, 'SAR', '682', 'Saudi Riyal', 'ر.س', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (131, 'RSD', '941', 'Serbian Dinar', 'РСД', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (132, 'SCR', '690', 'Seychelles Rupee', '₨', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (133, 'SLE', '925', 'Leone', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (134, 'SGD', '702', 'Singapore Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (135, 'XSU', '994', 'Sucre', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (136, 'SBD', '090', 'Solomon Islands Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (137, 'SOS', '706', 'Somali Shilling', 'Sh', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (138, 'SSP', '728', 'South Sudanese Pound', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (139, 'LKR', '144', 'Sri Lanka Rupee', 'ரூ', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (140, 'SDG', '938', 'Sudanese Pound', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (141, 'SRD', '968', 'Surinam Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (142, 'SEK', '752', 'Swedish Krona', 'kr', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (143, 'CHE', '947', 'WIR Euro', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (144, 'CHW', '948', 'WIR Franc', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (145, 'SYP', '760', 'Syrian Pound', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (146, 'TWD', '901', 'New Taiwan Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (147, 'TJS', '972', 'Somoni', 'ЅМ', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (148, 'TZS', '834', 'Tanzanian Shilling', 'Sh', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (149, 'THB', '764', 'Baht', '฿', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (150, 'TOP', '776', 'Pa’anga', 'T$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (151, 'TTD', '780', 'Trinidad and Tobago Dollar', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (152, 'TND', '788', 'Tunisian Dinar', NULL, 3, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (153, 'TRY', '949', 'Turkish Lira', '₤', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (154, 'TMT', '934', 'Turkmenistan New Manat', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (155, 'UGX', '800', 'Uganda Shilling', 'Sh', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (156, 'UAH', '980', 'Hryvnia', '₴', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (157, 'AED', '784', 'UAE Dirham', 'د.إ', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (158, 'USN', '997', 'US Dollar (Next day)', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (159, 'UYU', '858', 'Peso Uruguayo', '$', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (160, 'UYI', '940', 'Uruguay Peso en Unidades Indexadas (UI)', NULL, 0, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (161, 'UYW', '927', 'Unidad Previsional', NULL, 4, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (162, 'UZS', '860', 'Uzbekistan Sum', 'UZS', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (163, 'VUV', '548', 'Vatu', 'Vt', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (164, 'VES', '928', 'Bolívar Soberano', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (165, 'VED', '926', 'Bolívar Soberano', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (166, 'VND', '704', 'Dong', '₫', 0, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (167, 'YER', '886', 'Yemeni Rial', '﷼', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (168, 'ZMW', '967', 'Zambian Kwacha', 'ZMW', 2, '2025-01-19 13:51:18', '2025-01-19 16:20:44');
INSERT INTO `currencies` VALUES (169, 'ZWG', '924', 'Zimbabwe Gold', NULL, 2, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (170, 'XBA', '955', 'Bond Markets Unit European Composite Unit (EURCO)', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (171, 'XBB', '956', 'Bond Markets Unit European Monetary Unit (E.M.U.-6)', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (172, 'XBC', '957', 'Bond Markets Unit European Unit of Account 9 (E.U.A.-9)', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (173, 'XBD', '958', 'Bond Markets Unit European Unit of Account 17 (E.U.A.-17)', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (174, 'XTS', '963', 'Codes specifically reserved for testing purposes', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (175, 'XXX', '999', 'The codes assigned for transactions where no currency is involved', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (176, 'XAU', '959', 'Gold', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (177, 'XPD', '964', 'Palladium', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (178, 'XPT', '962', 'Platinum', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');
INSERT INTO `currencies` VALUES (179, 'XAG', '961', 'Silver', NULL, -1, '2025-01-19 13:51:18', '2025-01-19 13:51:18');

-- ----------------------------
-- Table structure for currency_exchange_rates
-- ----------------------------
DROP TABLE IF EXISTS `currency_exchange_rates`;
CREATE TABLE `currency_exchange_rates`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '汇率记录 ID',
  `base_currency_code` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '基准货币代码（如 USD）',
  `target_currency_code` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标货币代码（如 CNY）',
  `exchange_rate` decimal(16, 6) NOT NULL COMMENT '汇率值（1 基准货币 = N 目标货币）',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '汇率更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_base_target`(`base_currency_code` ASC, `target_currency_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '汇率表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency_exchange_rates
-- ----------------------------

-- ----------------------------
-- Table structure for email_verifications
-- ----------------------------
DROP TABLE IF EXISTS `email_verifications`;
CREATE TABLE `email_verifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'bin2hex(random_bytes(16)); ',
  `expire_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邮箱验证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_verifications
-- ----------------------------
INSERT INTO `email_verifications` VALUES (1, 8, 'fly@qgq.com', 'abdde7647037edbbb258b43d800a6365', '2025-01-15 15:11:42.000000', '2025-01-08 15:11:42.132116');
INSERT INTO `email_verifications` VALUES (2, 9, 'fly@qhgq.com', '678acdb3ace163066219713f4e5cbcbe', '2025-01-15 15:21:30.000000', '2025-01-08 15:21:30.536965');
INSERT INTO `email_verifications` VALUES (4, 11, 'flyh@qq.com', '3766b2b263a22755538fca0bae2cb982', '2025-01-15 15:53:44.000000', '2025-01-08 15:53:44.947896');
INSERT INTO `email_verifications` VALUES (5, 12, 'fnlyh@qq.com', '05d4146e71e17e01f07820c6f1c48ea9', '2025-01-15 15:54:38.000000', '2025-01-08 15:54:38.803336');
INSERT INTO `email_verifications` VALUES (6, 13, 'haha@qq.cc', '7fb30644dce1110cde4d4d2df570391c', '2025-01-15 15:55:54.000000', '2025-01-08 15:55:54.811958');
INSERT INTO `email_verifications` VALUES (7, 21, 'fl2yfsf3af3g@qq.com', '4a038a756fc915c323a8561b75307ee9', '2025-01-26 17:08:50.000000', '2025-01-19 17:08:50.011520');
INSERT INTO `email_verifications` VALUES (8, 22, 'fl2yfsf3af3gf@qq.com', '7cca35b389ec0ae9ffb1c28223db983b', '2025-01-26 17:08:59.000000', '2025-01-19 17:08:59.361348');
INSERT INTO `email_verifications` VALUES (9, 23, 'fl2yfs1f3af3gf@qq.com', 'fd246c01c5c27ee9f9fb806bb9e27ebc', '2025-01-26 17:20:00.000000', '2025-01-19 17:20:00.010497');
INSERT INTO `email_verifications` VALUES (10, 24, 'fl2yfsf1f3af3gf@qq.com', '00b7cd7b890d93fd5e06b448115839c2', '2025-01-26 17:24:44.000000', '2025-01-19 17:24:44.374103');

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages`  (
  `code` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `native` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES ('af', 'Afrikaans', 'Afrikaans', 0);
INSERT INTO `languages` VALUES ('am', 'Amharic', 'አማርኛ', 0);
INSERT INTO `languages` VALUES ('ar', 'Arabic', 'العربية', 1);
INSERT INTO `languages` VALUES ('ay', 'Aymara', 'Aymar', 0);
INSERT INTO `languages` VALUES ('az', 'Azerbaijani', 'Azərbaycanca / آذربايجان', 0);
INSERT INTO `languages` VALUES ('be', 'Belarusian', 'Беларуская', 0);
INSERT INTO `languages` VALUES ('bg', 'Bulgarian', 'Български', 0);
INSERT INTO `languages` VALUES ('bi', 'Bislama', 'Bislama', 0);
INSERT INTO `languages` VALUES ('bn', 'Bengali', 'বাংলা', 0);
INSERT INTO `languages` VALUES ('bs', 'Bosnian', 'Bosanski', 0);
INSERT INTO `languages` VALUES ('ca', 'Catalan', 'Català', 0);
INSERT INTO `languages` VALUES ('ch', 'Chamorro', 'Chamoru', 0);
INSERT INTO `languages` VALUES ('cs', 'Czech', 'Čeština', 0);
INSERT INTO `languages` VALUES ('da', 'Danish', 'Dansk', 0);
INSERT INTO `languages` VALUES ('de', 'German', 'Deutsch', 0);
INSERT INTO `languages` VALUES ('dv', 'Divehi', 'ދިވެހިބަސް', 1);
INSERT INTO `languages` VALUES ('dz', 'Dzongkha', 'ཇོང་ཁ', 0);
INSERT INTO `languages` VALUES ('el', 'Greek', 'Ελληνικά', 0);
INSERT INTO `languages` VALUES ('en', 'English', 'English', 0);
INSERT INTO `languages` VALUES ('es', 'Spanish', 'Español', 0);
INSERT INTO `languages` VALUES ('et', 'Estonian', 'Eesti', 0);
INSERT INTO `languages` VALUES ('eu', 'Basque', 'Euskara', 0);
INSERT INTO `languages` VALUES ('fa', 'Persian', 'فارسی', 1);
INSERT INTO `languages` VALUES ('ff', 'Peul', 'Fulfulde', 0);
INSERT INTO `languages` VALUES ('fi', 'Finnish', 'Suomi', 0);
INSERT INTO `languages` VALUES ('fj', 'Fijian', 'Na Vosa Vakaviti', 0);
INSERT INTO `languages` VALUES ('fo', 'Faroese', 'Føroyskt', 0);
INSERT INTO `languages` VALUES ('fr', 'French', 'Français', 0);
INSERT INTO `languages` VALUES ('ga', 'Irish', 'Gaeilge', 0);
INSERT INTO `languages` VALUES ('gl', 'Galician', 'Galego', 0);
INSERT INTO `languages` VALUES ('gn', 'Guarani', 'Avañe\'ẽ', 0);
INSERT INTO `languages` VALUES ('gv', 'Manx', 'Gaelg', 0);
INSERT INTO `languages` VALUES ('he', 'Hebrew', 'עברית', 1);
INSERT INTO `languages` VALUES ('hi', 'Hindi', 'हिन्दी', 0);
INSERT INTO `languages` VALUES ('hr', 'Croatian', 'Hrvatski', 0);
INSERT INTO `languages` VALUES ('ht', 'Haitian', 'Krèyol ayisyen', 0);
INSERT INTO `languages` VALUES ('hu', 'Hungarian', 'Magyar', 0);
INSERT INTO `languages` VALUES ('hy', 'Armenian', 'Հայերեն', 0);
INSERT INTO `languages` VALUES ('id', 'Indonesian', 'Bahasa Indonesia', 0);
INSERT INTO `languages` VALUES ('is', 'Icelandic', 'Íslenska', 0);
INSERT INTO `languages` VALUES ('it', 'Italian', 'Italiano', 0);
INSERT INTO `languages` VALUES ('ja', 'Japanese', '日本語', 0);
INSERT INTO `languages` VALUES ('ka', 'Georgian', 'ქართული', 0);
INSERT INTO `languages` VALUES ('kg', 'Kongo', 'KiKongo', 0);
INSERT INTO `languages` VALUES ('kk', 'Kazakh', 'Қазақша', 0);
INSERT INTO `languages` VALUES ('kl', 'Greenlandic', 'Kalaallisut', 0);
INSERT INTO `languages` VALUES ('km', 'Cambodian', 'ភាសាខ្មែរ', 0);
INSERT INTO `languages` VALUES ('ko', 'Korean', '한국어', 0);
INSERT INTO `languages` VALUES ('ku', 'Kurdish', 'Kurdî / كوردی', 1);
INSERT INTO `languages` VALUES ('ky', 'Kyrgyz', 'Кыргызча', 0);
INSERT INTO `languages` VALUES ('la', 'Latin', 'Latina', 0);
INSERT INTO `languages` VALUES ('lb', 'Luxembourgish', 'Lëtzebuergesch', 0);
INSERT INTO `languages` VALUES ('ln', 'Lingala', 'Lingála', 0);
INSERT INTO `languages` VALUES ('lo', 'Laotian', 'ລາວ / Pha xa lao', 0);
INSERT INTO `languages` VALUES ('lt', 'Lithuanian', 'Lietuvių', 0);
INSERT INTO `languages` VALUES ('lu', 'Luba-Katanga', 'Tshiluba', 0);
INSERT INTO `languages` VALUES ('lv', 'Latvian', 'Latviešu', 0);
INSERT INTO `languages` VALUES ('mg', 'Malagasy', 'Malagasy', 0);
INSERT INTO `languages` VALUES ('mh', 'Marshallese', 'Kajin Majel / Ebon', 0);
INSERT INTO `languages` VALUES ('mi', 'Maori', 'Māori', 0);
INSERT INTO `languages` VALUES ('mk', 'Macedonian', 'Македонски', 0);
INSERT INTO `languages` VALUES ('mn', 'Mongolian', 'Монгол', 0);
INSERT INTO `languages` VALUES ('ms', 'Malay', 'Bahasa Melayu', 0);
INSERT INTO `languages` VALUES ('mt', 'Maltese', 'bil-Malti', 0);
INSERT INTO `languages` VALUES ('my', 'Burmese', 'မြန်မာစာ', 0);
INSERT INTO `languages` VALUES ('na', 'Nauruan', 'Dorerin Naoero', 0);
INSERT INTO `languages` VALUES ('nb', 'Norwegian Bokmål', 'Norsk bokmål', 0);
INSERT INTO `languages` VALUES ('nd', 'North Ndebele', 'Sindebele', 0);
INSERT INTO `languages` VALUES ('ne', 'Nepali', 'नेपाली', 0);
INSERT INTO `languages` VALUES ('nl', 'Dutch', 'Nederlands', 0);
INSERT INTO `languages` VALUES ('nn', 'Norwegian Nynorsk', 'Norsk nynorsk', 0);
INSERT INTO `languages` VALUES ('no', 'Norwegian', 'Norsk', 0);
INSERT INTO `languages` VALUES ('nr', 'South Ndebele', 'isiNdebele', 0);
INSERT INTO `languages` VALUES ('ny', 'Chichewa', 'Chi-Chewa', 0);
INSERT INTO `languages` VALUES ('oc', 'Occitan', 'Occitan', 0);
INSERT INTO `languages` VALUES ('pa', 'Panjabi / Punjabi', 'ਪੰਜਾਬੀ / पंजाबी / پنجابي', 0);
INSERT INTO `languages` VALUES ('pl', 'Polish', 'Polski', 0);
INSERT INTO `languages` VALUES ('ps', 'Pashto', 'پښتو', 1);
INSERT INTO `languages` VALUES ('pt', 'Portuguese', 'Português', 0);
INSERT INTO `languages` VALUES ('qu', 'Quechua', 'Runa Simi', 0);
INSERT INTO `languages` VALUES ('rn', 'Kirundi', 'Kirundi', 0);
INSERT INTO `languages` VALUES ('ro', 'Romanian', 'Română', 0);
INSERT INTO `languages` VALUES ('ru', 'Russian', 'Русский', 0);
INSERT INTO `languages` VALUES ('rw', 'Rwandi', 'Kinyarwandi', 0);
INSERT INTO `languages` VALUES ('sg', 'Sango', 'Sängö', 0);
INSERT INTO `languages` VALUES ('si', 'Sinhalese', 'සිංහල', 0);
INSERT INTO `languages` VALUES ('sk', 'Slovak', 'Slovenčina', 0);
INSERT INTO `languages` VALUES ('sl', 'Slovenian', 'Slovenščina', 0);
INSERT INTO `languages` VALUES ('sm', 'Samoan', 'Gagana Samoa', 0);
INSERT INTO `languages` VALUES ('sn', 'Shona', 'chiShona', 0);
INSERT INTO `languages` VALUES ('so', 'Somalia', 'Soomaaliga', 0);
INSERT INTO `languages` VALUES ('sq', 'Albanian', 'Shqip', 0);
INSERT INTO `languages` VALUES ('sr', 'Serbian', 'Српски', 0);
INSERT INTO `languages` VALUES ('ss', 'Swati', 'SiSwati', 0);
INSERT INTO `languages` VALUES ('st', 'Southern Sotho', 'Sesotho', 0);
INSERT INTO `languages` VALUES ('sv', 'Swedish', 'Svenska', 0);
INSERT INTO `languages` VALUES ('sw', 'Swahili', 'Kiswahili', 0);
INSERT INTO `languages` VALUES ('ta', 'Tamil', 'தமிழ்', 0);
INSERT INTO `languages` VALUES ('tg', 'Tajik', 'Тоҷикӣ', 0);
INSERT INTO `languages` VALUES ('th', 'Thai', 'ไทย / Phasa Thai', 0);
INSERT INTO `languages` VALUES ('ti', 'Tigrinya', 'ትግርኛ', 0);
INSERT INTO `languages` VALUES ('tk', 'Turkmen', 'Туркмен / تركمن', 0);
INSERT INTO `languages` VALUES ('tn', 'Tswana', 'Setswana', 0);
INSERT INTO `languages` VALUES ('to', 'Tonga', 'Lea Faka-Tonga', 0);
INSERT INTO `languages` VALUES ('tr', 'Turkish', 'Türkçe', 0);
INSERT INTO `languages` VALUES ('ts', 'Tsonga', 'Xitsonga', 0);
INSERT INTO `languages` VALUES ('uk', 'Ukrainian', 'Українська', 0);
INSERT INTO `languages` VALUES ('ur', 'Urdu', 'اردو', 1);
INSERT INTO `languages` VALUES ('uz', 'Uzbek', 'O\'zbekcha', 0);
INSERT INTO `languages` VALUES ('ve', 'Venda', 'Tshivenḓa', 0);
INSERT INTO `languages` VALUES ('vi', 'Vietnamese', 'Tiếng Việt', 0);
INSERT INTO `languages` VALUES ('xh', 'Xhosa', 'isiXhosa', 0);
INSERT INTO `languages` VALUES ('zh', 'Chinese', '中文', 0);
INSERT INTO `languages` VALUES ('zu', 'Zulu', 'isiZulu', 0);

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `is_menu` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否菜单 1菜单 2权限',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES (1, 0, 'autoPilot', 'AutoPilot', '', '', 1, 1, 'normal', NULL, NULL);
INSERT INTO `rule` VALUES (2, 1, '/app/autopilot/workflow/list', 'Workflow', '', '', 1, 1, 'normal', NULL, '2025-01-06 16:47:19.417163');
INSERT INTO `rule` VALUES (3, 1, '/app/ai', 'AutoPilot', '', '', 1, 2, 'normal', NULL, '2025-01-06 16:47:25.662560');
INSERT INTO `rule` VALUES (4, 0, '/dashboard', 'Dashboard', '', '', 1, 2, 'normal', NULL, '2025-01-07 16:40:48.469910');
INSERT INTO `rule` VALUES (5, 0, '', 'Accounts', '', '', 1, 3, 'normal', NULL, '2025-01-07 16:40:52.384178');
INSERT INTO `rule` VALUES (6, 5, '/ReceivingAccount', 'Accounts', '', '', 1, 1, 'normal', NULL, '2025-01-06 16:47:41.181091');
INSERT INTO `rule` VALUES (7, 5, '/app/TransCurrency/allTransfer', 'Transfer', '', '', 1, 2, 'normal', NULL, '2025-01-06 16:47:42.231903');
INSERT INTO `rule` VALUES (8, 5, '/app/transactions/index', 'Transactions', '', '', 1, 3, 'normal', NULL, '2025-01-06 16:47:42.936879');
INSERT INTO `rule` VALUES (9, 5, '/app/statement/index', 'Statements & Documents', '', '', 1, 4, 'normal', NULL, '2025-01-06 16:47:46.722259');
INSERT INTO `rule` VALUES (10, 0, '/app/cash_management/list', 'Cash Management', '', '', 1, 4, 'normal', NULL, '2025-01-07 16:40:53.409653');
INSERT INTO `rule` VALUES (11, 0, '/app/contracts/index', 'Contract Mgt', '', '', 1, 5, 'normal', NULL, '2025-01-07 16:40:55.167725');
INSERT INTO `rule` VALUES (12, 0, '', 'AR', '', '', 1, 6, 'normal', NULL, '2025-01-07 16:40:56.048901');
INSERT INTO `rule` VALUES (13, 12, '/app/Getpaid/customer', 'Customers', '', '', 1, 1, 'normal', '2025-01-06 16:45:34.996708', '2025-01-07 16:48:38.027925');
INSERT INTO `rule` VALUES (14, 12, '/app/Getpaid/invoice', 'Invoices', '', '', 1, 2, 'normal', '2025-01-06 16:46:04.889751', '2025-01-07 16:48:38.109339');
INSERT INTO `rule` VALUES (15, 12, '/app/Getpaid/payments_in', 'Payments In', '', '', 1, 3, 'normal', '2025-01-06 16:47:06.772983', '2025-01-07 16:48:38.119887');
INSERT INTO `rule` VALUES (16, 0, '', 'AP', '', '', 1, 7, 'normal', '2025-01-06 16:48:37.660426', '2025-01-07 16:48:38.123115');
INSERT INTO `rule` VALUES (17, 16, '/app/PaidVendor/index', 'Vendors', '', '', 1, 1, 'normal', '2025-01-06 16:49:58.500599', '2025-01-07 16:48:38.124941');
INSERT INTO `rule` VALUES (18, 16, '/app/PaidBills/index', 'Bills', '', '', 1, 2, 'normal', '2025-01-06 16:50:08.977482', '2025-01-07 16:48:38.128233');
INSERT INTO `rule` VALUES (19, 16, '/app/PaidPaymentOut/index', 'Payments Out', '', '', 1, 3, 'normal', '2025-01-06 16:50:20.762070', '2025-01-07 16:48:38.133847');
INSERT INTO `rule` VALUES (20, 16, '/app/ContractsAP/index', 'Contracts', '', '', 1, 4, 'normal', '2025-01-06 16:50:29.069358', '2025-01-07 16:48:38.136996');
INSERT INTO `rule` VALUES (21, 0, '', 'Withdraw', '', '', 1, 8, 'normal', '2025-01-06 16:51:04.924633', '2025-01-07 16:48:38.140029');
INSERT INTO `rule` VALUES (22, 21, '/app/Achconnect/transfer_money', 'Withdraw', 'sub-el-icon2', '', 1, 1, 'normal', '2025-01-06 16:51:35.599470', '2025-01-07 16:48:38.142505');
INSERT INTO `rule` VALUES (23, 0, '', 'Settings', '', '', 1, 9, 'normal', '2025-01-06 16:52:28.802285', '2025-01-07 16:48:38.144475');
INSERT INTO `rule` VALUES (24, 23, '/app/onboard', 'Profile', '', '', 1, 1, 'normal', '2025-01-06 16:52:47.291233', '2025-01-07 16:48:38.146339');
INSERT INTO `rule` VALUES (25, 23, '/app/team/index', 'Team', '', '', 1, 2, 'normal', '2025-01-06 16:52:58.880141', '2025-01-07 16:48:38.148602');
INSERT INTO `rule` VALUES (26, 23, '/app/Approval/index', 'Approval', '', '', 1, 3, 'normal', '2025-01-06 16:53:05.633423', '2025-01-07 16:48:38.150835');
INSERT INTO `rule` VALUES (27, 23, '/app/setting/emails/list', 'Emails', '', '', 1, 4, 'normal', '2025-01-06 16:53:16.660882', '2025-01-07 16:48:38.152864');
INSERT INTO `rule` VALUES (28, 23, '/app/security/index', 'Security', '', '', 1, 5, 'normal', '2025-01-06 16:53:26.960214', '2025-01-07 16:48:38.155181');
INSERT INTO `rule` VALUES (29, 23, '/app/integration/index', 'Integrations', '', '', 1, 6, 'normal', '2025-01-06 16:53:35.891074', '2025-01-07 16:48:38.164884');
INSERT INTO `rule` VALUES (30, 23, '/app/PaymentMethods/index', 'Payment Methods', '', '', 1, 7, 'normal', '2025-01-06 16:53:38.676194', '2025-01-07 16:48:38.167413');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `country` smallint(5) UNSIGNED NOT NULL,
  `status` enum('normal','forbidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'fly', 'yin', '', 1, 'normal', '2025-01-08 10:17:25.023580', '2025-01-08 10:17:25.023580');
INSERT INTO `user` VALUES (2, 'rui', 'zong', '', 1, 'normal', '2025-01-08 10:17:25.028881', '2025-01-08 10:17:25.028881');
INSERT INTO `user` VALUES (3, 'sonj', 'xie', '', 1, 'normal', '2025-01-08 10:17:25.031087', '2025-01-08 10:17:25.031087');
INSERT INTO `user` VALUES (4, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 10:57:31.460126', '2025-01-08 10:57:31.460131');
INSERT INTO `user` VALUES (5, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 10:59:17.973580', '2025-01-08 10:59:17.973585');
INSERT INTO `user` VALUES (6, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:06:51.467479', '2025-01-08 15:06:51.467483');
INSERT INTO `user` VALUES (7, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:10:06.048087', '2025-01-08 15:10:06.048092');
INSERT INTO `user` VALUES (8, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:11:42.047114', '2025-01-08 15:11:42.047119');
INSERT INTO `user` VALUES (9, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:21:30.466596', '2025-01-08 15:21:30.466601');
INSERT INTO `user` VALUES (10, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:21:50.131350', '2025-01-08 15:21:50.131356');
INSERT INTO `user` VALUES (11, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:53:44.870671', '2025-01-08 15:53:44.870676');
INSERT INTO `user` VALUES (12, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:54:38.671020', '2025-01-08 15:54:38.671025');
INSERT INTO `user` VALUES (13, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-08 15:55:54.666942', '2025-01-08 15:55:54.666947');
INSERT INTO `user` VALUES (14, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 16:59:56.129310', '2025-01-19 16:59:56.129384');
INSERT INTO `user` VALUES (15, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:00:36.683034', '2025-01-19 17:00:36.683039');
INSERT INTO `user` VALUES (16, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:02:00.882822', '2025-01-19 17:02:00.882827');
INSERT INTO `user` VALUES (17, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:06:17.798744', '2025-01-19 17:06:17.798757');
INSERT INTO `user` VALUES (18, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:07:25.185198', '2025-01-19 17:07:25.185203');
INSERT INTO `user` VALUES (19, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:07:57.380687', '2025-01-19 17:07:57.380692');
INSERT INTO `user` VALUES (20, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:08:06.779228', '2025-01-19 17:08:06.779247');
INSERT INTO `user` VALUES (21, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:08:49.890834', '2025-01-19 17:08:49.890839');
INSERT INTO `user` VALUES (22, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:08:59.288396', '2025-01-19 17:08:59.288400');
INSERT INTO `user` VALUES (23, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:19:59.890043', '2025-01-19 17:19:59.890048');
INSERT INTO `user` VALUES (24, 'holy', 'shit', '13800138001', 1, 'normal', '2025-01-19 17:24:44.300596', '2025-01-19 17:24:44.300600');

-- ----------------------------
-- Table structure for user_2fa
-- ----------------------------
DROP TABLE IF EXISTS `user_2fa`;
CREATE TABLE `user_2fa`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('unverified','verified') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'unverified',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_2fa
-- ----------------------------
INSERT INTO `user_2fa` VALUES (1, 2, 'PNLCFQEG4D2XXMDUP5TCNLKRUX34AAC6B5AREDITPAD5HR5JQJBEBN4HO3WTWDE2HY3KPR23KSNY6KOKDX4RHXM2NMF6F23BKDF2PLY', 'verified', '2025-01-17 16:19:42.984927', '2025-01-17 17:45:19.675422');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `user_auth_group_access`;
CREATE TABLE `user_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid` ASC, `group_id` ASC) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  INDEX `group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_auth_group_access
-- ----------------------------
INSERT INTO `user_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for user_balance
-- ----------------------------
DROP TABLE IF EXISTS `user_balance`;
CREATE TABLE `user_balance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of user_balance
-- ----------------------------
INSERT INTO `user_balance` VALUES (1, 2, 'GBP', 67657617.00, '2025-01-08 16:25:17.143871', '2025-01-19 10:46:58.527724');
INSERT INTO `user_balance` VALUES (2, 2, 'HKD', 5555555.00, '2025-01-08 16:25:53.894589', '2025-01-08 16:26:10.999108');

-- ----------------------------
-- Table structure for user_balance_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_balance_logs`;
CREATE TABLE `user_balance_logs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户 ID',
  `amount` decimal(10, 2) NOT NULL COMMENT '变动金额（正数增加，负数减少）',
  `balance_before` decimal(10, 2) NOT NULL COMMENT '变动前余额',
  `balance_after` decimal(10, 2) NOT NULL COMMENT '变动后余额',
  `type` enum('recharge') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'recharge' COMMENT '变动类型（1：充值，2：消费，3：提现，4：退款等）',
  `related_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联的业务单号或订单号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变动说明',
  `operator_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '操作人 ID',
  `operator_type` enum('customer','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'customer' COMMENT '操作人类型（1：用户，2：管理员）',
  `status` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '记录状态（1：成功，0：失败，2：处理中）',
  `create_time` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updated_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_related_id`(`related_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户余额变动记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_balance_logs
-- ----------------------------
INSERT INTO `user_balance_logs` VALUES (1, 2, 10.00, 67657657.00, 67657667.00, 'recharge', NULL, NULL, NULL, 'customer', 1, '2025-01-19 10:46:58.473810', NULL);
INSERT INTO `user_balance_logs` VALUES (2, 2, -20.00, 67657667.00, 67657647.00, 'recharge', NULL, NULL, NULL, 'customer', 1, '2025-01-19 10:46:58.514567', NULL);
INSERT INTO `user_balance_logs` VALUES (3, 2, -30.00, 67657647.00, 67657617.00, 'recharge', NULL, NULL, NULL, 'customer', 1, '2025-01-19 10:46:58.532041', NULL);

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `identity_type` enum('facebook','google','github','phone','email','username','x','slack') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'username',
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号/邮箱/第三方的唯一标识',
  `credential` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码凭证 (自建账号的保存密码, 第三方的保存 token)',
  `salt` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '盐',
  `is_verified` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'no',
  `status` enum('normal','forbidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'forbidden',
  `login_time` datetime(6) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '添加时间',
  `update_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES (1, 2, 'username', 'fly123', '$2y$10$8JC3.lpIVfF9ePS1s1eRpeblTc0MUd5lyl7KnJlj7iIZonT7n5mS.', '123456', 'yes', 'normal', '2025-01-17 17:47:38.000000', '2025-01-06 17:35:02.950229', '2025-01-17 17:47:38.957612');
INSERT INTO `user_login` VALUES (2, 2, 'email', 'fly@qq.com', '$2y$10$8JC3.lpIVfF9ePS1s1eRpeblTc0MUd5lyl7KnJlj7iIZonT7n5mS.', '123456', 'yes', 'normal', NULL, '2025-01-06 17:35:50.691267', '2025-01-07 16:24:38.260962');
INSERT INTO `user_login` VALUES (3, 2, 'phone', '13800138000', '$2y$10$8JC3.lpIVfF9ePS1s1eRpeblTc0MUd5lyl7KnJlj7iIZonT7n5mS.', '123456', 'no', 'normal', NULL, '2025-01-06 17:36:34.560918', '2025-01-07 16:24:38.262233');
INSERT INTO `user_login` VALUES (4, 4, 'email', 'fly@163.com', '$2y$10$.4hSclni6BSQIjqLq/8abOrbEz3jEKpKhlqhVnKR7VRo3qtCSymlK', '123456', 'no', 'forbidden', NULL, '2025-01-08 10:57:31.517638', '2025-01-08 10:59:09.652934');
INSERT INTO `user_login` VALUES (5, 5, 'email', 'fly@sohu.com', '$2y$10$fuaW83wZUlGCew6qzXiWr.fGu32iFIM2ZSAPjm0V2J6fcYdKE05EO', '986171', 'no', 'forbidden', '2025-01-08 11:00:24.000000', '2025-01-08 10:59:18.027278', '2025-01-08 11:00:28.540885');
INSERT INTO `user_login` VALUES (6, 6, 'email', 'fly@tg.com', '$2y$10$bwSzG4wQAL9aaL1fbbURvuY1ad.XiZJ9BqoF1wuec5h5kfHdiyp86', '451881', 'no', 'forbidden', NULL, '2025-01-08 15:06:51.520060', '2025-01-08 15:06:51.520066');
INSERT INTO `user_login` VALUES (7, 7, 'email', 'fly@tgf.com', '$2y$10$URvleReaXE/2caImJLW7t.OgwFj.nejEfmTuLlrIhLiRARg245KFa', '723982', 'no', 'forbidden', NULL, '2025-01-08 15:10:06.101154', '2025-01-08 15:10:06.101163');
INSERT INTO `user_login` VALUES (8, 8, 'email', 'fly@qgq.com', '$2y$10$.M.5eUHlRuuFQCU4H.9TM.I8pu0TepM8JeFIAQ3DfXLq4Low7iyvK', '313201', 'no', 'forbidden', NULL, '2025-01-08 15:11:42.099588', '2025-01-08 15:11:42.099594');
INSERT INTO `user_login` VALUES (9, 9, 'email', 'fly@qhgq.com', '$2y$10$V4AXDOqLralGcFTprsAm..BBlaYXV.wMvMY26UmmOrfZwNyX1./zu', '949875', 'no', 'forbidden', NULL, '2025-01-08 15:21:30.518948', '2025-01-08 15:21:30.518954');
INSERT INTO `user_login` VALUES (10, 10, 'email', 'fly@qrhgq.com', '$2y$10$8RpMnpTtkGgB3Z7TYZelo.bg3tfzx.UR8qtOBF.95rS3yRwj0TYlG', '158190', 'yes', 'normal', NULL, '2025-01-08 15:21:50.183625', '2025-01-08 15:41:44.665530');
INSERT INTO `user_login` VALUES (11, 11, 'email', 'flyh@qq.com', '$2y$10$qVxPn.l3CTe2SS55qafCNuLcOv4c2Sp1pwYsVJ7RyHgRPDXo/RhLW', '217132', 'no', 'forbidden', NULL, '2025-01-08 15:53:44.923293', '2025-01-08 15:53:44.923299');
INSERT INTO `user_login` VALUES (12, 12, 'email', 'fnlyh@qq.com', '$2y$10$wtxgshdeRx/JPxOHUGz1fuVutdR2w6etaCszM/J3bQvpclivPKwTy', '117237', 'no', 'forbidden', NULL, '2025-01-08 15:54:38.723402', '2025-01-08 15:54:38.723407');
INSERT INTO `user_login` VALUES (13, 13, 'email', 'haha@qq.cc', '$2y$10$FqYQbSSrZ6ziKBylpjmTw.44mcBoL14HQTTyUbXk6YiDjUqGW.upS', '202491', 'no', 'forbidden', NULL, '2025-01-08 15:55:54.719241', '2025-01-08 16:20:20.931770');
INSERT INTO `user_login` VALUES (14, 14, 'email', 'flyff@qq.com', '$2y$10$ndBc45zuRWGmC28EN80Ev.v3aOp/KuRe3ndPp77qZqRyRFeMHkQaC', '484074', 'no', 'forbidden', NULL, '2025-01-19 16:59:56.189172', '2025-01-19 16:59:56.189200');
INSERT INTO `user_login` VALUES (15, 15, 'email', 'flyffg@qq.com', '$2y$10$we.fIJ2jeUqElZmckwiGhOBjg50cMh.D0.Pq/qXjMmHnxOPLIe2nG', '634910', 'no', 'forbidden', NULL, '2025-01-19 17:00:36.736546', '2025-01-19 17:00:36.736564');
INSERT INTO `user_login` VALUES (16, 16, 'email', 'fl2yffg@qq.com', '$2y$10$q88ZHFKzvGzAD/ODFjf/XuRWl9KkhPfQycDNIXoUPxc7FJEnRRLJK', '145347', 'no', 'forbidden', NULL, '2025-01-19 17:02:00.939259', '2025-01-19 17:02:00.939276');
INSERT INTO `user_login` VALUES (17, 17, 'email', 'fl2yf3fg@qq.com', '$2y$10$euBnFGr7gQCHQUKIrqPGzOg77P3HUugTLM/csyN1pfpOW1HFXyDny', '604645', 'no', 'forbidden', NULL, '2025-01-19 17:06:17.853379', '2025-01-19 17:06:17.853385');
INSERT INTO `user_login` VALUES (18, 18, 'email', 'fl2yf3f3g@qq.com', '$2y$10$Dvt0NsvjIe2kusR1K7cdyOeOM2D1JcKwQojf2PSSmGZxTvBWlwBpC', '129410', 'no', 'forbidden', NULL, '2025-01-19 17:07:25.238043', '2025-01-19 17:07:25.238049');
INSERT INTO `user_login` VALUES (19, 19, 'email', 'fl2yfs3f3g@qq.com', '$2y$10$BE4wN.UUjROLDS5zbvnO2uU.wk2MePA6FvDn/A2fhcaXaYwJKvwcK', '600000', 'no', 'forbidden', NULL, '2025-01-19 17:07:57.433784', '2025-01-19 17:07:57.433789');
INSERT INTO `user_login` VALUES (20, 20, 'email', 'fl2yfs3af3g@qq.com', '$2y$10$7gT.bzdgRhHBWBTZ9SlqverSNw8bintX2VvcnaYlrm6rZvxFcpLgy', '446071', 'no', 'forbidden', NULL, '2025-01-19 17:08:06.833718', '2025-01-19 17:08:06.833724');
INSERT INTO `user_login` VALUES (21, 21, 'email', 'fl2yfsf3af3g@qq.com', '$2y$10$1Qgc1x0Wh7HNN9AN0SlpyOeDv4gmO5RRAtAp7ujERoyt22jO0MwAu', '841646', 'no', 'forbidden', NULL, '2025-01-19 17:08:49.944660', '2025-01-19 17:08:49.944665');
INSERT INTO `user_login` VALUES (22, 22, 'email', 'fl2yfsf3af3gf@qq.com', '$2y$10$uDB.JrrVThj4/TinYHKVV.uD/zk8h83xPa5vC//CKXS/tkepR7qem', '609929', 'no', 'forbidden', NULL, '2025-01-19 17:08:59.341704', '2025-01-19 17:08:59.341719');
INSERT INTO `user_login` VALUES (23, 23, 'email', 'fl2yfs1f3af3gf@qq.com', '$2y$10$fXBN6zNLsmDCbn/9AJyPyuIPgYkxWm5nuXSVVaZctUgYIVBd0Mseu', '279899', 'no', 'forbidden', NULL, '2025-01-19 17:19:59.942606', '2025-01-19 17:19:59.942612');
INSERT INTO `user_login` VALUES (24, 24, 'email', 'fl2yfsf1f3af3gf@qq.com', '$2y$10$.HPdjFXsioj2ZOjSRatz2O5/HiS4yixvnN3MfnSO1j/Mzk/oBu.2C', '369684', 'no', 'forbidden', NULL, '2025-01-19 17:24:44.353733', '2025-01-19 17:24:44.353739');

SET FOREIGN_KEY_CHECKS = 1;
