Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B08C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B07CD60F93
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbhKLMjH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:39:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbhKLMjH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:39:07 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B8BC061766;
        Fri, 12 Nov 2021 04:36:16 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d27so15263642wrb.6;
        Fri, 12 Nov 2021 04:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eMtyUZCPe3jI4M/02lrSTujHXoLLOzIpEv5CqhrxJIA=;
        b=ORYwHrY6Cluvd4is2krIsmv0j4cZ/F8qk1Ip1HBnGLT6F0bttmB2y+YD/1+A3BK3G+
         rZVgy0C6Dnv/5b1QQeLJXxXiOagJhwKUrYn6Q3DV8pf2Hme44HLKM4PeOTSyGVGLAEqS
         JTFAhvySZzjV3cgiyYz0tiQtz34R0FVxtDKa9qC9w0RMSXKU7NkIueyL+8BkOe9jCEck
         NrVM/ILDDa2mg3P6GLblJgLbsdO4Uteaf+nxbo+kUThW1HPSI7aShCmFLAqyVmqiInOX
         U7vaqUDZ2G5cpRGVAjxZXWOkdfB8GUCq85pzwY/wPKQyYpP0hyE6J8optwW3z5ONFCzO
         zGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eMtyUZCPe3jI4M/02lrSTujHXoLLOzIpEv5CqhrxJIA=;
        b=0NlyDhsgXO2+mMDkBYh4k4uTbp+Zu4BFv9UpYP8DAD8RrDsNKZGERjthdBAUxMoTwk
         NlJ7My0ks/QUZnjL4ydXaRCiFWcuGTKyMFrWalXUI+Q8CJETuOjaGJDavincoWTqm+Hl
         hwD0vK5EAJs9/VHnyFyePNFPAm09rznb9RNgUqy2K9+K3ka4XTVAofh3XyVFsxUOe6YV
         c5uZHVflkv7P5YNDTgu6k6RRaFXVhlpaTSZ21pH6av/pfrj8fAgTh5UqmJib1/PcCPW0
         61kD6NmyYdjfyCmLSUMSd4lI86+IRBMX+EY2Z4rQMzOXZWEgl7IPq70UW8SK5Dd6ISUN
         Z1Fg==
X-Gm-Message-State: AOAM531OtKia4VubDmHXqiAji5kZQZH4jh4lT/nOj5j9/tY2u8j3N3dr
        CsUjjHTHo6KBZHdhZIXS97c=
X-Google-Smtp-Source: ABdhPJyJAvRYR+npp+ec2spwLMLoe4eT3HeKLQOT95hE3RoP9Z7HgsKggh/XbIrvFEnMq3MVkPy2VA==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr18274967wrt.126.1636720574971;
        Fri, 12 Nov 2021 04:36:14 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d8sm5751109wrm.76.2021.11.12.04.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/11] arm64: tegra: Fill in properties for Tegra234 eMMC
Date:   Fri, 12 Nov 2021 13:35:40 +0100
Message-Id: <20211112123542.3680629-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add missing properties to the eMMC controller, as required to use it on
actual hardware.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 844cab44aee6..ffe300356e85 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -40,11 +40,24 @@ mmc@3460000 {
 			compatible = "nvidia,tegra234-sdhci", "nvidia,tegra186-sdhci";
 			reg = <0x03460000 0x20000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&bpmp TEGRA234_CLK_SDMMC4>;
-			clock-names = "sdhci";
+			clocks = <&bpmp TEGRA234_CLK_SDMMC4>,
+				 <&bpmp TEGRA234_CLK_SDMMC_LEGACY_TM>;
+			clock-names = "sdhci", "tmclk";
+			assigned-clocks = <&bpmp TEGRA234_CLK_SDMMC4>,
+					  <&bpmp TEGRA234_CLK_PLLC4>;
+			assigned-clock-parents = <&bpmp TEGRA234_CLK_PLLC4>;
 			resets = <&bpmp TEGRA234_RESET_SDMMC4>;
 			reset-names = "sdhci";
-			dma-coherent;
+			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
+			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
+			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x0a>;
+			nvidia,pad-autocal-pull-down-offset-1v8-timeout = <0x0a>;
+			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x0a>;
+			nvidia,pad-autocal-pull-down-offset-3v3-timeout = <0x0a>;
+			nvidia,default-tap = <0x8>;
+			nvidia,default-trim = <0x14>;
+			nvidia,dqs-trim = <40>;
+			supports-cqe;
 			status = "disabled";
 		};
 
-- 
2.33.1

