Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275E0C433E9
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 14:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE00123A02
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 14:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbhAHOAP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jan 2021 09:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbhAHOAO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 09:00:14 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3381C0612F5;
        Fri,  8 Jan 2021 05:59:33 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id p187so9818884iod.4;
        Fri, 08 Jan 2021 05:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C/zuslkswFYbFYSDVravjmOqNUYzx2XjLo8fR1+C5Bo=;
        b=CwbkCCR5W8VzKN8SL6brUw3/NlzhnhkQl25s3Ww8oxbHiKCxd2A7QgpL2FG7V/7/V3
         JXlBQdaZFio7AzJThTdC0RF2yURFC7RJZ55jLHTxuZxhv/Ov9t+kMP2psHPeyd6A1/uA
         8kp4knYuY8X99ri10VIy4+sIPwFzL5sDHf85XPNX4oWWYzE+YCUDDJ8CwyUcfmWxCS9Z
         VegCtV8pQvozwsQ4Jg18+5gLp4LCjxFzZhaw+y05YvtUoeMYxWDPZg6bJL+3c9b4vMPi
         fmfrTGT06s8pgwaL+KRuNQQWl7IEau9shZMCk9xoxbEDFUtRXdoN3DR3W8RifNIKlwKJ
         Xcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C/zuslkswFYbFYSDVravjmOqNUYzx2XjLo8fR1+C5Bo=;
        b=FOf0lq0bm1eSB65q9oVZXgP2N2N83T6wLaf/9CJyxoorClwu1tfpNyYX119lkMm3/+
         0PkMLXQ0+eLey3j3zEAj0QD3+JYtBzH3PdotPB2QU2IVo33/heyJ2173bvfbblYEH4Zv
         EsqFDNMej2ST6wCGogZKADopO9xScYOJhHtGt0Ou4+dJBlYDXMCsBLPGqo/F2SkVvEru
         R5XsoMg5q7Byyz5CMZpYrtTZXwH3ieoDPT0iztTfLP7KFpwB47BI/jY2TjPDSXV1rQNT
         QnKIxG+KHI9e3Kip1HVLoMcD01aE71YmcK4+1znF6o+ovcpphYbMzMMJVtwRRp+J1FCN
         93vw==
X-Gm-Message-State: AOAM530+/tRGw4wRkK7PEOr7LNiBzP+hok5dhDAca36JfuSbQrKew0P0
        TeuC8VtT9ZRz1zffqDA3CN4=
X-Google-Smtp-Source: ABdhPJxAEW7Csj0IPuhsiOm4Rr0CnhSvCZDc1s+wNmgGnnSvXxljW7r+BWgqmQ7VLgSfGIJsu4ygXQ==
X-Received: by 2002:a05:6602:27af:: with SMTP id i15mr5415055ios.170.1610114373016;
        Fri, 08 Jan 2021 05:59:33 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id l6sm7570063ili.78.2021.01.08.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:59:32 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Subject: [PATCH v2 1/2] clk: tegra30: Add hda clock default rates to clock driver
Date:   Fri,  8 Jan 2021 13:59:12 +0000
Message-Id: <20210108135913.2421585-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108135913.2421585-1-pgwipeout@gmail.com>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Current implementation defaults the hda clocks to clk_m. This causes hda
to run too slow to operate correctly. Fix this by defaulting to pll_p and
setting the frequency to the correct rate.

This matches upstream t124 and downstream t30.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 37244a7e68c2..9cf249c344d9 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1256,6 +1256,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_I2S3_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S4_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_VIMCLK_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
+	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
+	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.25.1

