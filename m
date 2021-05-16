Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFC2C43461
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E19C610A7
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbhEPQOe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbhEPQOc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:14:32 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4152C061573;
        Sun, 16 May 2021 09:13:17 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id w15so4286453ljo.10;
        Sun, 16 May 2021 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8C9VSduIj0bVkjklKXJSAmIEYwrf0xWcWWaa+mCbouw=;
        b=Fr07QrljGWl91M4gbvmbRPzsTgy9tEJ6zkWGLccvWZAEngDvbonl1upewQXOcxCAyJ
         tLUEC/96/VsyjEHGVeCibP06ViE0gYdlbTpmJxyKbIm02OyzCgcKomAx0qwiC/4fAKkE
         My93IKYhWZQuyTzLxr1TcTztKmdtH8U9Pt4LckVkaUK9sgu+x5lpi/shW9n4YLFyBwKR
         06OBUhxbK/jFu9PEc3ZP4YYA1W8jdqNa2bzRcvLBb7uN+etGv2JeO735GO4tvAjarXbU
         Mcov6c/GFC1ehlZR62+x/DYVFUWLjlVQ2svughqUu+sCoRyg37HgwCRfcLpmNTB1U69i
         etSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8C9VSduIj0bVkjklKXJSAmIEYwrf0xWcWWaa+mCbouw=;
        b=UPqMN+4RCKHf4PCx+/ne32CT//YfjsEZlvAu1e408b/l6YsJd991KE5Ivv+aU3Gv4Z
         X3SFx/ISm+BflK/DM8c8gqs+o6zvUgWQ/qpyOZDIfsOz8WpKGn13mw45sdK1EmXU37rt
         GlhU4Or8w27h2ln3QexXkeYk29PGikXwAi7cQb49lc5KXad+VBRhb2CdAWtlG14TbFAJ
         Gn/uBFhpKs7Y8eNBDdf3Es5Pq1pWZdIp3cqguZ2Ip/fDyrXSjfHd3OrtTlDJUvK4fkTc
         mZq7eo9QoU3+sQCLQ0W2+8+i99P9Uw5FWU75yWFfIAByi7LKYQeevZeyHfzruO+/JrHT
         RX+g==
X-Gm-Message-State: AOAM533S38uHw7GDc3qOztSe1ymJ/3sC+V9tcUKirQfczTQ3in+rzSS0
        fPYWybAk9q749TwWVyHuh7o=
X-Google-Smtp-Source: ABdhPJz+y1l8kM2NI74JVZchLDIxHo7yq0KhfM+6Fv9AKaumPuGfsg7rvvOKnbyNKjIeGyMxubcpqQ==
X-Received: by 2002:a2e:8e63:: with SMTP id t3mr45656337ljk.71.1621181596262;
        Sun, 16 May 2021 09:13:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id d27sm1712547lfq.290.2021.05.16.09.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:13:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 4/4] memory: tegra: Enable compile testing for all drivers
Date:   Sun, 16 May 2021 19:12:14 +0300
Message-Id: <20210516161214.4693-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516161214.4693-1-digetx@gmail.com>
References: <20210516161214.4693-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable compile testing for all Tegra memory drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index a70967a56e52..c63ffa74ab94 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -2,16 +2,18 @@
 config TEGRA_MC
 	bool "NVIDIA Tegra Memory Controller support"
 	default y
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || COMPILE_TEST
 	select INTERCONNECT
 	help
 	  This driver supports the Memory Controller (MC) hardware found on
 	  NVIDIA Tegra SoCs.
 
+if TEGRA_MC
+
 config TEGRA20_EMC
 	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
-	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
+	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_DEVFREQ
 	help
@@ -23,7 +25,7 @@ config TEGRA20_EMC
 config TEGRA30_EMC
 	tristate "NVIDIA Tegra30 External Memory Controller driver"
 	default y
-	depends on TEGRA_MC && ARCH_TEGRA_3x_SOC
+	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
 	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
@@ -34,8 +36,8 @@ config TEGRA30_EMC
 config TEGRA124_EMC
 	tristate "NVIDIA Tegra124 External Memory Controller driver"
 	default y
-	depends on TEGRA_MC && ARCH_TEGRA_124_SOC
-	select TEGRA124_CLK_EMC
+	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
+	select TEGRA124_CLK_EMC if ARCH_TEGRA
 	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
@@ -49,10 +51,12 @@ config TEGRA210_EMC_TABLE
 
 config TEGRA210_EMC
 	tristate "NVIDIA Tegra210 External Memory Controller driver"
-	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
+	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
 	select TEGRA210_EMC_TABLE
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra210 chips. The EMC controls the external DRAM on the board.
 	  This driver is required to change memory timings / clock rate for
 	  external memory.
+
+endif
-- 
2.30.2

