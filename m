Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7B4C4332D
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 03:54:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA56323132
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 03:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbhATC2e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 21:28:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:47348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730437AbhATB27 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:28:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD6AB233FD;
        Wed, 20 Jan 2021 01:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611106039;
        bh=EbDvrSM9XOkP9uHJHSEhVoZGXE8b80g6BNmz3C88Zlo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gTeh9CmiIyRx4flY6hJG0s0BzDE3fld2Rp32HJ43TN4TZT3HXQbSVMnNIMmPzTO2w
         P78IMVvHwpBH/tnJ4aqMR/YZ3pQrFuQIHzdYtPIjUPFF4Hp+ZJKt2sRw0017OxRLdJ
         2vrtaDkyFU3J4y1/cjh02h3VoZVj6ydf/U4djrZSA3sO6E8vEQ6UuXOJpGjJ9ITmpq
         TMu+6oNVJA023isgdQ32FMilpzj9HVFp8osehlqpAKlvR2tS5SEXdSq+4ZDTEfLyd6
         C8Sp+dNZR9RE4YUnfMZLYgrnzISThg43rSc1jyEif8fPge7E46vxJmVsYqiNMGJzBP
         ZQtT3FaCQQ3DA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Peter Geis <pgwipeout@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Ion Agorria <ion@agorria.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/26] clk: tegra30: Add hda clock default rates to clock driver
Date:   Tue, 19 Jan 2021 20:26:48 -0500
Message-Id: <20210120012704.770095-11-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012704.770095-1-sashal@kernel.org>
References: <20210120012704.770095-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Peter Geis <pgwipeout@gmail.com>

[ Upstream commit f4eccc7fea203cfb35205891eced1ab51836f362 ]

Current implementation defaults the hda clocks to clk_m. This causes hda
to run too slow to operate correctly. Fix this by defaulting to pll_p and
setting the frequency to the correct rate.

This matches upstream t124 and downstream t30.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Ion Agorria <ion@agorria.com>
Acked-by: Sameer Pujar <spujar@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Link: https://lore.kernel.org/r/20210108135913.2421585-2-pgwipeout@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/tegra/clk-tegra30.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 7b4c6a488527d..501929d9f70ed 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1263,6 +1263,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_I2S3_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_I2S4_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
 	{ TEGRA30_CLK_VIMCLK_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
+	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
+	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.27.0

