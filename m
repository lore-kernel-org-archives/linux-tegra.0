Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C5BC433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbhLIRhr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236684AbhLIRhr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:47 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94881C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:13 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso4676488wmr.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pXWGTWR7RW7YQXrBlSccx4/GYB8XMw2ogccuJY7SV5I=;
        b=il/Lldnmjv2Ras8+CCbSeg61YiqeZdPYQnVbQFUqgHn8AkFsUfWcfJBnUu1QYVtmJF
         BLDoIHY27FYfOE6IQJAlwakz75zZpmuXyyUc3XX9fbeGoAQ6WntHsSgx1xEHrLx5MmHc
         kdgZhTND6/vEQ+WPcrFhPDcTymSTLAsVcK6xF0HeH5i35b79OP7K7OQJxY6Dpehru0Cg
         4AjQ3FsCoAoH5frg4dY7xd7ORzqtb7r4jJrunQBM7qAJcMIb1KdZWDPNcWP6dy6mH2wU
         lOPD7n3oUXWlwdeVXkjXqTO+G736pgxmkUhifdFH9DCV7Y6M1pA/4JNjuNYXIBwMDNQS
         pIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pXWGTWR7RW7YQXrBlSccx4/GYB8XMw2ogccuJY7SV5I=;
        b=u3XwSuUEFOATJfUNcPsyxSrbzD7JjA+SP40sQ+DEoJzljQArRZIDI9wGoO0jfN9SBe
         q17U/tsaLoiV0tGOrzsX1xC3zA774ibiUOrr8s7z09MYF+V3lyxZNGuecV3axo8H8F9L
         wjypba8O/NQWeXDt5rH1IuNnX9JFwK059HWWfCBtn2iW42ViCYi9YfM+gtNkCic0PCLG
         2d4DQrM17p+MgjW3MeDLCH8rpAd6D7m2mgScRlfqSzxnTytEf27a5Ir1WVu9f5V6sm0B
         3G89AIgAMsjbdE/BWQJ+/8tSCQuPP6X58WIxwAv71NCl4cTee2ur1ydGCdLENPnHG9KI
         PcXg==
X-Gm-Message-State: AOAM530cmXrxpDoXpf+7ev/SLjWatsTVURVJrg35Uz1z6QKccuCmYWBQ
        ri66f6yb2ejGbSDW53rWptU=
X-Google-Smtp-Source: ABdhPJxVvRH1BhnvRni4Djjpl7AeIvOAya2BJ8SfSsFKK/4r1Q6KPAf8XrNgmszQIvvNIcs/AeAAjg==
X-Received: by 2002:a05:600c:4113:: with SMTP id j19mr9232891wmi.48.1639071251991;
        Thu, 09 Dec 2021 09:34:11 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m9sm521614wmq.1.2021.12.09.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:11 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 04/25] ARM: tegra: Rename top-level clocks
Date:   Thu,  9 Dec 2021 18:33:35 +0100
Message-Id: <20211209173356.618460-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Clocks defined at the top level in device tree are no longer part of a
simple bus and therefore don't have a reg property. Nodes without a reg
property shouldn't have a unit-address either, so drop the unit address
from the node names. To ensure nodes aren't duplicated (in which case
they would end up merged in the final DTB), append the name of the clock
to the node name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts                    | 2 +-
 arch/arm/boot/dts/tegra114-roth.dts                       | 2 +-
 arch/arm/boot/dts/tegra114-tn7.dts                        | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts                 | 2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi                      | 2 +-
 arch/arm/boot/dts/tegra124-venice2.dts                    | 2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 4 ++--
 arch/arm/boot/dts/tegra20-harmony.dts                     | 2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                       | 2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts                    | 2 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi                   | 2 +-
 arch/arm/boot/dts/tegra20-trimslice.dts                   | 2 +-
 arch/arm/boot/dts/tegra20-ventana.dts                     | 2 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 2 +-
 arch/arm/boot/dts/tegra30-beaver.dts                      | 2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
 16 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index e64199ba82cb..ad8116780dc9 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1152,7 +1152,7 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegra114-roth.dts
index 71a2806c0f59..ed6ebbf008e1 100644
--- a/arch/arm/boot/dts/tegra114-roth.dts
+++ b/arch/arm/boot/dts/tegra114-roth.dts
@@ -1016,7 +1016,7 @@ backlight: backlight {
 		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 753130b1e37b..36717331101e 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -273,7 +273,7 @@ backlight: backlight {
 		power-supply = <&lcd_bl_en>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index b2b3eea81232..f59135b93cb0 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1869,7 +1869,7 @@ usb-phy@7d008000 {
 		vbus-supply = <&vdd_usb3_vbus>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 63a81270300a..f15623f83893 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -582,7 +582,7 @@ backlight: backlight {
 			 256>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 02cf986c7567..14eeb1242b15 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -1062,7 +1062,7 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 23d3f8daab23..be5ef6745ac8 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -827,7 +827,7 @@ bat1010: battery-2s1p {
 	};
 
 	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
@@ -839,7 +839,7 @@ clk32k_in: clock@0 {
 	 * oscillator is used as a reference clock-source by the
 	 * Azurewave WiFi/BT module.
 	 */
-	rtc_32k_wifi: clock@1 {
+	rtc_32k_wifi: clock-rtc-32k-wifi {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index ae4312eedcbd..4d137461f3c4 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -640,7 +640,7 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 5b38b0606f99..d3d24523553e 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -575,7 +575,7 @@ backlight: backlight {
 		default-brightness-level = <10>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index 92d494b8c3d2..ffeae5da22e7 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -792,7 +792,7 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
index dd4d506683de..d5f1a46da0bc 100644
--- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
@@ -502,7 +502,7 @@ mmc@c8000600 {
 		status = "okay";
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index beae368f827a..49c3b3bfac51 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -380,7 +380,7 @@ mmc@c8000600 {
 		bus-width = <4>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 5a2578b3707f..ef97457f1334 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -606,7 +606,7 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 07d4ea130964..72159eb55a3d 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1069,7 +1069,7 @@ battery_cell: battery-cell {
 	};
 
 	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index f724abcdb1a5..91ecca0be5a2 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1967,7 +1967,7 @@ usb-phy@7d008000 {
 		status = "okay";
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index e7bfe0e5ee06..6074885280fc 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -434,7 +434,7 @@ backlight: backlight {
 		default-brightness-level = <6>;
 	};
 
-	clk32k_in: clock@0 {
+	clk32k_in: clock-32k {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
 		#clock-cells = <0>;
-- 
2.34.1

