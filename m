Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCECC433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 13:27:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06871610E6
	for <linux-tegra@archiver.kernel.org>; Thu, 13 May 2021 13:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbhEMN2J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 May 2021 09:28:09 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2366 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbhEMN2I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 May 2021 09:28:08 -0400
Received: from dggeml752-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fgsmh4b2tz60sW;
        Thu, 13 May 2021 21:23:32 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml752-chm.china.huawei.com (10.1.199.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 21:26:55 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 13 May 2021 21:26:55 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] firmware: tegra: Fix error return code in tegra210_bpmp_init()
Date:   Thu, 13 May 2021 21:26:46 +0800
Message-ID: <20210513132646.6488-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When call irq_get_irq_data() to get the IRQ's irq_data failed, an
appropriate error code -ENOENT should be returned. However, we directly
return 'err', which records the IRQ number instead of the error code.

Fixes: 139251fc2208 ("firmware: tegra: add bpmp driver for Tegra210")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/firmware/tegra/bpmp-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra210.c b/drivers/firmware/tegra/bpmp-tegra210.c
index ae15940a078e3e5..c32754055c60bf4 100644
--- a/drivers/firmware/tegra/bpmp-tegra210.c
+++ b/drivers/firmware/tegra/bpmp-tegra210.c
@@ -210,7 +210,7 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 	priv->tx_irq_data = irq_get_irq_data(err);
 	if (!priv->tx_irq_data) {
 		dev_err(&pdev->dev, "failed to get IRQ data for TX IRQ\n");
-		return err;
+		return -ENOENT;
 	}
 
 	err = platform_get_irq_byname(pdev, "rx");
-- 
2.26.0.106.g9fadedd


