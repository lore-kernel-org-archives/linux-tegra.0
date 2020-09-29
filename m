Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3D1C4727F
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 11:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6293E21924
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 11:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgI2Lpb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 07:45:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14776 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730681AbgI2LpS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 07:45:18 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id DB96EF3FBE7670F74CDA;
        Tue, 29 Sep 2020 19:45:14 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 29 Sep 2020
 19:45:05 +0800
From:   Wang ShaoBo <bobo.shaobowang@huawei.com>
CC:     <weiyongjun1@huawei.com>, <huawei.libin@huawei.com>,
        <cj.chengjian@huawei.com>, <thierry.reding@gmail.com>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] soc/tegra: fuse: Fix build with Tegra234 configuration
Date:   Tue, 29 Sep 2020 19:43:25 +0800
Message-ID: <20200929114325.3909556-1-bobo.shaobowang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If only Tegra234 support is enabled, the tegra30_fuse_read() and
tegra30_fuse_init() function are not declared and cause a build failure.

drivers/soc/tegra/fuse/fuse-tegra30.c:376:10: error: ‘tegra30_fuse_read’
 undeclared here (not in a function); did you mean ‘tegra_fuse_readl’?
  .read = tegra30_fuse_read,
          ^~~~~~~~~~~~~~~~~
          tegra_fuse_readl
drivers/soc/tegra/fuse/fuse-tegra30.c:382:10: error: ‘tegra30_fuse_init’
 undeclared here (not in a function); did you mean ‘tegra30_fuse_read’?
  .init = tegra30_fuse_init,
          ^~~~~~~~~~~~~~~~~
          tegra30_fuse_read

Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 9ea7f0168457..c1aa7815bd6e 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -37,7 +37,8 @@
     defined(CONFIG_ARCH_TEGRA_132_SOC) || \
     defined(CONFIG_ARCH_TEGRA_210_SOC) || \
     defined(CONFIG_ARCH_TEGRA_186_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_194_SOC)
+    defined(CONFIG_ARCH_TEGRA_194_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_234_SOC)
 static u32 tegra30_fuse_read_early(struct tegra_fuse *fuse, unsigned int offset)
 {
 	if (WARN_ON(!fuse->base))
-- 
2.25.1

