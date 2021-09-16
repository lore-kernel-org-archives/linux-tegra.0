Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51230C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 08:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3551060F93
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 08:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbhIPIZC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:25:02 -0400
Received: from mx24.baidu.com ([111.206.215.185]:33586 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235069AbhIPIZB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 04:25:01 -0400
X-Greylist: delayed 1800 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Sep 2021 04:25:01 EDT
Received: from BC-Mail-EX08.internal.baidu.com (unknown [172.31.51.48])
        by Forcepoint Email with ESMTPS id 31E261133E30DDCA424E;
        Thu, 16 Sep 2021 15:37:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-EX08.internal.baidu.com (172.31.51.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 15:37:27 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 15:37:26 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/tegra: plane: Improve use of dev_err_probe()
Date:   Thu, 16 Sep 2021 15:37:21 +0800
Message-ID: <20210916073722.9110-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex09.internal.baidu.com (172.31.51.49) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Return dev_err_probe() directly, because the return value of
dev_err_probe() is the appropriate error code, and it can
reduce code size, simplify the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/tegra/plane.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index e00ec3f40ec8..e373411b1f0b 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -744,21 +744,17 @@ int tegra_plane_interconnect_init(struct tegra_plane *plane)
 
 	plane->icc_mem = devm_of_icc_get(dev, icc_name);
 	err = PTR_ERR_OR_ZERO(plane->icc_mem);
-	if (err) {
-		dev_err_probe(dev, err, "failed to get %s interconnect\n",
-			      icc_name);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "failed to get %s interconnect\n",
+				     icc_name);
 
 	/* plane B on T20/30 has a dedicated memory client for a 6-tap vertical filter */
 	if (plane->index == 1 && dc->soc->has_win_b_vfilter_mem_client) {
 		plane->icc_mem_vfilter = devm_of_icc_get(dev, "winb-vfilter");
 		err = PTR_ERR_OR_ZERO(plane->icc_mem_vfilter);
-		if (err) {
-			dev_err_probe(dev, err, "failed to get %s interconnect\n",
-				      "winb-vfilter");
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err, "failed to get %s interconnect\n",
+					     "winb-vfilter");
 	}
 
 	return 0;
-- 
2.25.1

