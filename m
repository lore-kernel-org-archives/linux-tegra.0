Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628DBC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 21:51:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F566619AA
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 21:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhCVVvH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Mar 2021 17:51:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229673AbhCVVuv (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Mar 2021 17:50:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58B4D6191D;
        Mon, 22 Mar 2021 21:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616449851;
        bh=kniO8EgYpGrSZ52pEinFuWK7aMl4BCkQdxdUWt6pD2A=;
        h=From:To:Cc:Subject:Date:From;
        b=YueTaDD3DAcwPk+zdpFk4esAsAha/H2JdaFc/MEdtMumKJbE9gNDBHut8TsdLaSyM
         QFIiNtipSmTdZA7d8Thhb2PpcEcGP+sbEQrPgBknb8uuYaa5ITP5h0OIa3Q++IDpqC
         YD5XQhHZiB6AtAu1Z4AnH7+W0dVdkmASVmfLKvDKrBDxJUADdfgPgIV67G6/fF/lRW
         41K7wxb4DMuX5FAq+wcHSGWvs1AyRhvSNAOJafqDUhHS3kKZidUXdDQS1EwVLZfJPW
         y0UjE3B2LB6+8kRsIBUSr/AYXVO9W2ZWWEJIc3GwgJeTEFA8bZSM29nhwlBRbipI7I
         O2bVHJCPL/GtQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tegra: fix old-style declaration
Date:   Mon, 22 Mar 2021 22:50:41 +0100
Message-Id: <20210322215047.1062540-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

With extra warnings enabled, gcc complains about a slightly odd
prototype:

drivers/clk/tegra/clk-dfll.c:1380:1: error: 'inline' is not at beginning of declaration [-Werror=old-style-declaration]
 1380 | static void inline dfll_debug_init(struct tegra_dfll *td) { }

Move the 'inline' keyword to the start of the line.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/tegra/clk-dfll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index a5f526bb0483..6144447f86c6 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1377,7 +1377,7 @@ static void dfll_debug_init(struct tegra_dfll *td)
 }
 
 #else
-static void inline dfll_debug_init(struct tegra_dfll *td) { }
+static inline void dfll_debug_init(struct tegra_dfll *td) { }
 #endif /* CONFIG_DEBUG_FS */
 
 /*
-- 
2.29.2

