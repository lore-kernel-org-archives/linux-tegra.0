Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14599C6377B
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jul 2021 23:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0AFB6124B
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jul 2021 23:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhGUWqO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jul 2021 18:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhGUWqO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jul 2021 18:46:14 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9294C061575;
        Wed, 21 Jul 2021 16:26:49 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id b16so3837369ljq.9;
        Wed, 21 Jul 2021 16:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Il8UJhGjpnmDj53189lXqkD37q5sKtSo66wNqc5Vg6s=;
        b=FETA6EXuOLfRCzWuWoDNBcuxD19MHcO7al3jDz2bgwQbnkgcyBmyBV5UmVtUVMvjv4
         YFz17ZeOTPHL9VSVRwQxIGWsss030dCcd+mlkzJQmbRFmqB1kLLWmwwey09xzVVyXTtp
         psZsVLgdvoNLTrRmySx6j28CgbK8i1V8xRx1V4AoJr3hNdJemw1Qv0HbfEiJS7h8h9Be
         MksqFXVecOch1uCbtNHPbqN1El74Qxd1gVenS585EP+J4qggxDAGfgsXKIZSSnDL45/y
         Z/rUngHbohqmg2RtFcPhtXQvhCDNlr4ouJ9P0cthSqNdbFittrp30JPW5Vtsq1eB+4Ou
         q+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Il8UJhGjpnmDj53189lXqkD37q5sKtSo66wNqc5Vg6s=;
        b=ai+YXwY6xaYZ5IS38yPXFTdvG9E+IGf0HKPPjE+1ssLN1Hs865CW+zM6uRu2WVdwqA
         vqCjmc8eOs+4wwxYSHUNT2O//jDyZTnTYL61FPhfnfcP/hXqs1tGCB/bqJ1mJmiaIaEN
         WI9y2eul22AKpMRwREBDrtDdrisS2p9zD78zgvnIAwgauyHGYX9U6DengI+mE38C2rJk
         lUq3yLwhQO43wPJJGLiZn2WoTTRqfnX71lXpdM0X1XS6Ne96t1Sb9yXF0edbpODkcetB
         ukJBcV3OaDDAEVKqoKEbgfFlCpPhMXu/fXTBNS1dr/5SLmzKKsIG/8Ao9hXQ5uwP1SRU
         Ao4A==
X-Gm-Message-State: AOAM530So/Nf1kMHsZldcWTWI8Ck0bevhz+y349FCB9lbqJNDSHs5d9n
        INox3fHerxQzNpbQTx/bGxE=
X-Google-Smtp-Source: ABdhPJwuJINA3x8dOeYPlYtlUIejwdIani8/VDGazBclVy2E9Kr3PNSAFVIBVHnB2LJlhwalaUG+yA==
X-Received: by 2002:a2e:9695:: with SMTP id q21mr5223735lji.509.1626910008292;
        Wed, 21 Jul 2021 16:26:48 -0700 (PDT)
Received: from localhost.localdomain (79-139-184-182.dynamic.spd-mgts.ru. [79.139.184.182])
        by smtp.gmail.com with ESMTPSA id u10sm2940026ljl.122.2021.07.21.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 16:26:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, soc@kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] soc/tegra: Make regulator couplers depend on CONFIG_REGULATOR
Date:   Thu, 22 Jul 2021 02:26:16 +0300
Message-Id: <20210721232616.1935-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The regulator coupler drivers now use regulator-driver API function that
isn't available during compile-testing. Make regulator coupler drivers
dependent on CONFIG_REGULATOR in Kconfig.

Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system reboot")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - No changes. Re-sending to Arnd Bergmann and soc@kernel.org.

 drivers/soc/tegra/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index db49075b1946..1224e1c8c2c9 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -15,7 +15,7 @@ config ARCH_TEGRA_2x_SOC
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
-	select SOC_TEGRA20_VOLTAGE_COUPLER
+	select SOC_TEGRA20_VOLTAGE_COUPLER if REGULATOR
 	select TEGRA_TIMER
 	help
 	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
@@ -29,7 +29,7 @@ config ARCH_TEGRA_3x_SOC
 	select PL310_ERRATA_769419 if CACHE_L2X0
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
-	select SOC_TEGRA30_VOLTAGE_COUPLER
+	select SOC_TEGRA30_VOLTAGE_COUPLER if REGULATOR
 	select TEGRA_TIMER
 	help
 	  Support for NVIDIA Tegra T30 processor family, based on the
@@ -154,7 +154,9 @@ config SOC_TEGRA_POWERGATE_BPMP
 config SOC_TEGRA20_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra20 SoCs"
 	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
+	depends on REGULATOR
 
 config SOC_TEGRA30_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra30 SoCs"
 	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
+	depends on REGULATOR
-- 
2.32.0

