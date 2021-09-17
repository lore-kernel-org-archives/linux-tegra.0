Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46ED3C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 02:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E9D161108
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 02:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242618AbhIQCJL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 22:09:11 -0400
Received: from mx22.baidu.com ([220.181.50.185]:41554 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242651AbhIQCJL (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 22:09:11 -0400
Received: from BC-Mail-Ex12.internal.baidu.com (unknown [172.31.51.52])
        by Forcepoint Email with ESMTPS id 0D4B134AA735FED9982D;
        Fri, 17 Sep 2021 10:07:48 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex12.internal.baidu.com (172.31.51.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 17 Sep 2021 10:07:47 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 10:07:47 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/tegra: sor: Make use of the helper function dev_err_probe()
Date:   Fri, 17 Sep 2021 10:07:41 +0800
Message-ID: <20210917020741.17525-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex16.internal.baidu.com (10.127.64.39) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
And using dev_err_probe() can reduce code size, the error value
gets printed.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Fix compile error-add ';'

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
+				     "cannot get AVDD I/O supply\n");
 
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

