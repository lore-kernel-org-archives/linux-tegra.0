Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275C6C67871
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 06:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbiJ0G7T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 02:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbiJ0G7E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 02:59:04 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD481205F3
        for <linux-tegra@vger.kernel.org>; Wed, 26 Oct 2022 23:57:22 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mybvr61DCz15MBS;
        Thu, 27 Oct 2022 14:52:24 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 14:57:18 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 14:57:18 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-tegra@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] soc/tegra: cbb: tegra194: use of_address_count() helper
Date:   Thu, 27 Oct 2022 14:56:25 +0800
Message-ID: <20221027065625.1443750-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

After commit 16988c742968 ("of/address: introduce of_address_count() helper"),
We can use of_address_count() to instead of open-coding it.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index 1ae0bd9a1ac1..b5676dd49e88 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2191,7 +2191,6 @@ MODULE_DEVICE_TABLE(of, tegra194_cbb_match);
 static int tegra194_cbb_get_bridges(struct tegra194_cbb *cbb, struct device_node *np)
 {
 	struct tegra_cbb *entry;
-	struct resource res;
 	unsigned long flags;
 	unsigned int i;
 	int err;
@@ -2211,8 +2210,7 @@ static int tegra194_cbb_get_bridges(struct tegra194_cbb *cbb, struct device_node
 	spin_unlock_irqrestore(&cbb_lock, flags);
 
 	if (!cbb->bridges) {
-		while (of_address_to_resource(np, cbb->num_bridges, &res) == 0)
-			cbb->num_bridges++;
+		cbb->num_bridges = of_address_count(np);
 
 		cbb->bridges = devm_kcalloc(cbb->base.dev, cbb->num_bridges,
 					    sizeof(*cbb->bridges), GFP_KERNEL);
-- 
2.25.1

