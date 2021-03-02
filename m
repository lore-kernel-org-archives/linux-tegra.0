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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD236C28D14
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 650BD64E27
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377810AbhCCDbH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350097AbhCBLyB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:54:01 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030FDC061793;
        Tue,  2 Mar 2021 03:51:43 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p15so14621375ljc.13;
        Tue, 02 Mar 2021 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2GajrmIPPhVShSD9htWQH0c4G3php+jiJW9ohFhNDc=;
        b=a5NQi+dCliDqU3MZIq+HV1G7Hv02G5jQ0YFeFVSZ05AtJzCjeBzkUuynfOhQQrsZT1
         +YSsRtVpekBd60kcBJL2wZWhFrnVdIdyrp3DSFSOWq1WzwaYFoydtpytUmoE0LGo+hdO
         PuGVU8a7n1MgPrQ7uD84HL4NdY0tcJJqyy/73Tn7geG0d8+OJ/L6G9tACVPZ2XiikmkB
         8xUYvwGXLOeQaQ40VYUTwDc76BfOwVoEAC0TkyYDzy3gjltu1B9iZZB8P4rwmF/C7iJp
         1WzbACU6/uQmiq7wUMQ9euWMHbDN13X8WKiyvtMHHG93/hAHrsj8syG3lMQgRgJZTn7i
         qwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2GajrmIPPhVShSD9htWQH0c4G3php+jiJW9ohFhNDc=;
        b=GQNboFbL8xcfNKc1TudNyrDTxPKpsrRoATSM39RhQliQU29yJlNr6bYWzUOhU9pD0G
         FPEhGW8VauBFSw/OqAbEaHhNh3JuUpFA6e6UhDCzwoE/H7morsz4i4hjgYoF4FvN8Jns
         9SUeHEfXedd/ns3afH5EozuWQaI85p0Q/w5Y4imV64lEvjfxGgUwZG4U2DMuqBzEEcJF
         Kb1AQT59jFT3u1yWniNwPbq+uZcsOgzc/L4Ys3SLI6KGMAjo9wae3d1cIL7WJTae9NwV
         81HNN7g4HnqKxEKQgCoyUZG+9aZQpOogmwyfA7/3nczzvfE/8kIv+nf8EczCL8/MAUE8
         zdHQ==
X-Gm-Message-State: AOAM53112BJoqeth2ol8GhddOLMPc/s2tbIZSNXQ6PqqPCIJ99NUXGNB
        +zXRI5jNN2umGXHdCZgCWiA=
X-Google-Smtp-Source: ABdhPJyI63/HAHDw1/qnwJWecxidCq4Nihj3lXQGz7sFgGtD9auDUtWwRaK52RQSayhmGEumTOeeSw==
X-Received: by 2002:a2e:b4c8:: with SMTP id r8mr6000300ljm.57.1614685901553;
        Tue, 02 Mar 2021 03:51:41 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f4sm2720151lja.69.2021.03.02.03.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:51:41 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] clk: tegra30: Use 300MHz for video decoder by default
Date:   Tue,  2 Mar 2021 14:51:12 +0300
Message-Id: <20210302115117.9375-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302115117.9375-1-digetx@gmail.com>
References: <20210302115117.9375-1-digetx@gmail.com>
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
2.29.2

