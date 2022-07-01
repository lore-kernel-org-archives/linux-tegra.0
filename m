Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE22C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Jul 2022 07:29:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiGAH3I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Jul 2022 03:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiGAH3I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Jul 2022 03:29:08 -0400
Received: from out30-45.freemail.mail.aliyun.com (out30-45.freemail.mail.aliyun.com [115.124.30.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD2D6B828;
        Fri,  1 Jul 2022 00:29:06 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VHzzt3O_1656660532;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VHzzt3O_1656660532)
          by smtp.aliyun-inc.com;
          Fri, 01 Jul 2022 15:29:04 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     lgirdwood@gmail.com
Cc:     broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] ASoC: tegra20_ac97: Fix missing error code in tegra20_ac97_platform_probe()
Date:   Fri,  1 Jul 2022 15:28:50 +0800
Message-Id: <20220701072850.62408-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'ret'.

This was found by coccicheck:

sound/soc/tegra/tegra20_ac97.c:357 tegra20_ac97_platform_probe() warn: missing error code 'ret'.

Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/tegra/tegra20_ac97.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index e17375c6cddb..87facfbcdd11 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -354,6 +354,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 		}
 	} else {
 		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
+		ret = -EINVAL;
 		goto err_clk_put;
 	}
 
@@ -361,6 +362,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 					    "nvidia,codec-sync-gpio", 0);
 	if (!gpio_is_valid(ac97->sync_gpio)) {
 		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
+		ret = -EINVAL;
 		goto err_clk_put;
 	}
 
-- 
2.20.1.7.g153144c

