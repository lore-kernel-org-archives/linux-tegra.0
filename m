Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0870C433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242973AbhLIR2w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242968AbhLIR2s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:28:48 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005B4C061B38
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:12 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id t9so10936843wrx.7
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3iY9iGreTmfp4P0o1r1QHjzKXTN0W1n9JTY8XWYkOds=;
        b=VIE5t8eudeSGd0zsEXMiZtZ2LHrI203n+R+TGWnugeKBph/xMAkK+cTpys1UaWcMD0
         YKQVI6po5UPDvw3Aq1uQ2qOQ+8QSH19DtHygVJZ7vg6zyAroEq8FmSYR8OnIHYYrnCWt
         Q+6GuX4vjTeKC35eSfAhMWtxH6sbj45IwPshkQS3Tsk2dUZW+6HXXGyaYjCFl90XjoYu
         xsZyxc/ywNmE4ARoyW5MlI5wvv3pn1KeMmrdZDFhRPu6clnpF8nXkkqO363een6W5epM
         XiIsM8sBXNTcOLKCDRerKzNJlpeY3EakeFlgQz57B7YlVtVAKiofSoAr/AZ+DoPb5MZd
         cOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3iY9iGreTmfp4P0o1r1QHjzKXTN0W1n9JTY8XWYkOds=;
        b=XgjB0sdn6DRnE6tHnO525A5qsRFPq6QAnQvboSul00ee3baiT+4DmVklmTkyrAI8Mb
         yLegm53i505K6IVwfzaqU9+V93ojcsHfM0kbNX0GaVxHjKw41m7xBbUL2dD47cVUliCs
         BYL/R6E+J8S2/gtEnJvHNZ56denU09kQ0hhkDkL7tYmUwv+ishagH687cU2IFYJlfye5
         0JNm/YgDVPPVnRGynTQs9diflGjidA/VEonY9h9aKIDCtwM+gNh6fPa9pTNtKHgkbEMD
         XdptTVZIYBzsElCQR/bi05M84fR9AjkAoCbwdkl9398g/iwWCKVKTpTwVqL3ut8qA0lb
         Ek2A==
X-Gm-Message-State: AOAM531GdnJC+kXtCdXicC9Dxkkhgg2ZUWZKoEEnlHvhtkzEzZ5Se3zx
        Vd8D9L7VLd1yCCr/hdt4O0Q=
X-Google-Smtp-Source: ABdhPJzMEU2d7AMi57rNl56eUz3qdA2Cr3VyB6XW0mMETrEKbmcuiYRglfBX9wBt2WieydZiZWHuLw==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr8237671wrv.12.1639070711307;
        Thu, 09 Dec 2021 09:25:11 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id r8sm414304wrz.43.2021.12.09.09.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 02/30] arm64: tegra: Rename top-level regulators
Date:   Thu,  9 Dec 2021 18:24:35 +0100
Message-Id: <20211209172503.617716-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
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
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts | 26 +++++++-------
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  8 ++---
 .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  6 ++--
 .../nvidia/tegra186-p3509-0000+p3636-0001.dts |  8 ++---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 10 +++---
 .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  | 10 +++---
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  |  2 +-
 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  2 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 30 ++++++++--------
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 36 +++++++++----------
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 18 +++++-----
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 16 ++++-----
 12 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index ecd58bd2770f..c84ed1cb9a8c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -1057,7 +1057,7 @@ panel: panel {
 		ddc-i2c-bus = <&dpaux>;
 	};
 
-	vdd_mux: regulator@0 {
+	vdd_mux: regulator-vdd-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_MUX";
 		regulator-min-microvolt = <19000000>;
@@ -1066,7 +1066,7 @@ vdd_mux: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_5v0_sys: regulator@1 {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -1076,7 +1076,7 @@ vdd_5v0_sys: regulator@1 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_sys: regulator@2 {
+	vdd_3v3_sys: regulator-vdd-3v3-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_SYS";
 		regulator-min-microvolt = <3300000>;
@@ -1086,7 +1086,7 @@ vdd_3v3_sys: regulator@2 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_3v3_run: regulator@3 {
+	vdd_3v3_run: regulator-vdd-3v3-run {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_RUN";
 		regulator-min-microvolt = <3300000>;
@@ -1098,7 +1098,7 @@ vdd_3v3_run: regulator@3 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_3v3_hdmi: regulator@4 {
+	vdd_3v3_hdmi: regulator-vdd-3v3-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_AVDD_HDMI_AP_GATED";
 		regulator-min-microvolt = <3300000>;
@@ -1106,7 +1106,7 @@ vdd_3v3_hdmi: regulator@4 {
 		vin-supply = <&vdd_3v3_run>;
 	};
 
-	vdd_led: regulator@5 {
+	vdd_led: regulator-vdd-led {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_LED";
 		regulator-min-microvolt = <3300000>;
@@ -1116,7 +1116,7 @@ vdd_led: regulator@5 {
 		vin-supply = <&vdd_mux>;
 	};
 
-	vdd_usb1_vbus: regulator@6 {
+	vdd_usb1_vbus: regulator-vdd-usb1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
@@ -1127,7 +1127,7 @@ vdd_usb1_vbus: regulator@6 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb3_vbus: regulator@7 {
+	vdd_usb3_vbus: regulator-vdd-usb3-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_USB_SS";
 		regulator-min-microvolt = <5000000>;
@@ -1138,7 +1138,7 @@ vdd_usb3_vbus: regulator@7 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_3v3_panel: regulator@8 {
+	vdd_3v3_panel: regulator-vdd-3v3-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_PANEL";
 		regulator-min-microvolt = <3300000>;
@@ -1148,7 +1148,7 @@ vdd_3v3_panel: regulator@8 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_hdmi_pll: regulator@9 {
+	vdd_hdmi_pll: regulator-vdd-hdmi-pll {
 		compatible = "regulator-fixed";
 		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL_AP_GATE";
 		regulator-min-microvolt = <1050000>;
@@ -1157,7 +1157,7 @@ vdd_hdmi_pll: regulator@9 {
 		vin-supply = <&vdd_1v05_run>;
 	};
 
-	vdd_5v0_hdmi: regulator@10 {
+	vdd_5v0_hdmi: regulator-vdd-5v0-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
@@ -1167,7 +1167,7 @@ vdd_5v0_hdmi: regulator@10 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_5v0_ts: regulator@11 {
+	vdd_5v0_ts: regulator-vdd-5v0-ts {
 		compatible = "regulator-fixed";
 		regulator-name = "+5V_VDD_TS";
 		regulator-min-microvolt = <5000000>;
@@ -1178,7 +1178,7 @@ vdd_5v0_ts: regulator@11 {
 		enable-active-high;
 	};
 
-	vdd_3v3_lp0: regulator@12 {
+	vdd_3v3_lp0: regulator-vdd-3v3-lp0 {
 		compatible = "regulator-fixed";
 		regulator-name = "+3.3V_LP0";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 52fa258533e6..2883049c4edf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -2250,7 +2250,7 @@ volume-down {
 		};
 	};
 
-	vdd_sd: regulator@100 {
+	vdd_sd: regulator-vdd-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "SD_CARD_SW_PWR";
 		regulator-min-microvolt = <3300000>;
@@ -2262,7 +2262,7 @@ vdd_sd: regulator@100 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_hdmi: regulator@101 {
+	vdd_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_HDMI_5V0";
 		regulator-min-microvolt = <5000000>;
@@ -2274,7 +2274,7 @@ vdd_hdmi: regulator@101 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb0: regulator@102 {
+	vdd_usb0: regulator-vdd-usb0 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_USB0";
 		regulator-min-microvolt = <5000000>;
@@ -2286,7 +2286,7 @@ vdd_usb0: regulator@102 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb1: regulator@103 {
+	vdd_usb1: regulator-vdd-usb1 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_USB1";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index fcd71bfc6707..4917b43995b0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -393,7 +393,7 @@ psci {
 		method = "smc";
 	};
 
-	gnd: regulator@0 {
+	gnd: regulator-gnd {
 		compatible = "regulator-fixed";
 		regulator-name = "GND";
 		regulator-min-microvolt = <0>;
@@ -402,7 +402,7 @@ gnd: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_5v0_sys: regulator@1 {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -411,7 +411,7 @@ vdd_5v0_sys: regulator@1 {
 		regulator-boot-on;
 	};
 
-	vdd_1v8_ap: regulator@2 {
+	vdd_1v8_ap: regulator-vdd-1v8-ap {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_1V8_AP";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index af33fe93e1d6..28d59792eaa1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -593,7 +593,7 @@ psci {
 		method = "smc";
 	};
 
-	gnd: regulator@0 {
+	gnd: regulator-gnd {
 		compatible = "regulator-fixed";
 		regulator-name = "GND";
 		regulator-min-microvolt = <0>;
@@ -602,7 +602,7 @@ gnd: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_5v0_sys: regulator@1 {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -611,7 +611,7 @@ vdd_5v0_sys: regulator@1 {
 		regulator-boot-on;
 	};
 
-	vdd_1v8_ap: regulator@2 {
+	vdd_1v8_ap: regulator-vdd-1v8-ap {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_1V8_AP";
 		regulator-min-microvolt = <1800000>;
@@ -623,7 +623,7 @@ vdd_1v8_ap: regulator@2 {
 		vin-supply = <&vdd_1v8>;
 	};
 
-	vdd_hdmi: regulator@3 {
+	vdd_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index c4058ee36fec..ad217cac2b28 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -317,7 +317,7 @@ temperature-sensor@4c {
 		};
 	};
 
-	vdd_5v0_sys: regulator@0 {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VIN_SYS_5V0";
 		regulator-min-microvolt = <5000000>;
@@ -326,7 +326,7 @@ vdd_5v0_sys: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_hdmi: regulator@1 {
+	vdd_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
@@ -335,7 +335,7 @@ vdd_hdmi: regulator@1 {
 		enable-active-high;
 	};
 
-	vdd_3v3_pcie: regulator@2 {
+	vdd_3v3_pcie: regulator-vdd-3v3-pcie {
 		compatible = "regulator-fixed";
 		regulator-name = "PEX_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -345,7 +345,7 @@ vdd_3v3_pcie: regulator@2 {
 		enable-active-high;
 	};
 
-	vdd_12v_pcie: regulator@3 {
+	vdd_12v_pcie: regulator-vdd-12v-pcie {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_12V";
 		regulator-min-microvolt = <1200000>;
@@ -354,7 +354,7 @@ vdd_12v_pcie: regulator@3 {
 		regulator-boot-on;
 	};
 
-	vdd_5v_sata: regulator@4 {
+	vdd_5v_sata: regulator-vdd-5v0-sata {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V_SATA";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
index a055f17218bb..8d3999cd1af2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
@@ -2000,7 +2000,7 @@ power {
 		};
 	};
 
-	vdd_5v0_sys: regulator@100 {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -2009,7 +2009,7 @@ vdd_5v0_sys: regulator@100 {
 		regulator-boot-on;
 	};
 
-	vdd_3v3_sys: regulator@101 {
+	vdd_3v3_sys: regulator-vdd-3v3-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_3V3_SYS";
 		regulator-min-microvolt = <3300000>;
@@ -2018,7 +2018,7 @@ vdd_3v3_sys: regulator@101 {
 		regulator-boot-on;
 	};
 
-	vdd_3v3_ao: regulator@102 {
+	vdd_3v3_ao: regulator-vdd-3v3-ao {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_3V3_AO";
 		regulator-min-microvolt = <3300000>;
@@ -2027,7 +2027,7 @@ vdd_3v3_ao: regulator@102 {
 		regulator-boot-on;
 	};
 
-	vdd_1v8: regulator@103 {
+	vdd_1v8: regulator-vdd-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -2036,7 +2036,7 @@ vdd_1v8: regulator@103 {
 		regulator-boot-on;
 	};
 
-	vdd_hdmi: regulator@104 {
+	vdd_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
index 14da4206ea66..8c2c709dd54c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
@@ -20,7 +20,7 @@ mmc@3400000 {
 		};
 	};
 
-	vdd_3v3_sd: regulator@0 {
+	vdd_3v3_sd: regulator-vdd-3v3-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_3V3_SD";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index d3e622c4a439..75eb743a7242 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -336,7 +336,7 @@ psci {
 		method = "smc";
 	};
 
-	vdd_gpu: regulator@100 {
+	vdd_gpu: regulator-vdd-gpu {
 		compatible = "pwm-regulator";
 		pwms = <&pwm 1 8000>;
 		regulator-name = "VDD_GPU";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index d8409c1b4380..34276a84c68a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1555,7 +1555,7 @@ volume_up {
 		};
 	};
 
-	vdd_sys_mux: regulator@0 {
+	vdd_sys_mux: regulator-vdd-sys-mux {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_SYS_MUX";
 		regulator-min-microvolt = <5000000>;
@@ -1564,7 +1564,7 @@ vdd_sys_mux: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_5v0_sys: regulator@1 {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -1576,7 +1576,7 @@ vdd_5v0_sys: regulator@1 {
 		vin-supply = <&vdd_sys_mux>;
 	};
 
-	vdd_3v3_sys: regulator@2 {
+	vdd_3v3_sys: regulator-vdd-3v3-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_3V3_SYS";
 		regulator-min-microvolt = <3300000>;
@@ -1591,7 +1591,7 @@ vdd_3v3_sys: regulator@2 {
 		regulator-disable-ramp-delay = <10000>;
 	};
 
-	vdd_5v0_io: regulator@3 {
+	vdd_5v0_io: regulator-vdd-5v0-io {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_5V0_IO_SYS";
 		regulator-min-microvolt = <5000000>;
@@ -1600,7 +1600,7 @@ vdd_5v0_io: regulator@3 {
 		regulator-boot-on;
 	};
 
-	vdd_3v3_sd: regulator@4 {
+	vdd_3v3_sd: regulator-vdd-3v3-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_3V3_SD";
 		regulator-min-microvolt = <3300000>;
@@ -1613,7 +1613,7 @@ vdd_3v3_sd: regulator@4 {
 		regulator-disable-ramp-delay = <4880>;
 	};
 
-	vdd_dsi_csi: regulator@5 {
+	vdd_dsi_csi: regulator-vdd-dsi-csi {
 		compatible = "regulator-fixed";
 		regulator-name = "AVDD_DSI_CSI_1V2";
 		regulator-min-microvolt = <1200000>;
@@ -1621,7 +1621,7 @@ vdd_dsi_csi: regulator@5 {
 		vin-supply = <&vdd_sys_1v2>;
 	};
 
-	vdd_3v3_dis: regulator@6 {
+	vdd_3v3_dis: regulator-vdd-3v3-dis {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_DIS_3V3_LCD";
 		regulator-min-microvolt = <3300000>;
@@ -1632,7 +1632,7 @@ vdd_3v3_dis: regulator@6 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_1v8_dis: regulator@7 {
+	vdd_1v8_dis: regulator-vdd-1v8-dis {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_LCD_1V8_DIS";
 		regulator-min-microvolt = <1800000>;
@@ -1643,7 +1643,7 @@ vdd_1v8_dis: regulator@7 {
 		vin-supply = <&vdd_1v8>;
 	};
 
-	vdd_5v0_rtl: regulator@8 {
+	vdd_5v0_rtl: regulator-vdd-5v0-rtl {
 		compatible = "regulator-fixed";
 		regulator-name = "RTL_5V";
 		regulator-min-microvolt = <5000000>;
@@ -1653,7 +1653,7 @@ vdd_5v0_rtl: regulator@8 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_usb_vbus: regulator@9 {
+	vdd_usb_vbus: regulator-vdd-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_VBUS_EN1";
 		regulator-min-microvolt = <5000000>;
@@ -1663,7 +1663,7 @@ vdd_usb_vbus: regulator@9 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_hdmi: regulator@10 {
+	vdd_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_HDMI_5V0";
 		regulator-min-microvolt = <5000000>;
@@ -1673,7 +1673,7 @@ vdd_hdmi: regulator@10 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_cam_1v2: regulator@11 {
+	vdd_cam_1v2: regulator-vdd-cam-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-cam-1v2";
 		regulator-min-microvolt = <1200000>;
@@ -1683,7 +1683,7 @@ vdd_cam_1v2: regulator@11 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_cam_2v8: regulator@12 {
+	vdd_cam_2v8: regulator-vdd-cam-2v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-cam-2v8";
 		regulator-min-microvolt = <2800000>;
@@ -1693,7 +1693,7 @@ vdd_cam_2v8: regulator@12 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_cam_1v8: regulator@13 {
+	vdd_cam_1v8: regulator-vdd-cam-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-cam-1v8";
 		regulator-min-microvolt = <1800000>;
@@ -1703,7 +1703,7 @@ vdd_cam_1v8: regulator@13 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_usb_vbus_otg: regulator@14 {
+	vdd_usb_vbus_otg: regulator-vdd-usb-vbus-otg {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_VBUS_EN0";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index ed73c3a0c140..5cfbc0394173 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1635,7 +1635,7 @@ psci {
 		method = "smc";
 	};
 
-	battery_reg: regulator@0 {
+	battery_reg: regulator-vdd-ac-bat {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-ac-bat";
 		regulator-min-microvolt = <5000000>;
@@ -1643,7 +1643,7 @@ battery_reg: regulator@0 {
 		regulator-always-on;
 	};
 
-	vdd_3v3: regulator@1 {
+	vdd_3v3: regulator-vdd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-3v3";
 		regulator-enable-ramp-delay = <160>;
@@ -1655,7 +1655,7 @@ vdd_3v3: regulator@1 {
 		enable-active-high;
 	};
 
-	max77620_gpio7: regulator@2 {
+	max77620_gpio7: regulator-max77620-gpio7 {
 		compatible = "regulator-fixed";
 		regulator-name = "max77620-gpio7";
 		regulator-enable-ramp-delay = <240>;
@@ -1669,7 +1669,7 @@ max77620_gpio7: regulator@2 {
 		enable-active-high;
 	};
 
-	lcd_bl_en: regulator@3 {
+	lcd_bl_en: regulator-lcd-bl-en {
 		compatible = "regulator-fixed";
 		regulator-name = "lcd-bl-en";
 		regulator-min-microvolt = <1800000>;
@@ -1680,7 +1680,7 @@ lcd_bl_en: regulator@3 {
 		enable-active-high;
 	};
 
-	en_vdd_sd: regulator@4 {
+	en_vdd_sd: regulator-vdd-sd {
 		compatible = "regulator-fixed";
 		regulator-name = "en-vdd-sd";
 		regulator-enable-ramp-delay = <472>;
@@ -1692,7 +1692,7 @@ en_vdd_sd: regulator@4 {
 		enable-active-high;
 	};
 
-	en_vdd_cam: regulator@5 {
+	en_vdd_cam: regulator-vdd-cam {
 		compatible = "regulator-fixed";
 		regulator-name = "en-vdd-cam";
 		regulator-min-microvolt = <1800000>;
@@ -1702,7 +1702,7 @@ en_vdd_cam: regulator@5 {
 		enable-active-high;
 	};
 
-	vdd_sys_boost: regulator@6 {
+	vdd_sys_boost: regulator-vdd-sys-boost {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-sys-boost";
 		regulator-enable-ramp-delay = <3090>;
@@ -1714,7 +1714,7 @@ vdd_sys_boost: regulator@6 {
 		enable-active-high;
 	};
 
-	vdd_hdmi: regulator@7 {
+	vdd_hdmi: regulator-vdd-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-hdmi";
 		regulator-enable-ramp-delay = <468>;
@@ -1727,21 +1727,21 @@ vdd_hdmi: regulator@7 {
 		enable-active-high;
 	};
 
-	en_vdd_cpu_fixed: regulator@8 {
+	en_vdd_cpu_fixed: regulator-vdd-cpu-fixed {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-cpu-fixed";
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <1000000>;
 	};
 
-	vdd_aux_3v3: regulator@9 {
+	vdd_aux_3v3: regulator-vdd-aux-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "aux-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vdd_snsr_pm: regulator@10 {
+	vdd_snsr_pm: regulator-vdd-snsr-pm {
 		compatible = "regulator-fixed";
 		regulator-name = "snsr_pm";
 		regulator-min-microvolt = <3300000>;
@@ -1750,7 +1750,7 @@ vdd_snsr_pm: regulator@10 {
 		enable-active-high;
 	};
 
-	vdd_usb_5v0: regulator@11 {
+	vdd_usb_5v0: regulator-vdd-usb-5v0 {
 		compatible = "regulator-fixed";
 		status = "disabled";
 		regulator-name = "vdd-usb-5v0";
@@ -1761,7 +1761,7 @@ vdd_usb_5v0: regulator@11 {
 		enable-active-high;
 	};
 
-	vdd_cdc_1v2_aud: regulator@101 {
+	vdd_cdc_1v2_aud: regulator-vdd-cdc-1v2-aud {
 		compatible = "regulator-fixed";
 		status = "disabled";
 		regulator-name = "vdd_cdc_1v2_aud";
@@ -1772,7 +1772,7 @@ vdd_cdc_1v2_aud: regulator@101 {
 		enable-active-high;
 	};
 
-	vdd_disp_3v0: regulator@12 {
+	vdd_disp_3v0: regulator-vdd-disp-3v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-disp-3v0";
 		regulator-enable-ramp-delay = <232>;
@@ -1784,7 +1784,7 @@ vdd_disp_3v0: regulator@12 {
 		enable-active-high;
 	};
 
-	vdd_fan: regulator@13 {
+	vdd_fan: regulator-vdd-fan {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-fan";
 		regulator-enable-ramp-delay = <284>;
@@ -1795,7 +1795,7 @@ vdd_fan: regulator@13 {
 		enable-active-high;
 	};
 
-	usb_vbus1: regulator@14 {
+	usb_vbus1: regulator-usb-vbus1 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus1";
 		regulator-min-microvolt = <5000000>;
@@ -1806,7 +1806,7 @@ usb_vbus1: regulator@14 {
 		gpio-open-drain;
 	};
 
-	usb_vbus2: regulator@15 {
+	usb_vbus2: regulator-usb-vbus2 {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus2";
 		regulator-min-microvolt = <5000000>;
@@ -1817,7 +1817,7 @@ usb_vbus2: regulator@15 {
 		gpio-open-drain;
 	};
 
-	vdd_3v3_eth: regulator@16 {
+	vdd_3v3_eth: regulator-vdd-3v3-eth {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd-3v3-eth-a02";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index cbd8cda48f37..283b50febb6f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -1762,7 +1762,7 @@ psci {
 		method = "smc";
 	};
 
-	vdd_5v0_sys: regulator@0 {
+	vdd_5v0_sys: regulator-vdd-5v0-sys {
 		compatible = "regulator-fixed";
 
 		regulator-name = "VDD_5V0_SYS";
@@ -1772,7 +1772,7 @@ vdd_5v0_sys: regulator@0 {
 		regulator-boot-on;
 	};
 
-	vdd_3v3_sys: regulator@1 {
+	vdd_3v3_sys: regulator-vdd-3v3-sys {
 		compatible = "regulator-fixed";
 
 		regulator-name = "VDD_3V3_SYS";
@@ -1789,7 +1789,7 @@ vdd_3v3_sys: regulator@1 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_3v3_sd: regulator@2 {
+	vdd_3v3_sd: regulator-vdd-3v3-sd {
 		compatible = "regulator-fixed";
 
 		regulator-name = "VDD_3V3_SD";
@@ -1802,7 +1802,7 @@ vdd_3v3_sd: regulator@2 {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_hdmi: regulator@3 {
+	vdd_hdmi: regulator-vdd-hdmi-5v0 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "VDD_HDMI_5V0";
@@ -1812,7 +1812,7 @@ vdd_hdmi: regulator@3 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_hub_3v3: regulator@4 {
+	vdd_hub_3v3: regulator-vdd-hub-3v3 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "VDD_HUB_3V3";
@@ -1825,7 +1825,7 @@ vdd_hub_3v3: regulator@4 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_cpu: regulator@5 {
+	vdd_cpu: regulator-vdd-cpu {
 		compatible = "regulator-fixed";
 
 		regulator-name = "VDD_CPU";
@@ -1840,7 +1840,7 @@ vdd_cpu: regulator@5 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	vdd_gpu: regulator@6 {
+	vdd_gpu: regulator-vdd-gpu {
 		compatible = "pwm-regulator";
 		pwms = <&pwm 1 8000>;
 
@@ -1855,7 +1855,7 @@ vdd_gpu: regulator@6 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
-	avdd_io_edp_1v05: regulator@7 {
+	avdd_io_edp_1v05: regulator-avdd-io-epd-1v05 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "AVDD_IO_EDP_1V05";
@@ -1868,7 +1868,7 @@ avdd_io_edp_1v05: regulator@7 {
 		vin-supply = <&avdd_1v05_pll>;
 	};
 
-	vdd_5v0_usb: regulator@8 {
+	vdd_5v0_usb: regulator-vdd-5v-usb {
 		compatible = "regulator-fixed";
 
 		regulator-name = "VDD_5V_USB";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 43ff5e4bda19..6d59c28ff2a3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1807,7 +1807,7 @@ psci {
 		method = "smc";
 	};
 
-	ppvar_sys: regulator@0 {
+	ppvar_sys: regulator-ppvar-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "PPVAR_SYS";
 		regulator-min-microvolt = <4400000>;
@@ -1815,7 +1815,7 @@ ppvar_sys: regulator@0 {
 		regulator-always-on;
 	};
 
-	pplcd_vdd: regulator@1 {
+	pplcd_vdd: regulator-pplcd-vdd {
 		compatible = "regulator-fixed";
 		regulator-name = "PPLCD_VDD";
 		regulator-min-microvolt = <4400000>;
@@ -1825,7 +1825,7 @@ pplcd_vdd: regulator@1 {
 		regulator-boot-on;
 	};
 
-	pp3000_always: regulator@2 {
+	pp3000_always: regulator-pp3000-always {
 		compatible = "regulator-fixed";
 		regulator-name = "PP3000_ALWAYS";
 		regulator-min-microvolt = <3000000>;
@@ -1833,7 +1833,7 @@ pp3000_always: regulator@2 {
 		regulator-always-on;
 	};
 
-	pp3300: regulator@3 {
+	pp3300: regulator-pp3000 {
 		compatible = "regulator-fixed";
 		regulator-name = "PP3300";
 		regulator-min-microvolt = <3300000>;
@@ -1843,7 +1843,7 @@ pp3300: regulator@3 {
 		enable-active-high;
 	};
 
-	pp5000: regulator@4 {
+	pp5000: regulator-pp5000 {
 		compatible = "regulator-fixed";
 		regulator-name = "PP5000";
 		regulator-min-microvolt = <5000000>;
@@ -1851,7 +1851,7 @@ pp5000: regulator@4 {
 		regulator-always-on;
 	};
 
-	pp1800_lcdio: regulator@5 {
+	pp1800_lcdio: regulator-pp1800-lcdio {
 		compatible = "regulator-fixed";
 		regulator-name = "PP1800_LCDIO";
 		regulator-min-microvolt = <1800000>;
@@ -1861,7 +1861,7 @@ pp1800_lcdio: regulator@5 {
 		regulator-boot-on;
 	};
 
-	pp1800_cam: regulator@6 {
+	pp1800_cam: regulator-pp1800-cam {
 		compatible = "regulator-fixed";
 		regulator-name = "PP1800_CAM";
 		regulator-min-microvolt = <1800000>;
@@ -1870,7 +1870,7 @@ pp1800_cam: regulator@6 {
 		enable-active-high;
 	};
 
-	usbc_vbus: regulator@7 {
+	usbc_vbus: regulator-usbc-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USBC_VBUS";
 		regulator-min-microvolt = <5000000>;
-- 
2.34.1

