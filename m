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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF5FC47092
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B679061375
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbhFASAC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFASAC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:02 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1949C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:19 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id h24so19145822ejy.2
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D4DTNxk9Yl8qPqUlGFS/qn0d446IjQVbqxu1mMTb7YQ=;
        b=X3vawT4ImI3UT0ZaZpLVUcK3Fnl5IEFS5DvGqTxGfe/OxMSQOLl36AF1gKaCJGr6MA
         FyVCylhR6m8JxisOP5m6LZ1F/Ct9vKxP2UUA2RT5H2nBMviE1Fgllee/qldv0Dbxa3w/
         kwiMJuewRXuIUDTi+pYIvUjMaHvqpFykYblvtEHoHk/mSAwdDjOZDwBOJktAqycslsP7
         KZHdIW32RnXpzAwfB4FeoMyJ+aEChBEwCCClaTnEJkHVLQEfedKgowCsnz1NzQxOZz7e
         AO29X//IQ1iim4GQINYqLAWTWA4qEExUGJUDIa2oBcWDD7A0de51Pb913V0ZWvZ5TVAK
         N9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D4DTNxk9Yl8qPqUlGFS/qn0d446IjQVbqxu1mMTb7YQ=;
        b=nUDmVmAEkWPWKUpodji+iT2iI5c5rwxIDYBLlnC375Tei0cKbJyyezUnmhLrIcgn0j
         lnRRM7L1N/oi6Ymxostxg65+kPzWvmjmxThBVGFAqwfEDR8OOs4ly0gg7+zMgRICu+oc
         smcVskT3vmmQ3i8f1f7tRT65Y9PHXNTusOrykLiR1FqMh4cvfiGNfKzlYFTBe4a58s/s
         dVl01LnkyDcryKZZtlRvfJqODMEZxAMi5DbhDVXkbXf+/ZTZTA0J7okqX4RkpBgeX/8W
         pssRmYzL+mhHB94H3Td4gV/+BFNGX5pYRbWYCY+iUXLYD+Dd7aHB9pxCc50wxF3l2xh3
         AQ6Q==
X-Gm-Message-State: AOAM532Y3D3vzpPynOY1YfDLFYzvxOg3/DvTzkIpJOMAW743uIBjquBc
        a2uS7V48PoWONZlER2evMUY=
X-Google-Smtp-Source: ABdhPJyqGGaaSSSRZnYSmzaIoUHM3ZxCO4T20ZrxXj146AE+bKiLopgCLzO0Tsya238FX+EqSaz7Yw==
X-Received: by 2002:a17:906:755:: with SMTP id z21mr29660812ejb.113.1622570298498;
        Tue, 01 Jun 2021 10:58:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x9sm7840375eje.64.2021.06.01.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/12] memory: tegra: Introduce struct tegra_mc_ops
Date:   Tue,  1 Jun 2021 19:59:33 +0200
Message-Id: <20210601175942.1920588-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Subsequent patches will introduce further callbacks, so create a new
struct tegra_mc_ops to collect all of them in a single place. Move the
existing ->init() callback into the new structure.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- new patch (suggested by Krzysztof)

 drivers/memory/tegra/mc.c      | 4 ++--
 drivers/memory/tegra/tegra20.c | 6 +++++-
 include/soc/tegra/mc.h         | 7 +++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index b7e104bf6614..559ae1ef5633 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -829,8 +829,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
 
 	mc->debugfs.root = debugfs_create_dir("mc", NULL);
 
-	if (mc->soc->init) {
-		err = mc->soc->init(mc);
+	if (mc->soc->ops && mc->soc->ops->init) {
+		err = mc->soc->ops->init(mc);
 		if (err < 0)
 			dev_err(&pdev->dev, "failed to initialize SoC driver: %d\n",
 				err);
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 2db68a913b7a..3b7b93b96480 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -687,6 +687,10 @@ static int tegra20_mc_init(struct tegra_mc *mc)
 	return 0;
 }
 
+static const struct tegra_mc_ops tegra20_mc_ops = {
+	.init = tegra20_mc_init,
+};
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
@@ -698,5 +702,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.resets = tegra20_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
-	.init = tegra20_mc_init,
+	.ops = &tegra20_mc_ops,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 9da4ef52ce30..4f88da907a02 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -169,6 +169,10 @@ struct tegra_mc_icc_ops {
 						void *data);
 };
 
+struct tegra_mc_ops {
+	int (*init)(struct tegra_mc *mc);
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -190,8 +194,7 @@ struct tegra_mc_soc {
 	unsigned int num_resets;
 
 	const struct tegra_mc_icc_ops *icc_ops;
-
-	int (*init)(struct tegra_mc *mc);
+	const struct tegra_mc_ops *ops;
 };
 
 struct tegra_mc {
-- 
2.31.1

