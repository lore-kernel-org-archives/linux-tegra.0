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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10360C07E96
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC5E26136E
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 02:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237486AbhGNCy1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jul 2021 22:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237415AbhGNCy0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jul 2021 22:54:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA5BC0613E9;
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t17so1003611lfq.0;
        Tue, 13 Jul 2021 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F8IeVJTr7i2bx9mvdVqSYgCa5mC3W+aMda3nWI0nED8=;
        b=MCmPxQ3f1Lui/ioE7JjLTxWZTjqEPpNKskzgP3JFyPZ8KOthPmhIyqJ65B0I60QXwr
         mJy/kRB6d/SKZ9cy4fZH0QVi851G226kWS4/EzZJ3z2NbZyYCvvAJZJTXagQAeH+e/Gt
         xiXGRE5bH839VfHRI2V1Gr3Stp4abpHD/dTKBHnFHo+jcn0GllTvKLZYrexhB3gNloaA
         C3RWjAbXSAFWuYLDohWrJb9f+uO9Vln6j7vLfvPBMXpOo/IA/H9mL9iUl9uylgkNS9yj
         RoE9Pd7bdvKr21cEkfkOvlbMybPNb54y0u6d0mfGPjYfa6koWnv0uW0H3vktD6I466no
         Uv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8IeVJTr7i2bx9mvdVqSYgCa5mC3W+aMda3nWI0nED8=;
        b=AW8rJcDmGggJuG4tq57cwQEmLZZSSP4wL2NYtmK82nGg8+7ejQOXcQsuHVy3XEUlMk
         AHTFxA2Mlh2YFflgNGU52qFjlHDJsaGvEX/8tfF+PjB1qDDvtYmMK9sbceePy82lma/d
         PrqnawWi/t224ecazi+nhJsaFziGD4+Rr3BnVEKBo7paDec9/yKPscwiOVcR8hfHi6N5
         QL4sM7JpLt0OHqJx0aLUBnyuWSWC/44MIDvtMrTnjiF0TEfZWzlgFOgQETlbs7d6r2xM
         dqY7zCginwL4D8vDQDe5C+kfcT5p40U7NcRzUgDqb51wOFPA6XXmHtzof619WRtFsy3N
         gPig==
X-Gm-Message-State: AOAM530YCfx6Etm3xfCTKSse8w3end33JqDIMB7rqNBMAIWbBjaJMPY1
        O7Xw33yzcO4lWKwOCAHhdDA=
X-Google-Smtp-Source: ABdhPJxfK8Og/ySjaeqAKOkIzvj5MVf//U1VbCZwrZNlhdLmxIosfQi4rTDLmkb9Kbe9b31IbvCByw==
X-Received: by 2002:ac2:41d0:: with SMTP id d16mr5818145lfi.361.1626231094100;
        Tue, 13 Jul 2021 19:51:34 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id a10sm50281lfb.93.2021.07.13.19.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:51:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/7] ARM: tegra_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Wed, 14 Jul 2021 05:51:21 +0300
Message-Id: <20210714025127.2411-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714025127.2411-1-digetx@gmail.com>
References: <20210714025127.2411-1-digetx@gmail.com>
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
2.32.0

