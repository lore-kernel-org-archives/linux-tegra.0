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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA89C4332B
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4424822BE9
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733077AbhALM2t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbhALM2q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:28:46 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F38BC06179F;
        Tue, 12 Jan 2021 04:28:06 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id s26so3065700lfc.8;
        Tue, 12 Jan 2021 04:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yPM+mKrzqzT6nC3Wy0WdIdZUS1fp/5EYjuK6AyVpd2s=;
        b=Q9mMuXr23GolpvBFHmCp4TOnsl2aPfCnoQZbHQUvlLn7DvkSKDS6rCaohgjxaOkVZ0
         Tr7oXx5ycALb4izjOqc6UiVkVde/Hxwp2zVFRcqnocqIxyM/F7QKLDKLdQmx19yK3ypz
         TL55nxBlwK9vAOyOXnHlEg5qkMzxXXxoV0z+ymHVW3aZFu0Cg+SJjFDODnepv39Qwuz7
         fcW8YNSy++yk3TOfscEcDzaiZ2CVGHMo8BWtZyNPguM28iZ2+SyhuqTMcng5kFmc5pBe
         3wIlDqDQneH+qZGMGRtis9ckzl0d0Ob6zm6mHR2BsCLJ3NvNSo/2WZFcMVwbUvtgvBU2
         9SXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yPM+mKrzqzT6nC3Wy0WdIdZUS1fp/5EYjuK6AyVpd2s=;
        b=e5Lez0Ll4S6lQBvoQb4jlq7EXxNdlsERLuPW+JgPXyuw6vzB6cAUiIj5D6xoyXH8bb
         Q5aI3VBfPbxnbD74kXZYuD4rdgVUN71fgGYSBdA8/oqsayywueYghStGc6feIyfsmno9
         inHeOPK0FhrxZunxuI++Hbghtc+o/c4/EvtY3a2iCPjEDw8ivU7YUauCU6OJYOBI2GMz
         zQdHX9U5UMrIyUXqcRzlPBCbEfrpE2IFSkrn6XgouxmoPcvx9nQoXZTRscw5Qf2CfpjF
         CTp0ExLg9HHT6ZSEfwicsDfSeQJ2vDO8hwyFdjL9dPxiticRvZdaphp0M350+geVZM0U
         XxCA==
X-Gm-Message-State: AOAM530tKUjnIEVw3nP4Rz5KahDvYVW2i7Y2sEOv6BlfftDso+N/Fomn
        yBSXhIKgPJ96GQB6/rWkegkKTpbMUq4=
X-Google-Smtp-Source: ABdhPJz2mj634TSDJGwQoNWnQdcqL6BqMYNrd/bWW0GAnC5IZVF9HxX7GshCwNFyETFOxm0A6kJceA==
X-Received: by 2002:a19:770c:: with SMTP id s12mr2082419lfc.367.1610454484891;
        Tue, 12 Jan 2021 04:28:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c3sm330136ljk.88.2021.01.12.04.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:28:04 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Tue, 12 Jan 2021 15:27:22 +0300
Message-Id: <20210112122724.1712-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112122724.1712-1-digetx@gmail.com>
References: <20210112122724.1712-1-digetx@gmail.com>
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

