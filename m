Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E29C48BC2
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C17B96128C
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhFUONx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhFUONw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 10:13:52 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE091C061756;
        Mon, 21 Jun 2021 07:11:34 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id j10so3842476wms.1;
        Mon, 21 Jun 2021 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ogXP3/QXV3QOEUcCyCqZ4mpHopkuZhOKRQR9DuOeLPc=;
        b=acleCoUs2Vmk8ZnbhktnuQStvZRV91BHT6+VG7yvLaNxHo7xLe8FQ2beOJqGNyiPvp
         cJbFvLp5/pFuWmZ54E8ipQYTl3QB/lnZblcpUCI5TV/f1OXnyEIgjy/P++vVzsf/5R/P
         13aMa7VA6ReX7V7kcGBovD9iIXieIs1mQipVR/fEGAgBz40LIfJaC8Ew4BQFMvGM3yek
         STsvCD2xphRT7bP84wr57KjGgiJMxKOBGaU6SRbD5WaHMvUPaGhHWmvxtDsP90mwRkj7
         9lvrACV0oI2JEjgWQXKYVBjvif0O5KtiVEanQPuEF3P6tGwTszXQRiqPLJAhXdtYz0ei
         Np3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ogXP3/QXV3QOEUcCyCqZ4mpHopkuZhOKRQR9DuOeLPc=;
        b=Fsma39QX7mpiTQVLwvJl0eUu69kays1FW/R616huJ1v7c8jXI7Bx05hUiVbIgbOAFQ
         lNSbNFfuq84aZzLupM3De0XJWTppde7LXxxPKx16hGT3nMFnlDR+glQOd86Qmoy3jvKH
         98RKFb/Uz8RMQ6x6fqTx+N6J4VMYiMXHupORV8VtebwLDisRgkQ64FLH5UCZHhiueRw5
         fFAd85sMeQEDD9zPFdgPzcZzDR5HdnQV/3rHYXBATdeCEyw+YsrPPP17HmubAoqUgdSp
         FkmQVC+Mrk1mWYoD2bXahNs7viX6Q3DbFIsrND0qHVe/ASfE9H/by+vrKjnQE/hvaE2N
         +8xw==
X-Gm-Message-State: AOAM530PTWkifNX6KX/sTtpzJM8X6AYIxgiDQ2SKlxycbO9OdxA94+np
        3+OWi2AF450O666fDtkT/b8=
X-Google-Smtp-Source: ABdhPJyBZjy1q6UM8k2L2wVhmhQG/dq4mPsyB5sW1TpbKYH9wcHTbfBHJsNOjlqkQodBfXYQrfox4Q==
X-Received: by 2002:a7b:c446:: with SMTP id l6mr26466146wmi.171.1624284693512;
        Mon, 21 Jun 2021 07:11:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a1sm23085495wra.63.2021.06.21.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 07:11:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: tegra: Remove useless usb-ehci compatible string
Date:   Mon, 21 Jun 2021 16:13:27 +0200
Message-Id: <20210621141327.2880579-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621141327.2880579-1-thierry.reding@gmail.com>
References: <20210621141327.2880579-1-thierry.reding@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 6 +++---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 9928a87f593a..89ba63dbf1cb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -1107,7 +1107,7 @@ tegra_i2s4: i2s@70301400 {
 	};
 
 	usb@7d000000 {
-		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d000000 0x0 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -1146,7 +1146,7 @@ phy1: usb-phy@7d000000 {
 	};
 
 	usb@7d004000 {
-		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d004000 0x0 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -1184,7 +1184,7 @@ phy2: usb-phy@7d004000 {
 	};
 
 	usb@7d008000 {
-		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d008000 0x0 0x4000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 26b3f98a211c..aa0b8773f779 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1743,7 +1743,7 @@ spi@70410000 {
 	};
 
 	usb@7d000000 {
-		compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d000000 0x0 0x4000>;
 		interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
@@ -1781,7 +1781,7 @@ phy1: usb-phy@7d000000 {
 	};
 
 	usb@7d004000 {
-		compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci", "usb-ehci";
+		compatible = "nvidia,tegra210-ehci", "nvidia,tegra30-ehci";
 		reg = <0x0 0x7d004000 0x0 0x4000>;
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		phy_type = "utmi";
-- 
2.32.0

