Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4361C4743C
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDFA261261
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFUONv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhFUONt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 10:13:49 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387CFC061574;
        Mon, 21 Jun 2021 07:11:33 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h21-20020a1ccc150000b02901d4d33c5ca0so71887wmb.3;
        Mon, 21 Jun 2021 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdGiCNkhBuL+OIE+P10VzLCe1hptfAhJdgsupjreUXA=;
        b=aN+s+IzSaufFbA4kwq5oTJprJTJMRkr6q6vE6oACYlNyBHdf7aMoFhD1n1Cr3L75NI
         YAbmsNPq8pbrG/Zo0s1kGankarWpq6ODBn9HU062pgHRrJkthzkx12A/Lv+/UnIPZvG2
         ZM/GMgr2tgjY56dAFg8tyrqP4kPtEksqeVtHwppWfYCcPxs0cHb87iHOtLYPC8QxjR7P
         bf4PQ/6Vtm3uq7gcQZeDSofChuqhNiQLNMz8OnJTD0qvJ6k3TsfALOFhAvG8AExlXV4w
         7w3c+Z5qrYiA/kZoC9jmbfcOihiCyDzhg9YQr4l8mYp4RLq6hg1d7355rTQFQYM2+BHf
         hKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdGiCNkhBuL+OIE+P10VzLCe1hptfAhJdgsupjreUXA=;
        b=a0Jn5dQ3QvzF7QDNKzJS3Qzt8zxfbhaGmmDKQ8ZPv0NbN9AVLJTpt00Ils4bdtZzem
         rTV4Ru0Wxw5NTKTmP7QPcRV/iU00kAMOJX5YbxmlGHIkKLxjrArmqpJCQOA6xue1E13v
         hyuayWgmlDcKwGDOAtO2IRPgXh55DfQxWLI3yIiENh+bResgS97/Mis63/ki1HPOPF2y
         ZsuHtpd9ejFergEccYCnSHgdGx6d8QEEyot6wuR7resrIREYiIiAVjzGyif9KpycW7QE
         wh5fBKwj4BM72ymR31F4NXAJhJ+SX7LaajNYW1Er5/6gd2aymRNvBHxPaddKiDjZwqqg
         2eTg==
X-Gm-Message-State: AOAM530USbxrysA5cbaNfo9kda1gj6qFaJk4EMj4Igbs5jcC2soE0D45
        68iXThHFb8cWR5zbn0gcUX8=
X-Google-Smtp-Source: ABdhPJybf27OxyYb4zuJIDKInjj+JNVO3Lb5zWh3YIdoUSwKAeYrxdZk0QR5uVDqLTJ6MM25z1KU1g==
X-Received: by 2002:a05:600c:2051:: with SMTP id p17mr14280552wmg.35.1624284691843;
        Mon, 21 Jun 2021 07:11:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d4sm5667446wmd.42.2021.06.21.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 07:11:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: tegra: Remove useless usb-ehci compatible string
Date:   Mon, 21 Jun 2021 16:13:26 +0200
Message-Id: <20210621141327.2880579-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

There's no such thing as a generic USB EHCI controller. The EHCI
controllers found on Tegra SoCs are instantiations that need Tegra-
specific glue to work properly, so drop the generic compatible string
and keep only the Tegra-specific ones.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 4 ++--
 arch/arm/boot/dts/tegra124.dtsi | 6 +++---
 arch/arm/boot/dts/tegra20.dtsi  | 7 +++----
 arch/arm/boot/dts/tegra30.dtsi  | 6 +++---
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index fb99b3e971c3..e743fdf29cc3 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -691,7 +691,7 @@ mmc@78000600 {
 	};
 
 	usb@7d000000 {
-		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci";
 		reg = <0x7d000000 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -729,7 +729,7 @@ phy1: usb-phy@7d000000 {
 	};
 
 	usb@7d008000 {
-		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra114-ehci", "nvidia,tegra30-ehci";
 		reg = <0x7d008000 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 8b38f123f554..64140c09451a 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -1079,7 +1079,7 @@ tegra_i2s4: i2s@70301400 {
 	};
 
 	usb@7d000000 {
-		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d000000 0x0 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -1117,7 +1117,7 @@ phy1: usb-phy@7d000000 {
 	};
 
 	usb@7d004000 {
-		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d004000 0x0 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -1154,7 +1154,7 @@ phy2: usb-phy@7d004000 {
 	};
 
 	usb@7d008000 {
-		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d008000 0x0 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 6ce498178105..d60d048ea245 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -744,11 +744,10 @@ pci@2,0 {
 	};
 
 	usb@c5000000 {
-		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		compatible = "nvidia,tegra20-ehci";
 		reg = <0xc5000000 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
-		nvidia,has-legacy-mode;
 		clocks = <&tegra_car TEGRA20_CLK_USBD>;
 		resets = <&tegra_car 22>;
 		reset-names = "usb";
@@ -783,7 +782,7 @@ phy1: usb-phy@c5000000 {
 	};
 
 	usb@c5004000 {
-		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		compatible = "nvidia,tegra20-ehci";
 		reg = <0xc5004000 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "ulpi";
@@ -809,7 +808,7 @@ phy2: usb-phy@c5004000 {
 	};
 
 	usb@c5008000 {
-		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		compatible = "nvidia,tegra20-ehci";
 		reg = <0xc5008000 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index c577c191be4b..e4a5966ae341 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -943,7 +943,7 @@ mmc@78000600 {
 	};
 
 	usb@7d000000 {
-		compatible = "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra30-ehci";
 		reg = <0x7d000000 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -983,7 +983,7 @@ phy1: usb-phy@7d000000 {
 	};
 
 	usb@7d004000 {
-		compatible = "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra30-ehci";
 		reg = <0x7d004000 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -1021,7 +1021,7 @@ phy2: usb-phy@7d004000 {
 	};
 
 	usb@7d008000 {
-		compatible = "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra30-ehci";
 		reg = <0x7d008000 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
-- 
2.32.0

