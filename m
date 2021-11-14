Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74085C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FDF860EB9
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 22:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbhKNWLq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 17:11:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbhKNWLh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 17:11:37 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E7DC061210;
        Sun, 14 Nov 2021 14:08:33 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id e7so16697709ljq.12;
        Sun, 14 Nov 2021 14:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lypIbzMAdKowQS1+HnRTSDwp19bsKifrMWVI3aerImY=;
        b=GIyy8Bd20lA9Se8HAyleCJsBw3VqLDo4vkKWFbWV/DUOJBrZGzVjkLu4DIZb/YUL2F
         aTXCWRfjjI3enkdZib/z7ccPslKKB2CU5u0peDBRan+09h8qsZgzHY/tUQffcR1uNeYC
         tl7SIML8qmJQlj94gw44scY88Uw+aIqUdYSpxeufrRTiH6DrMQmxG6oIwRz/36XU23o1
         znCPGrtAzuGF33sgfRF4GgXAT8/NzLwMqv50cKenVWT3JW+gMgxvY+r6gZ+UR5xBs78L
         H+T6BfYsQ4IuY5CGk/vhNQTUZIEYFY7tqxS7Q33RaYyXFujU8KrbFpW5KR6s0139gIL+
         fadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lypIbzMAdKowQS1+HnRTSDwp19bsKifrMWVI3aerImY=;
        b=otojN/Nva07us/ehfJUum1y/Qi8RKtHv+FZ0rs6LaDpZStD5LCLIDtyfFjSkI2rSeo
         KOS9ALZk2RnY1z0iRIZOzbg5qB4x3tyB5Z0EUIMtvphHT9CKm3XP3gE+3vCdy9pQE/8+
         08gZDhhmF06S9fVTXJW5WjmXH4bWrAjQfJjm+mir/U6SvooxDro+O2EvPQKOd1IEF9Y7
         c/x0hgwcAbkGIGKlh0Mjg6N0pcQriDhlO3jG46GVrYLYa2C41W5TZVaIYbqhKlC9FmIc
         IGFO/v2MZLQhMRbxSJTVNIpBnSLpZ64yTEbb56z0FLx2P3rBiQAnPesiNZ8OuTvI20PB
         JFUg==
X-Gm-Message-State: AOAM530XuqbTLxZHWnsOADg/5GKEuN0SMVEYtQRUk+CxsiHXkgky1zOw
        ahrEJPtI9FyviSH5gUccNQbGuUZfvWM=
X-Google-Smtp-Source: ABdhPJwxu8a+VBshOpGvA1zOzu8EJS0UGis8jXtFU42wc6iO/LEKUG51NSMkpJ0pRD30OsoS/3KONA==
X-Received: by 2002:a2e:9dd5:: with SMTP id x21mr33433722ljj.459.1636927711577;
        Sun, 14 Nov 2021 14:08:31 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id bp22sm1219807lfb.93.2021.11.14.14.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:08:31 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: tegra: Make vde a child of pll_p on tegra114
Date:   Mon, 15 Nov 2021 01:07:58 +0300
Message-Id: <20211114220758.20224-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current default is to leave the VDE clock's parent at the default,
which is clk_m. However, that is not a configuration that will allow the
VDE to function. Reparent it to pll_p instead to make sure the hardware
can actually decode video content.

Tested-by: Anton Bambura <jenneron@protonmail.com> # ASUS TF701T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index bc9e47a4cb60..ef718c4b3826 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1158,7 +1158,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA114_CLK_XUSB_HS_SRC, TEGRA114_CLK_XUSB_SS_DIV2, 61200000, 0 },
 	{ TEGRA114_CLK_XUSB_FALCON_SRC, TEGRA114_CLK_PLL_P, 204000000, 0 },
 	{ TEGRA114_CLK_XUSB_HOST_SRC, TEGRA114_CLK_PLL_P, 102000000, 0 },
-	{ TEGRA114_CLK_VDE, TEGRA114_CLK_CLK_MAX, 600000000, 0 },
+	{ TEGRA114_CLK_VDE, TEGRA114_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA114_CLK_SPDIF_IN_SYNC, TEGRA114_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA114_CLK_I2S0_SYNC, TEGRA114_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA114_CLK_I2S1_SYNC, TEGRA114_CLK_CLK_MAX, 24000000, 0 },
-- 
2.33.1

