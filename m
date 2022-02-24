Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E61AC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Feb 2022 12:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbiBXM2G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 07:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234302AbiBXM2F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 07:28:05 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F67D145E23
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 04:27:35 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id s24so2579607edr.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 04:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lH4DKblAHno5yijOeDVLKkujySj1Kzd2+G9hXuYDpQI=;
        b=j7g3XLDJWImHUoxtDVDgqfDQLnbVhY5VdeACDLvdFRlzeJBPkeGnt9Kw2FwnQBw5dR
         CgLFqDQNuogIvOuVLcg892IQIUWPKJCbYamwWYLlIfYPbu5dMFZnV8lmp98LMyD6wr2q
         3rU/k5+BUU8L3/IEOi5H0IvQ1Usm9ppwjDSmJPx8ej8hVRv5TWDpv2e6pXGpVI+BnOco
         lPxbiTgxl0kg1YaDBBlyEF9XQPoUG5yUj/ua40syFVr0CCy6UK5t7Jr3PDRZOlDLcaQh
         hXvoeWRKwfoQ8yMGLqOh8Z/B+0FrG/+q9rTIO1X1RM166V06OOZ29gcgp8jO09PbmLcU
         MB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lH4DKblAHno5yijOeDVLKkujySj1Kzd2+G9hXuYDpQI=;
        b=4fZN1rg4D84vD5oyxp2nWh700z9+ApKdfqIVrV9CEE/ncOlpUU/w1iZNMRdQO/1yix
         WxwtvvGYJuz1hnAOMgV0BP5fhjAdGIC5t/Y1Ke6JJr/w0iQRQi1WYBEvTBX2pb8D88tW
         //goEhX3GAOMd0zFpMBFKwp9XecPelbInIkFYJvHltkkvGz0gP68J6CSurVC1QbCw7nb
         v8JxbQuN8FQpmejeK9UbpNaR9Klt2IegAeHVdibgKSAeGWmJgTfd1dEZmG1aKDZEBamq
         R+ESHpx63w4gCxF2g88h04csAPn+q3+S8gYo9VcDidf+8gJ0yqNml95omJqox8F1tI1T
         Md/g==
X-Gm-Message-State: AOAM530vnhRd0FUNrbIe3qvDRZfZtNWoVisVONSJ8Qz3kHji/JdZ4cvs
        Q6ZZ5QiBqbcCfnczGo4rtuhE4trbtYU=
X-Google-Smtp-Source: ABdhPJwpLNp+RxmPQknlt/sd5tz/64LKat17/yvafWI70K/FJi+AQqZV+L+XH5gS+V+T0w8JFxGosw==
X-Received: by 2002:a50:fa9a:0:b0:413:4420:518a with SMTP id w26-20020a50fa9a000000b004134420518amr2038238edr.168.1645705653538;
        Thu, 24 Feb 2022 04:27:33 -0800 (PST)
Received: from localhost (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de. [2003:e4:1f0a:6900::43a])
        by smtp.gmail.com with ESMTPSA id i9sm1267982eds.82.2022.02.24.04.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 04:27:32 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] soc/tegra: fuse: Explicitly cast to/from __iomem
Date:   Thu, 24 Feb 2022 13:27:28 +0100
Message-Id: <20220224122728.459608-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

sparse is picky about casts between different address spaces. A cast to
plain void * needs to be accompanied by a __force modifier and casting
back to void __iomem * needs to be explicit to avoid warnings.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 88724b78a84c ("soc/tegra: fuse: Use resource-managed helpers")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 10d2ae99babd..aa94fda282f4 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -202,8 +202,8 @@ static const struct nvmem_cell_info tegra_fuse_cells[] = {
 
 static void tegra_fuse_restore(void *base)
 {
+	fuse->base = (void __iomem *)base;
 	fuse->clk = NULL;
-	fuse->base = base;
 }
 
 static int tegra_fuse_probe(struct platform_device *pdev)
@@ -213,7 +213,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 	struct resource *res;
 	int err;
 
-	err = devm_add_action(&pdev->dev, tegra_fuse_restore, base);
+	err = devm_add_action(&pdev->dev, tegra_fuse_restore, (void __force *)base);
 	if (err)
 		return err;
 
-- 
2.35.1

