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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BFEC433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 978D96161C
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhEJXSx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 19:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbhEJXSw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 19:18:52 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4839C06175F;
        Mon, 10 May 2021 16:17:46 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id b21so22801077ljf.11;
        Mon, 10 May 2021 16:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=99TMTkahJ4QCgWUEiSLbnT5JfgAic6E8hP6s4tmViRw=;
        b=vdnvIArSFwJWi5xtU+3Cxuq9ZSDmNVEUVq4qgO4DFQcoHdpRwbEj+bG/crq1fAPFBk
         bkEdTPZFWlHcehe4mA8gfe5TBgg+Cypivd8xXJ6PmDM8pVoov4sSV7z3l6FRN5IUdu0g
         7h19bfTlETyV/qJMm4mO2PLlhb2YEtl+QX5/UCuMO3CpptoUl4grlrL8ObZHbmnHQMEO
         Lh4+KbEx/XPxb1s/GJTKAQo2QdQr5pZkZnFNW1lvCdzdfVriddUQkWRcSap16L7FnV5E
         IGlcMPd2YYP4pKOcsA2+E5R31ElwBPY5hciyOqiBrTO2kPhbl3kbz6AEwqtiN1qzhNpf
         qy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=99TMTkahJ4QCgWUEiSLbnT5JfgAic6E8hP6s4tmViRw=;
        b=KlRiuycAUDWmkciTOa3APrpahw4uESRfNEIuW4ThUqM/NWKs3svXVLpG/b6VH3fBYV
         7bjsIUCpEFDDfMQS9zv0p/1KWmhX70wqOerGSziatAiof1N0N/1JoysOZ4x33C50iClc
         o6lmErLvYQamT1Uthm2cPzwB0npZanzXD2fvYrexH+r+EtHUOMPyr7VBsitcWqWR0z+k
         lnFxQ5craDVVlPSWMZe3Js6y9zaFTZDWrBavjogUqdopHrRiZ7EyrJGmzAEu1uOYi98m
         4hgJ8naPkvzz2Jc1ZFBKNklbqFWWYRHFqkAmYMELZnCyxrCpvGenXLt1ekY5eWDF6sDE
         gT/Q==
X-Gm-Message-State: AOAM533IXkkd86/n++a5Ck8mKtmCk+EFZu75NvAccTJ26+eKT7cLsZSE
        dh6JTLPZTjK48sG48f3hC4k=
X-Google-Smtp-Source: ABdhPJzrAibelYTcFBmnX7JrVnkHC6nTxhXtVeyiKMQXYnuzoPH+6VGXXN3ryQekx/qv/fjaQRDxRw==
X-Received: by 2002:a2e:5c7:: with SMTP id 190mr21356059ljf.174.1620688665456;
        Mon, 10 May 2021 16:17:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id k8sm2422254lfo.123.2021.05.10.16.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:17:45 -0700 (PDT)
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
Subject: [PATCH v7 3/8] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Tue, 11 May 2021 02:17:32 +0300
Message-Id: <20210510231737.30313-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510231737.30313-1-digetx@gmail.com>
References: <20210510231737.30313-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The PLLU (USB) consists of the PLL configuration itself and configuration
of the PLLU outputs. The PLLU programming is inconsistent on T30 vs T114,
where T114 immediately bails out if PLLU is enabled and T30 re-enables
a potentially already enabled PLL (left after bootloader) and then fully
reprograms it, which could be unsafe to do. The correct way should be to
skip enabling of the PLL if it's already enabled and then apply
configuration to the outputs. This patch doesn't fix any known problems,
it's a minor improvement.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 0193cebe8c5a..823a567f2adc 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1131,7 +1131,8 @@ static int clk_pllu_enable(struct clk_hw *hw)
 	if (pll->lock)
 		spin_lock_irqsave(pll->lock, flags);
 
-	_clk_pll_enable(hw);
+	if (!clk_pll_is_enabled(hw))
+		_clk_pll_enable(hw);
 
 	ret = clk_pll_wait_for_lock(pll);
 	if (ret < 0)
@@ -1748,15 +1749,13 @@ static int clk_pllu_tegra114_enable(struct clk_hw *hw)
 		return -EINVAL;
 	}
 
-	if (clk_pll_is_enabled(hw))
-		return 0;
-
 	input_rate = clk_hw_get_rate(__clk_get_hw(osc));
 
 	if (pll->lock)
 		spin_lock_irqsave(pll->lock, flags);
 
-	_clk_pll_enable(hw);
+	if (!clk_pll_is_enabled(hw))
+		_clk_pll_enable(hw);
 
 	ret = clk_pll_wait_for_lock(pll);
 	if (ret < 0)
-- 
2.30.2

