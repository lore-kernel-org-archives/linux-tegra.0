Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069D0C433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE96C619A2
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhCTP2d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhCTP2O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 11:28:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682B9C061574;
        Sat, 20 Mar 2021 08:28:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x28so14580278lfu.6;
        Sat, 20 Mar 2021 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=fWreg+PLoVkprsogYb9aiKYbSot0k03pvfGe2hHPbRyDMzx27pCM/Ey2QOVN1impIJ
         u5G6zVL9khcPIOFMNaouuv+MJK2owM++hLGG2gc8sl6CIh9/Rk681SJzWGfJgsaf3aWz
         +mB+IPz+jNKwUMyDentA/MpYRqCFZ5axyV0iIE8bWkiH1VNON4sAF0ulHb+Svdy3e7WH
         cIlBzbbCBRbCoe9UBjSS65aM/ROQAYr+Z9HP6hehSmms0AIqtaKxnwVcQhSYWf3kT1Fo
         5zbu00tRzgeEbZCiX3mjBxq3Xx89GAHejZprtKKHhSQD+mcYzPTxOVFr++vN1Snft+mW
         VP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=HVmnJJsOLG1IiTQkpUzVqIW+WY1eyAZMR3udO9cD5HP0ytY/yeTfmex07z6RXg46Ak
         ZmexmR6avoCDR+zmU8V0aQeNn79WBOGOEJGV+KfqebYI2TmZK3klurw0d/foYeJ6B3CV
         j8TDdlu6qk38rauDdMxq9lKUni8GM9tlCGwTfJcvFqjd+tsn6FT11uUp2dvufAnPWE8K
         01IZS+gDKkWG1MMZqZb2NmignTwJuP+lfvwWBVc6bfomXq8iF/SZA2Tl3N+pCwWpZk9T
         HngAn7pYI5f0kxNlezDf2SLOkZpV3cekvOMG90yXAb22/FOJEJqHmyPYMmUMUE0xi6DM
         PXkQ==
X-Gm-Message-State: AOAM532KsCDyUZfu3q7I9N33OA9FL4GzeNA8ZKpFiH0ZsVCrmlnYIptn
        +uODYjh80BJWK+H8PcEJvF8=
X-Google-Smtp-Source: ABdhPJzYJ1INUayLRn1Ok9JpseS/3K5uAexDQnL3ZeBWUebLTtbN0rNDQtlFtZEHWnhIAPjzPLMU2Q==
X-Received: by 2002:a05:6512:2389:: with SMTP id c9mr3787131lfv.651.1616254091919;
        Sat, 20 Mar 2021 08:28:11 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id t17sm957024lft.224.2021.03.20.08.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 08:28:11 -0700 (PDT)
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
Subject: [PATCH v6 4/7] clk: tegra: Halve SCLK rate on Tegra20
Date:   Sat, 20 Mar 2021 18:26:45 +0300
Message-Id: <20210320152648.8389-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320152648.8389-1-digetx@gmail.com>
References: <20210320152648.8389-1-digetx@gmail.com>
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
2.30.2

