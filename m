Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F14EE49A3
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Aug 2023 07:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbjHVHRY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Aug 2023 03:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjHVHRX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Aug 2023 03:17:23 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B3A1711
        for <linux-tegra@vger.kernel.org>; Tue, 22 Aug 2023 00:16:42 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVLBB0NN1ztS2T;
        Tue, 22 Aug 2023 15:11:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 15:15:28 +0800
From:   Jinjie Ruan <ruanjinjie@huawei.com>
To:     <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <thierry.reding@gmail.com>,
        <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/2] drm/bridge: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Tue, 22 Aug 2023 15:15:02 +0800
Message-ID: <20230822071503.178000-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822071503.178000-1-ruanjinjie@huawei.com>
References: <20230822071503.178000-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
simplify code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 10 ++--------
 drivers/gpu/drm/bridge/tc358764.c |  5 +----
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 46198af9eebb..49fd60a08c1c 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -240,19 +240,13 @@ static int tc358762_parse_dt(struct tc358762 *ctx)
 
 	/* Reset GPIO is optional */
 	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->reset_gpio))
-		return PTR_ERR(ctx->reset_gpio);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ctx->reset_gpio);
 }
 
 static int tc358762_configure_regulators(struct tc358762 *ctx)
 {
 	ctx->regulator = devm_regulator_get(ctx->dev, "vddc");
-	if (IS_ERR(ctx->regulator))
-		return PTR_ERR(ctx->regulator);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ctx->regulator);
 }
 
 static int tc358762_probe(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index deccb3995022..738ea6e11712 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -319,10 +319,7 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
 	}
 
 	ctx->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(ctx->next_bridge))
-		return PTR_ERR(ctx->next_bridge);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ctx->next_bridge);
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
-- 
2.34.1

