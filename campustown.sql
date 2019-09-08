-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.2.12-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- campustown 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `campustown` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `campustown`;

-- 테이블 campustown.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `c_num` int(10) NOT NULL AUTO_INCREMENT,
  `c_category` varchar(20) NOT NULL,
  `c_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 테이블 데이터 campustown.category:~6 rows (대략적) 내보내기
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`c_num`, `c_category`, `c_img`) VALUES
	(1, '음식점', '/img/food.png'),
	(2, '카페', '/img/cafe.png'),
	(3, '오락', '/img/game.png'),
	(4, '잡화', '/img/market.png'),
	(5, '편의', '/img/building.png'),
	(6, '기타', '/img/etc.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 테이블 campustown.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `n_num` int(5) NOT NULL AUTO_INCREMENT,
  `n_type` varchar(5) DEFAULT NULL,
  `n_url` varchar(200) DEFAULT NULL,
  `n_title` varchar(100) NOT NULL,
  `n_content` text NOT NULL,
  `n_regdate` datetime NOT NULL,
  `n_hit` int(5) NOT NULL,
  `n_attach` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`n_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 campustown.notice:~3 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`n_num`, `n_type`, `n_url`, `n_title`, `n_content`, `n_regdate`, `n_hit`, `n_attach`) VALUES
	(2, '0', 'https://naver.com', '서일대 캠퍼스타운', 'aaa', '2019-08-25 21:27:41', 6, '6eae38ae7fb84ea1bf4f535f1532a4a7.jpg'),
	(3, '1', 'https://naver.com', '서일대 캠퍼스타운', 'a', '2019-08-25 21:27:52', 8, 'bfe0d13e4d3745fcb283235d4bc6a70a.jpg'),
	(4, '0', 'https://naver.com', '서일대 캠퍼스타운', 'a', '2019-08-25 21:28:03', 5, '6bad15adf9ee41a486772ea9b4c81785.jpg');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 campustown.store 구조 내보내기
CREATE TABLE IF NOT EXISTS `store` (
  `s_num` int(20) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(50) NOT NULL,
  `c_num` int(10) NOT NULL,
  `s_tel` varchar(50) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_content` text DEFAULT NULL,
  `s_snsurl` varchar(50) DEFAULT NULL,
  `s_hashtag` varchar(100) DEFAULT NULL,
  `s_hours` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- 테이블 데이터 campustown.store:~108 rows (대략적) 내보내기
DELETE FROM `store`;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` (`s_num`, `s_name`, `c_num`, `s_tel`, `s_address`, `s_content`, `s_snsurl`, `s_hashtag`, `s_hours`) VALUES
	(1, '이노이드', 2, '070-7808-0085', '서울 중랑구 용마산로86길 9-38', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(2, '나무미', 1, '02-2209-1775', '서울 중랑구 용마산로90길 18', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(3, '대학문화사', 6, '02-433-3385', '서울 중랑구 용마산로94가길 31', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(4, '라면과 함께라면', 1, '02-493-7727', '서울 중랑구 용마산로90길 18', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(5, '맘스터치 (서일대점)', 1, '02-491-9600', '서울 중랑구 용마산로 408', '많은 이용 부탁드립니다.', NULL, '#서일대,#패스트푸드', '09:00~18:00'),
	(6, '모두랑', 1, '02-432-8693', '서울 중랑구 용마산로90길 9', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(7, 'MUTO1', 3, '02-0000-0000', '서울 중랑구 용마산로 408', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(8, 'MUTO2', 3, '070-4814-0550', '서울 중랑구 용마산로90길 10', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(9, '스테프핫도그(서일대학교점)', 1, '02-433-8808', '서울 중랑구 용마산로90길 19', '많은 이용 부탁드립니다.', NULL, '#서일대,#패스트푸드', '09:00~18:00'),
	(10, '영진문화사', 6, '02-495-7660', '서울 중랑구 용마산로90길 20', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(11, '오백국수 (서일대점)', 1, '02-435-0908', '서울 중랑구 용마산로90길 10', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(12, '원광백숙', 1, '02-0000-0000', '서울 중랑구 용마산로90길 15', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(13, '이삭토스트 (서일대점)', 1, '02-2208-5907', '서울 중랑구 용마산로 410', '많은 이용 부탁드립니다.', NULL, '#서일대,#패스트푸드', '09:00~18:00'),
	(14, '쥬씨서일대점', 2, '02-0000-0000', '서울 중랑구 용마산로94나길 31', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(15, '지지고 (서일대점)', 1, '02-435-5456', '서울 중랑구 용마산로90길 18', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(16, '치즈밥있슈 (서일대점)', 1, '070-7798-4976', '서울 중랑구 용마산로90길 10', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(17, '커피니 서일대점', 2, '02-439-0101', '서울 중랑구 용마산로90길 22', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(18, '코사마트', 4, '02-436-9188', '서울 중랑구 용마산로90길 10', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(19, '코인노래연습장', 3, '02-0000-0000', '서울 중랑구 용마산로90길 10 ', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(20, 'Tea Cup', 2, '02-433-1399', '서울 중랑구 용마산로90길 10', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(21, '핑클 오락', 3, '02-496-6467 ', '서울 중랑구 용마산로90길 7 ', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(22, '하트 프라자', 4, '02-433-2157', '서울 중랑구 용마산로90길 22 ', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(23, '동화문화사', 6, '02-435-6474', '서울 중랑구 용마산로90길 17', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(24, '밥FULL (서울 서일대 본점)', 1, '02-491-0403', '서울 중랑구 용마산로90길 7', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(25, '보쌈당한그녀의족발', 1, '070-8151-4949', '서울 중랑구 용마산로90길 15', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(26, '뿌띠&뿌띠 헤어', 6, '02-0000-0000', '서울 중랑구 용마산로90길 9', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(27, '더헤어바이문', 6, '02-493-8887', '서울 중랑구 용마산로86길 5', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(28, '서일서적', 4, '02-491-0443', '서울 중랑구 용마산로86길 15', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(29, '코디컴', 6, '010-9110-3336', '서울 중랑구 용마산로86길 7', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(30, '프렌즈카페', 2, '02-2207-1634', '서울 중랑구 용마산로86길 15', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(31, '핵파워 탁구', 3, '010-5046-8981', '서울 중랑구 용마산로86길 15', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(32, '서울화방문구', 4, '02-2207-2445', '서울 중랑구 용마산로', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(33, '59양평해장국 (서일대점)', 1, '02-432-1224', '서울 중랑구 용마산로94길 4', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(34, '고향맛집', 1, '02-434-1252', '서울 중랑구 용마산로94길 16', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(35, '늘솜머리', 1, '02-0000-0000', '서울 중랑구 용마산로94길 22', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(36, '동광푸드', 4, '02-0000-0000', '서울 중랑구 용마산로94길 22', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(37, '미락분식', 1, '02-493-6060', '서울 중랑구 용마산로94길 4', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(38, '통나무집', 1, '02-435-9274', '서울 중랑구 용마산로94가길 26', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(39, '1등옛날떡볶이 (본점)', 1, '02-434-2261', '서울 중랑구 용마산로94가길 27', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(40, '가나점보돈까스', 1, '02-435-8587', '서울 중랑구 용마산로94가길 24', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(41, '가마솥순대국', 1, '02-437-1867', '서울 중랑구 용마산로94가길 22', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(42, '그린하우스생고기전문점', 1, '02-491-6516', '서울 중랑구 용마산로86길 9-32', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(43, '7ELEVEN', 5, '070-7767-4627', '서울 중랑구 용마산로94길 14', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(44, '피자나라치킨공주 (신면목점)', 1, '02-432-1516', '서울 중랑구 용마산로94가길 22', '많은 이용 부탁드립니다.', NULL, '#서일대,#패스트푸드', '09:00~18:00'),
	(45, '소선담', 2, '010-5090-5670', '서울 중랑구 용마산로94가길 19', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(46, '뭉크기타/뭉크헤어캡', 6, '02-2209-8723', '서울 중랑구 용마산로94가길 29', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(47, '블랙커피', 2, '02-0000-0000', '서울 중랑구 용마산로94가길 19', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(48, '오뎅바', 1, '02-0000-0000', '서울 중랑구 용마산로 410', '많은 이용 부탁드립니다.', NULL, '#서일대,#주점', '09:00~18:00'),
	(49, 'STORE', 6, '02-0000-0000', '서울 중량구 용마산로84길 9-3', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(50, '밥은火', 1, '02-0000-0000', '서울 중량구 용마산로94가길 29', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(51, 'BHC치킨 (면목사랑점)', 1, '02-2207-9942', '서울 중랑구 용마산로 394', '많은 이용 부탁드립니다.', NULL, '#서일대,#패스트푸드', '09:00~18:00'),
	(52, 'GS25 서일대학점', 5, '02-434-8925', '서울 중랑구 용마산로 388 ', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(53, 'IGA마트서일대점', 5, '02-436-6100', '서울 중랑구 용마산로 408', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(54, 'MT노래연습장', 3, '02-438-5830', '서울 중랑구 용마산로 410', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(55, 'sun헤어', 6, '070-8119-9393 ', '서울 중랑구 용마산로 394', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(56, '가각고 쭈꾸미와 불닭발', 1, '010-6322-5433', '서울 중랑구 용마산로 396', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(57, '강유미머리마당', 6, '02-2207-9169', '서울 중랑구 용마산로 412', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(58, '고기닷컴', 1, '02-493-9892', '서울 중랑구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(59, '도미노피자 (면목점)', 1, '02-435-3098', '서울 중랑구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대,#패스트푸드', '09:00~18:00'),
	(60, '돈장터 생고기 전문점', 1, '02-493-2465', '서울 중랑구 용마산로 424', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(61, '동대문엽기떡볶이 (면목점)', 1, '02-496-8592', '서울 중랑구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(62, '마미백반', 1, '02-2207-1866', '서울 중랑구 용마산로 396', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(63, '마이두헤어', 6, '02-435-96463', '서울 중랑구 용마산로 420', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(64, '맛대박호프치킨', 1, '02-2209-6365', '서울 중랑구 용마산로 414', '많은 이용 부탁드립니다.', NULL, '#서일대,#주점', '09:00~18:00'),
	(65, '먹고싶닭 (서일대점)', 3, '02-432-1540', '서울 중랑구 용마산로 412', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(66, '몽골리안즈', 1, '02-0000-0000', '서울 중랑구 용마산로 412', '많은 이용 부탁드립니다.', NULL, '#서일대,#양식', '09:00~18:00'),
	(67, '봉구스밥버거 (서일대점)', 1, '02-436-9455', '서울 중랑구 용마산로 388', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(68, '서일화방', 4, '02-432-5359', '서울 중랑구 용마산로 410 ', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(69, '성모약국', 5, '02-435-4726', '서울 중랑구 용마산로 424', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(70, '어머니밥상&부대찌개', 1, '02-434-8922', '서울 중랑구 용마산로 414', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(71, '오늘,참', 1, '02-6448-4005', '서울 중랑구 용마산로 408', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(72, '왕십리부추야채곱창', 1, '02-434-1377', '서울 중랑구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(73, '이디야커피 서일중앙점', 2, '02-493-7835', '서울 중랑구 용마산로 394', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(74, '즉떡뚝떡', 1, '02-496-0370', '서울 중랑구 용마산로 388', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(75, '짝태앤노가리', 1, '02-6425-0557', '서울 중랑구 용마산로 408', '많은 이용 부탁드립니다.', NULL, '#서일대,#주점', '09:00~18:00'),
	(76, '철이수산', 1, '02-432-4338', '서울 중랑구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(77, '체르니각', 1, '02-493-3838', '서울 중랑구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대,#중식', '09:00~18:00'),
	(78, '큰맘할매순대국 (서일대점)', 1, '02-435-5255', '서울 중랑구 용마산로 412', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(79, '투썸플레이스 서일대점', 2, '02-2208-1030', '서울 중랑구 용마산로 384', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(80, '효자 이발', 6, '02-0000-0000', '서울 중랑구 용마산로 394', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(81, '걸작떡볶이치킨(서울면목점)', 1, '02-433-2821', '서울 중랑구 용마산로 388', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(82, '안경박사', 5, '02-0000-0000', '서울 중랑구 용마산로 422 ', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(83, 'BONNIE', 6, '02-0000-0000', '서울 중랑구 용마산로 420', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(84, '대월디지탈프린팅', 5, '02-2209-0188', '서울 중랑구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(85, '가나인쇄', 6, '02-2207-9486', '서울 중랑구 용마산로 420', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(86, '토스트&햄버거', 1, '02-436-9456', '서울 중랑구 용마산로 388', '많은 이용 부탁드립니다.', NULL, '#서일대,#패스트푸드', '09:00~18:00'),
	(87, '명가족발', 1, '02-437-9927', '서울 중량구 용마산로86길 9-27', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(88, 'CU', 5, '02-433-2057', '서울 중랑구 용마산로 411', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(89, 'SBS노래연습장', 3, '070-7520-3468', '서울 중랑구 용마산로 391', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(90, '민트노래연습장', 3, '02-436-5638', '서울 중랑구 용마산로 405', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(91, '박가네압구정찌개명가', 1, '02-432-8402', '서울 중랑구 용마산로 411', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(92, '본초한방순대국감자탕', 1, '02-491-6671', '서울 중랑구 용마산로 419', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(93, '불타는돈갈매기', 1, '02-6408-8292', '서울 중랑구 용마산로 423', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(94, '센스PC', 3, '02-0000-0000', '서울 중랑구 용마산로 405', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(95, '소담식당', 1, '02-491-3939', '서울 중랑구 용마산로 391', '많은 이용 부탁드립니다.', NULL, '#서일대,#한식', '09:00~18:00'),
	(96, '숙헤어', 6, '02-494-2656 ', '서울 중랑구 용마산로 399', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(97, '아람마트 서일대점', 4, '02-491-5555', '서울 중랑구 용마산로 389', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(98, '오성맥주', 1, '070-7789-6363', '서울 중랑구 용마산로 409', '많은 이용 부탁드립니다.', NULL, '#서일대,#주점', '09:00~18:00'),
	(99, '요리하는Azit', 1, '02-434-9282', '서울 중랑구 용마산로 409', '많은 이용 부탁드립니다.', NULL, '#서일대,#주점', '09:00~18:00'),
	(100, '자작나무', 1, '02-2214-3153', '서울 중랑구 용마산로 405', '많은 이용 부탁드립니다.', NULL, '#서일대,#양식', '09:00~18:00'),
	(101, '인형뽑기샵', 3, '02-0000-0000', '서울 중랑구 용마산로 405', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(102, 'M.YOU', 6, '02-0000-0000', '서울 중랑구 용마산로 409', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(103, '까망콩', 2, '02-0000-0000', '서울 중랑구 용마산로 409', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(104, '카툰앤북카페 놀숲', 2, '02-6014-2221', '서울 중랑구 용마산로 391', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(105, '엄청 맛있는 탕수육 & 감동까스', 1, '02-433-5626', '서울 중랑구 용마산로 405', '많은 이용 부탁드립니다.', NULL, '#서일대,#분식', '09:00~18:00'),
	(106, '그, 미장원', 6, '02-0000-0000', '서울 중랑구 용마산로 409', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(107, '콩쥐랑 팥쥐랑 머리하는 날', 6, '02-495-5166', '서울 중랑구 용마산로 423', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00'),
	(108, '랑헤어', 6, '02-2207-8461', '서울 중랑구 용마산로86길 21-29', '많은 이용 부탁드립니다.', NULL, '#서일대', '09:00~18:00');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;

-- 테이블 campustown.store_img 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_img` (
  `si_num` int(20) NOT NULL AUTO_INCREMENT,
  `s_num` int(20) NOT NULL,
  `si_name` varchar(50) NOT NULL,
  `si_rename` varchar(50) NOT NULL,
  PRIMARY KEY (`si_num`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;

-- 테이블 데이터 campustown.store_img:~230 rows (대략적) 내보내기
DELETE FROM `store_img`;
/*!40000 ALTER TABLE `store_img` DISABLE KEYS */;
INSERT INTO `store_img` (`si_num`, `s_num`, `si_name`, `si_rename`) VALUES
	(1, 100, '100_1.jpg', '100_1.jpg'),
	(2, 100, '100_2.jpg', '100_2.jpg'),
	(3, 101, '101_1.jpg', '101_1.jpg'),
	(4, 101, '101_2.jpg', '101_2.jpg'),
	(5, 102, '102_1.jpg', '102_1.jpg'),
	(6, 102, '102_2.jpg', '102_2.jpg'),
	(7, 103, '103_1.jpg', '103_1.jpg'),
	(8, 103, '103_2.jpg', '103_2.jpg'),
	(9, 104, '104_1.jpg', '104_1.jpg'),
	(10, 104, '104_2.jpg', '104_2.jpg'),
	(11, 105, '105_1.jpg', '105_1.jpg'),
	(12, 105, '105_2.jpg', '105_2.jpg'),
	(13, 105, '105_3.jpg', '105_3.jpg'),
	(14, 106, '106_1.jpg', '106_1.jpg'),
	(15, 106, '106_2.jpg', '106_2.jpg'),
	(16, 107, '107_1.jpg', '107_1.jpg'),
	(17, 107, '107_2.jpg', '107_2.jpg'),
	(18, 108, '108_1.jpg', '108_1.jpg'),
	(19, 108, '108_2.jpg', '108_2.jpg'),
	(20, 10, '10_1.jpg', '10_1.jpg'),
	(21, 10, '10_2.jpg', '10_2.jpg'),
	(22, 11, '11_1.jpg', '11_1.jpg'),
	(23, 11, '11_2.jpg', '11_2.jpg'),
	(24, 12, '12_1.jpg', '12_1.jpg'),
	(25, 12, '12_2.jpg', '12_2.jpg'),
	(26, 13, '13_1.jpg', '13_1.jpg'),
	(27, 13, '13_2.jpg', '13_2.jpg'),
	(28, 14, '14_1.jpg', '14_1.jpg'),
	(29, 14, '14_2.jpg', '14_2.jpg'),
	(30, 15, '15_1.jpg', '15_1.jpg'),
	(31, 15, '15_2.jpg', '15_2.jpg'),
	(32, 16, '16_1.jpg', '16_1.jpg'),
	(33, 16, '16_2.jpg', '16_2.jpg'),
	(34, 17, '17_1.jpg', '17_1.jpg'),
	(35, 17, '17_2.jpg', '17_2.jpg'),
	(36, 18, '18_1.jpg', '18_1.jpg'),
	(37, 18, '18_2.jpg', '18_2.jpg'),
	(38, 19, '19_1.jpg', '19_1.jpg'),
	(39, 19, '19_2.jpg', '19_2.jpg'),
	(40, 1, '1_1.jpg', '1_1.jpg'),
	(41, 1, '1_2.jpg', '1_2.jpg'),
	(42, 1, '1_3.jpg', '1_3.jpg'),
	(43, 20, '20_1.jpg', '20_1.jpg'),
	(44, 20, '20_2.jpg', '20_2.jpg'),
	(45, 21, '21_1.jpg', '21_1.jpg'),
	(46, 21, '21_2.jpg', '21_2.jpg'),
	(47, 22, '22_1.jpg', '22_1.jpg'),
	(48, 22, '22_2.jpg', '22_2.jpg'),
	(49, 23, '23_1.jpg', '23_1.jpg'),
	(50, 23, '23_2.jpg', '23_2.jpg'),
	(51, 24, '24_1.jpg', '24_1.jpg'),
	(52, 24, '24_2.jpg', '24_2.jpg'),
	(53, 25, '25_1.jpg', '25_1.jpg'),
	(54, 25, '25_2.jpg', '25_2.jpg'),
	(55, 26, '26_1.jpg', '26_1.jpg'),
	(56, 26, '26_2.jpg', '26_2.jpg'),
	(57, 27, '27_1.jpg', '27_1.jpg'),
	(58, 27, '27_2.jpg', '27_2.jpg'),
	(59, 27, '27_3.jpg', '27_3.jpg'),
	(60, 28, '28_1.jpg', '28_1.jpg'),
	(61, 28, '28_2.jpg', '28_2.jpg'),
	(62, 29, '29_1.jpg', '29_1.jpg'),
	(63, 29, '29_2.jpg', '29_2.jpg'),
	(64, 29, '29_3.jpg', '29_3.jpg'),
	(65, 2, '2_1.jpg', '2_1.jpg'),
	(66, 2, '2_2.jpg', '2_2.jpg'),
	(67, 2, '2_3.jpg', '2_3.jpg'),
	(68, 30, '30_1.jpg', '30_1.jpg'),
	(69, 30, '30_2.jpg', '30_2.jpg'),
	(70, 31, '31_1.jpg', '31_1.jpg'),
	(71, 31, '31_2.jpg', '31_2.jpg'),
	(72, 31, '31_3.jpg', '31_3.jpg'),
	(73, 32, '32_1.jpg', '32_1.jpg'),
	(74, 32, '32_2.jpg', '32_2.jpg'),
	(75, 33, '33_1.jpg', '33_1.jpg'),
	(76, 33, '33_2.jpg', '33_2.jpg'),
	(77, 33, '33_3.jpg', '33_3.jpg'),
	(78, 34, '34_1.jpg', '34_1.jpg'),
	(79, 34, '34_2.jpg', '34_2.jpg'),
	(80, 35, '35_1.jpg', '35_1.jpg'),
	(81, 35, '35_2.jpg', '35_2.jpg'),
	(82, 36, '36_1.jpg', '36_1.jpg'),
	(83, 36, '36_2.jpg', '36_2.jpg'),
	(84, 37, '37_1.jpg', '37_1.jpg'),
	(85, 37, '37_2.jpg', '37_2.jpg'),
	(86, 37, '37_3.jpg', '37_3.jpg'),
	(87, 38, '38_1.jpg', '38_1.jpg'),
	(88, 38, '38_2.jpg', '38_2.jpg'),
	(89, 39, '39_1.jpg', '39_1.jpg'),
	(90, 39, '39_2.jpg', '39_2.jpg'),
	(91, 3, '3_1.jpg', '3_1.jpg'),
	(92, 3, '3_2.jpg', '3_2.jpg'),
	(93, 40, '40_1.jpg', '40_1.jpg'),
	(94, 40, '40_2.jpg', '40_2.jpg'),
	(95, 41, '41_1.jpg', '41_1.jpg'),
	(96, 41, '41_2.jpg', '41_2.jpg'),
	(97, 42, '42_1.jpg', '42_1.jpg'),
	(98, 42, '42_2.jpg', '42_2.jpg'),
	(99, 43, '43_1.jpg', '43_1.jpg'),
	(100, 43, '43_2.jpg', '43_2.jpg'),
	(101, 44, '44_1.jpg', '44_1.jpg'),
	(102, 44, '44_2.jpg', '44_2.jpg'),
	(103, 45, '45_1.jpg', '45_1.jpg'),
	(104, 45, '45_2.jpg', '45_2.jpg'),
	(105, 46, '46_1.jpg', '46_1.jpg'),
	(106, 46, '46_2.jpg', '46_2.jpg'),
	(107, 47, '47_1.jpg', '47_1.jpg'),
	(108, 47, '47_2.jpg', '47_2.jpg'),
	(109, 48, '48_1.jpg', '48_1.jpg'),
	(110, 48, '48_2.jpg', '48_2.jpg'),
	(111, 49, '49_1.jpg', '49_1.jpg'),
	(112, 4, '4_1.jpg', '4_1.jpg'),
	(113, 4, '4_2.jpg', '4_2.jpg'),
	(114, 4, '4_3.jpg', '4_3.jpg'),
	(115, 50, '50_1.jpg', '50_1.jpg'),
	(116, 50, '50_2.jpg', '50_2.jpg'),
	(117, 51, '51_1.jpg', '51_1.jpg'),
	(118, 51, '51_2.jpg', '51_2.jpg'),
	(119, 52, '52_1.jpg', '52_1.jpg'),
	(120, 52, '52_2.jpg', '52_2.jpg'),
	(121, 53, '53_1.jpg', '53_1.jpg'),
	(122, 53, '53_2.jpg', '53_2.jpg'),
	(123, 54, '54_1.jpg', '54_1.jpg'),
	(124, 54, '54_2.jpg', '54_2.jpg'),
	(125, 55, '55_1.jpg', '55_1.jpg'),
	(126, 55, '55_2.jpg', '55_2.jpg'),
	(127, 56, '56_1.jpg', '56_1.jpg'),
	(128, 56, '56_2.jpg', '56_2.jpg'),
	(129, 57, '57_1.jpg', '57_1.jpg'),
	(130, 57, '57_2.jpg', '57_2.jpg'),
	(131, 58, '58_1.jpg', '58_1.jpg'),
	(132, 58, '58_2.jpg', '58_2.jpg'),
	(133, 59, '59_1.jpg', '59_1.jpg'),
	(134, 59, '59_2.jpg', '59_2.jpg'),
	(135, 5, '5_1.jpg', '5_1.jpg'),
	(136, 5, '5_2.jpg', '5_2.jpg'),
	(137, 60, '60_1.jpg', '60_1.jpg'),
	(138, 60, '60_2.jpg', '60_2.jpg'),
	(139, 61, '61_1.jpg', '61_1.jpg'),
	(140, 61, '61_2.jpg', '61_2.jpg'),
	(141, 62, '62_1.jpg', '62_1.jpg'),
	(142, 62, '62_2.jpg', '62_2.jpg'),
	(143, 63, '63_1.jpg', '63_1.jpg'),
	(144, 63, '63_2.jpg', '63_2.jpg'),
	(145, 64, '64_1.jpg', '64_1.jpg'),
	(146, 64, '64_2.jpg', '64_2.jpg'),
	(147, 65, '65_1.jpg', '65_1.jpg'),
	(148, 65, '65_2.jpg', '65_2.jpg'),
	(149, 65, '65_3.jpg', '65_3.jpg'),
	(150, 66, '66_1.jpg', '66_1.jpg'),
	(151, 66, '66_2.jpg', '66_2.jpg'),
	(152, 67, '67_1.jpg', '67_1.jpg'),
	(153, 67, '67_2.jpg', '67_2.jpg'),
	(154, 68, '68_1.jpg', '68_1.jpg'),
	(155, 68, '68_2.jpg', '68_2.jpg'),
	(156, 69, '69_1.jpg', '69_1.jpg'),
	(157, 69, '69_2.jpg', '69_2.jpg'),
	(158, 6, '6_1.jpg', '6_1.jpg'),
	(159, 6, '6_2.jpg', '6_2.jpg'),
	(160, 70, '70_1.jpg', '70_1.jpg'),
	(161, 70, '70_2.jpg', '70_2.jpg'),
	(162, 71, '71_1.jpg', '71_1.jpg'),
	(163, 71, '71_2.jpg', '71_2.jpg'),
	(164, 72, '72_1.jpg', '72_1.jpg'),
	(165, 72, '72_2.jpg', '72_2.jpg'),
	(166, 73, '73_1.jpg', '73_1.jpg'),
	(167, 73, '73_2.jpg', '73_2.jpg'),
	(168, 73, '73_3.jpg', '73_3.jpg'),
	(169, 74, '74_1.jpg', '74_1.jpg'),
	(170, 74, '74_2.jpg', '74_2.jpg'),
	(171, 75, '75_1.jpg', '75_1.jpg'),
	(172, 75, '75_2.jpg', '75_2.jpg'),
	(173, 76, '76_1.jpg', '76_1.jpg'),
	(174, 76, '76_2.jpg', '76_2.jpg'),
	(175, 76, '76_3.jpg', '76_3.jpg'),
	(176, 77, '77_1.jpg', '77_1.jpg'),
	(177, 77, '77_2.jpg', '77_2.jpg'),
	(178, 78, '78_1.jpg', '78_1.jpg'),
	(179, 78, '78_2.jpg', '78_2.jpg'),
	(180, 79, '79_1.jpg', '79_1.jpg'),
	(181, 79, '79_2.jpg', '79_2.jpg'),
	(182, 7, '7_1.jpg', '7_1.jpg'),
	(183, 7, '7_2.jpg', '7_2.jpg'),
	(184, 80, '80_1.jpg', '80_1.jpg'),
	(185, 80, '80_2.jpg', '80_2.jpg'),
	(186, 81, '81_1.jpg', '81_1.jpg'),
	(187, 81, '81_2.jpg', '81_2.jpg'),
	(188, 82, '82_1.jpg', '82_1.jpg'),
	(189, 82, '82_2.jpg', '82_2.jpg'),
	(190, 83, '83_1.jpg', '83_1.jpg'),
	(191, 83, '83_2.jpg', '83_2.jpg'),
	(192, 84, '84_1.jpg', '84_1.jpg'),
	(193, 84, '84_2.jpg', '84_2.jpg'),
	(194, 85, '85_1.jpg', '85_1.jpg'),
	(195, 85, '85_2.jpg', '85_2.jpg'),
	(196, 86, '86_1.jpg', '86_1.jpg'),
	(197, 86, '86_2.jpg', '86_2.jpg'),
	(198, 87, '87_1.jpg', '87_1.jpg'),
	(199, 87, '87_2.jpg', '87_2.jpg'),
	(200, 88, '88_1.jpg', '88_1.jpg'),
	(201, 88, '88_2.jpg', '88_2.jpg'),
	(202, 89, '89_1.jpg', '89_1.jpg'),
	(203, 89, '89_2.jpg', '89_2.jpg'),
	(204, 8, '8_1.jpg', '8_1.jpg'),
	(205, 8, '8_2.jpg', '8_2.jpg'),
	(206, 90, '90_1.jpg', '90_1.jpg'),
	(207, 90, '90_2.jpg', '90_2.jpg'),
	(208, 91, '91_1.jpg', '91_1.jpg'),
	(209, 91, '91_2.jpg', '91_2.jpg'),
	(210, 91, '91_3.jpg', '91_3.jpg'),
	(211, 92, '92_1.jpg', '92_1.jpg'),
	(212, 92, '92_2.jpg', '92_2.jpg'),
	(213, 92, '92_3.jpg', '92_3.jpg'),
	(214, 93, '93_1.jpg', '93_1.jpg'),
	(215, 93, '93_2.jpg', '93_2.jpg'),
	(216, 94, '94_1.jpg', '94_1.jpg'),
	(217, 94, '94_2.jpg', '94_2.jpg'),
	(218, 95, '95_1.jpg', '95_1.jpg'),
	(219, 95, '95_2.jpg', '95_2.jpg'),
	(220, 96, '96_1.jpg', '96_1.jpg'),
	(221, 96, '96_2.jpg', '96_2.jpg'),
	(222, 97, '97_1.jpg', '97_1.jpg'),
	(223, 97, '97_2.jpg', '97_2.jpg'),
	(224, 98, '98_1.jpg', '98_1.jpg'),
	(225, 98, '98_2.jpg', '98_2.jpg'),
	(226, 99, '99_1.jpg', '99_1.jpg'),
	(227, 99, '99_2.jpg', '99_2.jpg'),
	(228, 9, '9_1.jpg', '9_1.jpg'),
	(229, 9, '9_2.jpg', '9_2.jpg'),
	(230, 9, '9_3.jpg', '9_3.jpg');
/*!40000 ALTER TABLE `store_img` ENABLE KEYS */;

-- 테이블 campustown.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` varchar(20) NOT NULL,
  `u_pw` varchar(20) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  `u_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 campustown.user:~2 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`u_id`, `u_pw`, `u_name`, `u_email`, `u_phone`) VALUES
	('admin', '1', '관리자', 'xx@naver.com', '01012345678');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
