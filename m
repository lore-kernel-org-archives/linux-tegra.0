Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9C8C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:30:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBDBD60F58
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhILSbr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 14:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbhILSbq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 14:31:46 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57962C061574;
        Sun, 12 Sep 2021 11:30:32 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id f2so13034204ljn.1;
        Sun, 12 Sep 2021 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lM95oVF+57JXmaYeDU5pGJdRZwgFdYQm9niZbYhhfzc=;
        b=pXjElKtJj0/p2kARz8MJwSWK/6sKGcHCfssPrnzkhXmjBVuBxMapJcCd3kmZGra+5t
         SylNHqABZAkPMoUymKhOaF+tLE/x1ss2IQrywahhd5O4ebRnOc+KadX5G+HInoygcHMM
         PsojvoVQX/XT1agnL2sfGhVxamaj9bnQuikCkzJUez7FBPMUxM/wm15thcy3QGIN/olp
         hrFIhVHto3X9FOJBhu2kYr+A8SMwM2tFkKZnxqzK4ulJ/r1FbOpBQnp4qzUy098uQ+fL
         oG3bUuw0K7wLonY+g1F2MolBBxSYexV0IRU7qLZVN8iVgkucNBOP32Lw+zSmD+lFRIqF
         AQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lM95oVF+57JXmaYeDU5pGJdRZwgFdYQm9niZbYhhfzc=;
        b=LPFq4itlX5r3sIbsKulkrm/buouDprFn6ZAyt/d0pxFNtatwn0A24ihFosjjODqzFi
         ewPNj3Ld67/ZxyqBmiAmubkV3oc3bJi5+8IncwX+iZDNCBFnLMc8bnQu64Xjw2lnUqPW
         P5CX+a+a/xTZXZarhen89EQcL5u9GY4pQ+4lZRPv2ETUI+Cm9/9YA7V9CyFYGT2oBcW+
         nhjuc82WRm0yU1TiZHrdUx9+w4GC4JO0S8OxR9Z2nH/ufnmEVXnKH7qfLmrznjwp6HDb
         Hcf7UHkHYPSs4Rl+b2CpndtOn0Q75ji1qDIJuDcafM0lZ5THklM/z8HDaMuRFPAYPtuo
         TOjw==
X-Gm-Message-State: AOAM530DkE7MCe+OhbWqUEczDQBWI9bHtNmzRo2NMM4SfQxxpmvvKuMU
        5cpBvb8SA3P4bTFFsGc2KzlPGeFX93M=
X-Google-Smtp-Source: ABdhPJwFHHYXhazDgurXJ4nSQsCdft2zclaEk0XBhVz/7Osc5HngrazO5015vLM0c3phiuzWx8jAHg==
X-Received: by 2002:a05:651c:1242:: with SMTP id h2mr7043661ljh.114.1631471430772;
        Sun, 12 Sep 2021 11:30:30 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id x192sm586750lff.154.2021.09.12.11.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 11:30:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] memory: tegra: Remove interconnect state syncing hack
Date:   Sun, 12 Sep 2021 21:30:09 +0300
Message-Id: <20210912183009.6400-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

State syncing works properly now, previously the sync callback was never
invoked. Apparently it was fixed in drivers core, so let's remove the
hack. The state won't be synced until all consumer drivers of devices
that reference memory controller in a device-tree are probed, i.e. keeping
bandwidth at maximum until both display and devfreq drivers are probed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 3c5aae7abf35..6b710c204799 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -706,15 +706,6 @@ static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
 			goto remove_nodes;
 	}
 
-	/*
-	 * MC driver is registered too early, so early that generic driver
-	 * syncing doesn't work for the MC. But it doesn't really matter
-	 * since syncing works for the EMC drivers, hence we can sync the
-	 * MC driver by ourselves and then EMC will complete syncing of
-	 * the whole ICC state.
-	 */
-	icc_sync_state(mc->dev);
-
 	return 0;
 
 remove_nodes:
@@ -835,6 +826,15 @@ static int __maybe_unused tegra_mc_resume(struct device *dev)
 	return 0;
 }
 
+static void tegra_mc_sync_state(struct device *dev)
+{
+	struct tegra_mc *mc = dev_get_drvdata(dev);
+
+	/* check whether ICC provider is registered */
+	if (mc->provider.dev == dev)
+		icc_sync_state(dev);
+}
+
 static const struct dev_pm_ops tegra_mc_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_mc_suspend, tegra_mc_resume)
 };
@@ -845,6 +845,7 @@ static struct platform_driver tegra_mc_driver = {
 		.of_match_table = tegra_mc_of_match,
 		.pm = &tegra_mc_pm_ops,
 		.suppress_bind_attrs = true,
+		.sync_state = tegra_mc_sync_state,
 	},
 	.prevent_deferred_probe = true,
 	.probe = tegra_mc_probe,
-- 
2.32.0

