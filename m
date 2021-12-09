Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D63C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243075AbhLIRhu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbhLIRhu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:50 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56844C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:16 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso4676601wmr.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fgJ8WSNX3Wyihf0nV4Zv1HsHccHrKtHRPUx6/qItyOk=;
        b=p/PBVQHcWr+JvKXEGoLQyGnxF2AslJPxM9Q041PZADuJSTR0Wej5gMhX/ZIY9l161W
         ItmNo8JcTRCw9HSwy18lE1BkJLETYI95IV5ChLLMW02IUPd6upnmsQLFQuO/cxIT5i1h
         srL2UzCpVliqcoMN+tDRop6lfJ1OUuWDIKVc7DjWllMxXGQvPBNLtHsKgQ7r1MTvcYsl
         +YySjznvMpWAcJ19XECm8ddTXojSzIxuLtYqFxiujWtxFlzkXtGGespCK3WxOZvZ2KOf
         /CkTrs8kp7gxL3GN82oPjg2SRBpvfLLfYu52gxwmktmYXHTyyKdnDNqz6SOFO7qDDvAJ
         t21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fgJ8WSNX3Wyihf0nV4Zv1HsHccHrKtHRPUx6/qItyOk=;
        b=N43hpTdzt5ZTLEAduNjK1jmDIonL29Mv1Kfa5FqvRWSgY7jAVx6uEYIGIDZQQdWrUM
         aZBqBXybWavsu3kHvGekJ2qEctfSnOOzY0FL964+bNCjAmssNAd5exU+5gva1O60WP9X
         s3LyxwHvUIAu4uVZQDGR74i9Kd/3U70j78C5Dc/nwZy0Unz+1VrW8ixaUXuojNO/3Zah
         TQ19AbZKyRMTbyrLfxgsSijPRvQx22jC2hqA2XV4HyPKJm1cd1aepy72WXYR52sHJKMH
         guES+n/Lr9keGiJfiUSyAMqYFmRCzbxsh0Z356SfX6lPvaRIT49q1X43lQmXMBJaPR4r
         OVqg==
X-Gm-Message-State: AOAM5314pqLIJgZ2Rk4TBdEasoTz8EltEZ5+nGyu4bLsSFoNCinMtz43
        4Zx+LdWY8r+picOhZ2T+s78=
X-Google-Smtp-Source: ABdhPJzTvhGoRCpVeTdOQecvJxA8GvcRf0dvShAk5tsq/Rzau+JGt0bWXXb4wNPhyMKNnotFmf+yRg==
X-Received: by 2002:a05:600c:ce:: with SMTP id u14mr8903741wmm.83.1639071254605;
        Thu, 09 Dec 2021 09:34:14 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id n7sm330376wro.68.2021.12.09.09.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 05/25] ARM: tegra: Rename top-level regulators
Date:   Thu,  9 Dec 2021 18:33:36 +0100
Message-Id: <20211209173356.618460-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Regulators defined at the top level in device tree are no longer part of
a simple bus and therefore don't have a reg property. Nodes without a
reg property shouldn't have a unit-address either, so drop the unit
address from the node names. To ensure nodes aren't duplicated (in which
case they would end up merged in the final DTB), append the name of the
regulator to the node name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts        | 14 +++++-----
 arch/arm/boot/dts/tegra114-roth.dts           | 12 ++++-----
 arch/arm/boot/dts/tegra114-tn7.dts            |  6 ++---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 24 ++++++++---------
 arch/arm/boot/dts/tegra124-nyan.dtsi          | 26 +++++++++----------
 arch/arm/boot/dts/tegra124-venice2.dts        | 26 +++++++++----------
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  8 +++---
 arch/arm/boot/dts/tegra20-harmony.dts         | 14 +++++-----
 arch/arm/boot/dts/tegra20-medcom-wide.dts     |  8 +++---
 arch/arm/boot/dts/tegra20-paz00.dts           |  4 +--
 arch/arm/boot/dts/tegra20-plutux.dts          |  8 +++---
 arch/arm/boot/dts/tegra20-seaboard.dts        | 14 +++++-----
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |  2 +-
 arch/arm/boot/dts/tegra20-tec.dts             |  8 +++---
 arch/arm/boot/dts/tegra20-trimslice.dts       | 10 +++----
 arch/arm/boot/dts/tegra20-ventana.dts         | 10 +++----
 .../tegra30-asus-nexus7-grouper-common.dtsi   |  8 +++---
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  4 +--
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  2 +-
 arch/arm/boot/dts/tegra30-beaver.dts          | 18 ++++++-------
 arch/arm/boot/dts/tegra30-cardhu-a02.dts      | 12 ++++-----
 arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 14 +++++-----
 arch/arm/boot/dts/tegra30-cardhu.dtsi         | 26 +++++++++----------
 23 files changed, 139 insertions(+), 139 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index ad8116780dc9..d53caa953b7a 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1187,7 +1187,7 @@ volume_up {
 		};
 	};
 
-	vdd_ac_bat_reg: regulator@0 {
+	vdd_ac_bat_reg: regulator-vdd-ac-bat {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_ac_bat";
 		regulator-min-microvolt = <5000000>;
@@ -1195,7 +1195,7 @@ vdd_ac_bat_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	dvdd_ts_reg: regulator@1 {
+	dvdd_ts_reg: regulator-vdd-ts {
 		compatible = "regulator-fixed";
 		regulator-name = "dvdd_ts";
 		regulator-min-microvolt = <1800000>;
@@ -1204,7 +1204,7 @@ dvdd_ts_reg: regulator@1 {
 		gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
 	};
 
-	usb1_vbus_reg: regulator@3 {
+	usb1_vbus_reg: regulator-vdd-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -1215,7 +1215,7 @@ usb1_vbus_reg: regulator@3 {
 		vin-supply = <&tps65090_dcdc1_reg>;
 	};
 
-	usb3_vbus_reg: regulator@4 {
+	usb3_vbus_reg: regulator-vdd-vbus2 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb2_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -1226,7 +1226,7 @@ usb3_vbus_reg: regulator@4 {
 		vin-supply = <&tps65090_dcdc1_reg>;
 	};
 
-	vdd_hdmi_reg: regulator@5 {
+	vdd_hdmi_reg: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_hdmi_5v0";
 		regulator-min-microvolt = <5000000>;
@@ -1234,7 +1234,7 @@ vdd_hdmi_reg: regulator@5 {
 		vin-supply = <&tps65090_dcdc1_reg>;
 	};
 
-	vdd_cam_1v8_reg: regulator@6 {
+	vdd_cam_1v8_reg: regulator-vdd-1v8-cam {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_cam_1v8_reg";
 		regulator-min-microvolt = <1800000>;
@@ -1243,7 +1243,7 @@ vdd_cam_1v8_reg: regulator@6 {
 		gpio = <&palmas_gpio 6 0>;
 	};
 
-	vdd_5v0_hdmi: regulator@7 {
+	vdd_5v0_hdmi: regulator-vdd-5v0-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index ed6ebbf008e1..b43d8198f51a 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -1045,7 +1045,7 @@ power {
 		};
 	};
 
-	lcd_bl_en: regulator@0 {
+	lcd_bl_en: regulator-vdd-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "lcd_bl_en";
 		regulator-min-microvolt = <5000000>;
@@ -1053,7 +1053,7 @@ lcd_bl_en: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_lcd: regulator@1 {
+	vdd_lcd: regulator-vdd-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_lcd_1v8";
 		regulator-min-microvolt = <1800000>;
@@ -1064,7 +1064,7 @@ vdd_lcd: regulator@1 {
 		regulator-boot-on;
 	};
 
-	regulator@2 {
+	regulator-vdd-1v8-ts {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8_ts";
 		regulator-min-microvolt = <1800000>;
@@ -1073,7 +1073,7 @@ regulator@2 {
 		regulator-boot-on;
 	};
 
-	regulator@3 {
+	regulator-vdd-3v3-ts {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3_ts";
 		regulator-min-microvolt = <3300000>;
@@ -1083,7 +1083,7 @@ regulator@3 {
 		regulator-boot-on;
 	};
 
-	regulator@4 {
+	regulator-vdd-1v8-com {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8_com";
 		regulator-min-microvolt = <1800000>;
@@ -1094,7 +1094,7 @@ regulator@4 {
 		regulator-boot-on;
 	};
 
-	regulator@5 {
+	regulator-vdd-3v3-com {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3_com";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 36717331101e..06cf41ac7029 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -303,7 +303,7 @@ volume_up {
 	};
 
 	/* FIXME: output of BQ24192 */
-	vs_sys: regulator@0 {
+	vs_sys: regulator-vdd-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VS_SYS";
 		regulator-min-microvolt = <4200000>;
@@ -312,7 +312,7 @@ vs_sys: regulator@0 {
 		regulator-boot-on;
 	};
 
-	lcd_bl_en: regulator@1 {
+	lcd_bl_en: regulator-vdd-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_LCD_BL";
 		regulator-min-microvolt = <16500000>;
@@ -323,7 +323,7 @@ lcd_bl_en: regulator@1 {
 		regulator-boot-on;
 	};
 
-	vdd_lcd: regulator@2 {
+	vdd_lcd: regulator-vdd-1v8-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "VD_LCD_1V8";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index f59135b93cb0..95b97c1fa1fb 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1893,7 +1893,7 @@ power {
 		};
 	};
 
-	vdd_mux: regulator@0 {
+	vdd_mux: regulator-vdd-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_MUX";
 		regulator-min-microvolt = <12000000>;
@@ -1902,7 +1902,7 @@ vdd_mux: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_5v0_sys: regulator@1 {
+	vdd_5v0_sys: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -1912,7 +1912,7 @@ vdd_5v0_sys: regulator@1 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_sys: regulator@2 {
+	vdd_3v3_sys: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_SYS";
 		regulator-min-microvolt = <3300000>;
@@ -1922,7 +1922,7 @@ vdd_3v3_sys: regulator@2 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_run: regulator@3 {
+	vdd_3v3_run: regulator-vdd-3v3-run {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_RUN";
 		regulator-min-microvolt = <3300000>;
@@ -1934,7 +1934,7 @@ vdd_3v3_run: regulator@3 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_3v3_hdmi: regulator@4 {
+	vdd_3v3_hdmi: regulator-vdd-3v3-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
 		regulator-min-microvolt = <3300000>;
@@ -1942,7 +1942,7 @@ vdd_3v3_hdmi: regulator@4 {
 		vin-supply = <&vdd_3v3_run>;
 	};
 
-	vdd_usb1_vbus: regulator@5 {
+	vdd_usb1_vbus: regulator-vdd-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "+USB0_VBUS_SW";
 		regulator-min-microvolt = <5000000>;
@@ -1953,7 +1953,7 @@ vdd_usb1_vbus: regulator@5 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb3_vbus: regulator@6 {
+	vdd_usb3_vbus: regulator-vdd-vbus3 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
@@ -1964,7 +1964,7 @@ vdd_usb3_vbus: regulator@6 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_3v3_lp0: regulator@7 {
+	vdd_3v3_lp0: regulator-vdd-3v3-lp0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_LP0";
 		regulator-min-microvolt = <3300000>;
@@ -1976,7 +1976,7 @@ vdd_3v3_lp0: regulator@7 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_hdmi_pll: regulator@8 {
+	vdd_hdmi_pll: regulator-vdd-hdmi-pll {
 		compatible = "regulator-fixed";
 		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
@@ -1985,7 +1985,7 @@ vdd_hdmi_pll: regulator@8 {
 		vin-supply = <&vdd_1v05_run>;
 	};
 
-	vdd_5v0_hdmi: regulator@9 {
+	vdd_5v0_hdmi: regulator-vdd-5v0-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
@@ -1996,7 +1996,7 @@ vdd_5v0_hdmi: regulator@9 {
 	};
 
 	/* Molex power connector */
-	vdd_5v0_sata: regulator@10 {
+	vdd_5v0_sata: regulator-vdd-5v0-sata {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_SATA";
 		regulator-min-microvolt = <5000000>;
@@ -2006,7 +2006,7 @@ vdd_5v0_sata: regulator@10 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_12v0_sata: regulator@11 {
+	vdd_12v0_sata: regulator-vdd-12v0-sata {
 		compatible = "regulator-fixed";
 		regulator-name = "+12V_SATA";
 		regulator-min-microvolt = <12000000>;
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index f15623f83893..1350a0b9a606 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -615,7 +615,7 @@ power {
 		};
 	};
 
-	vdd_mux: regulator@0 {
+	vdd_mux: regulator-vdd-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_MUX";
 		regulator-min-microvolt = <12000000>;
@@ -624,7 +624,7 @@ vdd_mux: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_5v0_sys: regulator@1 {
+	vdd_5v0_sys: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -634,7 +634,7 @@ vdd_5v0_sys: regulator@1 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_sys: regulator@2 {
+	vdd_3v3_sys: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_SYS";
 		regulator-min-microvolt = <3300000>;
@@ -644,7 +644,7 @@ vdd_3v3_sys: regulator@2 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_run: regulator@3 {
+	vdd_3v3_run: regulator-vdd-3v3-run {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_RUN";
 		regulator-min-microvolt = <3300000>;
@@ -656,7 +656,7 @@ vdd_3v3_run: regulator@3 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_3v3_hdmi: regulator@4 {
+	vdd_3v3_hdmi: regulator-vdd-3v3-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
 		regulator-min-microvolt = <3300000>;
@@ -664,7 +664,7 @@ vdd_3v3_hdmi: regulator@4 {
 		vin-supply = <&vdd_3v3_run>;
 	};
 
-	vdd_led: regulator@5 {
+	vdd_led: regulator-vdd-led {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_LED";
 		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
@@ -672,7 +672,7 @@ vdd_led: regulator@5 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_5v0_ts: regulator@6 {
+	vdd_5v0_ts: regulator-vdd-5v0-ts {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_VDD_TS_SW";
 		regulator-min-microvolt = <5000000>;
@@ -683,7 +683,7 @@ vdd_5v0_ts: regulator@6 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb1_vbus: regulator@7 {
+	vdd_usb1_vbus: regulator-vdd-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
@@ -694,7 +694,7 @@ vdd_usb1_vbus: regulator@7 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb3_vbus: regulator@8 {
+	vdd_usb3_vbus: regulator-vdd-vbus3 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_USB_SS";
 		regulator-min-microvolt = <5000000>;
@@ -705,7 +705,7 @@ vdd_usb3_vbus: regulator@8 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_3v3_panel: regulator@9 {
+	vdd_3v3_panel: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_PANEL";
 		regulator-min-microvolt = <3300000>;
@@ -715,7 +715,7 @@ vdd_3v3_panel: regulator@9 {
 		vin-supply = <&vdd_3v3_run>;
 	};
 
-	vdd_3v3_lp0: regulator@10 {
+	vdd_3v3_lp0: regulator-vdd-3v3-lp0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_LP0";
 		regulator-min-microvolt = <3300000>;
@@ -730,7 +730,7 @@ vdd_3v3_lp0: regulator@10 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_hdmi_pll: regulator@11 {
+	vdd_hdmi_pll: regulator-vdd-hdmi-pll {
 		compatible = "regulator-fixed";
 		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
@@ -739,7 +739,7 @@ vdd_hdmi_pll: regulator@11 {
 		vin-supply = <&vdd_1v05_run>;
 	};
 
-	vdd_5v0_hdmi: regulator@12 {
+	vdd_5v0_hdmi: regulator-vdd-5v0-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 14eeb1242b15..4698c6db6f76 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -1087,7 +1087,7 @@ panel: panel {
 		ddc-i2c-bus = <&dpaux>;
 	};
 
-	vdd_mux: regulator@0 {
+	vdd_mux: regulator-vdd-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_MUX";
 		regulator-min-microvolt = <12000000>;
@@ -1096,7 +1096,7 @@ vdd_mux: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_5v0_sys: regulator@1 {
+	vdd_5v0_sys: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -1106,7 +1106,7 @@ vdd_5v0_sys: regulator@1 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_sys: regulator@2 {
+	vdd_3v3_sys: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_SYS";
 		regulator-min-microvolt = <3300000>;
@@ -1116,7 +1116,7 @@ vdd_3v3_sys: regulator@2 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_run: regulator@3 {
+	vdd_3v3_run: regulator-vdd-3v3-run {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_RUN";
 		regulator-min-microvolt = <3300000>;
@@ -1128,7 +1128,7 @@ vdd_3v3_run: regulator@3 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_3v3_hdmi: regulator@4 {
+	vdd_3v3_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
 		regulator-min-microvolt = <3300000>;
@@ -1136,7 +1136,7 @@ vdd_3v3_hdmi: regulator@4 {
 		vin-supply = <&vdd_3v3_run>;
 	};
 
-	vdd_led: regulator@5 {
+	vdd_led: regulator-vdd-led {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_LED";
 		regulator-min-microvolt = <3300000>;
@@ -1146,7 +1146,7 @@ vdd_led: regulator@5 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_5v0_ts: regulator@6 {
+	vdd_5v0_ts: regulator-vdd-5v0-ts {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_VDD_TS_SW";
 		regulator-min-microvolt = <5000000>;
@@ -1157,7 +1157,7 @@ vdd_5v0_ts: regulator@6 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb1_vbus: regulator@7 {
+	vdd_usb1_vbus: regulator-vdd-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
@@ -1168,7 +1168,7 @@ vdd_usb1_vbus: regulator@7 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb3_vbus: regulator@8 {
+	vdd_usb3_vbus: regulator-vdd-vbus3 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_USB_SS";
 		regulator-min-microvolt = <5000000>;
@@ -1179,7 +1179,7 @@ vdd_usb3_vbus: regulator@8 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_3v3_panel: regulator@9 {
+	vdd_3v3_panel: regulator-vdd-3v3-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_PANEL";
 		regulator-min-microvolt = <3300000>;
@@ -1189,7 +1189,7 @@ vdd_3v3_panel: regulator@9 {
 		vin-supply = <&vdd_3v3_run>;
 	};
 
-	vdd_3v3_lp0: regulator@10 {
+	vdd_3v3_lp0: regulator-vdd-3v3-lp0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_LP0";
 		regulator-min-microvolt = <3300000>;
@@ -1204,7 +1204,7 @@ vdd_3v3_lp0: regulator@10 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_hdmi_pll: regulator@11 {
+	vdd_hdmi_pll: regulator-vdd-hdmi-pll {
 		compatible = "regulator-fixed";
 		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
@@ -1213,7 +1213,7 @@ vdd_hdmi_pll: regulator@11 {
 		vin-supply = <&vdd_1v05_run>;
 	};
 
-	vdd_5v0_hdmi: regulator@12 {
+	vdd_5v0_hdmi: regulator-vdd-5v0-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index be5ef6745ac8..acbaea0503aa 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -964,7 +964,7 @@ lvds_encoder_output: endpoint {
 		};
 	};
 
-	vdd_5v0_sys: regulator@0 {
+	vdd_5v0_sys: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		regulator-min-microvolt = <5000000>;
@@ -972,7 +972,7 @@ vdd_5v0_sys: regulator@0 {
 		regulator-always-on;
 	};
 
-	vdd_3v3_sys: regulator@1 {
+	vdd_3v3_sys: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3_vs";
 		regulator-min-microvolt = <3300000>;
@@ -981,7 +981,7 @@ vdd_3v3_sys: regulator@1 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_1v8_sys: regulator@2 {
+	vdd_1v8_sys: regulator-vdd-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8_vs";
 		regulator-min-microvolt = <1800000>;
@@ -990,7 +990,7 @@ vdd_1v8_sys: regulator@2 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_pnl: regulator@3 {
+	vdd_pnl: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_panel";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 4d137461f3c4..e39318f90ffc 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -666,7 +666,7 @@ panel: panel {
 		backlight = <&backlight>;
 	};
 
-	vdd_5v0_reg: regulator@0 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		regulator-min-microvolt = <5000000>;
@@ -674,7 +674,7 @@ vdd_5v0_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	regulator@1 {
+	regulator-vdd-1v5 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v5";
 		regulator-min-microvolt = <1500000>;
@@ -682,7 +682,7 @@ regulator@1 {
 		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
-	regulator@2 {
+	regulator-vdd-1v2 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v2";
 		regulator-min-microvolt = <1200000>;
@@ -691,7 +691,7 @@ regulator@2 {
 		enable-active-high;
 	};
 
-	pci_vdd_reg: regulator@3 {
+	pci_vdd_reg: regulator-vdd-1v05 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v05";
 		regulator-min-microvolt = <1050000>;
@@ -700,7 +700,7 @@ pci_vdd_reg: regulator@3 {
 		enable-active-high;
 	};
 
-	vdd_pnl_reg: regulator@4 {
+	vdd_pnl_reg: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_pnl";
 		regulator-min-microvolt = <2800000>;
@@ -709,7 +709,7 @@ vdd_pnl_reg: regulator@4 {
 		enable-active-high;
 	};
 
-	vdd_bl_reg: regulator@5 {
+	vdd_bl_reg: regulator-vdd-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <2800000>;
@@ -718,7 +718,7 @@ vdd_bl_reg: regulator@5 {
 		enable-active-high;
 	};
 
-	vdd_5v0_hdmi: regulator@6 {
+	vdd_5v0_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_HDMI";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dts/tegra20-medcom-wide.dts
index b31c9bca16e6..ed0e4012e140 100644
--- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
+++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
@@ -92,7 +92,7 @@ sound {
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
-	vcc_24v_reg: regulator@100 {
+	vcc_24v_reg: regulator-vcc-24v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_24v";
 		regulator-min-microvolt = <24000000>;
@@ -100,7 +100,7 @@ vcc_24v_reg: regulator@100 {
 		regulator-always-on;
 	};
 
-	vdd_5v0_reg: regulator@101 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		vin-supply = <&vcc_24v_reg>;
@@ -109,7 +109,7 @@ vdd_5v0_reg: regulator@101 {
 		regulator-always-on;
 	};
 
-	vdd_3v3_reg: regulator@102 {
+	vdd_3v3_reg: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3";
 		vin-supply = <&vcc_24v_reg>;
@@ -118,7 +118,7 @@ vdd_3v3_reg: regulator@102 {
 		regulator-always-on;
 	};
 
-	vdd_1v8_reg: regulator@103 {
+	vdd_1v8_reg: regulator-vdd-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8";
 		vin-supply = <&vdd_3v3_reg>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index d3d24523553e..d525fb8cdacc 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -612,7 +612,7 @@ panel: panel {
 		backlight = <&backlight>;
 	};
 
-	p5valw_reg: regulator@0 {
+	p5valw_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+5valw";
 		regulator-min-microvolt = <5000000>;
@@ -620,7 +620,7 @@ p5valw_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	vdd_pnl_reg: regulator@1 {
+	vdd_pnl_reg: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "+3VS,vdd_pnl";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts
index 5811b7006a9b..d1a6137359a1 100644
--- a/arch/arm/boot/dts/tegra20-plutux.dts
+++ b/arch/arm/boot/dts/tegra20-plutux.dts
@@ -60,7 +60,7 @@ sound {
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
-	vcc_24v_reg: regulator@100 {
+	vcc_24v_reg: regulator-vcc-24v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_24v";
 		regulator-min-microvolt = <24000000>;
@@ -68,7 +68,7 @@ vcc_24v_reg: regulator@100 {
 		regulator-always-on;
 	};
 
-	vdd_5v0_reg: regulator@101 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		vin-supply = <&vcc_24v_reg>;
@@ -77,7 +77,7 @@ vdd_5v0_reg: regulator@101 {
 		regulator-always-on;
 	};
 
-	vdd_3v3_reg: regulator@102 {
+	vdd_3v3_reg: regulator-vcc-24v {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3";
 		vin-supply = <&vcc_24v_reg>;
@@ -86,7 +86,7 @@ vdd_3v3_reg: regulator@102 {
 		regulator-always-on;
 	};
 
-	vdd_1v8_reg: regulator@103 {
+	vdd_1v8_reg: regulator-vdd-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8";
 		vin-supply = <&vdd_3v3_reg>;
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index ffeae5da22e7..d1debe54320c 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -828,7 +828,7 @@ panel: panel {
 		ddc-i2c-bus = <&lvds_ddc>;
 	};
 
-	vdd_5v0_reg: regulator@0 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		regulator-min-microvolt = <5000000>;
@@ -836,7 +836,7 @@ vdd_5v0_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	regulator@1 {
+	regulator-vdd-1v5 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v5";
 		regulator-min-microvolt = <1500000>;
@@ -844,7 +844,7 @@ regulator@1 {
 		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
-	regulator@2 {
+	regulator-vdd-1v2 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v2";
 		regulator-min-microvolt = <1200000>;
@@ -853,7 +853,7 @@ regulator@2 {
 		enable-active-high;
 	};
 
-	vbus_reg: regulator@3 {
+	vbus_reg: regulator-vdd-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_vbus_wup1";
 		regulator-min-microvolt = <5000000>;
@@ -864,7 +864,7 @@ vbus_reg: regulator@3 {
 		regulator-boot-on;
 	};
 
-	vdd_pnl_reg: regulator@4 {
+	vdd_pnl_reg: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_pnl";
 		regulator-min-microvolt = <2800000>;
@@ -873,7 +873,7 @@ vdd_pnl_reg: regulator@4 {
 		enable-active-high;
 	};
 
-	vdd_bl_reg: regulator@5 {
+	vdd_bl_reg: regulator-vdd-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <2800000>;
@@ -882,7 +882,7 @@ vdd_bl_reg: regulator@5 {
 		enable-active-high;
 	};
 
-	vdd_hdmi: regulator@6 {
+	vdd_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_HDMI";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index d5f1a46da0bc..bcd395326db4 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -508,7 +508,7 @@ clk32k_in: clock-32k {
 		#clock-cells = <0>;
 	};
 
-	pci_vdd_reg: regulator@1 {
+	pci_vdd_reg: regulator-vdd-1v05 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v05";
 		regulator-min-microvolt = <1050000>;
diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra20-tec.dts
index 10ff09d86efa..b5291e276f8a 100644
--- a/arch/arm/boot/dts/tegra20-tec.dts
+++ b/arch/arm/boot/dts/tegra20-tec.dts
@@ -69,7 +69,7 @@ sound {
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
-	vcc_24v_reg: regulator@100 {
+	vcc_24v_reg: regulator-vcc-24v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_24v";
 		regulator-min-microvolt = <24000000>;
@@ -77,7 +77,7 @@ vcc_24v_reg: regulator@100 {
 		regulator-always-on;
 	};
 
-	vdd_5v0_reg: regulator@101 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		vin-supply = <&vcc_24v_reg>;
@@ -86,7 +86,7 @@ vdd_5v0_reg: regulator@101 {
 		regulator-always-on;
 	};
 
-	vdd_3v3_reg: regulator@102 {
+	vdd_3v3_reg: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3";
 		vin-supply = <&vcc_24v_reg>;
@@ -95,7 +95,7 @@ vdd_3v3_reg: regulator@102 {
 		regulator-always-on;
 	};
 
-	vdd_1v8_reg: regulator@103 {
+	vdd_1v8_reg: regulator-vdd-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8";
 		vin-supply = <&vdd_3v3_reg>;
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 49c3b3bfac51..0bcd548023d6 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -402,7 +402,7 @@ poweroff {
 		gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 	};
 
-	hdmi_vdd_reg: regulator@0 {
+	hdmi_vdd_reg: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "avdd_hdmi";
 		regulator-min-microvolt = <3300000>;
@@ -410,7 +410,7 @@ hdmi_vdd_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	hdmi_pll_reg: regulator@1 {
+	hdmi_pll_reg: regulator-vdd-hdmi-pll {
 		compatible = "regulator-fixed";
 		regulator-name = "avdd_hdmi_pll";
 		regulator-min-microvolt = <1800000>;
@@ -418,7 +418,7 @@ hdmi_pll_reg: regulator@1 {
 		regulator-always-on;
 	};
 
-	vbus_reg: regulator@2 {
+	vbus_reg: regulator-usb1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -429,7 +429,7 @@ vbus_reg: regulator@2 {
 		regulator-boot-on;
 	};
 
-	pci_clk_reg: regulator@3 {
+	pci_clk_reg: regulator-clk-pci {
 		compatible = "regulator-fixed";
 		regulator-name = "pci_clk";
 		regulator-min-microvolt = <3300000>;
@@ -437,7 +437,7 @@ pci_clk_reg: regulator@3 {
 		regulator-always-on;
 	};
 
-	pci_vdd_reg: regulator@4 {
+	pci_vdd_reg: regulator-vdd-pci {
 		compatible = "regulator-fixed";
 		regulator-name = "pci_vdd";
 		regulator-min-microvolt = <1050000>;
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index ef97457f1334..91060bf27499 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -647,7 +647,7 @@ panel: panel {
 		ddc-i2c-bus = <&lvds_ddc>;
 	};
 
-	vdd_5v0_reg: regulator@0 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		regulator-min-microvolt = <5000000>;
@@ -655,7 +655,7 @@ vdd_5v0_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	regulator@1 {
+	regulator-vdd-1v5 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v5";
 		regulator-min-microvolt = <1500000>;
@@ -663,7 +663,7 @@ regulator@1 {
 		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
-	regulator@2 {
+	regulator-vdd-1v2 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v2";
 		regulator-min-microvolt = <1200000>;
@@ -672,7 +672,7 @@ regulator@2 {
 		enable-active-high;
 	};
 
-	vdd_pnl_reg: regulator@3 {
+	vdd_pnl_reg: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_pnl";
 		regulator-min-microvolt = <2800000>;
@@ -681,7 +681,7 @@ vdd_pnl_reg: regulator@3 {
 		enable-active-high;
 	};
 
-	vdd_bl_reg: regulator@4 {
+	vdd_bl_reg: regulator-vdd-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <2800000>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 72159eb55a3d..3fbb57d517c4 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1207,7 +1207,7 @@ lvds_encoder_output: endpoint {
 		};
 	};
 
-	vdd_5v0_sys: regulator@0 {
+	vdd_5v0_sys: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v0";
 		regulator-min-microvolt = <5000000>;
@@ -1216,7 +1216,7 @@ vdd_5v0_sys: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_3v3_sys: regulator@1 {
+	vdd_3v3_sys: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -1226,7 +1226,7 @@ vdd_3v3_sys: regulator@1 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_pnl: regulator@2 {
+	vdd_pnl: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_panel";
 		regulator-min-microvolt = <3300000>;
@@ -1237,7 +1237,7 @@ vdd_pnl: regulator@2 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vcc_3v3_ts: regulator@3 {
+	vcc_3v3_ts: regulator-vdd-3v3-ts {
 		compatible = "regulator-fixed";
 		regulator-name = "ldo_s-1167_3v3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
index 53966fa4eef2..175e18639607 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
@@ -166,12 +166,12 @@ ldo8 {
 		};
 	};
 
-	vdd_3v3_sys: regulator@1 {
+	vdd_3v3_sys: regulator-vdd-3v3 {
 		gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
-	regulator@4 {
+	regulator-vdd-usb {
 		compatible = "regulator-fixed";
 		regulator-name = "avdd_usb";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
index 9365ae607239..bf2bd42ba166 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -143,7 +143,7 @@ vdd_core: core-regulator@60 {
 		};
 	};
 
-	vdd_3v3_sys: regulator@1 {
+	vdd_3v3_sys: regulator-vdd-3v3 {
 		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 91ecca0be5a2..df743935e1ac 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1986,7 +1986,7 @@ gpled2 {
 		};
 	};
 
-	vdd_5v_in_reg: regulator@0 {
+	vdd_5v_in_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v_in";
 		regulator-min-microvolt = <5000000>;
@@ -1994,7 +1994,7 @@ vdd_5v_in_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	chargepump_5v_reg: regulator@1 {
+	chargepump_5v_reg: regulator-vdd-chargepump {
 		compatible = "regulator-fixed";
 		regulator-name = "chargepump_5v";
 		regulator-min-microvolt = <5000000>;
@@ -2005,7 +2005,7 @@ chargepump_5v_reg: regulator@1 {
 		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
-	ddr_reg: regulator@2 {
+	ddr_reg: regulator-vdd-ddr {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_ddr";
 		regulator-min-microvolt = <1500000>;
@@ -2017,7 +2017,7 @@ ddr_reg: regulator@2 {
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
-	vdd_5v_sata_reg: regulator@3 {
+	vdd_5v_sata_reg: regulator-vdd-5v0-sata {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_5v_sata";
 		regulator-min-microvolt = <5000000>;
@@ -2029,7 +2029,7 @@ vdd_5v_sata_reg: regulator@3 {
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
-	usb1_vbus_reg: regulator@4 {
+	usb1_vbus_reg: regulator-vdd-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -2040,7 +2040,7 @@ usb1_vbus_reg: regulator@4 {
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
-	usb3_vbus_reg: regulator@5 {
+	usb3_vbus_reg: regulator-vdd-vbus3 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb3_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -2051,7 +2051,7 @@ usb3_vbus_reg: regulator@5 {
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
-	sys_3v3_reg: regulator@6 {
+	sys_3v3_reg: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "sys_3v3,vdd_3v3_alw";
 		regulator-min-microvolt = <3300000>;
@@ -2063,7 +2063,7 @@ sys_3v3_reg: regulator@6 {
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
-	sys_3v3_pexs_reg: regulator@7 {
+	sys_3v3_pexs_reg: regulator-vdd-3v3-pex {
 		compatible = "regulator-fixed";
 		regulator-name = "sys_3v3_pexs";
 		regulator-min-microvolt = <3300000>;
@@ -2075,7 +2075,7 @@ sys_3v3_pexs_reg: regulator@7 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_5v0_hdmi: regulator@8 {
+	vdd_5v0_hdmi: regulator-vdd-5v0-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_5V_HDMI";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dts b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
index 4899e05a0d9c..eacff4f78208 100644
--- a/arch/arm/boot/dts/tegra30-cardhu-a02.dts
+++ b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
@@ -16,7 +16,7 @@ mmc@78000400 {
 		keep-power-in-suspend;
 	};
 
-	ddr_reg: regulator@100 {
+	ddr_reg: regulator-vdd-ddr {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_ddr";
 		regulator-min-microvolt = <1500000>;
@@ -27,7 +27,7 @@ ddr_reg: regulator@100 {
 		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
 	};
 
-	sys_3v3_reg: regulator@101 {
+	sys_3v3_reg: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "sys_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -38,7 +38,7 @@ sys_3v3_reg: regulator@101 {
 		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
 	};
 
-	usb1_vbus_reg: regulator@102 {
+	usb1_vbus_reg: regulator-vdd-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -49,7 +49,7 @@ usb1_vbus_reg: regulator@102 {
 		vin-supply = <&vdd_5v0_reg>;
 	};
 
-	usb3_vbus_reg: regulator@103 {
+	usb3_vbus_reg: regulator-vdd-vbus3 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb3_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -60,7 +60,7 @@ usb3_vbus_reg: regulator@103 {
 		vin-supply = <&vdd_5v0_reg>;
 	};
 
-	vdd_5v0_reg: regulator@104 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "5v0";
 		regulator-min-microvolt = <5000000>;
@@ -69,7 +69,7 @@ vdd_5v0_reg: regulator@104 {
 		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
 	};
 
-	vdd_bl_reg: regulator@105 {
+	vdd_bl_reg: regulator-vdd-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
index a11028b8b67b..19f2e8f491d5 100644
--- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
+++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
@@ -16,7 +16,7 @@ mmc@78000400 {
 		keep-power-in-suspend;
 	};
 
-	ddr_reg: regulator@100 {
+	ddr_reg: regulator-vdd-ddr {
 		compatible = "regulator-fixed";
 		regulator-name = "ddr";
 		regulator-min-microvolt = <1500000>;
@@ -27,7 +27,7 @@ ddr_reg: regulator@100 {
 		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
 	};
 
-	sys_3v3_reg: regulator@101 {
+	sys_3v3_reg: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "sys_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -38,7 +38,7 @@ sys_3v3_reg: regulator@101 {
 		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
 	};
 
-	usb1_vbus_reg: regulator@102 {
+	usb1_vbus_reg: regulator-vdd-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -49,7 +49,7 @@ usb1_vbus_reg: regulator@102 {
 		vin-supply = <&vdd_5v0_reg>;
 	};
 
-	usb3_vbus_reg: regulator@103 {
+	usb3_vbus_reg: regulator-vdd-vbus3 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb3_vbus";
 		regulator-min-microvolt = <5000000>;
@@ -60,7 +60,7 @@ usb3_vbus_reg: regulator@103 {
 		vin-supply = <&vdd_5v0_reg>;
 	};
 
-	vdd_5v0_reg: regulator@104 {
+	vdd_5v0_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "5v0";
 		regulator-min-microvolt = <5000000>;
@@ -69,7 +69,7 @@ vdd_5v0_reg: regulator@104 {
 		gpio = <&pmic 8 GPIO_ACTIVE_HIGH>;
 	};
 
-	vdd_bl_reg: regulator@105 {
+	vdd_bl_reg: regulator-vdd-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <5000000>;
@@ -80,7 +80,7 @@ vdd_bl_reg: regulator@105 {
 		gpio = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
 	};
 
-	vdd_bl2_reg: regulator@106 {
+	vdd_bl2_reg: regulator-vdd-backlight2 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_bl2";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 6074885280fc..efaa39171c99 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -476,7 +476,7 @@ panel: panel {
 		backlight = <&backlight>;
 	};
 
-	vdd_ac_bat_reg: regulator@0 {
+	vdd_ac_bat_reg: regulator-vdd-ac-bat {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_ac_bat";
 		regulator-min-microvolt = <5000000>;
@@ -484,7 +484,7 @@ vdd_ac_bat_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	cam_1v8_reg: regulator@1 {
+	cam_1v8_reg: regulator-vdd-1v8-cam {
 		compatible = "regulator-fixed";
 		regulator-name = "cam_1v8";
 		regulator-min-microvolt = <1800000>;
@@ -494,7 +494,7 @@ cam_1v8_reg: regulator@1 {
 		vin-supply = <&vio_reg>;
 	};
 
-	cp_5v_reg: regulator@2 {
+	cp_5v_reg: regulator-vdd-5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "cp_5v";
 		regulator-min-microvolt = <5000000>;
@@ -505,7 +505,7 @@ cp_5v_reg: regulator@2 {
 		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
-	emmc_3v3_reg: regulator@3 {
+	emmc_3v3_reg: regulator-vdd-3v3-emmc {
 		compatible = "regulator-fixed";
 		regulator-name = "emmc_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -517,7 +517,7 @@ emmc_3v3_reg: regulator@3 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	modem_3v3_reg: regulator@4 {
+	modem_3v3_reg: regulator-vdd-3v3-modem {
 		compatible = "regulator-fixed";
 		regulator-name = "modem_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -526,7 +526,7 @@ modem_3v3_reg: regulator@4 {
 		gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
 	};
 
-	pex_hvdd_3v3_reg: regulator@5 {
+	pex_hvdd_3v3_reg: regulator-vdd-3v3-pex {
 		compatible = "regulator-fixed";
 		regulator-name = "pex_hvdd_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -536,7 +536,7 @@ pex_hvdd_3v3_reg: regulator@5 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_cam1_ldo_reg: regulator@6 {
+	vdd_cam1_ldo_reg: regulator-vdd-cam1-ldo {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_cam1_ldo";
 		regulator-min-microvolt = <2800000>;
@@ -546,7 +546,7 @@ vdd_cam1_ldo_reg: regulator@6 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_cam2_ldo_reg: regulator@7 {
+	vdd_cam2_ldo_reg: regulator-vdd-cam2-ldo {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_cam2_ldo";
 		regulator-min-microvolt = <2800000>;
@@ -556,7 +556,7 @@ vdd_cam2_ldo_reg: regulator@7 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_cam3_ldo_reg: regulator@8 {
+	vdd_cam3_ldo_reg: regulator-vdd-cam3-ldo {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_cam3_ldo";
 		regulator-min-microvolt = <3300000>;
@@ -566,7 +566,7 @@ vdd_cam3_ldo_reg: regulator@8 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_com_reg: regulator@9 {
+	vdd_com_reg: regulator-vdd-com {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_com";
 		regulator-min-microvolt = <3300000>;
@@ -578,7 +578,7 @@ vdd_com_reg: regulator@9 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_fuse_3v3_reg: regulator@10 {
+	vdd_fuse_3v3_reg: regulator-vdd-fuse {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_fuse_3v3";
 		regulator-min-microvolt = <3300000>;
@@ -588,7 +588,7 @@ vdd_fuse_3v3_reg: regulator@10 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_pnl1_reg: regulator@11 {
+	vdd_pnl1_reg: regulator-vdd-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_pnl1";
 		regulator-min-microvolt = <3300000>;
@@ -600,7 +600,7 @@ vdd_pnl1_reg: regulator@11 {
 		vin-supply = <&sys_3v3_reg>;
 	};
 
-	vdd_vid_reg: regulator@12 {
+	vdd_vid_reg: regulator-vdd-video {
 		compatible = "regulator-fixed";
 		regulator-name = "vddio_vid";
 		regulator-min-microvolt = <5000000>;
-- 
2.34.1

