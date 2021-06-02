Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7002C47083
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DDC061984
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhFBQed (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:34:33 -0400
Received: from mail-ej1-f48.google.com ([209.85.218.48]:39676 "EHLO
        mail-ej1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhFBQec (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:34:32 -0400
Received: by mail-ej1-f48.google.com with SMTP id l1so4768093ejb.6
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D4DTNxk9Yl8qPqUlGFS/qn0d446IjQVbqxu1mMTb7YQ=;
        b=h3DWyuFsFRjGi1EPcx2YHCHhgkK6YPr++knyOcvADPsLlrxtfJbdEK5L1AWRkSyhga
         Mebya76N38tO3RPmApuiUqtSss/phx0YbFCtiN46pxppE2pCS2KfsIeggL7CxajnuGlX
         TM+tNXIqFnFpHwa/9kl/N0Ni647BdB1xuzLUKJUhYO6u7Mhvdey6yBl8LHsVeeLhqJrF
         PSoWN1J6taRoTYBvnxahM5Hv54LinQmpYsZbONC/0hzQF9g83jmTInQV460NZvhuPPRD
         BuYH7RlP50NgzYouz7GECcQxFGC+3M98bYDvATTuyfDf5q7lTsM+ctZsIf+55uusTKwS
         xAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D4DTNxk9Yl8qPqUlGFS/qn0d446IjQVbqxu1mMTb7YQ=;
        b=ZRF5XrbAfLCLaaPSWwtXwNfCXk4OTJjqxQqfXHGwXX3Y+dnI1TXmj6FZF3jSNNPiEh
         n5meD4VFGgxZF+uC+EdEEOAmCttrYoTi/hwldblnGWFSJ2UXpkvgyXCWZmZ57UX9mUrl
         S9gpcqO36vem8D6KdyIQ8G3LtQZNYKOuvB9Bcl/nLMWFFRo6nhc+7C2L64w7Uc8ueunY
         QH7Na7ktvVqwEFUKnvc/ku9T8n/OEYx4cmdmwdGuJoOsOs+6RrwyN+RbsPC4rE8DMOgo
         pQUla4aSmhmbiduIyISI7GVrYZqjljaHL/Qj9KBUiNppN4j4dRA4MLwWBIZilXC6smIx
         nVhA==
X-Gm-Message-State: AOAM533lCLWS5zSO0hRm+bOGo5ZxWuX6bheHNN5l24c05ESbGQhOdKni
        zO+xBC2tDTKBKE3bswPtN/4=
X-Google-Smtp-Source: ABdhPJx9Y5TogD9QFeAJzYkIjeaEkB77j3ccaGQWBbHYgsSxTZuXzuz5feAv772ZknYhLBN1PGZRQQ==
X-Received: by 2002:a17:906:f9d1:: with SMTP id lj17mr14655255ejb.345.1622651496524;
        Wed, 02 Jun 2021 09:31:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id e22sm253556edv.57.2021.06.02.09.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 03/12] memory: tegra: Introduce struct tegra_mc_ops
Date:   Wed,  2 Jun 2021 18:32:53 +0200
Message-Id: <20210602163302.120041-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
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

