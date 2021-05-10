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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA69C43600
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B12E61606
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhEJXS6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 19:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhEJXSz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 19:18:55 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C237C06138B;
        Mon, 10 May 2021 16:17:49 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id v6so22834665ljj.5;
        Mon, 10 May 2021 16:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ezXWLawRH6/xu46ft4pBR8YUb7TW3xNdsazrSx37qjs=;
        b=BoquGtg0zIISKb4qZ1jjSUgWVjCr3Mh2Qvs/6sfeVhKYMJOAwK0yYlBYSbxCBDL5gE
         OaJesr/ND0+toY/mEV0pYprlKTBo7NIIXJauDKMLx/Mi6HpUGxEnSOd9J43dL48xSdV4
         N9nDEjUn1aRl+Y+bZAQ1k06vY8S7goqUA7PeOI8Iz54yR9uSMUvqLXvCzLRwYJZqLpwj
         ixaxttFZv0Z3gZpq36jJl/aBVNw8MItqFq2uDuxOZ9XBPgZjH95OCJpTPr3OnSKSb/We
         +excoh+cTKoiRnuWkMJvyV23WeJpWOJpdx804kWp81EvTIS1dUGwIgUlk7gZ0r90zgvo
         +r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ezXWLawRH6/xu46ft4pBR8YUb7TW3xNdsazrSx37qjs=;
        b=U/3ZYMXR5TLQ/m5ZxL1RR1pcOJu0kAv/0iqgLFNJ3AFEITmqrvndGxt/Ir/zcmLm8O
         J8san6JPA4y1+8bQmpkvdi60Y5Yn51ysas4Nrj53OkymV1neYDqzvuc8KOow6J6r8gUS
         HniYm7AR36vsYEGE/MyIhfpmLreqVieAhQvDqbNhlonB+NNhDP9IZjJ/LnaBBzddlQ++
         ztwKc5vh4KvM/r/qQvLbaz2zehG52vez+VZF2GS858bVexMxucOqRR5A+hJGbDY1jP/H
         9oY1Ifpv07Z/R5cluw31v/3jbHAIZeqdaI1X51WhxeZm08fgre302AIvKMdLq36QIGQ+
         +yxw==
X-Gm-Message-State: AOAM533Het0OekSJSQn9Qfn4rDqEa3N+DQJC2VjXpNxNA8e4gFQ2eZ7q
        uW4vFRJOnhBrPZHZkGtEv0g=
X-Google-Smtp-Source: ABdhPJyS4Sv4uiaOwSO2HV5uTZ53o1TSeOg2JISZIJbPW253gLu2NRQfvpkphvMkl55tnYsP3snTAQ==
X-Received: by 2002:a2e:818d:: with SMTP id e13mr23039363ljg.18.1620688668060;
        Mon, 10 May 2021 16:17:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id k8sm2422254lfo.123.2021.05.10.16.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:17:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 7/8] clk: tegra: Mark external clocks as not having reset control
Date:   Tue, 11 May 2021 02:17:36 +0300
Message-Id: <20210510231737.30313-8-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510231737.30313-1-digetx@gmail.com>
References: <20210510231737.30313-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The external clocks don't have reset bits as they don't belong to any
specific hardware unit. Mark them as not having reset control for
consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 60cc34f90cb9..292d6269daf1 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -712,9 +712,9 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("ndflash", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDFLASH, 13, TEGRA_PERIPH_ON_APB, tegra_clk_ndflash_8),
 	MUX8("ndspeed", mux_pllp_pllc2_c_c3_pllm_clkm, CLK_SOURCE_NDSPEED, 80, TEGRA_PERIPH_ON_APB, tegra_clk_ndspeed_8),
 	MUX8("hdmi", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_HDMI, 51, 0, tegra_clk_hdmi),
-	MUX8("extern1", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN1, 120, 0, tegra_clk_extern1),
-	MUX8("extern2", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN2, 121, 0, tegra_clk_extern2),
-	MUX8("extern3", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN3, 122, 0, tegra_clk_extern3),
+	MUX8("extern1", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN1, 120, TEGRA_PERIPH_NO_RESET, tegra_clk_extern1),
+	MUX8("extern2", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN2, 121, TEGRA_PERIPH_NO_RESET, tegra_clk_extern2),
+	MUX8("extern3", mux_plla_clk32_pllp_clkm_plle, CLK_SOURCE_EXTERN3, 122, TEGRA_PERIPH_NO_RESET, tegra_clk_extern3),
 	MUX8("soc_therm", mux_pllm_pllc_pllp_plla, CLK_SOURCE_SOC_THERM, 78, TEGRA_PERIPH_ON_APB, tegra_clk_soc_therm),
 	MUX8("soc_therm", mux_clkm_pllc_pllp_plla, CLK_SOURCE_SOC_THERM, 78, TEGRA_PERIPH_ON_APB, tegra_clk_soc_therm_8),
 	MUX8("vi_sensor", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR, 164, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor_8),
-- 
2.30.2

