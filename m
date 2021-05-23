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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DCBC47080
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73DFC61152
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhEWX6H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbhEWX6F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:58:05 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FCDC061756;
        Sun, 23 May 2021 16:56:37 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id o8so31281062ljp.0;
        Sun, 23 May 2021 16:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W4XYgA9FTIuq7IUiliTgLv6U+XMmEN4JcS1gayFO6x4=;
        b=h6Y1AlQBDrE6tlUwOBJEg9wOJcJlUOEkPnqPrA5D+RhZvcDy6JF49GcBjtDRF0H/kr
         BAfLfJFKpt3YGeWv9jEi7+oM4TxOkK6S0ZoKQmmx+ivXmWXzX18ew/fDgnW5dHZ2q1bX
         QtTzfOt93mEMaNjM//V7wiqWkNVyiMWAvVVCjtAy+wuxgz4+5ZaxWzLVeHaLthwjoPnb
         nyf+PznPsYWP89LNZWG3gAzrFJsvcZX206LdGC9KetNMC7Lh36j1gRlfVZDp4xnDy+eQ
         3LlLg38iI0Lji3crhbvGYUNDua+w2/X7j+1mXQjRPCdcVfcgbbT2fccw+woNQ9/NZEL3
         J+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W4XYgA9FTIuq7IUiliTgLv6U+XMmEN4JcS1gayFO6x4=;
        b=C+X315hKWqpwEGazjdSeSRWaj5jQ27JVthfP+iYEPxJI1UXVA8kpA3T4+Javz92hKR
         iDFF2PaD9Yq6rgmI/TGesn8G0fW2Tv7AJTgpCnJCAfOCScpc06LUKC5bmOZvF8rgTFMP
         qKQgWPvDaXbHF6bu3KetYfPaBdRaPv4e1tE3tIe+pwyh/LpTY7Fi2N3qotrh3mx1LUtd
         3S1p45cqI5Ux8fn8+NycY485iSEyRPLkPBi8MLfhARqOwhkSL8JUVC/D1eBrP0FhKNor
         2plBbv9s2j8wy/fqQjzzfOmcBsfcFhsSDVyw4+t4ZZwbQ63BvMCL6H3iZNWCypwJoZAZ
         UtNg==
X-Gm-Message-State: AOAM533Xti72Gf+pf2rWurexFR/R5iruoVN8tMs8WTGpcA3H22F3Wg7d
        BTc08Dduk+NOnYFjexcGzH0j+bn0d8s=
X-Google-Smtp-Source: ABdhPJwPa0YohlZUnH55wlmqcQH9eBEwRCmuKrPgAieRSvCwwFIipkUCrTD4PNWkrpZAkx0qN1gQyw==
X-Received: by 2002:a2e:b01a:: with SMTP id y26mr15017450ljk.341.1621814195523;
        Sun, 23 May 2021 16:56:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id h4sm1092987lfv.247.2021.05.23.16.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:56:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] ARM: tegra_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Mon, 24 May 2021 02:56:18 +0300
Message-Id: <20210523235620.31538-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523235620.31538-1-digetx@gmail.com>
References: <20210523235620.31538-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable NVIDIA Tegra30 SoC thermal sensor driver in tegra_defconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 3d8d8af9524d..63e7f3261e6d 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -169,6 +169,7 @@ CONFIG_THERMAL_STATISTICS=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
+CONFIG_TEGRA30_TSENSOR=m
 CONFIG_WATCHDOG=y
 CONFIG_MAX77620_WATCHDOG=y
 CONFIG_TEGRA_WATCHDOG=y
-- 
2.30.2

