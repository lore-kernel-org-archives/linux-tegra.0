Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FFAC001B0
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbjGQQds (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjGQQdm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:33:42 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A7910DC;
        Mon, 17 Jul 2023 09:33:34 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so6686855a12.0;
        Mon, 17 Jul 2023 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611612; x=1692203612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0BtPzFopRLJh1Z6oxc0O6GlOfPDHfoi+8ZzkHDGuMc=;
        b=StnQKlXnYIIyzDLScfaiAj04w7kTJY9S5ja1KzFHvp7YbgHY8o8B1jUWd4gDSpcBRF
         DU6P8E60PtZUx6SgkR8FXPSjKnQsHfIRXSH0TUPqg9WYSMrTz/yd1yRCROgKFWkjfMa2
         X3WxhYeBUVOqdjYAE/3XEVvEkdYszNRsGApDlDtIaiHdwKHeyHBzzQiYPdAJCAOk/Yuh
         xQm1S+OiQUOlFXsvVkfdrArTAVH0pmqxYbzbSyQOdPk+Y25kxI1Kwg7OtuQzNoCeUzvh
         cpid2749SHlroTyrsNkz2AibGjONuXmO0VaYPuMtjtmt9G91JPHoiEg/JstZHHClQrZB
         2Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611612; x=1692203612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0BtPzFopRLJh1Z6oxc0O6GlOfPDHfoi+8ZzkHDGuMc=;
        b=DCrfVV17c9FVpRechpddfTdyYsdRLCcXGQ0m04J75Meq3Swqii0pyLEw2MzcwFmoZS
         TW7nBMY8EIWV+L09K5/b5aOVcSa+g61DmLBRfclghUzhLagvnnb/1Euo714y/25iPwbz
         RA+AXdi6tbytCE2KeETa0EqcvnTPCjQ61T+hBCo9IgE9nziz43TWgzrOPIATd/bjq2Zl
         znPgo73vQnWn9TFBDx/474y5Jezcab06uYXAuCjHT5gXLs1lk9HWQePRxHRCuUK++ORL
         nZqwo266YqtkapYHFS/dWzcbyB7vbsYjtvUVi5ZLzEYD81OpUNmzXFQiTe+yqL+5HaoT
         /09A==
X-Gm-Message-State: ABy/qLbTd6Aqpt4bc5PUXcdJnMUJLER5dHpTm+oRohYw6TJxpOxNbmJZ
        WVxLYEbhRnMTebnBdBGiMuqlDJ/ABqY=
X-Google-Smtp-Source: APBJJlGR9q/UcU8HhmHdJCx/TVbDqOknVDhyO3/7lKV89yEhJ+H1xalLmmQFmyO4s96hHxyz5Vv6Gg==
X-Received: by 2002:aa7:d7c7:0:b0:51d:d27a:6d3 with SMTP id e7-20020aa7d7c7000000b0051dd27a06d3mr12644975eds.11.1689611612230;
        Mon, 17 Jul 2023 09:33:32 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7d902000000b0051e0eba608bsm10156196edr.19.2023.07.17.09.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:33:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] ARM: tegra: Add missing reset-names for Tegra HS UART
Date:   Mon, 17 Jul 2023 18:33:29 +0200
Message-ID: <20230717163329.1033725-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717163329.1033725-1-thierry.reding@gmail.com>
References: <20230717163329.1033725-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The device tree bindings for the Tegra high-speed UART require the
reset-names property, so add it whenever the compatible string for the
serial port is overwritten.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi             | 3 +++
 arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi                  | 3 +++
 arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts               | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts         | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts                | 2 ++
 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi                  | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi              | 3 +++
 arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi                   | 3 +++
 .../boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi    | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi  | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi                   | 1 +
 arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi                  | 2 ++
 arch/arm/boot/dts/nvidia/tegra30-ouya.dts                      | 1 +
 arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts          | 2 ++
 14 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi
index 75cfe718737c..54b7da4b6920 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi
@@ -1557,16 +1557,19 @@ sdmmc3-clk-lb-out-pee4 { /* NC */
 
 	serial@70006040 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006200 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi b/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi
index 554c8089491c..c5a0d6aebaec 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi
@@ -1550,16 +1550,19 @@ sdmmc3-clk-lb-out-pee4 { /* NC */
 
 	serial@70006040 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006200 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
index 00b62ed243ec..f09109be1152 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
@@ -1385,6 +1385,7 @@ dsi_b {
 	 */
 	serial@70006000 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 	};
@@ -1398,6 +1399,7 @@ serial@70006000 {
 	 */
 	serial@70006040 {
 		compatible = "nvidia,tegra124-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
index 08b42952f4de..486fd244291e 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
@@ -393,12 +393,14 @@ tegra_i2s1: i2s@70002800 {
 
 	uartb: serial@70006040 {
 		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		/* GPS BCM4751 */
 	};
 
 	uartc: serial@70006200 {
 		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index 494d2d07def3..a3757b7daeda 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -450,12 +450,14 @@ i2s@70002800 {
 
 	serial@70006040 {
 		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		/* GPS BCM4751 */
 	};
 
 	serial@70006200 {
 		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi b/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
index 0e03910abbe6..16b374e6482f 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
@@ -453,11 +453,13 @@ tegra_ac97: ac97@70002000 {
 
 	serial@70006040 {
 		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra20-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
index f08a8c5f5e3e..bed869722b0b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
@@ -829,16 +829,19 @@ pv0 {
 
 	serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi b/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
index f4a3b3704618..3601f407e539 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
@@ -820,16 +820,19 @@ pv0 {
 
 	serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index c0062353c1f1..4fa6b20c4fdb 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
@@ -798,12 +798,14 @@ drive_gma {
 
 	uartb: serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		/* GPS BCM4751 */
 	};
 
 	uartc: serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index bdb898ad6262..ead95306840f 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -1088,6 +1088,7 @@ drive_sdio1 {
 
 	serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
@@ -1096,6 +1097,7 @@ serial@70006040 {
 
 	serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi b/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
index caefa7c2adda..0120859d6d72 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
@@ -177,6 +177,7 @@ serial@70006000 {
 
 	serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi b/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
index b61d30bd82ea..da2f5860ad54 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
@@ -710,11 +710,13 @@ pv0 {
 
 	serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
 	serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
index e3309908b1ca..7e3de26ca960 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
@@ -2004,6 +2004,7 @@ drive_groups {
 
 	uartc: serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
index 8d10eb8b48b9..c81d5875c31c 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
@@ -1110,6 +1110,7 @@ drive_lcd2 {
 
 	uartb: serial@70006040 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
@@ -1118,6 +1119,7 @@ uartb: serial@70006040 {
 
 	uartc: serial@70006200 {
 		compatible = "nvidia,tegra30-hsuart";
+		reset-names = "serial";
 		/delete-property/ reg-shift;
 		status = "okay";
 
-- 
2.41.0

