Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98014C761A6
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 08:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234115AbjDDIsW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 04:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbjDDIsW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 04:48:22 -0400
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F401FE2;
        Tue,  4 Apr 2023 01:48:18 -0700 (PDT)
Received: from localhost.localdomain ([10.12.176.39])
        (user=u202012060@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 3348kqDV032411-3348kqDW032411
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 4 Apr 2023 16:46:57 +0800
From:   Zihao Wang <u202012060@hust.edu.cn>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Zihao Wang <u202012060@hust.edu.cn>,
        Dan Carpenter <error27@gmail.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra20_ac97: Add missing unwind goto in tegra20_ac97_platform_probe()
Date:   Tue,  4 Apr 2023 16:46:22 +0800
Message-Id: <20230404084622.1202-1-u202012060@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: u202012060@hust.edu.cn
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Smatch Warns:
	sound/soc/tegra/tegra20_ac97.c:321 tegra20_ac97_platform_probe()
	warn: missing unwind goto?

The goto will set the "soc_ac97_ops" and "soc_ac97_bus" operations to
NULL.  But they are already NULL at this point so it is a no-op.
However, just for consistency, change the direct return to a goto.  No
functional change.

Signed-off-by: Zihao Wang <u202012060@hust.edu.cn>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/tegra/tegra20_ac97.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index d23d88a10899..d00449441e5e 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -318,7 +318,8 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->reset = devm_reset_control_get_exclusive(&pdev->dev, "ac97");
 	if (IS_ERR(ac97->reset)) {
 		dev_err(&pdev->dev, "Can't retrieve ac97 reset\n");
-		return PTR_ERR(ac97->reset);
+		ret = PTR_ERR(ac97->reset);
+		goto err;
 	}
 
 	ac97->clk_ac97 = devm_clk_get(&pdev->dev, NULL);
-- 
2.34.1

