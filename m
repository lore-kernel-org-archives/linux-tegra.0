Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4324FC4320A
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EC9460EBD
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 22:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhHBWOE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 18:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbhHBWOC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 18:14:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C4EC06175F;
        Mon,  2 Aug 2021 15:13:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z2so36463769lft.1;
        Mon, 02 Aug 2021 15:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NcgHywzOs0dEPbPbKvfBE8iLc6lV0m/3jUIasI7Wu5s=;
        b=uo2Inim7n3NOhUbdsXO4yvyzZ3U66xiYywNDF9JfshRhgF7jlsS36yJyzJ60QZdU5s
         AyTd3J9yrvsm4i8PNCUVCvqseFsPWvDoIzy4oqkpaDLaQmAlWWYvRoyNdoLHv6gehc8U
         cgniC+v772t1j69P5tYFuXr3+f0CYc5qMmaK9gRLfbFd5YYAE2ltryf92LNKmfC61W0E
         7K5CgytVEZLeoDYHit3TvniAC/rUmfwHvSY6yBCktDtCm6nXRxQ016E+3GBJPVbTCgC7
         vVkoJ57KHWE9HaFjXgou/q5vTQ3Oaq7BEAVeiQJ0ooo5TM0QXIk1VUbiA/qZk2FQNy4Z
         rwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NcgHywzOs0dEPbPbKvfBE8iLc6lV0m/3jUIasI7Wu5s=;
        b=SlAIRozNK7g5OjyOpc+rttdgj7N0Wpcyjs816X956Mb8J57Oxx1okggMBODk85RE8W
         Db3imaTTQFbeJjvpEAIqKKB7/wCbKeUASI/OFu+CisB0zkYnWGj1CqN6bBqZt7eBjegE
         NoRm8qdrwKAouboOIboF13cTA6sJPnUv8U8k0ew/bJbL+XyZbTVCvcV7lYXrcyX9chHm
         8K/xeH/crgyucVv78IkqB4RsxzQVgvS4vdHi7wNevFhY28KYEBNhTEfQW0D7O6zTTahr
         70ECUD7Ij039CuS42RW0y3fjODgMZ9I7GJGEa0ugsxwNdCYeZcC4NfwUXuwmTpAPNMNU
         h4Zg==
X-Gm-Message-State: AOAM532KMbw9qfMx4rITvJn1bYtj8dbQ6yLE/Q1sev+s+J1WlQqVmW+2
        ZcXsdOfHFxCRGr3Nq6DJ3AE=
X-Google-Smtp-Source: ABdhPJznzBO20DYzH1P8yPbcU0xnlT0QFFgMGUtZpqnry6kMLcHox3f9sC7ut9ZB+ZNs0slwx52FHA==
X-Received: by 2002:ac2:53a6:: with SMTP id j6mr13672850lfh.408.1627942430707;
        Mon, 02 Aug 2021 15:13:50 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id c10sm960167ljn.11.2021.08.02.15.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 15:13:50 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] clk: tegra: Remove CLK_IS_CRITICAL flag from fuse clock
Date:   Tue,  3 Aug 2021 01:13:36 +0300
Message-Id: <20210802221336.32016-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802221336.32016-1-digetx@gmail.com>
References: <20210802221336.32016-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

FUSE driver now takes care of keeping the clock enabled when necessary.
Remove the CLK_IS_CRITICAL flag from the clock.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra-periph.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 292d6269daf1..4dcf7f7cb8a0 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -777,11 +777,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
 	GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
 	GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
-	/*
-	 * Critical for RAM re-repair operation, which must occur on resume
-	 * from LP1 system suspend and as part of CCPLEX cluster switching.
-	 */
-	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CLK_IS_CRITICAL),
+	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
 	GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
 	GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, 0),
 	GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif, 0),
-- 
2.32.0

