Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BB2C64ED8
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Feb 2023 09:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjB0JIh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Feb 2023 04:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjB0JIR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Feb 2023 04:08:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BAB2DE71;
        Mon, 27 Feb 2023 00:59:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D46FCB80CAF;
        Mon, 27 Feb 2023 08:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BEEC433EF;
        Mon, 27 Feb 2023 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677488362;
        bh=1tHIKd104QyfvtA3q/kKbEIMUdEcyl2i2c8bvAcFeJM=;
        h=From:To:Cc:Subject:Date:From;
        b=Kw5Zqn3DimaluDdXJOPEW3TIh2enf/BL6FWitZ2pgqn32NU8fyQBiFD9SWkcBm7qN
         +emkN8tvZ/4iESvOQ/UtudrbbXa/LWWs6KiVoxtoVZAyqPCMSCoTsgt0Bn7u+0nQA9
         XWtBYwPhn+52wPffdcA5meTR6EeB13RrAhvxDZlRO4Yp3isQHC/Pdc0u8ZSQnYTVuY
         jMm5tZBNmigDFqPMsheWS9xEQiLqfv7JzVNYQYBKYaVGxX0n4oXiVY+hdnmAJzCzmy
         rlWMljaC521Ik8QRNFNo0NpDy5oOVp8S9l9khz4Iny/Kbxq44BeHeaiWbAJgJEpgBS
         hBRrx2DZF805g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Miaoqian Lin <linmq006@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tegra20: fix gcc-7 constant overflow warning
Date:   Mon, 27 Feb 2023 09:59:10 +0100
Message-Id: <20230227085914.2560984-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Older gcc versions get confused by comparing a u32 value to a negative
constant in a switch()/case block:

drivers/clk/tegra/clk-tegra20.c: In function 'tegra20_clk_measure_input_freq':
drivers/clk/tegra/clk-tegra20.c:581:2: error: case label does not reduce to an integer constant
  case OSC_CTRL_OSC_FREQ_12MHZ:
  ^~~~
drivers/clk/tegra/clk-tegra20.c:593:2: error: case label does not reduce to an integer constant
  case OSC_CTRL_OSC_FREQ_26MHZ:

Make the constants unsigned instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/tegra/clk-tegra20.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 422d78247553..dcacc5064d33 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -21,24 +21,24 @@
 #define MISC_CLK_ENB 0x48
 
 #define OSC_CTRL 0x50
-#define OSC_CTRL_OSC_FREQ_MASK (3<<30)
-#define OSC_CTRL_OSC_FREQ_13MHZ (0<<30)
-#define OSC_CTRL_OSC_FREQ_19_2MHZ (1<<30)
-#define OSC_CTRL_OSC_FREQ_12MHZ (2<<30)
-#define OSC_CTRL_OSC_FREQ_26MHZ (3<<30)
-#define OSC_CTRL_MASK (0x3f2 | OSC_CTRL_OSC_FREQ_MASK)
-
-#define OSC_CTRL_PLL_REF_DIV_MASK (3<<28)
-#define OSC_CTRL_PLL_REF_DIV_1		(0<<28)
-#define OSC_CTRL_PLL_REF_DIV_2		(1<<28)
-#define OSC_CTRL_PLL_REF_DIV_4		(2<<28)
+#define OSC_CTRL_OSC_FREQ_MASK (3u<<30)
+#define OSC_CTRL_OSC_FREQ_13MHZ (0u<<30)
+#define OSC_CTRL_OSC_FREQ_19_2MHZ (1u<<30)
+#define OSC_CTRL_OSC_FREQ_12MHZ (2u<<30)
+#define OSC_CTRL_OSC_FREQ_26MHZ (3u<<30)
+#define OSC_CTRL_MASK (0x3f2u | OSC_CTRL_OSC_FREQ_MASK)
+
+#define OSC_CTRL_PLL_REF_DIV_MASK	(3u<<28)
+#define OSC_CTRL_PLL_REF_DIV_1		(0u<<28)
+#define OSC_CTRL_PLL_REF_DIV_2		(1u<<28)
+#define OSC_CTRL_PLL_REF_DIV_4		(2u<<28)
 
 #define OSC_FREQ_DET 0x58
-#define OSC_FREQ_DET_TRIG (1<<31)
+#define OSC_FREQ_DET_TRIG (1u<<31)
 
 #define OSC_FREQ_DET_STATUS 0x5c
-#define OSC_FREQ_DET_BUSY (1<<31)
-#define OSC_FREQ_DET_CNT_MASK 0xFFFF
+#define OSC_FREQ_DET_BUSYu (1<<31)
+#define OSC_FREQ_DET_CNT_MASK 0xFFFFu
 
 #define TEGRA20_CLK_PERIPH_BANKS	3
 
-- 
2.39.2

