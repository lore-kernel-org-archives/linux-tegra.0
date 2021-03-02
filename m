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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D35BC2BA11
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D57264E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378069AbhCCDba (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350257AbhCBMOh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 07:14:37 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17D9C0611C2;
        Tue,  2 Mar 2021 04:11:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id k9so10986473lfo.12;
        Tue, 02 Mar 2021 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9hqLWrkdSaK/WM4EDBGHiVS8Bvc68hFjoKQw4IIqVQ=;
        b=aNwsHIIT4YETfiFgeX+XzLyUOrs8t3/RfIwuglx0Ei2n3tt9t05NRi43VXSvewmXdd
         DIjVIc8UYcfwqIXnFL9oHYYlZbtPAZCglN0zMRm/zHkNjC0LRq9UZ4qygp3+1jppwC+I
         tBk5GDPf5zXPqeH4TO2HKxAQq7t5G5wiYzqwbs4HpeIi+oiOLKftWIMBM5u92Zz+Lf6o
         VjbvIUmS8iR4b/R7V2tDliaQ3LXAAd4jzETb5oMmRZDYdBaWl90fXVQS6ucWmVOwoObT
         fJSJ2odz3oHV9bvkW4zkH1D5iN/qLRXAnORV3PcP8FsFgBm3B4+QHzOfjUHC5LlZO6SO
         53bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9hqLWrkdSaK/WM4EDBGHiVS8Bvc68hFjoKQw4IIqVQ=;
        b=EEK+InqvdIdJ5nBXVHk0Az3qwScHJvp+4GUcOeTxRPSqDNNOt2H+rNrXN2Jf7VXnal
         p1e6vEvu9AMPi2pm+OPa3nS7sHXzqx9c3sQfa7I5fQ+iTDMHs6odgriuc6XIAQVywT7h
         5mJqXjhlvXa6I+dPm5+JG7rKUHZX/p71iD/MvrL017RKwTS016biYFQ/sc/lDkeAP1rW
         nGvwIz3LCNfRz/OfsiVsV5aVbSnsM0rRo1ZBnsWHgSNg53cjDXxJv7g3sl+4dm+jWgHc
         ZuJZpITdBQhM/OhSkg9JlnO0VNLjXnFFbQ2Adq2TATGo6Ho7Ymd19IbtFV6JfMJ9sbHv
         WbkA==
X-Gm-Message-State: AOAM530BZjddsMtbZh9nWwT1GbuooRGxVcn/T6+93h9N5a6l4YDHdvJu
        oLW+/trFRathfGQQilQeHVo=
X-Google-Smtp-Source: ABdhPJwexzO1C6N6cEA24Vhbl7IJZodv9+GtTzWEcqC8EVKzuAig/fG/VvokAL+NCsPfAWKnhhDIVg==
X-Received: by 2002:a19:7e4e:: with SMTP id z75mr9202879lfc.618.1614687069261;
        Tue, 02 Mar 2021 04:11:09 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id d21sm835097ljo.55.2021.03.02.04.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 04:11:09 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/14] ARM: tegra: Specify tps65911 as wakeup source
Date:   Tue,  2 Mar 2021 15:10:03 +0300
Message-Id: <20210302121003.15058-15-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302121003.15058-1-digetx@gmail.com>
References: <20210302121003.15058-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Specify TPS65911 as wakeup source on Tegra devices in order to allow
its RTC to wake up system from suspend by default instead of requiring
wakeup to be enabled manually via sysfs.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-apalis.dtsi                      | 1 +
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi | 1 +
 arch/arm/boot/dts/tegra30-beaver.dts                       | 1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi                      | 1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi                     | 1 +
 arch/arm/boot/dts/tegra30-ouya.dts                         | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 6544ce70b46f..b2ac51fb15b1 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -860,6 +860,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
index bfc06b988781..b97da45ebdb4 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -12,6 +12,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,en-gpio-sleep = <0 0 1 0 0 0 0 0 0>;
 			ti,system-power-controller;
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e0624b74fb50..e159feeedef7 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1776,6 +1776,7 @@ pmic: tps65911@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 844ed700c0e6..2dff14b87f3e 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -243,6 +243,7 @@ pmic: tps65911@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index e36aa3ce6c3d..413e35215804 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -737,6 +737,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,system-power-controller;
 
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index d36511d95d5a..9a10e0d69762 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -139,6 +139,7 @@ pmic: pmic@2d {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
+			wakeup-source;
 
 			ti,en-gpio-sleep = <0 1 1 1 1 1 0 0 1>;
 			ti,system-power-controller;
-- 
2.29.2

