Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D761C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 11:49:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CA2661166
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 11:49:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbhJ2LwW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Oct 2021 07:52:22 -0400
Received: from ixit.cz ([94.230.151.217]:51154 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231365AbhJ2LwW (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Oct 2021 07:52:22 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 1B4DA20064;
        Fri, 29 Oct 2021 13:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635508191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5TAxT8QqPg2vPjMA7fQLWn10ftyx07EDwMeGrhzT5tk=;
        b=j+wQYdeM6RItz8izsKl6yZMMF0piWPDm5P17OMIlAlGxPvUTXikUBY5zcC4wlA2pcYrkwt
        xWKnuEdXoL33PofvAxwemhdN3obCcBKsXcp3SgU8Zt0FieHTb+Fm8DCq4Q/JySWxeJGe3I
        +eQ/smbucPEZ1nMAY+8Id+Vv6bIVKzw=
From:   David Heidelberg <david@ixit.cz>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     ~okias/devicetree@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/3] ARM: dts: make dts use gpio-fan matrix instead of array
Date:   Fri, 29 Oct 2021 13:49:44 +0200
Message-Id: <20211029114948.41841-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

No functional changes.

Adjust to comply with dt-schema requirements
and make possible to validate values.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/armada-370-rd.dts           |   2 +-
 .../boot/dts/armada-370-seagate-nas-2bay.dts  |   8 +-
 .../boot/dts/armada-370-seagate-nas-4bay.dts  |   8 +-
 .../boot/dts/armada-370-synology-ds213j.dts   |  16 +--
 .../boot/dts/armada-385-synology-ds116.dts    |  16 +--
 arch/arm/boot/dts/armada-388-gp.dts           |   4 +-
 arch/arm/boot/dts/kirkwood-dnskw.dtsi         |   6 +-
 .../boot/dts/kirkwood-linkstation-6282.dtsi   |   9 +-
 .../boot/dts/kirkwood-linkstation-lswxl.dts   |   9 +-
 arch/arm/boot/dts/kirkwood-lsxl.dtsi          |   9 +-
 arch/arm/boot/dts/kirkwood-ns2max.dts         |  18 ++--
 arch/arm/boot/dts/kirkwood-ns2mini.dts        |  18 ++--
 arch/arm/boot/dts/kirkwood-synology.dtsi      | 102 +++++++++---------
 arch/arm/boot/dts/mvebu-linkstation-fan.dtsi  |   8 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |   4 +-
 15 files changed, 123 insertions(+), 114 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-rd.dts b/arch/arm/boot/dts/armada-370-rd.dts
index c910d157a686..041c99b99921 100644
--- a/arch/arm/boot/dts/armada-370-rd.dts
+++ b/arch/arm/boot/dts/armada-370-rd.dts
@@ -96,7 +96,7 @@ button {
 			gpio-fan {
 				compatible = "gpio-fan";
 				gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
-				gpio-fan,speed-map = <0 0 3000 1>;
+				gpio-fan,speed-map = <0 0>, <3000 1>;
 				pinctrl-0 = <&fan_pins>;
 				pinctrl-names = "default";
 			};
diff --git a/arch/arm/boot/dts/armada-370-seagate-nas-2bay.dts b/arch/arm/boot/dts/armada-370-seagate-nas-2bay.dts
index 8dd242e668e6..6ec3dd3337f4 100644
--- a/arch/arm/boot/dts/armada-370-seagate-nas-2bay.dts
+++ b/arch/arm/boot/dts/armada-370-seagate-nas-2bay.dts
@@ -25,9 +25,9 @@ / {
 
 	gpio-fan {
 		gpio-fan,speed-map =
-			<   0 3
-			  950 2
-			 1400 1
-			 1800 0>;
+			<   0 3>,
+			< 950 2>,
+			<1400 1>,
+			<1800 0>;
 	};
 };
diff --git a/arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts b/arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts
index 3cf70c72c5ca..d62e32e9ddb5 100644
--- a/arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts
+++ b/arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts
@@ -109,10 +109,10 @@ NS_V2_LED_ON   1 0
 
 	gpio-fan {
 		gpio-fan,speed-map =
-			<   0 3
-			  800 2
-			  1050 1
-			  1300 0>;
+			<   0 3>,
+			< 800 2>,
+			<1050 1>,
+			<1300 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/armada-370-synology-ds213j.dts b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
index 64f2ce254fb6..88aa2b7c4962 100644
--- a/arch/arm/boot/dts/armada-370-synology-ds213j.dts
+++ b/arch/arm/boot/dts/armada-370-synology-ds213j.dts
@@ -113,14 +113,14 @@ gpio-fan-32-38 {
 			 &gpio2  0 GPIO_ACTIVE_HIGH
 			 &gpio2  1 GPIO_ACTIVE_HIGH>;
 		alarm-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <    0 0
-				       1000 1
-				       1150 2
-				       1350 4
-				       1500 3
-				       1650 5
-				       1750 6
-				       1900 7 >;
+		gpio-fan,speed-map = <   0 0>,
+				     <1000 1>,
+				     <1150 2>,
+				     <1350 4>,
+				     <1500 3>,
+				     <1650 5>,
+				     <1750 6>,
+				     <1900 7>;
 	};
 
 	gpio-leds {
diff --git a/arch/arm/boot/dts/armada-385-synology-ds116.dts b/arch/arm/boot/dts/armada-385-synology-ds116.dts
index d8769956cbfc..26c6ef47354c 100644
--- a/arch/arm/boot/dts/armada-385-synology-ds116.dts
+++ b/arch/arm/boot/dts/armada-385-synology-ds116.dts
@@ -131,14 +131,14 @@ gpio-fan {
 			gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>,
 				<&gpio1 17 GPIO_ACTIVE_HIGH>,
 				<&gpio1 16 GPIO_ACTIVE_HIGH>;
-			gpio-fan,speed-map = <   0 0
-					      1500 1
-					      2500 2
-					      3000 3
-					      3400 4
-					      3700 5
-					      3900 6
-					      4000 7>;
+			gpio-fan,speed-map = <   0 0>,
+					     <1500 1>,
+					     <2500 2>,
+					     <3000 3>,
+					     <3400 4>,
+					     <3700 5>,
+					     <3900 6>,
+					     <4000 7>;
 			#cooling-cells = <2>;
 		};
 
diff --git a/arch/arm/boot/dts/armada-388-gp.dts b/arch/arm/boot/dts/armada-388-gp.dts
index 9d873257ac45..9f8d7ab2c897 100644
--- a/arch/arm/boot/dts/armada-388-gp.dts
+++ b/arch/arm/boot/dts/armada-388-gp.dts
@@ -237,8 +237,8 @@ pcie@3,0 {
 		gpio-fan {
 			compatible = "gpio-fan";
 			gpios = <&expander1 3 GPIO_ACTIVE_HIGH>;
-			gpio-fan,speed-map = <	 0 0
-					      3000 1>;
+			gpio-fan,speed-map = <	 0 0>,
+					     <3000 1>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/kirkwood-dnskw.dtsi b/arch/arm/boot/dts/kirkwood-dnskw.dtsi
index eb917462b219..0738eb679fcd 100644
--- a/arch/arm/boot/dts/kirkwood-dnskw.dtsi
+++ b/arch/arm/boot/dts/kirkwood-dnskw.dtsi
@@ -38,9 +38,9 @@ gpio_fan {
 		pinctrl-names = "default";
 		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH
 			 &gpio1 13 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <0    0
-				      3000 1
-				      6000 2>;
+		gpio-fan,speed-map = <0    0>,
+				     <3000 1>,
+				     <6000 2>;
 	};
 
 	gpio_poweroff {
diff --git a/arch/arm/boot/dts/kirkwood-linkstation-6282.dtsi b/arch/arm/boot/dts/kirkwood-linkstation-6282.dtsi
index 377b6e970259..dfac2045a1eb 100644
--- a/arch/arm/boot/dts/kirkwood-linkstation-6282.dtsi
+++ b/arch/arm/boot/dts/kirkwood-linkstation-6282.dtsi
@@ -118,10 +118,11 @@ gpio_fan {
 		gpios = <&gpio0 17 GPIO_ACTIVE_LOW
 			 &gpio0 16 GPIO_ACTIVE_LOW>;
 
-		gpio-fan,speed-map = <0 3
-				1500 2
-				3250 1
-				5000 0>;
+		gpio-fan,speed-map =
+				<   0 3>,
+				<1500 2>,
+				<3250 1>,
+				<5000 0>;
 
 		alarm-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
 	};
diff --git a/arch/arm/boot/dts/kirkwood-linkstation-lswxl.dts b/arch/arm/boot/dts/kirkwood-linkstation-lswxl.dts
index c6024b569423..0425df8cb91c 100644
--- a/arch/arm/boot/dts/kirkwood-linkstation-lswxl.dts
+++ b/arch/arm/boot/dts/kirkwood-linkstation-lswxl.dts
@@ -69,10 +69,11 @@ gpio_fan {
 		gpios = <&gpio1 16 GPIO_ACTIVE_LOW
 			 &gpio1 15 GPIO_ACTIVE_LOW>;
 
-		gpio-fan,speed-map = <0 3
-				1500 2
-				3250 1
-				5000 0>;
+		gpio-fan,speed-map =
+				<   0 3>,
+				<1500 2>,
+				<3250 1>,
+				<5000 0>;
 
 		alarm-gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
 	};
diff --git a/arch/arm/boot/dts/kirkwood-lsxl.dtsi b/arch/arm/boot/dts/kirkwood-lsxl.dtsi
index 7b151acb9984..74009ed9e423 100644
--- a/arch/arm/boot/dts/kirkwood-lsxl.dtsi
+++ b/arch/arm/boot/dts/kirkwood-lsxl.dtsi
@@ -167,10 +167,11 @@ gpio_fan {
 		pinctrl-names = "default";
 		gpios = <&gpio0 19 GPIO_ACTIVE_LOW
 		         &gpio0 18 GPIO_ACTIVE_LOW>;
-		gpio-fan,speed-map = <0    3
-		                      1500 2
-		                      3250 1
-		                      5000 0>;
+		gpio-fan,speed-map =
+				<0    3>,
+				<1500 2>,
+				<3250 1>,
+				<5000 0>;
 		alarm-gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
 	};
 
diff --git a/arch/arm/boot/dts/kirkwood-ns2max.dts b/arch/arm/boot/dts/kirkwood-ns2max.dts
index c0a087e77408..044958bc55da 100644
--- a/arch/arm/boot/dts/kirkwood-ns2max.dts
+++ b/arch/arm/boot/dts/kirkwood-ns2max.dts
@@ -29,15 +29,15 @@ &gpio0  7 GPIO_ACTIVE_LOW
 			 &gpio1  1 GPIO_ACTIVE_LOW
 			 &gpio0 23 GPIO_ACTIVE_LOW>;
 		gpio-fan,speed-map =
-			<   0  0
-			 1500 15
-			 1700 14
-			 1800 13
-			 2100 12
-			 3100 11
-			 3300 10
-			 4300  9
-			 5500  8>;
+			<   0  0>,
+			<1500 15>,
+			<1700 14>,
+			<1800 13>,
+			<2100 12>,
+			<3100 11>,
+			<3300 10>,
+			<4300  9>,
+			<5500  8>;
 		alarm-gpios = <&gpio0 25 GPIO_ACTIVE_LOW>;
 	};
 
diff --git a/arch/arm/boot/dts/kirkwood-ns2mini.dts b/arch/arm/boot/dts/kirkwood-ns2mini.dts
index 5b9fa14b6428..3fbe008f9141 100644
--- a/arch/arm/boot/dts/kirkwood-ns2mini.dts
+++ b/arch/arm/boot/dts/kirkwood-ns2mini.dts
@@ -30,15 +30,15 @@ &gpio0  7 GPIO_ACTIVE_LOW
 			 &gpio1  1 GPIO_ACTIVE_LOW
 			 &gpio0 23 GPIO_ACTIVE_LOW>;
 		gpio-fan,speed-map =
-			<   0  0
-			 3000 15
-			 3180 14
-			 4140 13
-			 4570 12
-			 6760 11
-			 7140 10
-			 7980  9
-			 9200  8>;
+			<   0  0>,
+			<3000 15>,
+			<3180 14>,
+			<4140 13>,
+			<4570 12>,
+			<6760 11>,
+			<7140 10>,
+			<7980  9>,
+			<9200  8>;
 		alarm-gpios = <&gpio0 25 GPIO_ACTIVE_LOW>;
 	};
 
diff --git a/arch/arm/boot/dts/kirkwood-synology.dtsi b/arch/arm/boot/dts/kirkwood-synology.dtsi
index 217bd374e52b..00adca68ae95 100644
--- a/arch/arm/boot/dts/kirkwood-synology.dtsi
+++ b/arch/arm/boot/dts/kirkwood-synology.dtsi
@@ -286,14 +286,15 @@ gpio-fan-150-32-35 {
 		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH
 			 &gpio1 1 GPIO_ACTIVE_HIGH
 			 &gpio1 2 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <    0 0
-				       2200 1
-				       2500 2
-				       3000 4
-				       3300 3
-				       3700 5
-				       3800 6
-				       4200 7 >;
+		gpio-fan,speed-map =
+				<   0 0>,
+				<2200 1>,
+				<2500 2>,
+				<3000 4>,
+				<3300 3>,
+				<3700 5>,
+				<3800 6>,
+				<4200 7>;
 	};
 
 	gpio-fan-150-15-18 {
@@ -306,14 +307,15 @@ gpio-fan-150-15-18 {
 			 &gpio0 16 GPIO_ACTIVE_HIGH
 			 &gpio0 17 GPIO_ACTIVE_HIGH>;
 		alarm-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <    0 0
-				       2200 1
-				       2500 2
-				       3000 4
-				       3300 3
-				       3700 5
-				       3800 6
-				       4200 7 >;
+		gpio-fan,speed-map =
+				<   0 0>,
+				<2200 1>,
+				<2500 2>,
+				<3000 4>,
+				<3300 3>,
+				<3700 5>,
+				<3800 6>,
+				<4200 7>;
 	};
 
 	gpio-fan-100-32-35 {
@@ -326,14 +328,15 @@ gpio-fan-100-32-35 {
 			 &gpio1 1 GPIO_ACTIVE_HIGH
 			 &gpio1 2 GPIO_ACTIVE_HIGH>;
 		alarm-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <    0 0
-				       2500 1
-				       3100 2
-				       3800 3
-				       4600 4
-				       4800 5
-				       4900 6
-				       5000 7 >;
+		gpio-fan,speed-map =
+				<   0 0>,
+				<2500 1>,
+				<3100 2>,
+				<3800 3>,
+				<4600 4>,
+				<4800 5>,
+				<4900 6>,
+				<5000 7>;
 	};
 
 	gpio-fan-100-15-18 {
@@ -346,14 +349,15 @@ gpio-fan-100-15-18 {
 			 &gpio0 16 GPIO_ACTIVE_HIGH
 			 &gpio0 17 GPIO_ACTIVE_HIGH>;
 		alarm-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <    0 0
-				       2500 1
-				       3100 2
-				       3800 3
-				       4600 4
-				       4800 5
-				       4900 6
-				       5000 7 >;
+		gpio-fan,speed-map =
+				<   0 0>,
+				<2500 1>,
+				<3100 2>,
+				<3800 3>,
+				<4600 4>,
+				<4800 5>,
+				<4900 6>,
+				<5000 7>;
 	};
 
 	gpio-fan-100-15-35-1 {
@@ -366,14 +370,15 @@ gpio-fan-100-15-35-1 {
 			 &gpio0 16 GPIO_ACTIVE_HIGH
 			 &gpio0 17 GPIO_ACTIVE_HIGH>;
 		alarm-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <    0 0
-				       2500 1
-				       3100 2
-				       3800 3
-				       4600 4
-				       4800 5
-				       4900 6
-				       5000 7 >;
+		gpio-fan,speed-map =
+				<   0 0>,
+				<2500 1>,
+				<3100 2>,
+				<3800 3>,
+				<4600 4>,
+				<4800 5>,
+				<4900 6>,
+				<5000 7>;
 	};
 
 	gpio-fan-100-15-35-3 {
@@ -388,14 +393,15 @@ &gpio0 16 GPIO_ACTIVE_HIGH
 		alarm-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH
 			       &gpio1 12 GPIO_ACTIVE_HIGH
 			       &gpio1 13 GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <    0 0
-				       2500 1
-				       3100 2
-				       3800 3
-				       4600 4
-				       4800 5
-				       4900 6
-				       5000 7 >;
+		gpio-fan,speed-map =
+				<   0 0>,
+				<2500 1>,
+				<3100 2>,
+				<3800 3>,
+				<4600 4>,
+				<4800 5>,
+				<4900 6>,
+				<5000 7>;
 	};
 
 	gpio-leds-alarm-12 {
diff --git a/arch/arm/boot/dts/mvebu-linkstation-fan.dtsi b/arch/arm/boot/dts/mvebu-linkstation-fan.dtsi
index e172029a0c4d..a260c42dbda3 100644
--- a/arch/arm/boot/dts/mvebu-linkstation-fan.dtsi
+++ b/arch/arm/boot/dts/mvebu-linkstation-fan.dtsi
@@ -50,10 +50,10 @@ gpio_fan {
 		pinctrl-names = "default";
 
 		gpio-fan,speed-map =
-			<0		3
-			1500	2
-			3250	1
-			5000	0>;
+			<   0 3>,
+			<1500 2>,
+			<3250 1>,
+			<5000 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index a93bc452d315..19aa9c2169fd 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -426,8 +426,8 @@ trusted-foundations {
 	fan: gpio_fan {
 		compatible = "gpio-fan";
 		gpios = <&gpio TEGRA_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
-		gpio-fan,speed-map = <0    0
-				      4500 1>;
+		gpio-fan,speed-map = <0    0>,
+				     <4500 1>;
 		#cooling-cells = <2>;
 	};
 
-- 
2.33.0

