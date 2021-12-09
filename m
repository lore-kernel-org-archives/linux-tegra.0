Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0702EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbhLIR3P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbhLIR3N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:13 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E43AC0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:39 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso4658715wmr.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2/NWvwWZ1OE6OkioKorg51qNDChPG5eIjil7W5cXpdY=;
        b=V1nd22iNaTOYiXq2Tk10SKDRfnt0wsBy406og90rtRZBTUCclK9eZ8GdZLYfKiQgr8
         vV3j+kHZbOvkQ43hUKSPPfEGFGHuCyN1QgcAJ5wjvhBnJvK2MwByAm20as6boY5VVEIG
         3aC1V760XfCsNKt7n01HgQoUF5Sp99bumkgXbPToVTtHf9rNm5R9tXLgS6yY4+Yxb+V6
         qaPgcIbh5M5PhpeJIzuKEDDaXksjq9+55ogyhciicEx0nxBsGT6hMca0/EnvMNX8N/9b
         JTPue6RGDjW7w52Gx/Klt+K0srZzgkqqiOFtkycEMc8ChNxi497rTo4qI646FCxeOxpu
         cKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2/NWvwWZ1OE6OkioKorg51qNDChPG5eIjil7W5cXpdY=;
        b=KWzd7ONnYPc1u6bgLSI3HTitQqt306N8GWmDUDg6IY2MzwiN/FnN6sMtMBbFU++fFq
         vSGwHcVZfFayjowhZbmZBj3Y0Gc9rPxE7kM2VhtSI8MNIybozXWk86HV2lfiqFfqENzp
         tcRa+JXlW+sxC6iDI/aNwRKiRFnxZwbGMZQ1swK4uNUoorg/HtdF5wSkZeUgCThSDY77
         Eps/ojHVoyzU9GEm6rpIVukyAt8JhuJo1ZvPbjAjapftWtiecFUbeNwBHrFYrHKv7h1P
         NXa96qW2kBvICJ2YtFpjtWaOU1AAFWmarWg4N1KZzjkw02q/bvpxLRVUop4t3ysgipBu
         PSVQ==
X-Gm-Message-State: AOAM530U2GUW7soVYVi7QK6LM2BjnvEx/nAnjfxE4yHsirJ1yJfQGSFb
        0Paq/zMJ0cr1Ryamy5lpshMfQ5gRxeWRHQ==
X-Google-Smtp-Source: ABdhPJw/2mDZ6FTNCgEhm7oOfXmC4ZUNHYiWamnb1lzFo4UxSiePPGIQKvXuySAbBwfaVqL2MdOuWQ==
X-Received: by 2002:a05:600c:35c8:: with SMTP id r8mr9062013wmq.8.1639070737940;
        Thu, 09 Dec 2021 09:25:37 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id s22sm783730wmc.1.2021.12.09.09.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 13/30] arm64: tegra: Fix Tegra186 compatible string list
Date:   Thu,  9 Dec 2021 18:24:46 +0100
Message-Id: <20211209172503.617716-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The I2C controller found on Tegra186 is not fully compatible with the
Tegra210 version, so drop the fallback compatible string from the list.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index f4642ceacc63..e8886c9f54da 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -585,7 +585,7 @@ uartf: serial@3150000 {
 	};
 
 	gen1_i2c: i2c@3160000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x03160000 0x0 0x10000>;
 		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -598,7 +598,7 @@ gen1_i2c: i2c@3160000 {
 	};
 
 	cam_i2c: i2c@3180000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x03180000 0x0 0x10000>;
 		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -612,7 +612,7 @@ cam_i2c: i2c@3180000 {
 
 	/* shares pads with dpaux1 */
 	dp_aux_ch1_i2c: i2c@3190000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x03190000 0x0 0x10000>;
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -629,7 +629,7 @@ dp_aux_ch1_i2c: i2c@3190000 {
 
 	/* controlled by BPMP, should not be enabled */
 	pwr_i2c: i2c@31a0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x031a0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -643,7 +643,7 @@ pwr_i2c: i2c@31a0000 {
 
 	/* shares pads with dpaux0 */
 	dp_aux_ch0_i2c: i2c@31b0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x031b0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -659,7 +659,7 @@ dp_aux_ch0_i2c: i2c@31b0000 {
 	};
 
 	gen7_i2c: i2c@31c0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x031c0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -672,7 +672,7 @@ gen7_i2c: i2c@31c0000 {
 	};
 
 	gen9_i2c: i2c@31e0000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x031e0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -1089,7 +1089,7 @@ hsp_top0: hsp@3c00000 {
 	};
 
 	gen2_i2c: i2c@c240000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x0c240000 0x0 0x10000>;
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -1102,7 +1102,7 @@ gen2_i2c: i2c@c240000 {
 	};
 
 	gen8_i2c: i2c@c250000 {
-		compatible = "nvidia,tegra186-i2c", "nvidia,tegra210-i2c";
+		compatible = "nvidia,tegra186-i2c";
 		reg = <0x0 0x0c250000 0x0 0x10000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
-- 
2.34.1

