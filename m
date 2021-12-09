Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D92FC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243078AbhLIRh5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:37:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhLIRh5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:37:57 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB71C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:34:23 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso4676875wmr.5
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ris0XiNeBKRo1MssLvsi4cb1EMg74Njf73AG/BIZ3Qw=;
        b=YrpZeO+ZHjARp8mvCO4t2QZ+cu/wyG8UoGqJVz3dpL048RRTX3l8nwXtEp0a8DAYDW
         PSLl0qXqiX3xgmBpC7bM5hp7sdY/KxNiA1st6YA7/xxkMoJNikZ2fk1FU7ZwD4WZUZg6
         GE6ooI9CMXB52DzsSVVtVg7/DeVAQXE2zwOGQy+SWLmrdxGoRTE9I0bvSSMlXgZ4/fEn
         j3XYiix0sV0JZNHUFGbljyb7bMk8kKzYd9krls/Q/GeeG1q9ZJJtwNTHhQ042GoYxoMh
         rwK16G+YuSXJHC/4eW5dlyZ4DtrdwBDdCl0En7uHCuEjqfrlXdcsHYiNv0J6jIk8zDBC
         54pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ris0XiNeBKRo1MssLvsi4cb1EMg74Njf73AG/BIZ3Qw=;
        b=fkUPaqyI95M94sLgh7gtcsq4r6/CjUFDeFxtQEyV98o8i2Bjk3b63rUY/y/aFTHo82
         gdVbu2sDQ4v55gTiqTqHxnjRHVZLzbhzyi5Cbvk9DK1ogrVhMcNnTua/8pSdWuBZiUsf
         brzoZQJGOf+MOe+zzP8eyerRV3fRPu0cYxpEuIpsyCs8GYeqmzJ0gJI4nhwlLPSwhBaU
         F4Snk/SpepBhQXp7RWoH1JF/Tpe/xv/G7bBxYWI6eQKUyDoVUwI/jMJIOUTagKExhEGu
         mckmLWYuYPwJ4pvxzeDWENlNGMd3xbIP7pilh27fh5YOMy+KHvHYkpKoOsWXRxFfve2i
         tAow==
X-Gm-Message-State: AOAM530ns39WYaWvOnxOyJDvf8zpofyYawWubGWVy1/cPOfU6rqNGUVV
        ypw/dLfQdlG1PfBeNHu8ZMw=
X-Google-Smtp-Source: ABdhPJw9RTQgIv9PoiJUEbNMhFVpmTjYYRRhFMPabGJdhktbmN7VCQaqyt9coCyyKbHTB63ZRO2jNg==
X-Received: by 2002:a1c:a301:: with SMTP id m1mr9124217wme.118.1639071261969;
        Thu, 09 Dec 2021 09:34:21 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b15sm452717wri.62.2021.12.09.09.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:34:21 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 08/25] ARM: tegra: Rename GPIO hog nodes to match schema
Date:   Thu,  9 Dec 2021 18:33:39 +0100
Message-Id: <20211209173356.618460-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

GPIO hog nodes must have a "hog-" prefix or "-hog" suffix according to
the DT schema. Rename all such nodes to allow validation to pass.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 4 ++--
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 4 ++--
 arch/arm/boot/dts/tegra20-colibri.dtsi          | 6 +++---
 arch/arm/boot/dts/tegra30-apalis-eval.dts       | 2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index 28c29b6813a7..3209554ec7e6 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -246,7 +246,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index f3afde410615..814257c79bf1 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -248,7 +248,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index cde9ae8fa04b..4ba4d5229fcf 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -2055,7 +2055,7 @@ gpu-shutdown-trip {
 
 &gpio {
 	/* I210 Gigabit Ethernet Controller Reset */
-	lan-reset-n {
+	lan-reset-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -2063,7 +2063,7 @@ lan-reset-n {
 	};
 
 	/* Control MXM3 pin 26 Reset Module Output Carrier Input */
-	reset-moci-ctrl {
+	reset-moci-ctrl-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index a46d9ba9bb7a..3760744cc1b0 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -2047,7 +2047,7 @@ gpu-shutdown-trip {
 
 &gpio {
 	/* I210 Gigabit Ethernet Controller Reset */
-	lan-reset-n {
+	lan-reset-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -2055,7 +2055,7 @@ lan-reset-n {
 	};
 
 	/* Control MXM3 pin 26 Reset Module Output Carrier Input */
-	reset-moci-ctrl {
+	reset-moci-ctrl-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 585a5b441cf6..80e439003a6d 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -747,7 +747,7 @@ &emc_icc_dvfs_opp_table {
 };
 
 &gpio {
-	lan-reset-n {
+	lan-reset-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(V, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -755,7 +755,7 @@ lan-reset-n {
 	};
 
 	/* Tri-stating GMI_WR_N on SODIMM pin 99 nPWE */
-	npwe {
+	npwe-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -763,7 +763,7 @@ npwe {
 	};
 
 	/* Not tri-stating GMI_WR_N on SODIMM pin 93 RDnWR */
-	rdnwr {
+	rdnwr-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 6) GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 9f653ef41da4..93b83b3c5655 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -239,7 +239,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index 86e138e8c7f0..fbfa75e53f32 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -257,7 +257,7 @@ reg_vddio_sdmmc3: regulator-vddio-sdmmc3 {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	pex-perst-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 88b7f2925e9e..03b930bce479 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -1041,7 +1041,7 @@ sound {
 };
 
 &gpio {
-	lan-reset-n {
+	lan-reset-n-hog {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.34.1

