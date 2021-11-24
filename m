Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53703C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 21:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345033AbhKXVEl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 16:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344836AbhKXVE1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 16:04:27 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD9CC0613E1;
        Wed, 24 Nov 2021 13:01:10 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id m27so10537798lfj.12;
        Wed, 24 Nov 2021 13:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MVMeO5TsjpG7X103IJ0vtCcKisfNOPmQ/M/aYmMnN4k=;
        b=dIaikO5/iZx8wXkgZLmz6L8MXhHmUkOYatbQxx8UKFn0ZuMINvCFjXp6cox7gk6u4s
         tzdZRxjY23SXXlVrsyG4jiYMLzWbX3Cp+VrYQ3D+lGmb4BaCgGNtKauXFh9rwZWyu67h
         ArY+Yf/Lat3IZH3kMcnsVjMU3sSxhWmxgYFCKRAz3D7xaDwc0+sioapUsAmyVPkglovn
         cYM/cRc64K6s0Irw+azoYLXQESjhOvJW6ikhYwzZtAAtBMFmE7eKNHY0tP873ocCX7ov
         VDGbDxf7P5p8Fax5AYbb8XNxwPe+aNwY/l+nhkwi36FT5iIPEo/UdDP8DcaDLmGakbH+
         ZznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MVMeO5TsjpG7X103IJ0vtCcKisfNOPmQ/M/aYmMnN4k=;
        b=LWsnB5oYKIMSae7HO+knDupir3VMp6zZaqsLKDJygtFdZ7j6YYJXck8RWq+8jDTMS/
         9/1Rdkj+GLfw6tDzCidemir+jUxc/13qsITg8KWedZO7f2ox3DCf9a5kc6rbgUBB0hhc
         ARJFohbCN4+floBFndlPdhOWW34E1Q7CuPlr8HRFC0XvsUF3WNusSxRfr33qyOX1R2GK
         WTiJRmgekyE/dr0+beCVU0omMSMkkMBNWxty7ymCT1FPlAbw+/eWdf3kFOKwwjwSBEbB
         scxA+9uFQxWZbIADAzXJ7slsAgBu8SuxWfLgUTELncgMVqt6G5hNd3E135fPrl8TWd8Q
         +u0g==
X-Gm-Message-State: AOAM530MN+P01TshrBxbNRxg5Ry978PvGDRNVkUmaNlvFHhOnCB3qHSC
        ikYtM3DPIczOp0tmdGtUZ+RrFpqf08Y=
X-Google-Smtp-Source: ABdhPJw5kWXMUMTTcM5sEZl2uJbojdwX3X1hzirgwMlHruoi77BjPhr+8bNpSU/Rkoka8Wa2MoilVg==
X-Received: by 2002:a05:6512:2628:: with SMTP id bt40mr17768496lfb.476.1637787668545;
        Wed, 24 Nov 2021 13:01:08 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id 18sm79939ljr.17.2021.11.24.13.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:01:07 -0800 (PST)
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
Subject: [PATCH v2 13/14] ARM: tegra: nexus7: Drop clock-frequency from NFC node
Date:   Wed, 24 Nov 2021 23:59:21 +0300
Message-Id: <20211124205922.11930-14-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124205922.11930-1-digetx@gmail.com>
References: <20211124205922.11930-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: David Heidelberg <david@ixit.cz>

The clock-frequency property was never used and is deprecated now.
Remove it from Nexus 7 device-tree.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi | 1 -
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
index a044dbd200a9..564cfcde21a9 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
@@ -137,7 +137,6 @@ i2c@7000c500 {
 		nfc@28 {
 			compatible = "nxp,pn544-i2c";
 			reg = <0x28>;
-			clock-frequency = <100000>;
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(X, 0) IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
index a681ad51fddd..cd63e0ef7445 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi
@@ -223,8 +223,6 @@ nfc@2a {
 			compatible = "nxp,pn544-i2c";
 			reg = <0x2a>;
 
-			clock-frequency = <100000>;
-
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(S, 7) IRQ_TYPE_EDGE_RISING>;
 
-- 
2.33.1

