Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD25AC433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Nov 2022 08:16:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiKAIQT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Nov 2022 04:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiKAIQS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Nov 2022 04:16:18 -0400
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1527EE0D;
        Tue,  1 Nov 2022 01:16:15 -0700 (PDT)
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id WLS00012;
        Tue, 01 Nov 2022 16:16:12 +0800
Received: from localhost.localdomain (10.200.104.97) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.12; Tue, 1 Nov 2022 16:16:13 +0800
From:   Bo Liu <liubo03@inspur.com>
To:     <krzysztof.kozlowski@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Bo Liu <liubo03@inspur.com>
Subject: [PATCH] memory: tegra20-emc: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Tue, 1 Nov 2022 04:16:11 -0400
Message-ID: <20221101081611.8179-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.200.104.97]
tUid:   20221101161612805c7c5ea3d01c1012e969ff4e38ba2d
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix the following coccicheck warning:
 drivers/memory/tegra/tegra20-emc.c:902:0-23: WARNING:
  tegra_emc_debug_max_rate_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
 drivers/memory/tegra/tegra20-emc.c:872:0-23: WARNING:
  tegra_emc_debug_min_rate_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index bd4e37b6552d..c2b4caccfae9 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -869,7 +869,7 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
 			tegra_emc_debug_min_rate_get,
 			tegra_emc_debug_min_rate_set, "%llu\n");
 
@@ -899,7 +899,7 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
 			tegra_emc_debug_max_rate_get,
 			tegra_emc_debug_max_rate_set, "%llu\n");
 
-- 
2.27.0

