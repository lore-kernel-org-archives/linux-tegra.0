Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D633C4743C
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 16:10:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15FAF6115B
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 16:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhFUQMV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 12:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbhFUQMV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 12:12:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB823C061574;
        Mon, 21 Jun 2021 09:10:06 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id k8so2958913ljk.7;
        Mon, 21 Jun 2021 09:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ICkdfzH6XCcjBYxGEsjQo2bFyJ6lwjMxxQXnUmGqrvc=;
        b=XDRZ8PFNYOTui7aSL6NlwFjzQAM5YqE+Hbp7/ywcKilL8ADnJXU5ER4eblkIapr/VP
         vv1zsKBFx6pHrikjZ2tsd+3ETTb/rhp3pCmAP69nbFPyMNei70KWSf8N2TQfI2Z4KjY5
         qpI7CTtJc38uTYhK4jaA2D3IKL34DM6qKvGmLLrewvuB7xr86XkNCeDcoV0byAvhxY3n
         AEd26Ub/tAzth6EbottMjQeMeql7uPqOJ012i1tWQLyhvulvoQSVs7nL4OFPf8CqTgpV
         DFexIku0E6BopK+p0a36RvkibLMmHXL/QoZYTQVDVUrqQKV+ACI7ymHvJGzLzxL2b7/+
         VyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ICkdfzH6XCcjBYxGEsjQo2bFyJ6lwjMxxQXnUmGqrvc=;
        b=pmKPI7F9/K5jEr7kIpo9XeYP8vjApTX4LZr7NiSoHwRnLB9J+PpZuk7of/Hxi/V+6Z
         v4BFJFIdmv/T2bb+OPG6VYmX2mQWU+cs8qYw1gKbDmARilr34JakrB5P65yaMnIoYyW9
         u5xqvrWE3ibKRRwiOpM1Go96ZwH7yr9r8ffoueosi+4P5cMkPst6RqFvg7wS7CzRItkD
         2HEywHOTnD/baR7ucNLsl+Hzju4kWocTWl48umPI5qSvj/F4PecipJIsGTjCq+UD2j3M
         vJUH/Ky0SaADQhJEmWyvAPopx4M/+B34dT55H6v1NfKzWZpMrZBnYePyB+t9HffuG/wq
         3ocg==
X-Gm-Message-State: AOAM533moFRuIH2x70VlvYCG4B04sD/YjaC/P6+0yc65fwhNOQnMoHne
        8vqerlsTawIamIzXiTVzn5E=
X-Google-Smtp-Source: ABdhPJw+z+F/RX/pIwciHgZzeVtAviu351AwkBaOXZkuSyayZWlDQgyxro7OlRKRaOWdlTcsg6NMTg==
X-Received: by 2002:a2e:b4c6:: with SMTP id r6mr10614446ljm.302.1624291805123;
        Mon, 21 Jun 2021 09:10:05 -0700 (PDT)
Received: from localhost.localdomain (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
        by smtp.gmail.com with ESMTPSA id j9sm1916033lfm.309.2021.06.21.09.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:10:04 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] soc/tegra: Make regulator couplers depend on CONFIG_REGULATOR
Date:   Mon, 21 Jun 2021 19:07:39 +0300
Message-Id: <20210621160739.22448-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The regulator coupler drivers now use regulator-driver API function that
isn't available during compile-testing. Make regulator coupler drivers
depend on CONFIG_REGULATOR in Kconfig.

Fixes: 03978d42ed0d ("soc/tegra: regulators: Bump voltages on system reboot")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
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
2.30.2

