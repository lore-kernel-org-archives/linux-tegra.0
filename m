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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78682C433B4
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6023661074
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbhEPQcU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbhEPQcR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:32:17 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE24BC06175F;
        Sun, 16 May 2021 09:31:02 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c15so4327396ljr.7;
        Sun, 16 May 2021 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=99TMTkahJ4QCgWUEiSLbnT5JfgAic6E8hP6s4tmViRw=;
        b=YI4TPdlKM5GeI4naXWaXkV54rqr2x5yThRcxcnFiYDQmlffwzoCdG3YRzL3wUxjrMx
         uXDsLXDbMasoz68QVesEoGrL6lBZTyDLfHqCjYtb5GSGt7ozw44uT7S9W0VbkK2HBxK+
         ru8fEnqo8var6KabGNFwk04137aB0c9v2KY7iu5djX7TWYnGYrXkhiaFl6IRw+4Gt1vT
         5ggUJlCHDoc7hqdrk16486RFd+KbjSI4ipcrxZaRDYo8gv70R/F0ZGIX10GE/xD1RF0i
         9LDEIoCN3QPTsb90zXSD9sGE4gH9L0FJMMD/wrMntaIvm7PkyG07y63jODpOvdO5vP2H
         oy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=99TMTkahJ4QCgWUEiSLbnT5JfgAic6E8hP6s4tmViRw=;
        b=Fo0hh3sQQ+jMH/qj7kCSUk5IkLKP3KiwyoGR3SsgiyGSYYlTqbUcu67AzKCdX8LAny
         iLEId7Y2Z6qk7S0joIWFdFyWUwBJTlPeBB87GXS3JaXAP3Hq8Mq3eLgUZUbAofyquE4u
         JugwVqoKrVY7n3ZgB8PhatVl5vTUTkl3UsH7EhyZYoql+qtpMIZfu0jlY4cPa3uYQeKQ
         bwgRDRmQJ1Aoqh0Ix6+j7U+g9XGbDC8jHSzXKKCZXFiYxcj63V61qre27ytHHKCDcd+O
         UNi+HnAp/GOYPT+X9vaAautyT0RXPc9HMrmFsqh3DEOKmmW06q27j3nYAe+r7KBqgmMW
         mSOA==
X-Gm-Message-State: AOAM531aERpP3OM4YTV9ll8ls9QpbetuZ1vs8klgT4UJ0uDgKiNtcBaG
        EuDcBRP+NzgC0Dji3BCCeXI=
X-Google-Smtp-Source: ABdhPJzRZGeZ3SQYeuSacr6aWc7bzfsbE2McV8zcCgsJbjRSw7hHlf97aRVJxHTTEoc0ng2wI5Z+ig==
X-Received: by 2002:a2e:5342:: with SMTP id t2mr39064234ljd.321.1621182661367;
        Sun, 16 May 2021 09:31:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id m2sm1704548lfo.23.2021.05.16.09.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:31:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 3/9] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Sun, 16 May 2021 19:30:35 +0300
Message-Id: <20210516163041.12818-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
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

