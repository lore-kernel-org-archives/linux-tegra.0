Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0A8C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhLIRiK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhLIRiK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:10 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70C3C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:36 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v11so10942648wrw.10
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jcSskejSneiFuu74k2khPfVI19aDm0oOaVgWlk4oXTw=;
        b=d5oUm/ld3oQWeYvw4aAPeLzZL7rVsAhyGkkpWGKb5FlfH6EvV7rykoMU7ycdHUCWIF
         YRMQwRoCq5T34mFXVocGw5kzL3d0CMNGwIlvacWC0uzfDuT5COVEcu0BqgDnG/YXCX7d
         He6hWnyymkJuXrLUMMT0mLnKAN5HBTLizqXkhW8SpVpgTeR6HjrxvzBy/WHMKvVBprqH
         yXvCZuMQcg2TOGjiHXd1MgaO/HaF2H5429ddO/kJktHh33UWKI4zBBGv/7g1uoaMoNdN
         3XDb0DwTRoXQFA09cAan/XftxBlod9CMpm5yfzCBQxTDtcBTkvyzr/xsfwbj75WxM/hZ
         t7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcSskejSneiFuu74k2khPfVI19aDm0oOaVgWlk4oXTw=;
        b=cEc4YFmiLHme99tLTOWXyRVOhE5VmDsspNvY5RUKyaovPtcmBTwo8pZHTfCulwuGBL
         Peq2xR+L1w42WyTfxmMelQ2KMTr8ciFEg8o1gCP3/l97dhrdFzaGmnx3DgLGHu5Q5ZN9
         iZb/fKmBSeAyuLyYLNEA/kCcDKgHtac7J5FxTQSoc34hhGMqfqOdgdOO5LN0+DSy9uth
         rsQm/R2FqiXdPmSSZ+ZJc4D0QXO+b5R57jeo53jM+r1HJo2lklG+SGucJPeRlxMdJqHF
         c8aEErArBjoh7jljuTjTwtK7Rwshf5dUlEnAV2QYfDfy1qC51u+K2LhgR4qvpeY3n9Bp
         HvRQ==
X-Gm-Message-State: AOAM532T8PeqVFqGtBb4nqZdk/Pn+mRIvsljUE5Ajap8n8KjPa9+C1r2
        qRMCXPonbjOaaa1Tft6H7UmlN7YcaYSOWw==
X-Google-Smtp-Source: ABdhPJzH3ASpKXaCc+b6KlvLCFqgYJf+mWOipS77Y7PSdYSgAcZmNm5GbEYoP+I2rkZ9RjQ2BtYYFQ==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr7944951wru.317.1639071275239;
        Thu, 09 Dec 2021 09:34:35 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id t11sm293799wrz.97.2021.12.09.09.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:34 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 13/25] ARM: tegra: Fix Tegra124 I2C compatible string list
Date:   Thu,  9 Dec 2021 18:33:44 +0100
Message-Id: <20211209173356.618460-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
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
 arch/arm/boot/dts/tegra124.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 752a28268024..0e0a769fb30f 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -438,7 +438,7 @@ pwm: pwm@7000a000 {
 	};
 
 	i2c@7000c000 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c000 0x0 0x100>;
 		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -453,7 +453,7 @@ i2c@7000c000 {
 	};
 
 	i2c@7000c400 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c400 0x0 0x100>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -468,7 +468,7 @@ i2c@7000c400 {
 	};
 
 	i2c@7000c500 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c500 0x0 0x100>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -483,7 +483,7 @@ i2c@7000c500 {
 	};
 
 	i2c@7000c700 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000c700 0x0 0x100>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -498,7 +498,7 @@ i2c@7000c700 {
 	};
 
 	i2c@7000d000 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000d000 0x0 0x100>;
 		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -513,7 +513,7 @@ i2c@7000d000 {
 	};
 
 	i2c@7000d100 {
-		compatible = "nvidia,tegra124-i2c", "nvidia,tegra114-i2c";
+		compatible = "nvidia,tegra124-i2c";
 		reg = <0x0 0x7000d100 0x0 0x100>;
 		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
-- 
2.34.1

