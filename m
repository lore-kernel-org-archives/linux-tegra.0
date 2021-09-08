Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299BAC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 10:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 124DC60ED8
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Sep 2021 10:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348945AbhIHK5t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Sep 2021 06:57:49 -0400
Received: from mx20.baidu.com ([111.202.115.85]:39838 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348101AbhIHK5r (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 8 Sep 2021 06:57:47 -0400
Received: from BC-Mail-Ex18.internal.baidu.com (unknown [172.31.51.12])
        by Forcepoint Email with ESMTPS id 52528B5E57767FF86749;
        Wed,  8 Sep 2021 18:56:30 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex18.internal.baidu.com (172.31.51.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 8 Sep 2021 18:56:29 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 8 Sep 2021 18:56:29 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] firmware: bpmp-tegra210: Make use of the helper function devm_platform_ioremap_resource()
Date:   Wed, 8 Sep 2021 18:56:23 +0800
Message-ID: <20210908105624.1423-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/firmware/tegra/bpmp-tegra210.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra210.c b/drivers/firmware/tegra/bpmp-tegra210.c
index c32754055c60..c9c830f658c3 100644
--- a/drivers/firmware/tegra/bpmp-tegra210.c
+++ b/drivers/firmware/tegra/bpmp-tegra210.c
@@ -162,7 +162,6 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 {
 	struct platform_device *pdev = to_platform_device(bpmp->dev);
 	struct tegra210_bpmp *priv;
-	struct resource *res;
 	unsigned int i;
 	int err;
 
@@ -172,13 +171,11 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 
 	bpmp->priv = priv;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->atomics = devm_ioremap_resource(&pdev->dev, res);
+	priv->atomics = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->atomics))
 		return PTR_ERR(priv->atomics);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	priv->arb_sema = devm_ioremap_resource(&pdev->dev, res);
+	priv->arb_sema = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->arb_sema))
 		return PTR_ERR(priv->arb_sema);
 
-- 
2.25.1

