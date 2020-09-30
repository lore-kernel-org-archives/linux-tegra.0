Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F2EC4727F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20E8220739
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 08:48:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix+qFRJI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728644AbgI3Isf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 04:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3Ise (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 04:48:34 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925A0C061755;
        Wed, 30 Sep 2020 01:48:34 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u24so706286pgi.1;
        Wed, 30 Sep 2020 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gRPmGINBdNtCVpLXYQWKV/z0/BjC4x5k8jBYlIxRWMI=;
        b=ix+qFRJIPmJnhMHgRJOperQmnNpa9JERF4QIF6qwBysaM0XTnZGxiY1O7YxFolJ4Wk
         3zwNhXr4XplrQ4Vhm7rVldfA+zx/iEEPwjXp84bBpU3GyWPY3DgQibZ/ZNynU2Jm+jUk
         CRF0b4bqKkf3VVt4onVAdAA05e0gWPXgV6dJ3MhPeBSPeiXtkaL1wHoJTVD7Kws0G0Ir
         wEDUpxpgf6gIfSxJVHR3pj4+5ZEXmQakZBZ84LFpa28tGRQFd19jBDE+u1GpuTHDl3fF
         SIhVltn9m0xIpX8+MfXRru138QQsAKWeOttNQn91OcedsxMcwOSU5sZqpy2FbMaLeZ7K
         sUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gRPmGINBdNtCVpLXYQWKV/z0/BjC4x5k8jBYlIxRWMI=;
        b=dbWzEg0wVnoUjWB/FLimOHdyUTTUo5e2KN41FM0SE3knLxZQKyE4Nz8lcmsQO8V3zl
         qC3A7F65GByV+3qyLiQxijbg9zYMLtBwp1k9/SkBLjXk7aLidQik8UZe+gB/K1VWs2JW
         nyBPn7lOM7w6Y9VBejgiv9DUGbSn6CVSe5pMx9aJBDXFSmzoV5FlTEVN6JQyUs9qJO4x
         dxWnMJzr7A1IjPapApV0lRO/T5qFG9/ZoPwnRmf/xSzkm4GjeBh2m8AOMkfyBdSRqQb5
         omI3qpeG2nVdTvSd9baDWqrgSJx0rtawDf3ldUw1drfYJUogDZIZGG4vjuUIO6qN37VU
         Jjfw==
X-Gm-Message-State: AOAM530Oad7VdMuJjbXFMyH5wFYZhzOYFhWtsBNbAarDvIZLICeqjC7K
        8VGNFygj4D8+c1l+/bI5SqY=
X-Google-Smtp-Source: ABdhPJxvF1cP8pYmC64AGwODKBmj4N0d0ivPiQdYOV1QL6X5rnq+N7PfjC+fD8mxsunGsAt8K8aEwQ==
X-Received: by 2002:aa7:8249:0:b029:142:2501:39dd with SMTP id e9-20020aa782490000b0290142250139ddmr1489789pfn.44.1601455714074;
        Wed, 30 Sep 2020 01:48:34 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id d17sm1505830pfq.157.2020.09.30.01.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 01:48:33 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     thierry.reding@gmail.com, joro@8bytes.org, krzk@kernel.org,
        digetx@gmail.com
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] memory: tegra: Add devm_tegra_get_memory_controller()
Date:   Wed, 30 Sep 2020 01:42:56 -0700
Message-Id: <20200930084258.25493-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200930084258.25493-1-nicoleotsuka@gmail.com>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

Multiple Tegra drivers need to retrieve Memory Controller and hence there
is quite some duplication of the retrieval code among the drivers. Let's
add a new common helper for the retrieval of the MC.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v2->v3:
 * Replaced with Dimtry's devm_tegra_get_memory_controller()
v1->v2:
 * N/A

 drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/mc.h    | 17 +++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..dd691dc3738e 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -42,6 +42,45 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+static void tegra_mc_devm_action_put_device(void *data)
+{
+	struct tegra_mc *mc = data;
+
+	put_device(mc->dev);
+}
+
+struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct tegra_mc *mc;
+	int err;
+
+	np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
+	if (!np)
+		return ERR_PTR(-ENOENT);
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	mc = platform_get_drvdata(pdev);
+	if (!mc) {
+		put_device(mc->dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	err = devm_add_action(dev, tegra_mc_devm_action_put_device, mc);
+	if (err) {
+		put_device(mc->dev);
+		return ERR_PTR(err);
+	}
+
+	return mc;
+}
+EXPORT_SYMBOL_GPL(devm_tegra_get_memory_controller);
+
 static int tegra_mc_block_dma_common(struct tegra_mc *mc,
 				     const struct tegra_mc_reset *rst)
 {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 1238e35653d1..c05142e3e244 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -184,4 +184,21 @@ struct tegra_mc {
 int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
 
+#ifdef CONFIG_TEGRA_MC
+/**
+ * devm_tegra_get_memory_controller() - Get the tegra_mc pointer.
+ * @dev: Device that will be interacted with
+ *
+ * Return: ERR_PTR() on error or a valid pointer to a struct tegra_mc.
+ *
+ * The mc->dev counter will be automatically put by the device management code.
+ */
+struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev);
+#else
+static inline struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.17.1

