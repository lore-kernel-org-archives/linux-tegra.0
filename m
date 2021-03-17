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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD55C4360C
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6003264F55
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbhCQTbl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 15:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbhCQTb0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 15:31:26 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D6AC06174A;
        Wed, 17 Mar 2021 12:31:26 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r20so4657740ljk.4;
        Wed, 17 Mar 2021 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bGW/+40ApmphwP+PbpLVYGoBEkoT1K7har+B7OfVtFo=;
        b=t28x67WyRO7HKc4ha0z8eq1cdnX3gi4so1Cko1LaP5ytC5/4EGsm2aZQhxTziTfV2o
         vIzu/N3FzVdoKLlu8pkf7RAlWHiw8ZYVP/NbGrAGAzy7B1SMFpQpNpBMCLSHFORNW2q0
         Kqs0l2de0NIyEnMRLAwHH4kAGNPIhIDuGx9BfjzwvBcGPFYjybtgIN0BMVffDRsO6+4P
         7lRAPQd3iflz1c3UPOgouTSIbADTC6CgbD+LXH0pYysA3ouVbBVojaPchMYU8R306VFY
         Rd4SypN/UO01r3+GLa2IHTvNJ2VOVNxEvwQUgNC4pp7gjVv192EYfV/0o+lOatV3r0IO
         Oafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bGW/+40ApmphwP+PbpLVYGoBEkoT1K7har+B7OfVtFo=;
        b=PMf82ZOgWOZ4fI8qPQU3wgQMtUYXVc8qY8OR8Bn8l24A3XStWCE4UGXnp7hF3EVzLL
         lhR6Qyjg4/e3l01olUs0PxcKmVNCVDKSuZiVyqaoP38+/GU6bX6VGnpSyvg4LPljrbIR
         9OX1m1xt0JWZoGd5W/9kYI19QNJPPP9H5lfb1lSUoQGE1J4xz0kDi81SyBoulmkFp5JZ
         F3+1R3Cn4PNA1nqpuZRlj3KQB5g9eSmofMIXz+HSfATQE2wtthv1ijnMdL024tb+nTY/
         M55U2r4cKoqdFV2G5515+mTm87tlnMGl0TnfFlxemT1MLFejb0XNxaRvkoSl6TB09FiX
         HNhw==
X-Gm-Message-State: AOAM532Uelt6d5RBD6EDzp+GqeCIxLN5pgK4c7LMqLvKv5+xkB1jU36L
        NqsEkl+UHtgR2kRfwm2nEvY+bmKjgNw=
X-Google-Smtp-Source: ABdhPJxPMs/Gv+5bLOrRGiqHNeYbk1UHtLQV5OkTIPh1OSJuiSnIeY0DBdLRcmKhSdza0qEBkMTwtQ==
X-Received: by 2002:a2e:b8c9:: with SMTP id s9mr3346990ljp.187.1616009484740;
        Wed, 17 Mar 2021 12:31:24 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id q24sm3623098lji.40.2021.03.17.12.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 12:31:24 -0700 (PDT)
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
Subject: [PATCH v5 3/7] clk: tegra: Ensure that PLLU configuration is applied properly
Date:   Wed, 17 Mar 2021 22:30:02 +0300
Message-Id: <20210317193006.29633-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317193006.29633-1-digetx@gmail.com>
References: <20210317193006.29633-1-digetx@gmail.com>
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

