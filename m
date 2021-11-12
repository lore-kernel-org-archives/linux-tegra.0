Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488ECC433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27E3C61029
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbhKLMiv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbhKLMiu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:38:50 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA352C061766;
        Fri, 12 Nov 2021 04:35:59 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id t30so15217067wra.10;
        Fri, 12 Nov 2021 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=243izrX/RxZR31RQONkzjW80N0L6t2Vzy44t3zq2gr0=;
        b=Bk4E8X/xB0886BL+7dgirHUwUQgCRPG/Cna8dAKwBf92EFm2q9QH+0UhcE2NJhTSbH
         +GdITz3rmI40D41Z2PE5pmh6cvQLNMLGlsiznVqoqzVj+wXKSI06q4XXM3jFN0rRW1Pz
         R7FYfX7HRtZXqhxDV3bfGAOsP+XhEV6kUsSqLU7zkHL5prO2DPkPzBZAQhtuXsKIdCPH
         mjvDCT0KdmgFSpVufAuCtHQP74PjnFgFDPF2+SWBgIopiwQETBGkxq0zgnark625YWHe
         VKKli7SxZBh7UsmhVzgAOnRh0sxkfN4Kogar+pR3M1EWyG8wmUi8WRTJSTYsE7jTkngB
         P2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=243izrX/RxZR31RQONkzjW80N0L6t2Vzy44t3zq2gr0=;
        b=NrtSZnzf/ehVQEsdKKguOOhiDaX3Lj0jWlhtugwR1S8eSxsqF0eNMkXplAB7c64Pk8
         Xd3v1WruWM8myFjXI9nX2fK+Nx56Q9gAPxL70cwxp+diJfGA5OyJaPtsunlMY8dnY6W7
         6SBVhpLwNh3TPv42Ju3YFv2x94yX6mTu+ouUG44n0buNGdMVghpnIu5rKaxdPo2vuPdF
         J0jxRWUaiwbeRIrF3hoXYMPDPWnEYOq9w9prc8NnsNDKKs0AFoZWLqrkV9R3BWskX6pO
         OgcAiHBQvk0IsbdIYvB80wKXVC48L6PMnorPZ/XPVQNEROyADZr6hasEfoGaIcn4Rxf7
         P8zw==
X-Gm-Message-State: AOAM533g76VNhIObyPQvYT36XhNoN7Oxc6Rc/4JT8IOa715SLkou4Xu0
        RhBV1j32czyYkFgJju12sOM=
X-Google-Smtp-Source: ABdhPJwKIcXCM0a4+eG5D8HnEp2y0slms5tkkU14YbU+XzikRF1G5piTvmsrYruL71DdxERBYRadDA==
X-Received: by 2002:a05:6000:1541:: with SMTP id 1mr17791140wry.347.1636720558353;
        Fri, 12 Nov 2021 04:35:58 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 21sm5286573wmj.18.2021.11.12.04.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:35:57 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/11] dt-bindings: Update headers for Tegra234
Date:   Fri, 12 Nov 2021 13:35:34 +0100
Message-Id: <20211112123542.3680629-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add a few more clocks that will be used in follow-up patches to enable
more functionality on Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h | 17 ++++++++++++++---
 include/dt-bindings/reset/tegra234-reset.h | 12 ++++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 2c82072950ee..21ed0c732fb9 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -4,11 +4,22 @@
 #ifndef DT_BINDINGS_CLOCK_TEGRA234_CLOCK_H
 #define DT_BINDINGS_CLOCK_TEGRA234_CLOCK_H
 
+/**
+ * @file
+ * @defgroup bpmp_clock_ids Clock ID's
+ * @{
+ */
 /** @brief output of gate CLK_ENB_FUSE */
-#define TEGRA234_CLK_FUSE			40
+#define TEGRA234_CLK_FUSE			40U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC4 */
-#define TEGRA234_CLK_SDMMC4			123
+#define TEGRA234_CLK_SDMMC4			123U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTA */
-#define TEGRA234_CLK_UARTA			155
+#define TEGRA234_CLK_UARTA			155U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC_LEGACY_TM switch divider output */
+#define TEGRA234_CLK_SDMMC_LEGACY_TM		219U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLC4_BASE */
+#define TEGRA234_CLK_PLLC4			237U
+/** @brief 32K input clock provided by PMIC */
+#define TEGRA234_CLK_CLK_32K			289U
 
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index b3c63be06d2d..50e13bced642 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -4,7 +4,15 @@
 #ifndef DT_BINDINGS_RESET_TEGRA234_RESET_H
 #define DT_BINDINGS_RESET_TEGRA234_RESET_H
 
-#define TEGRA234_RESET_SDMMC4			85
-#define TEGRA234_RESET_UARTA			100
+/**
+ * @file
+ * @defgroup bpmp_reset_ids Reset ID's
+ * @brief Identifiers for Resets controllable by firmware
+ * @{
+ */
+#define TEGRA234_RESET_SDMMC4			85U
+#define TEGRA234_RESET_UARTA			100U
+
+/** @} */
 
 #endif
-- 
2.33.1

