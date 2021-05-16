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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811FEC43600
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 656DB61185
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbhEPQcS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbhEPQcR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:32:17 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D422C06174A;
        Sun, 16 May 2021 09:31:01 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id e11so4306410ljn.13;
        Sun, 16 May 2021 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ofiUnTNVmdhSCPXFUakdrcB5fFxVu8qvsddsoETV6Zo=;
        b=LozPzTKaSETaV2rdnkYpWYgMnAkusxmk1ax5YqRdzSOsgQJ+xAAZlte+WqlE0dm8Go
         YtTQBlxKCUMMfVDNMV76ozKpL8+UH2vVzmuV/Hfkdhc+XQsj/2i3gWWaj2imGfR4tEqs
         aR2XlScJGnHUMGg/ygd7g5ehiWtwsARAr5rMZxgTKqZ7QnAbbQoXGBi5M+vBPU0Smv+Y
         nloN3c1o49odom4dX8FKZRjsSuQ5pmJz5LjtVoqyXr9NLMT8Y86IQITY0A6Ett7BEyfH
         nkbXSZJgpX6kybSrcEYPAfLIUFRiMQcJGTYkPf8R3XZ8MX9xVRz7zFoZOBO2EnU4To4q
         PvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ofiUnTNVmdhSCPXFUakdrcB5fFxVu8qvsddsoETV6Zo=;
        b=lZW3E+fgCXCqLbdqrLHJsxyEosemoAl914Fv/fwOUfxg+j5TvLGJ201/ecvYE3cImP
         33oZZ+mLZXJVXyUIWsxshiFMlUE6m7DgdbNfYlc4os0LvJH9c0eKMXUeSZDIEAsazWVO
         e1O7s1doy+IOeMGTTHx8glm5LILZcvYe3ebr0edzq0LYx6JXDTAiHFevtBoVvdNRrsLj
         SCMGQV62uSb7OmS3k48G6avhS/t2mmB+ZxNM8psh5phI1nWP5knOcHghORzpPak6PfQZ
         cfsUqYH30JTWDPEIKeVz8JEfNPRZztQUkxlD0TkueRyxs607n13ABYDokEtPKor/lkr9
         57LA==
X-Gm-Message-State: AOAM531FBr/NORV1HulxFwUnPvw63wuslIEVF0pZZGmSmCZlmng5eCQT
        IhljPMkjhGxbaIOF/F7iLpRG67vMeKM=
X-Google-Smtp-Source: ABdhPJyMul4ZGWFZ3EMqr31xb6H/CbK3Paw79JP+gLyln/HdhZB0ZyHai3g5/AqgYITT3GG+Ytw+Xw==
X-Received: by 2002:a2e:b892:: with SMTP id r18mr3324743ljp.402.1621182659952;
        Sun, 16 May 2021 09:30:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id m2sm1704548lfo.23.2021.05.16.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:30:59 -0700 (PDT)
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
Subject: [PATCH v8 1/9] clk: tegra30: Use 300MHz for video decoder by default
Date:   Sun, 16 May 2021 19:30:33 +0300
Message-Id: <20210516163041.12818-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
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

