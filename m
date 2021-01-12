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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81B2C43332
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 876912310C
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387608AbhALM3W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731468AbhALM2p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:28:45 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A0CC061794;
        Tue, 12 Jan 2021 04:28:04 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x20so3037135lfe.12;
        Tue, 12 Jan 2021 04:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tATaPWAeIZO8mvZ/lzhKPVoXvQQFhtgfsi9R5HiJZkY=;
        b=G30TE4STSvQ1E+ojDFF6Rmzv7mG/iIQ9nSIgc2fxE9ewcMUi2vaxOHV3EHck86bNBC
         02hTlUsHldPApSp79cd8HlL5MkzOkFSSrpJqdu/m6T4Xw7OlVKMGiKKdWVtHz00133Q3
         EveQ0kzetGzC7zL/BDak3XMHy80PZ+jeXjXm/+g+z0VGG6D/vRHBtLhdbh/FDIOB70XO
         MVXZQQspmMl43/UxUFVOVAWmxDFuZxDWFNhEkpKNlkQJ03ZM8VL/9VanRxvpBTnIJEyb
         JNvm4psLglQ/oksN1YE6jskayTwq84ulrgP+DoGp8/fBRf3rThVyoo05sJL9eJtKqzT5
         So/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tATaPWAeIZO8mvZ/lzhKPVoXvQQFhtgfsi9R5HiJZkY=;
        b=Joixp71k9qCs24cngJ/KvmWnQhsfPTTYnYlQ3Wyi5MiNK7FygXgRUKgUdX6rZjF4sB
         0Uudpgb8o+Do5C/EUpsoSrMDbqeeJ7IGPMqrUwD27/BxZcm70QzeldzC064FbRy+7Ltg
         PEWaw4rPkd7g/LKw8AZzjVlSHkFNZI1C1zq8kK+SQsygsVmBwRJhb/cqZhg3M671DaFR
         av3pdU2xY6bLyvo0WezxJEW1TsOO+U60FYEeV3ajKrklbf8B+66H+peEAdD8rlEyyFqO
         31aae6R/3s+V7/AUzwTUtYv//Gol3ZTJiRijq84XIRYtTfRlkuYQ4AmQDQCrkJEgsP8v
         2OLQ==
X-Gm-Message-State: AOAM533O+fM+7JD04A1tezfQleQspKJ2S2iWZdlGl0hZyfvTtGHnyK8T
        EBkJcmH6uk0q27izKY12znY=
X-Google-Smtp-Source: ABdhPJwWsbuLwwKO39dmii1PesteRSRjqi3Bmg3igXvmYOKQghfaPS9CpxxA1jzGOkIH7vtHPb0obg==
X-Received: by 2002:a05:6512:3586:: with SMTP id m6mr2105377lfr.318.1610454483215;
        Tue, 12 Jan 2021 04:28:03 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c3sm330136ljk.88.2021.01.12.04.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:28:02 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] clk: tegra30: Use 300MHz for video decoder by default
Date:   Tue, 12 Jan 2021 15:27:20 +0300
Message-Id: <20210112122724.1712-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112122724.1712-1-digetx@gmail.com>
References: <20210112122724.1712-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 600MHz is a too high clock rate for some SoC versions for the video
decoder hardware and this may cause stability issues. Use 300MHz for the
video decoder by default, which is supported by all hardware versions.

Fixes: ed1a2459e20c ("clk: tegra: Add Tegra20/30 EMC clock implementation")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 37244a7e68c2..98923c4674bf 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1248,7 +1248,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_GR3D, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_GR3D2, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_PLL_U, TEGRA30_CLK_CLK_MAX, 480000000, 0 },
-	{ TEGRA30_CLK_VDE, TEGRA30_CLK_PLL_C, 600000000, 0 },
+	{ TEGRA30_CLK_VDE, TEGRA30_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA30_CLK_SPDIF_IN_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S0_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S1_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
-- 
2.29.2

