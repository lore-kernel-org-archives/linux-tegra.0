Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E805BC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhLIRim (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237463AbhLIRik (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:40 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14568C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:35:07 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d24so11100190wra.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jfpPTrfbHgOiakQS91ZeJ2lovKvYhxswRGxO2FBTPrY=;
        b=G1TEsPXX/7+iDRU76eGitI/ojVOF3V0gM03apleu4pWbz0xYmoj98p/qzwW3zHf9oQ
         f8S18dywUgPfZbHn8R0+WF9D0/DDm6QabIGRHIi2bYVD8ju24ITuAxTM+43H9qN/sMCJ
         BnDwNIUVL1REg1Rxs7eLZHO7rQfXlN5lxLAnqYO7ra5z0bIJybPyCWTKNEZYeBhE05q1
         8UBPWQZfy9D6S2821RhBZzSBH+Y1gzGLMjJfM14COhkYqckNysCAPkUoWevKdWLd/+G9
         QiGuG/5B7l7KIZmFHUMoRqG5nihNx9E0nbAk4IH9SsduOstRQTDGrBJ/i/eljuw8+YRQ
         tZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jfpPTrfbHgOiakQS91ZeJ2lovKvYhxswRGxO2FBTPrY=;
        b=K+PXT5KXAH72SgFbnoKkH4MlakQF3xXplB5X/ep0/jO/8LqcsnsCC28tR8P2k6rlMf
         BhbmeCocKF8WOt2pd3s3DDSkK2naG6jEg6jsA+JlRFp//ZQj5+O7DABA5HKz6AMBAMDv
         +Vn325tO88CW2lNGY6SruM4uLPf56JyLvAaLKf0vv/Em/zeIRdv5GaLlF0zEBhJ6FEmW
         r60TZJK7CpYqNYVzcwleth43GBDqD0A9j8uBC49nMW9arUSYSyOy1etnQlePuVSBWDKT
         psuifOts0yVcvTUIvTk9uhqktrAIJfxyEC3iXbeA1U+PRxnbqt39uD5doepiEMHq2O8c
         LYJA==
X-Gm-Message-State: AOAM532gg13hT2WA22UVSuOW40Q3+IkurGg1x1DbjiozKDS32t12Xt+1
        Y6XiM9VrBWtlg1Pus/3cLTY=
X-Google-Smtp-Source: ABdhPJwjZT2Clmk7xczMYAAOWtlrauH65Q2T8ttI+zfQZg58EprwNUBJttkH1ihhN4Gph7EqVKGfRw==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr7966428wro.461.1639071305641;
        Thu, 09 Dec 2021 09:35:05 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b11sm9112218wmj.35.2021.12.09.09.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:35:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 24/25] ARM: tegra: Fix SLINK compatible string on Tegra30
Date:   Thu,  9 Dec 2021 18:33:55 +0100
Message-Id: <20211209173356.618460-25-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SLINK controller found on Tegra30 is not compatible with its
predecessor found on Tegra20. Drop the fallback compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 4c04b9c28484..2fabf34f9c8c 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -666,7 +666,7 @@ i2c@7000d000 {
 	};
 
 	spi@7000d400 {
-		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
+		compatible = "nvidia,tegra30-slink";
 		reg = <0x7000d400 0x200>;
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -680,7 +680,7 @@ spi@7000d400 {
 	};
 
 	spi@7000d600 {
-		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
+		compatible = "nvidia,tegra30-slink";
 		reg = <0x7000d600 0x200>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -694,7 +694,7 @@ spi@7000d600 {
 	};
 
 	spi@7000d800 {
-		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
+		compatible = "nvidia,tegra30-slink";
 		reg = <0x7000d800 0x200>;
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -708,7 +708,7 @@ spi@7000d800 {
 	};
 
 	spi@7000da00 {
-		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
+		compatible = "nvidia,tegra30-slink";
 		reg = <0x7000da00 0x200>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -722,7 +722,7 @@ spi@7000da00 {
 	};
 
 	spi@7000dc00 {
-		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
+		compatible = "nvidia,tegra30-slink";
 		reg = <0x7000dc00 0x200>;
 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
@@ -736,7 +736,7 @@ spi@7000dc00 {
 	};
 
 	spi@7000de00 {
-		compatible = "nvidia,tegra30-slink", "nvidia,tegra20-slink";
+		compatible = "nvidia,tegra30-slink";
 		reg = <0x7000de00 0x200>;
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
-- 
2.34.1

