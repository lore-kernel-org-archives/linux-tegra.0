Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7AAC4321E
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 17:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbiI2RFM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 13:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236018AbiI2RFK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 13:05:10 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105E154648;
        Thu, 29 Sep 2022 10:05:03 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id CAF846005C4E;
        Thu, 29 Sep 2022 18:05:01 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id LPKtDgoflgO8; Thu, 29 Sep 2022 18:04:59 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 45A9E6008829;
        Thu, 29 Sep 2022 18:04:59 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1664471099;
        bh=1z5MIZzeYwJ1JfUX/ZDyqqjAalAcTmvA+Fvskl+RPyE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=upLzc1W3DivBzqT7/bQ00oBfLwDe+wZCRLIdCteLYPDMdvPLYnwA+CQHItLRBlTkX
         vb0C/ux09KP1AECBJCg0qknXXzUx9eooIRSF0E+CqfpP7cq5DQIVj+8KGQIsy+VVtB
         ZoHKP81tiEuzWQxmsZDjeuGYvW1YnehXg0ItvsjY=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 1C7E536009F;
        Thu, 29 Sep 2022 18:04:58 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Date:   Thu, 29 Sep 2022 18:05:02 +0100
Message-Id: <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Google Pixel C has a JDI LPM102A188A display panel. Add a
DT node for it. Tested on Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 20d092812984..271ef70747f1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -31,6 +31,39 @@ memory {
 	};
 
 	host1x@50000000 {
+		dc@54200000 {
+			status = "okay";
+		};
+
+		dsia: dsi@54300000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+			nvidia,boot-on;
+			status = "okay";
+
+			link2: panel@0 {
+				compatible = "jdi,lpm102a188a";
+				reg = <0>;
+			};
+		};
+
+		dsib: dsi@54400000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+			nvidia,ganged-mode = <&dsia>;
+			nvidia,boot-on;
+			status = "okay";
+
+			link1: panel@0 {
+				compatible = "jdi,lpm102a188a";
+				reg = <0>;
+				power-supply = <&pplcd_vdd>;
+				ddi-supply = <&pp1800_lcdio>;
+				enable-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+				link2 = <&link2>;
+				backlight = <&backlight>;
+			};
+		};
+
 		dpaux: dpaux@545c0000 {
 			status = "okay";
 		};
@@ -1627,6 +1660,37 @@ nau8825@1a {
 			status = "okay";
 		};
 
+		backlight: lp8557-backlight@2c {
+			compatible = "ti,lp8557";
+			reg = <0x2c>;
+			power-supply = <&pplcd_vdd>;
+			enable-supply = <&pp1800_lcdio>;
+			bl-name = "lp8557-backlight";
+			dev-ctrl = /bits/ 8 <0x01>;
+			init-brt = /bits/ 8 <0x80>;
+
+			/* Full scale current, 20mA */
+			rom_11h {
+				rom-addr = /bits/ 8 <0x11>;
+				rom-val = /bits/ 8 <0x05>;
+			};
+			/* Frequency = 4.9kHz, magic undocumented val */
+			rom_12h {
+				rom-addr = /bits/ 8 <0x12>;
+				rom-val = /bits/ 8 <0x29>;
+			};
+			/* Boost freq = 1MHz, BComp option = 1 */
+			rom_13h {
+				rom-addr = /bits/ 8 <0x13>;
+				rom-val = /bits/ 8 <0x03>;
+			};
+			/* 4V OV, 6 output LED string enabled */
+			rom_14h {
+				rom-addr = /bits/ 8 <0x14>;
+				rom-val = /bits/ 8 <0xbf>;
+			};
+		};
+
 		audio-codec@2d {
 			compatible = "realtek,rt5677";
 			reg = <0x2d>;
@@ -1908,4 +1972,12 @@ usbc_vbus: regulator-usbc-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	vdd_dsi_csi: regulator-vdd-dsi-csi {
+		compatible = "regulator-fixed";
+		regulator-name = "AVDD_DSI_CSI_1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&pp1200_avdd>;
+	};
 };
-- 
2.37.3

