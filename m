Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA01C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBE8E60C40
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbhKNWF7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 17:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236226AbhKNWFj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 17:05:39 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40CBC06121E;
        Sun, 14 Nov 2021 14:02:09 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l22so38142847lfg.7;
        Sun, 14 Nov 2021 14:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z+2i2S1W26dZ7VgKg6S5rlGKr4ZHMsx/PFUfrnnRofM=;
        b=ml0J0tMgZcF3PFcv+WgJ8G2i3OK38mfIvBSe1YkPQgQzWRkqQpEKlUS94aX5MLAf1q
         Zu7oGmLI96Ci8pRAuf5XLkk/w0kbLBgdNXlvgVVEXtih0cG4vxszkAxFzX1xyISKK3Js
         B8aNm0nRGeYIsSGi5sRNLhndvdd2zu9Kblp2Jjp48R2mu894sePWKi62vTbadVVMCJUl
         sm0hmJ+8eB2pxlHWhHXZWPRPieTK1dUUWnL/js5TbIlhm18gldoPF6X77ZrVAhgYDisx
         vVJy2chgCIwPNGxR81CR6Gqb8YC11LG1JzYzPtcnA9tEpakTykeYfd9zv1UF+Ju3uoIw
         RK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+2i2S1W26dZ7VgKg6S5rlGKr4ZHMsx/PFUfrnnRofM=;
        b=ZfV0y+aYURk0i2+lReIn9JAmp9B3EENTqHEkLhm2AhoNG1sKzpg4EqU3vbtCtGgrAl
         Qc0sq1xLgXu79XuJQWiNp43XxFd3WUPexp8EIP+DF3p0rb/oBmkS0Okf1mPwLEsjX5AK
         3swvC5rRmikhmq/zse408o2TX3bS6S5KpMp/jMzahX5p4IRcKXLxjY3WVHGwaRj0O6Ck
         hI36TJickAAMwy2q/IV93gaZj3KnH5t3vpiECLMoO4KKy6UozdrK6xPBA2BYM9gz65R+
         WGaBkgzhwz7OfJ8IpAkL7In1A4S2QSU6vy2ZymHtpPAAPtdJAfjvagF9qb7s0j3FJd8o
         p2WQ==
X-Gm-Message-State: AOAM532Jya/50AygKxWKTzxJlPwyl5ZkKQIWEDYRfiatLclwJONCy8gw
        y3QYogZeW4f9oG8H4uOA8X4=
X-Google-Smtp-Source: ABdhPJx3NXWPyjm3WDEUY8rjJZV4QE5SX/fDMs2diV4puRAnxUyAH7i2dIonFsrlYtJPCgAc0hHNUg==
X-Received: by 2002:a05:6512:1284:: with SMTP id u4mr31653403lfs.342.1636927328204;
        Sun, 14 Nov 2021 14:02:08 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id t5sm1353842lfd.80.2021.11.14.14.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:02:07 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 14/14] ARM: tegra: Enable video decoder on Tegra114
Date:   Mon, 15 Nov 2021 01:01:19 +0300
Message-Id: <20211114220119.18909-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114220119.18909-1-digetx@gmail.com>
References: <20211114220119.18909-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Anton Bambura <jenneron@protonmail.com>

Add Video Decoder Engine node to Tegra114 device-tree.

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 563ee262f41d..3d08764401ce 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -17,6 +17,19 @@ memory@80000000 {
 		reg = <0x80000000 0x0>;
 	};
 
+	sram@40000000 {
+		compatible = "mmio-sram";
+		reg = <0x40000000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x40000000 0x40000>;
+
+		vde_pool: sram@400 {
+			reg = <0x400 0x3fc00>;
+			pool;
+		};
+	};
+
 	host1x@50000000 {
 		compatible = "nvidia,tegra114-host1x";
 		reg = <0x50000000 0x00028000>;
@@ -253,6 +266,30 @@ gpio: gpio@6000d000 {
 		*/
 	};
 
+	vde@6001a000 {
+		compatible = "nvidia,tegra114-vde";
+		reg = <0x6001a000 0x1000>, /* Syntax Engine */
+		      <0x6001b000 0x1000>, /* Video Bitstream Engine */
+		      <0x6001c000  0x100>, /* Macroblock Engine */
+		      <0x6001c200  0x100>, /* Post-processing Engine */
+		      <0x6001c400  0x100>, /* Motion Compensation Engine */
+		      <0x6001c600  0x100>, /* Transform Engine */
+		      <0x6001c800  0x100>, /* Pixel prediction block */
+		      <0x6001ca00  0x100>, /* Video DMA */
+		      <0x6001d800  0x400>; /* Video frame controls */
+		reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
+			    "tfe", "ppb", "vdma", "frameid";
+		iram = <&vde_pool>; /* IRAM region */
+		interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
+			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
+		interrupt-names = "sync-token", "bsev", "sxe";
+		clocks = <&tegra_car TEGRA114_CLK_VDE>;
+		reset-names = "vde", "mc";
+		resets = <&tegra_car 61>, <&mc TEGRA114_MC_RESET_VDE>;
+		iommus = <&mc TEGRA_SWGROUP_VDE>;
+	};
+
 	apbmisc@70000800 {
 		compatible = "nvidia,tegra114-apbmisc", "nvidia,tegra20-apbmisc";
 		reg = <0x70000800 0x64>, /* Chip revision */
@@ -543,6 +580,7 @@ mc: memory-controller@70019000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 
 		#iommu-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	ahub@70080000 {
-- 
2.33.1

