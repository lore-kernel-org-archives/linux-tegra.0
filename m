Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0143DC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhLIR3H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbhLIR3D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:03 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A4EC0617A1
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:27 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so4693335wmd.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=InVeFGwIFbUx218EAJrK00TNaBRidGrPiVyHmyhPZzY=;
        b=bEuN3kJRrTjPgvnTKgKjeDABTS9zMnBERtvJBWtdkVwNX3U48elBklWDISD5qgGp9v
         6taf/5G0Ti/4Z6ur7uUjZxDMow4t4boXs7OgIbWIcKU6Kb/HSMM1FObuOS6Ctyf0Z+ZA
         tUzw/DvTOtDYpPnNdOetzDrIdxKEC49gi2bHzQdbhGb75Oog5kZB0ICoUAiMxamkAohD
         mCY9Zh/xHg1dQkFpOoQqgbr1EJON+K+Tp1LknZ1ObQyIEy0fi8thEMoVz/YcaoL5u+A+
         InEEtj6ZArAdcpvtSczTkGhh9+7LdGGPfM66w1I1UOg6M7hpqOAN6yQjV6jtHBFdWxI1
         6BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=InVeFGwIFbUx218EAJrK00TNaBRidGrPiVyHmyhPZzY=;
        b=zKPTxPf0zlG5uuMbP6DJJj3hAPpQCDK7NJerkZ58nsDCumAQ88i7Pq5ydHnF/ChKGD
         s1m96RWKpg1UqNowbFyk2gmfcEawuXfXBiAWFhqeG3GIWPrXuXQaJfCiGGTZbJOafY/a
         +r1Bx9CCSDJsBwwo5JIuvlGrpKsnFpGTiMasf57RChWdv1xLHAzbDAGi0JnPD2WVAtX2
         aT0u/mhhLC61VEmy4XGaLkmKrGnfAq+bzpr8QbhYNFgrfy0pl1krB8JK1KtK6kCY6Y+m
         d8R/vlf54a9PKzydfdhods/1uzic0CVpIrWKnDk2I7HtC4CuS42G3xAnrlBfmpHwVdFX
         Zhtw==
X-Gm-Message-State: AOAM533Ubt/ctmzKmXX4Yn/YlspbZtq0OJIP6WxY/5ZAP4H6wdj+KXDh
        G76sRwtfC5JmvUoaGx5ZaH4=
X-Google-Smtp-Source: ABdhPJzUopmPu48ARd/eO/KWUNQYXdEE1zLe+3dhUjYUCeo2A+msXhJk/Kbu86T+opkJeA7YbMBaMQ==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr8958428wmi.46.1639070725877;
        Thu, 09 Dec 2021 09:25:25 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l21sm285902wrb.38.2021.12.09.09.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:24 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 08/30] arm64: tegra: Fix Tegra132 I2C compatible string list
Date:   Thu,  9 Dec 2021 18:24:41 +0100
Message-Id: <20211209172503.617716-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The I2C controller found on Tegra124 is not fully compatible with the
Tegra114 version, so drop the fallback compatible string from the list.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 7f5cbcd63a25..0e8903027f04 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -400,7 +400,7 @@ pwm: pwm@7000a000 {
 	};
 
 	i2c@7000c000 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c000 0x0 0x100>;
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -415,7 +415,7 @@ i2c@7000c000 {
 	};
 
 	i2c@7000c400 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c400 0x0 0x100>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -430,7 +430,7 @@ i2c@7000c400 {
 	};
 
 	i2c@7000c500 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c500 0x0 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -445,7 +445,7 @@ i2c@7000c500 {
 	};
 
 	i2c@7000c700 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c700 0x0 0x100>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -460,7 +460,7 @@ i2c@7000c700 {
 	};
 
 	i2c@7000d000 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000d000 0x0 0x100>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -475,7 +475,7 @@ i2c@7000d000 {
 	};
 
 	i2c@7000d100 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000d100 0x0 0x100>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
-- 
2.34.1

