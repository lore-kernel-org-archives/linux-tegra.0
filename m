Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAAAC433B4
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Apr 2021 03:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79436613AF
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Apr 2021 03:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243510AbhDFDGN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Apr 2021 23:06:13 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15601 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239562AbhDFDGN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Apr 2021 23:06:13 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FDsmp4C1Wz18H3v;
        Tue,  6 Apr 2021 11:03:54 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Apr 2021
 11:05:56 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-tegra@vger.kernel.org>, <swarren@nvidia.com>,
        <perex@perex.cz>
CC:     <linux-kernel@vger.kernel.org>, <john.wanghui@huawei.com>,
        <abudankov@huawei.com>, <yz.yuzhou@huawei.com>
Subject: [PATCH] ASoC: tegra: fix build warning
Date:   Tue, 6 Apr 2021 11:05:22 +0800
Message-ID: <20210406030522.22941-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The following function may have no callers, so they're marked
__maybe_unused to avoid warning:

sound/soc/tegra/tegra30_i2s.c:50:12: warning: ‘tegra30_i2s_runtime_resume’ defined but not used [-Wunused-function]
 static int tegra30_i2s_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/tegra/tegra30_i2s.c:39:12: warning: ‘tegra30_i2s_runtime_suspend’ defined but not used [-Wunused-function]
 static int tegra30_i2s_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/tegra/tegra20_i2s.c:48:12: warning: ‘tegra20_i2s_runtime_resume’ defined but not used [-Wunused-function]
 static int tegra20_i2s_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/tegra/tegra20_i2s.c:37:12: warning: ‘tegra20_i2s_runtime_suspend’ defined but not used [-Wunused-function]
 static int tegra20_i2s_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/tegra/tegra30_ahub.c:64:12: warning: ‘tegra30_ahub_runtime_resume’ defined but not used [-Wunused-function]
 static int tegra30_ahub_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/tegra/tegra30_ahub.c:43:12: warning: ‘tegra30_ahub_runtime_suspend’ defined but not used [-Wunused-function]
 static int tegra30_ahub_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 82ef0ae46b86 ('ASoC: tegra: add runtime PM support')
Fixes: be944d42ccc1 ('ASoC: tegra: add tegra30-ahub driver')
Fixes: 4fb0384f3dc6 ('ASoC: tegra: add tegra30-i2s driver')

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 sound/soc/tegra/tegra20_i2s.c  | 4 ++--
 sound/soc/tegra/tegra30_ahub.c | 4 ++--
 sound/soc/tegra/tegra30_i2s.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 1b27f81c10fe..b280ebd72591 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -34,7 +34,7 @@
 
 #define DRV_NAME "tegra20-i2s"
 
-static int tegra20_i2s_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra20_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 
@@ -45,7 +45,7 @@ static int tegra20_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra20_i2s_runtime_resume(struct device *dev)
+static __maybe_unused int tegra20_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra20_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d1718f3af3cd..4692c70ed933 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -40,7 +40,7 @@ static inline void tegra30_audio_write(u32 reg, u32 val)
 	regmap_write(ahub->regmap_ahub, reg, val);
 }
 
-static int tegra30_ahub_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra30_ahub_runtime_suspend(struct device *dev)
 {
 	regcache_cache_only(ahub->regmap_apbif, true);
 	regcache_cache_only(ahub->regmap_ahub, true);
@@ -61,7 +61,7 @@ static int tegra30_ahub_runtime_suspend(struct device *dev)
  * stopping streams should dynamically adjust the clock as required.  However,
  * this is not yet implemented.
  */
-static int tegra30_ahub_runtime_resume(struct device *dev)
+static __maybe_unused int tegra30_ahub_runtime_resume(struct device *dev)
 {
 	int ret;
 
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 8730ffa0f691..36344f0a64c1 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -36,7 +36,7 @@
 
 #define DRV_NAME "tegra30-i2s"
 
-static int tegra30_i2s_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra30_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 
@@ -47,7 +47,7 @@ static int tegra30_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra30_i2s_runtime_resume(struct device *dev)
+static __maybe_unused int tegra30_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
 	int ret;
-- 
2.17.1

