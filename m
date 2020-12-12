Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DFBC4167B
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Dec 2020 16:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C8A32225E
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Dec 2020 16:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394926AbgLLQh0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 12 Dec 2020 11:37:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:57718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439374AbgLLQJg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Dec 2020 11:09:36 -0500
From:   Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 08/23] drm/tegra: sor: Disable clocks on error in tegra_sor_init()
Date:   Sat, 12 Dec 2020 11:07:49 -0500
Message-Id: <20201212160804.2334982-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201212160804.2334982-1-sashal@kernel.org>
References: <20201212160804.2334982-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Qinglang Miao <miaoqinglang@huawei.com>

[ Upstream commit bf3a3cdcad40e5928a22ea0fd200d17fd6d6308d ]

Fix the missing clk_disable_unprepare() before return from
tegra_sor_init() in the error handling case.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/sor.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f2a114f14a3db..b83a46df00584 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3143,6 +3143,7 @@ static int tegra_sor_init(struct host1x_client *client)
 		if (err < 0) {
 			dev_err(sor->dev, "failed to deassert SOR reset: %d\n",
 				err);
+			clk_disable_unprepare(sor->clk);
 			return err;
 		}
 
@@ -3150,12 +3151,17 @@ static int tegra_sor_init(struct host1x_client *client)
 	}
 
 	err = clk_prepare_enable(sor->clk_safe);
-	if (err < 0)
+	if (err < 0) {
+		clk_disable_unprepare(sor->clk);
 		return err;
+	}
 
 	err = clk_prepare_enable(sor->clk_dp);
-	if (err < 0)
+	if (err < 0) {
+		clk_disable_unprepare(sor->clk_safe);
+		clk_disable_unprepare(sor->clk);
 		return err;
+	}
 
 	return 0;
 }
-- 
2.27.0

