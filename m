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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C245C28E86
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D09A6023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377844AbhCCDbL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350099AbhCBLyC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:54:02 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9C3C061797;
        Tue,  2 Mar 2021 03:51:44 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id f1so30840832lfu.3;
        Tue, 02 Mar 2021 03:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nodRndiEDIjf1gGT+DYIeX0Kc5JMeKV6FJI5gzT7BG8=;
        b=CvRDaXF912OTEXjfcLWbBLXzKCQWh4HSDSe0nKBk/XdfU8q6OTGN4ebOOyyrXT7xbP
         NoyShRE9UZ4PmUqMPqs+xGxTHiJi27HlpvGRIXxEpePhpFDDrdV+cb2Snaf2fmnM2Mnw
         0A6fxrMVsbMbF/8iOOC3XKEuwzhaPLm0c0dy5+qpQAF1c5rmw24h235SEAt8wW7aw0cY
         JcdE0h8kNAMo4SveeM0OXvAoAp03If/LP4dxo6AszWpTnfFWMQvvsDU7aOgTuHpX6vuG
         rf93F/I8+KxonK2HF8Cgpw5k03V1JaNKKKq6ZwY+QZs+O3kwnxjlhItcEnlBGhRCUoyJ
         1/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nodRndiEDIjf1gGT+DYIeX0Kc5JMeKV6FJI5gzT7BG8=;
        b=XHkbjuow6tRQWhVsv3mqgjOSgeMfisJkIXLRS5V0qMqpCOk8NfyfuFEET9texdH1UI
         1evAZUghA5OziJz8bIgOX5hHX6mF6Ax+qcu0ldM5FWRsjYfPKA1G8Nw01c83xL78iXlF
         VFfgoJo8UUUk8/W4LjSPww+T1Y8A2hyt4jAYlp9hLQ+8V2fy5g+MpAJV6DNRus8aGkGq
         uqsJSzadXf5aTtqU0jhEsyar66zc4DMdyz26hlLXuHsvRu9h6B+5EwVhWg90C932b16v
         9yaVjIdW/Dgon5pfG0rpehGm+nK9acSZVbu74/LkmbewwQiBTzuyf9mo7FQyr/8v8DNB
         XmPA==
X-Gm-Message-State: AOAM533QX1XOa6dPL6UfTGmWE1WLlFnlbbcoBuvnd66vUT7IXNm0gxjU
        VSI4k5X0IwO+wCAoEjjiEUtqBar6HbY=
X-Google-Smtp-Source: ABdhPJwUnGTdT0ZckBWt9aZDAyQD9LHkZSGAQLzxYHoiILJExutrInRxkkDG+lVgaOhzHA52quk37A==
X-Received: by 2002:ac2:48b1:: with SMTP id u17mr12978490lfg.627.1614685902852;
        Tue, 02 Mar 2021 03:51:42 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f4sm2720151lja.69.2021.03.02.03.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:51:42 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Tue,  2 Mar 2021 14:51:14 +0300
Message-Id: <20210302115117.9375-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302115117.9375-1-digetx@gmail.com>
References: <20210302115117.9375-1-digetx@gmail.com>
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
2.29.2

