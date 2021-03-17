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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE738C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F46164F57
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhCQTbm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 15:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbhCQTb1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 15:31:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015DCC06175F;
        Wed, 17 Mar 2021 12:31:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x28so683816lfu.6;
        Wed, 17 Mar 2021 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=IbTtzH8Cc56Zr3qXoBp5Xu+tuoYXpDKy7pZT2BcsJbNZ9AgJ254k1Kr2qOIoXNCskI
         EPv6bHF5UNZIqF+HoZf77MnqpXTRYv2VixHpDHUEoTllWGuYAqINExnzJnWi4TD3lNWz
         u2OgLLAm/ynpqNgnptqv2lxwn1GEiGDVtgt56Ha31QpIkmW+MiHd9wfKDlomzNZwVGyW
         Gz0jsu8dtqMfJwQA5vVk3lfLU66Rok/BvPc/pJiEbXdnykqN6snqrkPjzoClPh52BI9Q
         D8UXVDrhLQTU5Qs1T9JQajWyVm7wBZdOEIIAvUzKHwsJfnEiK1riWg9g/wiRcG++MauM
         Uxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=STQqz208iwylZDZnGmSDXT7+kC8N2z4l223hjPo6XiZyR5VYoV7BOP+3agO3vMY09P
         FTB2eLRsOqSACbFTfNWXVHi60Pr40zAMavbBdsaQ6iQUhi8bqZ0Y6uw1c6M7cuFyCcZi
         glGw3HwD6CcbykRle2FPKrrNCQiemkQKaetAM05JhnrsU96uFlR7I2H/hfQs18ZoKiaK
         rwvIlGYPp2brDhleyUH0Cm4SeVIN7ND251cKVitHL62MadH0z0cDDpjL91hIe/JiU/r7
         4HfzciMQkf0tZZxUuQnLnK4yYQnJjPlth7v0ab3tYfJ9e/ALfkHbVbPfyWQMQ9/uPF1O
         Elog==
X-Gm-Message-State: AOAM531FyU5DKIDX3I7CdmWi64TfWgmLWJMY0rKJN7tRjGLkMmxd2Eu4
        Hq1emHSbnNxqGMY3u37kYKc=
X-Google-Smtp-Source: ABdhPJw/xyVW6cLYpmwpvyceHjC39GA1k0QPWaYXS7Fr11RBFwQRH80w/vI0l4I/c4UfE9X0sJ8RZA==
X-Received: by 2002:ac2:5977:: with SMTP id h23mr3382143lfp.156.1616009485558;
        Wed, 17 Mar 2021 12:31:25 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id q24sm3623098lji.40.2021.03.17.12.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 12:31:25 -0700 (PDT)
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
Subject: [PATCH v5 4/7] clk: tegra: Halve SCLK rate on Tegra20
Date:   Wed, 17 Mar 2021 22:30:03 +0300
Message-Id: <20210317193006.29633-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317193006.29633-1-digetx@gmail.com>
References: <20210317193006.29633-1-digetx@gmail.com>
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

