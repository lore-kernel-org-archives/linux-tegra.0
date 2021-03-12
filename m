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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7E4C41621
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADD2565020
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhCLQhx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbhCLQh1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 11:37:27 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B80C061574;
        Fri, 12 Mar 2021 08:37:27 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m22so46695464lfg.5;
        Fri, 12 Mar 2021 08:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/OuucxeHi7PJrm8acOWag61CT7ykaXlnUVeZkx8Omt0=;
        b=lFZtAtvvhE5nyR00/X6synbG16j8x12lwigkLy+WWRk0S52l6a+VweSDOx/90R7rnS
         HFiamJzCVurV4o+gIdhfv8xC0y/xsEb1YUaG0BcJuE6vV1HXUzSkqJPH4r7TIJcS/PtN
         oPXJtY5VAj2ZwdDjizV0YLXsISx7WKmZo1+aXTjI4Q6VUOLDTOg/PQEnFErbU1a7o/t9
         za4VwZj7aO3Gy/xN5KoprJkJx0PSuUe9N5x53TsW2FN2Ek3OkQ/YruqqTNZ7b4QuXGtd
         QN9LYFu+b9Qe6TDhRPdUMoDfwv8rgVOorb1vZM6K8L2lzdukPeZoUzGdirZq8v9h1xV8
         BSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/OuucxeHi7PJrm8acOWag61CT7ykaXlnUVeZkx8Omt0=;
        b=l1MmC7neH6PWFjXQx8tZCqg88nyWY5SoEgAVdNVBShz37RPofr1V2H6cPu0pRP/ODE
         KYZQWrn3zKo9qY+lgzW+y+oNGJkFVvJO5huDuooorRs1IAW+NuGobm6BLpy2AhtiPPJM
         84UO9HrAdxPBypS1SRdrwFExmatxiooRM9oI62mIhJJlyAA5/sImQozNCChgLeQU1PCg
         i2tSAmnzLO9ayHfmqhHUwExen08Hi6/lcyuoubm5+tL7Xa9VjvHVeFx2D7DOyAw3KQfB
         jc/qQvMlukJTxU6a3SxNqulXHvuGnezxXkc+BWlgYD08pOUZda11I4EXAojGFHfzylSA
         PL3w==
X-Gm-Message-State: AOAM530MjFJwHlTGMWKynUSSql7WfuS9QAMjED1JquFw40DZWvlts4QN
        4nxDvxLEwzmQC4BbICEBDE4=
X-Google-Smtp-Source: ABdhPJyK1c65xVApj6I6nzf152A6bkn3BRr4rAD3mC0b8NUjUbZmr8OBFGyugseoyGX94vX8rJcmGw==
X-Received: by 2002:a05:6512:230c:: with SMTP id o12mr69184lfu.350.1615567045902;
        Fri, 12 Mar 2021 08:37:25 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id l21sm1771703lfg.300.2021.03.12.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:37:25 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 4/7] clk: tegra: Halve SCLK rate on Tegra20
Date:   Fri, 12 Mar 2021 19:36:29 +0300
Message-Id: <20210312163632.8861-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312163632.8861-1-digetx@gmail.com>
References: <20210312163632.8861-1-digetx@gmail.com>
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

