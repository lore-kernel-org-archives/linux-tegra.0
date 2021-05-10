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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6D7C43618
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AAB76143B
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhEJWl6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbhEJWl4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:41:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC8AC06175F;
        Mon, 10 May 2021 15:40:49 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2so25752213lft.4;
        Mon, 10 May 2021 15:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uG0wF9x5J31B5QovgpxzHE3VxGkFw0gZRlBKzlTkO48=;
        b=tsZdxnMiH149R1Dhw3d33KtAcAFLklb+vJjWxVEJDl4lPAU4VlIugJxbHuAe5g80w+
         REkbev/MJ3OrjtgBr2IpNWhnMN7td1LuqtSzzyY0iFwS52m07H8V6DRNlw/M5YUVYrCO
         fXONaqSgvgx1nKwIEP0km8pDbQBUYbP4E673nTz/g77kLRdVZoT03RS0AOTGYPKvKMQz
         1T72rY2U7pNY2711Vgx3FUmHs67+I9imTXW5C+PQx/P8jKGCreBWGtwif0usYlFQJ0ek
         jeOeL5feuWpol2GOCSxIKyzwahU5dc8n75WPLexptB486ZURiFUVzgyb7NZs8dFVGcsT
         T+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uG0wF9x5J31B5QovgpxzHE3VxGkFw0gZRlBKzlTkO48=;
        b=saMpgIAsU7/koyrqgJmxPkvXs/2mk8Y38AaHeDE2Sa/Y8nNvf/7BDrcmgirQGslMji
         0VVq98EX2DBHA83RsJo3/rws866Z/04fIXj/y9aCzV0UJiHYx2paxChh76Y4mb/NiQ66
         8PpQ/0ZYY/9B9EW5LauvC4S/Ulq/yzalaTOS9Shwg5r+9eKC4qUcPJOSGcn7uHkiKE2n
         t+DKWZaeC/XFFSRUYcsu2m60G1qj0Dez4HNdc9zKGz7HDKpZQt7bl9auBhUJqod0kRsm
         6D7YrofdMu1whR9eKcCTMyXf8w+VDE7wwkMaF8YFzSMWqeE03W1oNT9OyF2Ryxt89neX
         5CNA==
X-Gm-Message-State: AOAM533/0Qm3cbILY1CFeMkN9XKhE/g2pqs77tfdvJcZbSbp3ya0UsZp
        zCdn/FyuhfjTz44Fk9+NC9c=
X-Google-Smtp-Source: ABdhPJwk9QDTp6EFnUSeNwin5PoUdwbzqLx0YL15DDUf3BuJDlzikg6Ha0c7ropbAuWKBLKj8Lk3gA==
X-Received: by 2002:a19:7dc4:: with SMTP id y187mr18680565lfc.525.1620686448146;
        Mon, 10 May 2021 15:40:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id g24sm2780698lja.63.2021.05.10.15.40.47
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
Subject: [PATCH v1 6/7] ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR
Date:   Tue, 11 May 2021 01:38:15 +0300
Message-Id: <20210510223816.18565-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510223816.18565-1-digetx@gmail.com>
References: <20210510223816.18565-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable NVIDIA Tegra30 SoC thermal sensor driver in multi_v7_defconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 52a0400fdd92..fc346f87d7f9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -523,6 +523,7 @@ CONFIG_BRCMSTB_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_ST_THERMAL_MEMMAP=y
 CONFIG_TEGRA_SOCTHERM=m
+CONFIG_TEGRA30_TSENSOR=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_XILINX_WATCHDOG=y
-- 
2.30.2

