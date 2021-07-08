Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7166AC07E96
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 14:35:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 519B461467
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 14:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhGHOhv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 10:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhGHOhv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 10:37:51 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860C4C061574
        for <linux-tegra@vger.kernel.org>; Thu,  8 Jul 2021 07:35:08 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g8-20020a1c9d080000b02901f13dd1672aso5026571wme.0
        for <linux-tegra@vger.kernel.org>; Thu, 08 Jul 2021 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ipPj1iqNC9lnA7tWPR2FY8hVdI2WOPcAN/IFDy00v+M=;
        b=kUjx2vqbNzPCwmw0DvqVf0pTFM2RYCXbkFcKVeLrKb8lWq3fb5sXrM/Jyj+UI2kwam
         P5gSfsY2LUKeH/kC71apptesxesmAfB3TBcLUTG9f6WMISFTTFMkycDCy0tx5Xf/k3Lu
         p8ceVyemLcbK7F06uuJL0MsiFVyll2MJyb8shtUrBKcpsJWVkXF53LcKBEFS5oCR7UHA
         ZmELxe5MokRE+XNTrzICULe+0DbvNXgpo+I6E3bxaxtSfYUaJAVyKbPYurTxot/xB14e
         dYX4TDRLPgvwz1AYBPvB9kXRHMtJ+Ge17SxkEaa2sDrxFwSXDb2o4U48CYOWFXYRmn2K
         B8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ipPj1iqNC9lnA7tWPR2FY8hVdI2WOPcAN/IFDy00v+M=;
        b=OblkYRiPpF3obGuMJlccV7X1k2KGbPxZEJR0z0Bjd1aFLO7q1da6Gq+hmuK08dHF8Z
         +wQH/XQZMxL2dBouJmOZudvNfK8GMuHu0iWZOtOwa1QNtTEcwFZ9BQN1reNpm6Xcj7fG
         h1Ia9mZn00G7/JJOd5e9HTgT1b5h8evI2D/rSYwKD4+3UxQ1Xt8+X9gcQZQay1mDr8hg
         AiX6WoAIycbMXHGvfTxTp8QkYLslR9SPQU/jdd+MODCqrwRcI4wIMyuTGPOAHxsL/wUD
         pbY1rHw2WrPsykGdvDuNeeO7HPuIVzc8ufm0zxP8D4Fq6j6UT9MAFOR2qjvbtND9rR6Z
         G/Sw==
X-Gm-Message-State: AOAM531/yhGiG81lUMMBEl4whGdcUydh00W6vxGWofjB5bBiuTx1xrSe
        GclhPPR1pyQChAnGfPJ6cNQ=
X-Google-Smtp-Source: ABdhPJw/2jHbxU8SCxDsF+TsGdstH4KTGC1LfafVBdspsh183upXjSK5U1TU749Kat/OiONRKVqXIA==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr32696964wmi.171.1625754907129;
        Thu, 08 Jul 2021 07:35:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p7sm2398292wrr.21.2021.07.08.07.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 07:35:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: gr2d: Explicitly control module reset
Date:   Thu,  8 Jul 2021 16:37:36 +0200
Message-Id: <20210708143736.2018135-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

As of commit 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling
clocks"), module resets are no longer automatically deasserted when the
module clock is enabled. To make sure that the gr2d module continues to
work, we need to explicitly control the module reset.

Fixes: 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling clocks")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index de288cba3905..ba3722f1b865 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -4,9 +4,11 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/reset.h>
 
 #include "drm.h"
 #include "gem.h"
@@ -19,6 +21,7 @@ struct gr2d_soc {
 struct gr2d {
 	struct tegra_drm_client client;
 	struct host1x_channel *channel;
+	struct reset_control *rst;
 	struct clk *clk;
 
 	const struct gr2d_soc *soc;
@@ -208,6 +211,12 @@ static int gr2d_probe(struct platform_device *pdev)
 	if (!syncpts)
 		return -ENOMEM;
 
+	gr2d->rst = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(gr2d->rst)) {
+		dev_err(dev, "cannot get reset\n");
+		return PTR_ERR(gr2d->rst);
+	}
+
 	gr2d->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(gr2d->clk)) {
 		dev_err(dev, "cannot get clock\n");
@@ -220,6 +229,14 @@ static int gr2d_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	usleep_range(2000, 4000);
+
+	err = reset_control_deassert(gr2d->rst);
+	if (err < 0) {
+		dev_err(dev, "failed to deassert reset: %d\n", err);
+		goto disable_clk;
+	}
+
 	INIT_LIST_HEAD(&gr2d->client.base.list);
 	gr2d->client.base.ops = &gr2d_client_ops;
 	gr2d->client.base.dev = dev;
@@ -234,8 +251,7 @@ static int gr2d_probe(struct platform_device *pdev)
 	err = host1x_client_register(&gr2d->client.base);
 	if (err < 0) {
 		dev_err(dev, "failed to register host1x client: %d\n", err);
-		clk_disable_unprepare(gr2d->clk);
-		return err;
+		goto assert_rst;
 	}
 
 	/* initialize address register map */
@@ -245,6 +261,13 @@ static int gr2d_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gr2d);
 
 	return 0;
+
+assert_rst:
+	(void)reset_control_assert(gr2d->rst);
+disable_clk:
+	clk_disable_unprepare(gr2d->clk);
+
+	return err;
 }
 
 static int gr2d_remove(struct platform_device *pdev)
@@ -259,6 +282,12 @@ static int gr2d_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	err = reset_control_assert(gr2d->rst);
+	if (err < 0)
+		dev_err(&pdev->dev, "failed to assert reset: %d\n", err);
+
+	usleep_range(2000, 4000);
+
 	clk_disable_unprepare(gr2d->clk);
 
 	return 0;
-- 
2.32.0

