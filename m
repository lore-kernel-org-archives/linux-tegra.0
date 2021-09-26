Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE734C4167B
	for <linux-tegra@archiver.kernel.org>; Sun, 26 Sep 2021 23:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F18F61151
	for <linux-tegra@archiver.kernel.org>; Sun, 26 Sep 2021 23:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbhIZXjM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 26 Sep 2021 19:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbhIZXjK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 26 Sep 2021 19:39:10 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D1AC061575;
        Sun, 26 Sep 2021 16:37:33 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u18so46892728wrg.5;
        Sun, 26 Sep 2021 16:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h8PxNhJlZ90lHXucmk0/ma9BveND1oXYM14ZGxGGeIs=;
        b=ITbSA/LfK7Ga2tRcdNLkMQGu3fSqLkJ3DgNw2v9QwQtkt+qrKd9PmRwGmZuzlFB/xD
         wLxMB+jZwq2jGYAsyoJVfJFe883zysD5yTD3Zy5f9rLQgC2PdeV8x5bUU3tbHoWpI2Kn
         e0NXVjWRvzyq3zrmNaJgA8RUaa74ArLED+qHgokfzhexljBcgB4oLHjXB8cm+ketygst
         aWyntUUOHEdy0uG9eIWTELmMFBqEJvKLoZPkd5sbgUrNtW3N5axp4VHjUN9QQWb3c6oG
         fiUT5TST+HXIIxi0rq6WMHqA4oJF8b13/A91r0x0aa36zf6PCYnqFZq89a5yoHrUtih9
         7UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h8PxNhJlZ90lHXucmk0/ma9BveND1oXYM14ZGxGGeIs=;
        b=HI9DWZkNEU6fAuX5lZ2U4pyaKxAjonbDMYkFOi42vQbgiWEv53EhLJTiqILMHyb61Y
         7Kvdxegb8HMAva8FJMfGOUOMOUCUovvw2kSsaLG1CilXmPV8HgjK2v4EE+zUH//tP5wS
         F1A+1wDIzsdxNoMYHPrtqBRk7hpmeRFkjUMgk8GLckcv0SDeBOl6dhIORhuX8tk4SjYy
         joTVp/j/BJ6sBzpEMg99XPIEmBazAPJntNYLgCCaBFyIgCoYDv98Bf4OgWerwEiUtSYW
         getcppCUKunoxK3AhdHj32xq7nJv5DNF4Zq1DFKLzyd0f4XneDLZTPtUqt1JaVZZInNr
         wV5Q==
X-Gm-Message-State: AOAM530LhPL2j2wGBORIiKyQZ4t4WVQW9sF0+VcL+RVQO4CcxIndTms5
        922IQW4x6nQ+3WAS+KKfSqaXKpVUMW8=
X-Google-Smtp-Source: ABdhPJyUP5NnYASSnAHrb6XKtLkpcW1AX/YpHRDqoxwwCeYAqcPUGANkUNLV8x8dX5LpMjgNo5f3hw==
X-Received: by 2002:a05:600c:35c6:: with SMTP id r6mr13124103wmq.24.1632699451596;
        Sun, 26 Sep 2021 16:37:31 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id y7sm12493698wrs.95.2021.09.26.16.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 16:37:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] ARM: tegra: Update Broadcom Bluetooth device-tree nodes
Date:   Mon, 27 Sep 2021 02:37:04 +0300
Message-Id: <20210926233704.10164-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926233704.10164-1-digetx@gmail.com>
References: <20210926233704.10164-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The host-wakeup GPIO is now marked as deprecated in the broadcom-bluetooth
device-tree binding, it's replaced with the host-wakeup interrupt. Update
Tegra device-trees to the recent version of the Bluetooth binding.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts           | 5 ++++-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 5 ++++-
 arch/arm/boot/dts/tegra30-ouya.dts                        | 5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 0abfd6215016..2e6340e92fe1 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -393,6 +393,10 @@ uartc: serial@70006200 {
 		bluetooth {
 			compatible = "brcm,bcm4329-bt";
 
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
 			/* PLLP 216MHz / 16 / 4 */
 			max-speed = <3375000>;
 
@@ -403,7 +407,6 @@ bluetooth {
 			vddio-supply = <&vdd_1v8_sys>;
 
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
-			host-wakeup-gpios =   <&gpio TEGRA_GPIO(U, 6) GPIO_ACTIVE_HIGH>;
 			shutdown-gpios =      <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 6433fde6db02..56e566fb922b 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -819,6 +819,10 @@ uartc: serial@70006200 {
 		bluetooth {
 			compatible = "brcm,bcm4330-bt";
 
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
 			max-speed = <4000000>;
 
 			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
@@ -828,7 +832,6 @@ bluetooth {
 			vddio-supply = <&vdd_1v8>;
 
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
-			host-wakeup-gpios =   <&gpio TEGRA_GPIO(U, 6) GPIO_ACTIVE_HIGH>;
 			shutdown-gpios =      <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 90db5ff72537..4259871b76c9 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -93,6 +93,10 @@ uartc: serial@70006200 {
 		bluetooth {
 			compatible = "brcm,bcm4330-bt";
 
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "host-wakeup";
+
 			max-speed = <4000000>;
 
 			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
@@ -103,7 +107,6 @@ bluetooth {
 
 			shutdown-gpios = <&gpio TEGRA_GPIO(U, 0) GPIO_ACTIVE_HIGH>;
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
-			host-wakeup-gpios = <&gpio TEGRA_GPIO(U, 6) GPIO_ACTIVE_HIGH>;
 		};
 	};
 
-- 
2.32.0

