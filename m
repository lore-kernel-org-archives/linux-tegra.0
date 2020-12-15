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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF006C2BB9A
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 21:13:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 950C222CB8
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 21:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgLOVMm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 16:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbgLOVMk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 16:12:40 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E822C0617A6;
        Tue, 15 Dec 2020 13:11:59 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id x20so23527102lfe.12;
        Tue, 15 Dec 2020 13:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tATaPWAeIZO8mvZ/lzhKPVoXvQQFhtgfsi9R5HiJZkY=;
        b=AEutOcuWl83SwygbAfOsgrFARFfRX/EgyUOZI/dgB8lGCKhejoWabEPYnTFrJ/wZVi
         26YLKMIiRAX9Y5UPdntTe7PgNQXwSAgOOwQbHFOZyC//q6dGUSGLTd4D2ysG4x3rMySS
         rZ23EktXM5V61lUlESjNL6DU4v3TxOjDe37tXh7/s2K/VZvblmSPufrUGuZrPkNe6R1m
         i9t+rJNe95z73LiCVM1Oj+3PihJ1Nj+uMJFx9M6tKPf3M0/Uaw786T3B9wNCM/6Umr3+
         84ZV9OaD/OkGlVrH8ZNIsoefl/mLJHAdULVkVjvzTofsX+HQxGejYYhxxcP9Ey3tZ5Zd
         3XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tATaPWAeIZO8mvZ/lzhKPVoXvQQFhtgfsi9R5HiJZkY=;
        b=MRXAR9Ho7xkZkoChMMyMuXv0NcbvpP01Wkzp5D7gz3Pn654cZL71di3iJe4uPmlUiC
         tMP2dubaF7e2iQ+gtXOP9HdzADuV7t8wS4zbbGaLc76BNbcNt8fzHRVrx4i77zWWTURD
         onLZvtyNW/ny38GsX64872lo3RDRZkk+H0bygYchoPRHzCTK9Ja3exGwwQHdMTV5az+j
         GFGNOs8/9kSWVuAFVudMVKOyHgrwiGcS0I39zP4lnZzT+FKG/WuMvxOH8yXSzJe7QFZ6
         7mDiy2fNGWXFqhKcviqBTUOgP6joi6X5s9bO2PHRJ7NfSLvlpgTYltaEghyK1ZU82AdU
         MpAA==
X-Gm-Message-State: AOAM533N4LxSrRu+5z3kgzs/j9ODMKYJQg79on+IShDFM390ZYmFoqDp
        jKe+jQeblO9ngus4Wm/G6Lk=
X-Google-Smtp-Source: ABdhPJyvUQiP7nXEZSasmbP/XqlX4okCVA12VI9R+hVhqfnE+UryvgfKEA9osnGG+vlj871Oy/nPkQ==
X-Received: by 2002:a19:ca:: with SMTP id 193mr12614412lfa.331.1608066717878;
        Tue, 15 Dec 2020 13:11:57 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id k11sm2572079lji.95.2020.12.15.13.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 13:11:57 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] clk: tegra30: Use 300MHz for video decoder by default
Date:   Wed, 16 Dec 2020 00:11:48 +0300
Message-Id: <20201215211150.21214-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215211150.21214-1-digetx@gmail.com>
References: <20201215211150.21214-1-digetx@gmail.com>
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

