Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C7FC43334
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Jun 2022 19:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiF2Tmo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiF2Tmo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jun 2022 15:42:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219D33D1C4
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jun 2022 12:42:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da7-0007RG-EE; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da2-003SHR-Dm; Wed, 29 Jun 2022 21:42:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da5-001xRY-81; Wed, 29 Jun 2022 21:42:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/5] ASoC: tegra: tegra20_das: Remove unused function tegra20_das_read
Date:   Wed, 29 Jun 2022 21:42:21 +0200
Message-Id: <20220629194224.175607-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; h=from:subject; bh=N38zUMhA0/Dc3fqjr6CXZtSErJFoyz8+tS9hBRivjeE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsTyQUNE8UimE1fO9gEEX4unUblCi2mnEQedpck 6qcxjbWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrEwAKCRDB/BR4rcrsCUaACA CGE/LEDhpRx+1nUpVeSj9SIU8feTzn5o1xba4mf+oE7mv1LwE3vZI7U5SSqSnX2BUxsvLNM7o2tFNz HSNPXovbBbLTSmbACBnGRMcMZnfi9dNzG+YFGLxUM8oI5d/LGPltEcHgIHzS0d3aJqekdc99HfTGNR pHqeWlUYIIO+zuDKWahJHw+mQhCFLExRz/upY+um4la4wiWgoFPI99FWEMZwb576zeliIjTnJIghE5 qJcJa0f0XxmpeA2KOFTxjucrClMqmqeuV3cYoQkZLxbcQoybFWkroaXaplCcVwHWXf8nuF04jliykZ 1FyJzewHA4K3SOqOQJbAZvL1Xz0Oo6
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This function is unused since commit 7203a62562dc ("ASoC: convert
Tegra20 DAS driver to regmap").

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index d2801130a986..4e23fd96c745 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -104,14 +104,6 @@ static inline void tegra20_das_write(u32 reg, u32 val)
 	regmap_write(das->regmap, reg, val);
 }
 
-static inline u32 tegra20_das_read(u32 reg)
-{
-	u32 val;
-
-	regmap_read(das->regmap, reg, &val);
-	return val;
-}
-
 static int tegra20_das_connect_dap_to_dac(int dap, int dac)
 {
 	u32 addr;
-- 
2.36.1

