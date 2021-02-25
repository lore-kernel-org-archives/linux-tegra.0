Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D9BC433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Feb 2021 09:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B29E164F18
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Feb 2021 09:10:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236079AbhBYJIr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Feb 2021 04:08:47 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:52544 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234781AbhBYJGo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Feb 2021 04:06:44 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UPWiIBt_1614243960;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPWiIBt_1614243960)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Feb 2021 17:06:00 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     krzk@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] memory: tegra: Replace DEFINE_SIMPLE_ATTRIBUTE with  DEFINE_DEBUGFS_ATTRIBUTE
Date:   Thu, 25 Feb 2021 17:05:58 +0800
Message-Id: <1614243958-55847-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix the following coccicheck warning:
./drivers/memory/tegra/tegra124-emc.c:1207:0-23: WARNING:
tegra_emc_debug_min_rate_fops should be defined with
DEFINE_DEBUGFS_ATTRIBUTE
./drivers/memory/tegra/tegra124-emc.c:1237:0-23: WARNING:
tegra_emc_debug_max_rate_fops should be defined with
DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/memory/tegra/tegra124-emc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index bee8d9f..874e1a0 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1204,7 +1204,7 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
 			tegra_emc_debug_min_rate_get,
 			tegra_emc_debug_min_rate_set, "%llu\n");
 
@@ -1234,7 +1234,7 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
 			tegra_emc_debug_max_rate_get,
 			tegra_emc_debug_max_rate_set, "%llu\n");
 
-- 
1.8.3.1

