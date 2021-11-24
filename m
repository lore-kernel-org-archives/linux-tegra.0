Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A29C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 21:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351598AbhKXVEi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 16:04:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344987AbhKXVE2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 16:04:28 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A031C0613F2;
        Wed, 24 Nov 2021 13:01:11 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l22so10590725lfg.7;
        Wed, 24 Nov 2021 13:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z+2i2S1W26dZ7VgKg6S5rlGKr4ZHMsx/PFUfrnnRofM=;
        b=H1IC1Rhg/sbKX/bv67zOzLmbDWcxbXgXk4Ne1rzPtB5APbLXwJOY6qLue9KTSkpDSl
         bH8BK94KVem+P1sh4DJmR6j2SJeZREqc15HSDE/o/rzB3LXJjNPYXYhHSKX9y25KxyEZ
         JPci2k36KcN/eY4TsiGZ4EqQ8NAz0hKjaSc3D8ctkK/YhffNRNttb6ZT9j6OuDtj5KyL
         ec7FPwKNAGBuu6srsy1b0z2oiZ7qHsoXPjRkUPQ8SWH+3yWzpBQbJRqZYZzj9tGm46ZL
         e/Yo6/ApEXIB/4VFRrJO+bi+ZPp4zRflScF4Z2mY3n7iymk5im79zQ2zApCHGw1C64Lx
         9s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+2i2S1W26dZ7VgKg6S5rlGKr4ZHMsx/PFUfrnnRofM=;
        b=O4YWtCrDSvpM4uMUfv/A1r4hiHpFmyHOWUj1wU/tIM5PXRUFhgtI85yr3ROhtQsCut
         JhttjYno9gXOw8O1lOOq2ZMnh0H6EWAOOGOuaaB9v88BA6or4xsEuUhT4vwK8Ta7tP7t
         YY+Fq2YgCAc3ys7bzez/NYZSlsZgtPHeO0botkwsvm8KE4MIa7nYmdAiL3dBZReXP9U/
         O1EKGphWygGt3aL0tVBD2Qkscuda1w8NCXdn4MzxYBKRDJ7P6JNEJJVew2F+dgoSSnSU
         otaLX3M7v5mZcqD+uaL4mGxqHlVPTgvdwohkxTpUprc/75ZqUDmzHknB69xnauV8A3hL
         Reyw==
X-Gm-Message-State: AOAM530sdOruHh7aJ0h0JeSrCimL+VQcSiHUDChqHk5en33S5+aLM0aL
        AdIEDDiWrx7taY8eHkyvZEU=
X-Google-Smtp-Source: ABdhPJxwVXRjMxfXHFPggEeoeb2RUtSroGUsGFe0QDZE+1jFQERbvQgv46guVSx4JQ5gFj6JWDvq8w==
X-Received: by 2002:a05:6512:398b:: with SMTP id j11mr18324072lfu.461.1637787669517;
        Wed, 24 Nov 2021 13:01:09 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id 18sm79939ljr.17.2021.11.24.13.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:01:09 -0800 (PST)
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
Subject: [PATCH v2 14/14] ARM: tegra: Enable video decoder on Tegra114
Date:   Wed, 24 Nov 2021 23:59:22 +0300
Message-Id: <20211124205922.11930-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124205922.11930-1-digetx@gmail.com>
References: <20211124205922.11930-1-digetx@gmail.com>
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

