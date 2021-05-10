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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E35CC433B4
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F0C96157F
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhEJWl5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbhEJWlz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:41:55 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30DDC0613ED;
        Mon, 10 May 2021 15:40:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id x19so25775294lfa.2;
        Mon, 10 May 2021 15:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RXKVqH0Gu1PT1WV5SwHA4/xjxYRDYxbiWQf6ubIWKHM=;
        b=RhpXB8nQiQOFQ4QC2dEKwCVNXiMkG++cX9ObPSa7BqR3qtDa2obxzBvzWihWn8Qnhj
         kUr2Nl+3V7XPUMhyQM9h0PyD+XkJUxubQsZ++4sw291mxdk/C8KIji7cJY4BoUw8A6LX
         1ezABq8RAJqUMXfheG5u7JKvauWFZiqDWa0PFLg1zZejlyZiGCco00PaQ56HjZEaEHuB
         RgbqhBmQ361M9ufseuAi7FzmwS+AxJLTyYhXMe9RwxYqy2/8o1lh93+eqAFV4Nx733Er
         8EVizSk48f2vEj5bzUbyWDDQXEFUisy77Lf0m9yTKl7Io2DMxvLsiz0u7/2XVykYYMxu
         Zp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RXKVqH0Gu1PT1WV5SwHA4/xjxYRDYxbiWQf6ubIWKHM=;
        b=ghxHaFigGFsa002Jgmr4fbGVWIYJLRgAF6H6naXvy9aa1WHGqSAeVvwAK8cWqgAVFm
         dd1t1sXqTkclnLL+33aTlFz5f45EDdMmAgd2GGm7cKqeI9aWgRlE0+W6fQaCgRDWDN0J
         XhglcDukI6vElhUk5iyl+xpLk7FIsWeSTefeQtlX01A8fRJN5tesQ79BY+vHZwVANqRf
         VnivR8KSHdxqELsU7jQPHr2ijhOvxhL4HQmy4IRk0JULyUom0aL3dD7SCA2ExREirnfI
         +FdicXa+0ZlVzDUB5fcbgW5SfAn8p6TXbL8+LSPuGjie/XaAem8TyLIrPQd36sJ/fqVC
         i06g==
X-Gm-Message-State: AOAM530h+AM7SOOjPY3zmAIUZK0UzZOWC9aScin3kFxa+oF1IR/AElQP
        I1HoClsv3NB3e50ff5sYY/0=
X-Google-Smtp-Source: ABdhPJw4+KNAdGIoq2cCUN+UMGmsEz5RMz1h818IpW1Te5EHVzfhGx9Stm0xsPpuq/G0PiH/r24ZUg==
X-Received: by 2002:ac2:4d0d:: with SMTP id r13mr18102156lfi.42.1620686447304;
        Mon, 10 May 2021 15:40:47 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id g24sm2780698lja.63.2021.05.10.15.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:40:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 5/7] ARM: tegra_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Tue, 11 May 2021 01:38:14 +0300
Message-Id: <20210510223816.18565-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510223816.18565-1-digetx@gmail.com>
References: <20210510223816.18565-1-digetx@gmail.com>
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
index 458b9280224d..581fcea671f8 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -171,6 +171,7 @@ CONFIG_THERMAL_STATISTICS=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_TEGRA_SOCTHERM=m
+CONFIG_TEGRA30_TSENSOR=m
 CONFIG_WATCHDOG=y
 CONFIG_MAX77620_WATCHDOG=y
 CONFIG_TEGRA_WATCHDOG=y
-- 
2.30.2

