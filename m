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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D678C433F8
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62DEF61964
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhCTP2c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbhCTP2N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 11:28:13 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A77C061574;
        Sat, 20 Mar 2021 08:28:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n138so14576398lfa.3;
        Sat, 20 Mar 2021 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bGW/+40ApmphwP+PbpLVYGoBEkoT1K7har+B7OfVtFo=;
        b=kbzYwDRpPzDChPkhUWLD+oyBqHWwQqHbrz/J4NJyBCLiuCpSNMbnsIoCvqtufarxB4
         T+yxEwWV8bm2E+4eECY/4kHdDfURaxSI/KzYXr2S5ztTu8OCmrAWteew/SOmqstz+UYW
         ifQvLCKKoXBxowbsZyyDYthuskiWY91ySlsECsvXbSHrn8qrlYt/ND6tk6TwT01YztVO
         Jbf1aHpCBbIt04vLzSRQW7ejnqreFMwy7gLyc4BbUui33tGrHvU7n6sCbP1gMx6fQWEn
         cmVHge6qOiuz2MlThQJcNK77E8hL4m8b2MoRTCofYsGK9wy59blJ+mipDonTG1Y/7MoK
         MW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGW/+40ApmphwP+PbpLVYGoBEkoT1K7har+B7OfVtFo=;
        b=r174fHhdtXM4N6m7A3JNNkxaZnGSVfgg55qeQPcm4gHxDGMFfYsReDz7492c/EmL6f
         45qliW+MsG6qKxE8gPhCVn1YzyXhfwxUswzDrI8Bq5SWe3vRtxcczxybtRLYKmKL1q8H
         F2vUq5xrkdgzLxjXaDkfZNvpj3X86W1T+uSmgFm6unj7bGhcudu8+H8UuxpkXrjEJy7g
         DUEspOMZv9wtv18r/PL2XS4ESZ8hliKw5CTqyamO46J8fVjiBBHsoJU9F6Vifni/Xbh+
         wdzDBMO1e5URCHWx6Pzwqgort9uKqQRRx1ExzL16ZUmq59Zox5f+S7Y2wKelcILPhmxp
         ubhQ==
X-Gm-Message-State: AOAM531Kt97GR11lbApvhnFHaN3dZEWfWRTMbQL0FjH7p0bWRXVDr4p8
        3+yFBk8RQU/kx10Bund+A1c=
X-Google-Smtp-Source: ABdhPJzgh7qdX6II53OZE6VfFFQ4hQceuBAZy+tdwTEUc1ENmbpDoK5ymFqKGVWeyb58PIM/HEbbNw==
X-Received: by 2002:ac2:5c0a:: with SMTP id r10mr3779156lfp.47.1616254091175;
        Sat, 20 Mar 2021 08:28:11 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id t17sm957024lft.224.2021.03.20.08.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 08:28:10 -0700 (PDT)
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
Subject: [PATCH v6 3/7] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Sat, 20 Mar 2021 18:26:44 +0300
Message-Id: <20210320152648.8389-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320152648.8389-1-digetx@gmail.com>
References: <20210320152648.8389-1-digetx@gmail.com>
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
2.30.2

