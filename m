Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8027AC433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 18 May 2022 06:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbiERG5r (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 May 2022 02:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbiERG5q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 May 2022 02:57:46 -0400
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1704C28E1B;
        Tue, 17 May 2022 23:57:42 -0700 (PDT)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 18 May
 2022 14:57:40 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 18 May
 2022 14:57:39 +0800
From:   Haowen Bai <baihaowen@meizu.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     Haowen Bai <baihaowen@meizu.com>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: [PATCH] mailbox: tegra-hsp: Drop unnecessary null test @list_for_each_entry
Date:   Wed, 18 May 2022 14:57:37 +0800
Message-ID: <1652857058-5220-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

list_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/mailbox/tegra-hsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 78f7265039c6..a55d6df99697 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -804,7 +804,7 @@ static int __maybe_unused tegra_hsp_resume(struct device *dev)
 	struct tegra_hsp_doorbell *db;
 
 	list_for_each_entry(db, &hsp->doorbells, list) {
-		if (db && db->channel.chan)
+		if (db->channel.chan)
 			tegra_hsp_doorbell_startup(db->channel.chan);
 	}
 
-- 
2.7.4

