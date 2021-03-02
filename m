Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D98C28E82
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 178936023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377836AbhCCDbK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350100AbhCBLyB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:54:01 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA15CC0617A7;
        Tue,  2 Mar 2021 03:51:44 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e2so16368210ljo.7;
        Tue, 02 Mar 2021 03:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/OuucxeHi7PJrm8acOWag61CT7ykaXlnUVeZkx8Omt0=;
        b=ROQL/dhXDg5Y27qErAuirusjvCvGXignNERRBXjAv0CvJl83B9zCfXRk+vssCTQuSe
         sorWkpRTrXOmkIPwmMbNpZF+NEBBerllW4ulibhpy5PdNtBM0MOlt0I2BCWjdkAadQ/A
         R1M3PVLi0WEfGIx0koxvWyLITi4SdhnQBrWoW60ru2gla/9MT1xd2Z7fnxKO73v0xxXX
         Ye/PoeboWvjd4HDGeSV/BwwZqie/1iQPrX2+89U07uBAs2R5MCG36g+WnjWiFBYSrF2b
         jV6nPGhMxP12czpcGFYyy7+dc+kYxJRDK/E8C+0HVcLfhcHLs6x6f6Q1UFXxY2eoCEhy
         aI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/OuucxeHi7PJrm8acOWag61CT7ykaXlnUVeZkx8Omt0=;
        b=sJHAMP8xXJhUkVK3QRKHaJYN/S4tBR+HWq06NJ3+Rl03ivHA5oOJ3vZyBEzP+/1PKO
         amcTx1Y/Nj+ciWfotsxgEk7AejJconftxRR3aXS/pS5KTmsVdk9GRf1Bymj5nyuvILJX
         oGlXdwiCr+gITRFaylKJrB94XIlJ1Gb0AJNS/li6D7fb9mSqjByx6ZM/GX5oBhfh9kKm
         U385V0D+go6Ay3TCFg9+MfC2XNIosQczlgcV8bkQM2jQVVpqgKb29dQuyzXhd+7m8OMF
         UVAa9BnNNuo2bDxV6ev8bdFxggv4HcGqLrjOkcA2VHQCY3keYn8gwP2yhgoIh1EP7I7e
         b62w==
X-Gm-Message-State: AOAM5337QuLDZHm0owGfIeVGEU9HyQLhxmXZztELzRZSYCbMGsS6bEFH
        BYpYe4/PJzd20Y23RY/lTno=
X-Google-Smtp-Source: ABdhPJxvAFpV5flsyCjZFesjEuXSRYhrqlM7qVyL8eMAxRrdkemgcDnXbx1+/wT2xtD5hatK14LZJg==
X-Received: by 2002:a2e:a0d0:: with SMTP id f16mr12334231ljm.215.1614685903507;
        Tue, 02 Mar 2021 03:51:43 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f4sm2720151lja.69.2021.03.02.03.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:51:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] clk: tegra: Halve SCLK rate on Tegra20
Date:   Tue,  2 Mar 2021 14:51:15 +0300
Message-Id: <20210302115117.9375-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302115117.9375-1-digetx@gmail.com>
References: <20210302115117.9375-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Higher SCLK rates on Tegra20 require high core voltage. The higher
clock rate may have a positive performance effect only for AHB DMA
transfers and AVP CPU, but both aren't used by upstream kernel at all.
Halve SCLK rate on Tegra20 in order to remove the high core voltage
requirement.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 3efc651b42e3..3664593a5ba4 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1021,9 +1021,9 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 1 },
 	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 1 },
 	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 0 },
-	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
-	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 240000000, 0 },
-	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
+	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 120000000, 0 },
+	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 120000000, 0 },
+	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 120000000, 0 },
 	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 0 },
 	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
-- 
2.29.2

