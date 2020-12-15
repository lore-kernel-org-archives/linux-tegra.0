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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAF5C4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 21:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5BD622CB8
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 21:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgLOVNs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 16:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgLOVMl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 16:12:41 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE45C0617B0;
        Tue, 15 Dec 2020 13:12:01 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id o13so19870102lfr.3;
        Tue, 15 Dec 2020 13:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yPM+mKrzqzT6nC3Wy0WdIdZUS1fp/5EYjuK6AyVpd2s=;
        b=Sy63e+KLreIH/yZ6zLpSniO0StkKcPrn/hJlrTCn+e+galfNlR3MD9xbn5mEhsURly
         wH2bgWg17bk9quqC/0cC+kiifi+rSpixl4wt5S4HGCvbsYhPuovgFuRgm6+NZxxC1dg8
         b25gP3BDgMELgfhw1iJJgOzmt3fiiif3d2ubKeaL5Z1CtfUDqS2fmO4ZbKVjrBNH2zBL
         uJEgFOKcfWhzFxMvVySnfXMnez9sGsOnb9Ke+h94cr1LLS+4r6vtEISq7ZTNn4MrZuNO
         XUxvdWAQ1RY7WLLRQI/mlYhA55CIwTPlZ5YLZ85OV2JVjkhhjv3fTzWZhsHY4du2F2p0
         3Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yPM+mKrzqzT6nC3Wy0WdIdZUS1fp/5EYjuK6AyVpd2s=;
        b=FH/37Qtyp6CDhu3d66sz5SXgooYnhSNCsjMT8BY7NR9N2RJDbdz+ZyKnMGf3rKjYz/
         QJzenmvJqlvLwKEoTQbQ6MMzz1lSnkjbz7cQEMc+xW3ng3MLteEOUQy92+E6gbf8OM3N
         9JesVwsxh8tT1CQekhbJw2Wldn3BV8YxuU1+RlK40zQW3Jsyvjun2WZ8P6fNfqAm6cP/
         wLtWOisfXVmmj8a4oTvpCdRcSkp5zN+huAfZzyC4XdEw4gnA3dNIM4ClrdgPOXNWhwqI
         kU8i04ekzpRbrhzcRc1iM7dLfTKjQBcwbWdqvejp8htQb/HvCpSnDPKJGD4shKmS4Ilj
         4G1A==
X-Gm-Message-State: AOAM531kAtCMabDPBjcIXqJeZ0cqU2t+820PZ3DDQRcAasdUYAt51HOW
        zWl+UwHJPSXMfr2ORlRkUoM=
X-Google-Smtp-Source: ABdhPJwk7gzNyJuUn7p3gIvhAs9JddAGDvrG15CVouaEZnB3cn+rQjsBIMpZjfUlLjEA5Bxeg01CQA==
X-Received: by 2002:ac2:4d44:: with SMTP id 4mr12296918lfp.627.1608066719730;
        Tue, 15 Dec 2020 13:11:59 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id k11sm2572079lji.95.2020.12.15.13.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 13:11:59 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Wed, 16 Dec 2020 00:11:50 +0300
Message-Id: <20201215211150.21214-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215211150.21214-1-digetx@gmail.com>
References: <20201215211150.21214-1-digetx@gmail.com>
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

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c5cc0a2dac6f..d709ecb7d8d7 100644
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
2.29.2

