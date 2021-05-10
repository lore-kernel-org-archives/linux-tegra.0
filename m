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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DCDC43600
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34EAD61359
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhEJXSv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 19:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhEJXSv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 19:18:51 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93230C06175F;
        Mon, 10 May 2021 16:17:45 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o16so22857402ljp.3;
        Mon, 10 May 2021 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ofiUnTNVmdhSCPXFUakdrcB5fFxVu8qvsddsoETV6Zo=;
        b=gUffqzxATl2oik6ONK02R4SJ5LzvNgYO4w3dnADqSdtHcfAYUcZIWXCkmhGfAjrvww
         izPiCfdA7XxizmNI67BwdIMZY/nEeJQOXst2bdmDxESVYK2/C5gfYj5Sy885G9htEndw
         Yi6bN9RFn+CmUakQVlsfUkNYZS9En5t0I/CwzstTAIYNiFY8YSsaoXnecXqIqGUautO/
         xEXkDkJ80lqZ3+sa0lboVt9NzjusMRyfGyJOuSpIAo1g68SmMiSCTavKQpVh2mMoYvW3
         maZg9BKGmYoEav3yOD1mYLJu3dIKCyz8qUZ/ZAcuWMnDSHngTuOEuSQKhtF4rXZCjB81
         dMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ofiUnTNVmdhSCPXFUakdrcB5fFxVu8qvsddsoETV6Zo=;
        b=YeYhKk1fw+QrAmDxAZ8A8kPldJ/bFteCpA1q99cB0V16v8bAr7GZaO0KE8O3hAqipc
         v3rxcXHUlKiKEJ/l8lW6mCZage+1DjFUadQnZJ4gMMX5uVSXWdChGVMB02IcO3nbR70N
         YWXCtTEg+AVeu10K8ZKEXCEnUOtRyAk+xLiS/vIT4RzLgpPIDaxZ9I3xqJlpXoR4FNva
         Clp6EC9fFWFAfCazABdF3I15stEGyyakkO8OljxRss/Ueoy8BIvfrqEjVwgd+0bM+pHj
         cDqaEy845Cl7vBePnRsnvsIk326EqNVP5Ta4ZqqHyGGHLB7Au5qmf0m1Eydi2BMGYXgK
         6oRA==
X-Gm-Message-State: AOAM530XUj7zWMTqYigSx7ZGxXOeVC/1Bi67tlEDYUYU/anJiy+U3BLp
        eenz9m/rs7UjwVyfYS1LaUA=
X-Google-Smtp-Source: ABdhPJwL/NoJu4Ja4OtcJfluGMhDwVunSTjW2qYHORtaM0C4q9p9+d6PpXqPzWd6NkV2G9QfDR/1qw==
X-Received: by 2002:a2e:b819:: with SMTP id u25mr21906536ljo.105.1620688664139;
        Mon, 10 May 2021 16:17:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id k8sm2422254lfo.123.2021.05.10.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:17:43 -0700 (PDT)
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
Subject: [PATCH v7 1/8] clk: tegra30: Use 300MHz for video decoder by default
Date:   Tue, 11 May 2021 02:17:30 +0300
Message-Id: <20210510231737.30313-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510231737.30313-1-digetx@gmail.com>
References: <20210510231737.30313-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 600MHz is a too high clock rate for some SoC versions for the video
decoder hardware and this may cause stability issues. Use 300MHz for the
video decoder by default, which is supported by all hardware versions.

Fixes: ed1a2459e20c ("clk: tegra: Add Tegra20/30 EMC clock implementation")
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 16dbf83d2f62..a33688b2359e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1245,7 +1245,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_PLL_U, TEGRA30_CLK_CLK_MAX, 480000000, 0 },
-	{ TEGRA30_CLK_VDE, TEGRA30_CLK_PLL_C, 600000000, 0 },
+	{ TEGRA30_CLK_VDE, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_SPDIF_IN_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S0_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S1_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
-- 
2.30.2

