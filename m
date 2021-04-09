Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443AEC433ED
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 04:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F4E761165
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 04:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhDIEpo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Apr 2021 00:45:44 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16107 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhDIEpn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Apr 2021 00:45:43 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGlr43sk1z1BGMl;
        Fri,  9 Apr 2021 12:43:16 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 12:45:27 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
Subject: [PATCH -next] soc/tegra: fuse: add missing iounmap() on error in tegra_init_fuse()
Date:   Fri, 9 Apr 2021 12:49:03 +0800
Message-ID: <20210409044903.663632-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the missing iounmap() before return from tegra_init_fuse()
in the error handling case.

Fixes: 9f94fadd75d3 ("soc/tegra: fuse: Register cell lookups for compatibility")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 94b60a692b51..bc8d70e6a676 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -489,8 +489,10 @@ static int __init tegra_init_fuse(void)
 		size_t size = sizeof(*fuse->lookups) * fuse->soc->num_lookups;
 
 		fuse->lookups = kmemdup(fuse->soc->lookups, size, GFP_KERNEL);
-		if (!fuse->lookups)
+		if (!fuse->lookups) {
+			iounmap(fuse->base);
 			return -ENOMEM;
+		}
 
 		nvmem_add_cell_lookups(fuse->lookups, fuse->soc->num_lookups);
 	}
-- 
2.25.1

