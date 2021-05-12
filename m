Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B0DC433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 12 May 2021 03:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C5D56108D
	for <linux-tegra@archiver.kernel.org>; Wed, 12 May 2021 03:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhELDpo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 23:45:44 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2565 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhELDpo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 23:45:44 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fg0w41TrSzwSQk;
        Wed, 12 May 2021 11:41:56 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 11:44:28 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <linux@armlinux.org.uk>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <gustavoars@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] ARM: tegra: Add missing MODULE_DEVICE_TABLE
Date:   Wed, 12 May 2021 12:01:29 +0800
Message-ID: <1620792089-16319-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/amba/tegra-ahb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index 0b2c20f..a0af8ed 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -272,6 +272,7 @@ static const struct of_device_id tegra_ahb_of_match[] = {
 	{ .compatible = "nvidia,tegra20-ahb", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra_ahb_of_match);
 
 static struct platform_driver tegra_ahb_driver = {
 	.probe = tegra_ahb_probe,
-- 
2.6.2

