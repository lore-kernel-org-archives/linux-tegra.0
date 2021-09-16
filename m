Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78171C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 10:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6438060EE4
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 10:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237365AbhIPK6R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 06:58:17 -0400
Received: from mx22.baidu.com ([220.181.50.185]:35486 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237193AbhIPK6Q (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 06:58:16 -0400
X-Greylist: delayed 11965 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Sep 2021 06:58:16 EDT
Received: from BC-Mail-Ex07.internal.baidu.com (unknown [172.31.51.47])
        by Forcepoint Email with ESMTPS id 4FD7C11E238CA96FD37D;
        Thu, 16 Sep 2021 18:56:54 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-EX07.internal.baidu.com (172.31.51.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 18:56:54 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 18:56:53 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/tegra: sor: Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 18:56:47 +0800
Message-ID: <20210916105648.12268-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
And using dev_err_probe() can reduce code size, the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/tegra/sor.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ea320c1092b..d7964e498da9 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2964,11 +2964,9 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 	int err;
 
 	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io-hdmi-dp");
-	if (IS_ERR(sor->avdd_io_supply)) {
-		dev_err(sor->dev, "cannot get AVDD I/O supply: %ld\n",
-			PTR_ERR(sor->avdd_io_supply));
-		return PTR_ERR(sor->avdd_io_supply);
-	}
+	if (IS_ERR(sor->avdd_io_supply))
+		return dev_err_probe(sor->dev, PTR_ERR(sor->avdd_io_supply),
+				     "cannot get AVDD I/O supply\n")
 
 	err = tegra_sor_enable_regulator(sor, sor->avdd_io_supply);
 	if (err < 0) {
@@ -2978,11 +2976,9 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 	}
 
 	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-hdmi-dp-pll");
-	if (IS_ERR(sor->vdd_pll_supply)) {
-		dev_err(sor->dev, "cannot get VDD PLL supply: %ld\n",
-			PTR_ERR(sor->vdd_pll_supply));
-		return PTR_ERR(sor->vdd_pll_supply);
-	}
+	if (IS_ERR(sor->vdd_pll_supply))
+		return dev_err_probe(sor->dev, PTR_ERR(sor->vdd_pll_supply),
+				     "cannot get VDD PLL supply\n");
 
 	err = tegra_sor_enable_regulator(sor, sor->vdd_pll_supply);
 	if (err < 0) {
@@ -2992,11 +2988,9 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 	}
 
 	sor->hdmi_supply = devm_regulator_get(sor->dev, "hdmi");
-	if (IS_ERR(sor->hdmi_supply)) {
-		dev_err(sor->dev, "cannot get HDMI supply: %ld\n",
-			PTR_ERR(sor->hdmi_supply));
-		return PTR_ERR(sor->hdmi_supply);
-	}
+	if (IS_ERR(sor->hdmi_supply))
+		return dev_err_probe(sor->dev, PTR_ERR(sor->hdmi_supply),
+				     "cannot get HDMI supply\n");
 
 	err = tegra_sor_enable_regulator(sor, sor->hdmi_supply);
 	if (err < 0) {
-- 
2.25.1

