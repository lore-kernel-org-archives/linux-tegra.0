Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A23C4708D
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Nov 2022 16:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbiK1Q3j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Nov 2022 11:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbiK1Q3h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Nov 2022 11:29:37 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAF3205FC;
        Mon, 28 Nov 2022 08:29:35 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 72D66600C804;
        Mon, 28 Nov 2022 16:29:33 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id vRpmiXuB3wm5; Mon, 28 Nov 2022 16:29:30 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C5ABF600C805;
        Mon, 28 Nov 2022 16:29:30 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1669652970;
        bh=TdKh3E/XenanfAlC8eRJ4MFy4v4lhEiS+bjmvYDecWA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OG3OYfAO5rLU/XAE7Usb7QP4OyhTrGvPA+SfCaWqWPKIIqlhf9l5hr4uBCrJsNYoS
         rkEA5HvbINP+QECnLr4eODpGX/PJMIRg17a2v3G8TQWtKuDGkEO1EjcswP0+PBKhGR
         xU8w758ID0H6SNzC1nB/OGkLDFnRybUDwQBa+4Ag=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 9D363360077;
        Mon, 28 Nov 2022 16:29:30 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 RESEND 4/4] arm64: dts: smaug: Add display panel node
Date:   Mon, 28 Nov 2022 16:28:51 +0000
Message-Id: <20221128162851.110611-4-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
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
Changes in v2:
 - renamed backlight node to a generic name
 - removed underscores

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 84ec4d8b7f10..5db0b25c8d58 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -31,6 +31,37 @@ memory {
 	};
 
 	host1x@50000000 {
+		dc@54200000 {
+			status = "okay";
+		};
+
+		dsia: dsi@54300000 {
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
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
@@ -1627,6 +1658,37 @@ nau8825@1a {
 			status = "okay";
 		};
 
+		backlight: backlight@2c {
+			compatible = "ti,lp8557";
+			reg = <0x2c>;
+			power-supply = <&pplcd_vdd>;
+			enable-supply = <&pp1800_lcdio>;
+			bl-name = "lp8557-backlight";
+			dev-ctrl = /bits/ 8 <0x01>;
+			init-brt = /bits/ 8 <0x80>;
+
+			/* Full scale current, 20mA */
+			rom-11h {
+				rom-addr = /bits/ 8 <0x11>;
+				rom-val = /bits/ 8 <0x05>;
+			};
+			/* Frequency = 4.9kHz, magic undocumented val */
+			rom-12h {
+				rom-addr = /bits/ 8 <0x12>;
+				rom-val = /bits/ 8 <0x29>;
+			};
+			/* Boost freq = 1MHz, BComp option = 1 */
+			rom-13h {
+				rom-addr = /bits/ 8 <0x13>;
+				rom-val = /bits/ 8 <0x03>;
+			};
+			/* 4V OV, 6 output LED string enabled */
+			rom-14h {
+				rom-addr = /bits/ 8 <0x14>;
+				rom-val = /bits/ 8 <0xbf>;
+			};
+		};
+
 		audio-codec@2d {
 			compatible = "realtek,rt5677";
 			reg = <0x2d>;
@@ -1908,4 +1970,12 @@ usbc_vbus: regulator-usbc-vbus {
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
2.38.1

