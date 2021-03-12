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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7890EC43619
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54E2A65034
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbhCLQhx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbhCLQh1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 11:37:27 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A504EC061574;
        Fri, 12 Mar 2021 08:37:26 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k9so46703385lfo.12;
        Fri, 12 Mar 2021 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nodRndiEDIjf1gGT+DYIeX0Kc5JMeKV6FJI5gzT7BG8=;
        b=j4PAyW4+fYXo/h+21SVK6STpXsHeEo1urxU2Dz2nvyCwMzrvh3WBvZK/8wnLtI4awa
         YeDxOjRtJO5jpgmjfrzY/WpgD4lKMPYcRS4wBJyiOU27Ynr6ZtVfUCXe0/P6a+QPfpVK
         uS4pIIKe9a0jgLSKFXrjpJTOoFHsnKxZQ9PGpPn4ldl9bYrBhB65GmM+6uNjje4OoLAY
         xocy5faxmo8r73p8/DSfI1HQulKtE28tCnYH9JQRA9WrbhYShZr73YoeotdXHIgQ/8Mz
         0fUWCo++qDVPg9jJT0TG1F7bVe7YR5EP49zSYc9GSuoKfMzu/BhWUJniiRi3km1Yl8G5
         bGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nodRndiEDIjf1gGT+DYIeX0Kc5JMeKV6FJI5gzT7BG8=;
        b=m0ePrP9hhI8V4+b+0DAHUI0SrDB8t0ZZlRP4FPh2RPj2HOQ59FSCsIkiA0OXugQHHe
         C2/tSj2PhLBbPQgOYecoJ92mXuoM+U8mpH5N6ZY1o7HKU9rKx8uxWfYY5r9SH9liIa3r
         Mba9+a9vOCVSz7KtLEeRxZ6gdigz2hTz7aRel9lFkToMVFVf3m3ZNAXjpLeWnfV/p2eW
         O9mLOfRhOsrIPH5n61fgr4nO3o396gvyWKrydUp1ryCFsaBqNyKQialj40foCrLZq6Wx
         Qivh8OLJe145Aqn7TbYEPD978bRoDcW53AXKOkORyRlap17TE4KuLBChBTh74tEq0Uow
         eCrg==
X-Gm-Message-State: AOAM532EAIIJJEX9Q0bXs0YoCK6QQJ71OUBAsGzvRQsbVVjfI/Qy/toR
        VtOCQ0AMGJsyh4ZzCXbt3eQ=
X-Google-Smtp-Source: ABdhPJzItos61FqARSDQDvrbiQzeSC7JG1+3gq3CSNrNrscGWMFTEBLbk3HvKTZcvyDm41H+J1SJFg==
X-Received: by 2002:a19:3f04:: with SMTP id m4mr38620lfa.395.1615567045244;
        Fri, 12 Mar 2021 08:37:25 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id l21sm1771703lfg.300.2021.03.12.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:37:24 -0800 (PST)
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
Subject: [PATCH v4 3/7] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Fri, 12 Mar 2021 19:36:28 +0300
Message-Id: <20210312163632.8861-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312163632.8861-1-digetx@gmail.com>
References: <20210312163632.8861-1-digetx@gmail.com>
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

