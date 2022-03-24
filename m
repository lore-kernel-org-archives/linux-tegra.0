Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D11C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Mar 2022 10:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343575AbiCXKcE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Mar 2022 06:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345579AbiCXKcD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Mar 2022 06:32:03 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BAD55227
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 03:30:31 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id g20so5070386edw.6
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qATJBRGZt70MHBeCBmN9PJu8Fg5hxZQ0jK4IY9wgqro=;
        b=W92XBWa6W8T3QlQ3Nll+QwSEssHfiEfPT2PeDmxwVc8RHFx5A1trXaZpzurUnHE9az
         V6IBvKMrGnYJRPyAXACt8aqI609tPHN/TilLpXNzLEj5wmxLPBpL3YzQwxqItDoGO1x3
         jwZmDaDISLCELJD5Vgb6DSBvRd0CDHHVaRG0LwJzhqPKxMK3qNL7/hLRfGwvrRrxVubN
         xAmJ40Td0uM+RtH39vlKrpD2QdCFGc+O8SFUC2NVkdpQjdhlgzQD3OcFmbf7+1yvKMWK
         eaomyqPIs+fYJVNOFVEBDL8BnOgvUczqeMwiOhl6+MaEzedXn8m4EQnSMjsiKrTTLiBy
         yLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qATJBRGZt70MHBeCBmN9PJu8Fg5hxZQ0jK4IY9wgqro=;
        b=8FD1Fyeus3mELCsWFo4512VwBNYPScyFzXQy9/v37S+qowNGpp9ZHtFdu/WcrsSQcO
         wNAKGIiqcsTQ4J6i9EBDBHdlBM3UIxjYrLMfOrQ2E2TlfvzPCO8ckri3ScbnUJeNOYci
         G6SI4p+k3rhtqYekuk511P6+FOIjGHZQr/Fm8DGG9sKZsALJLB6vZgBD5mOTIUm4Ukdj
         HY9Tz6MAXP8rmjKStUDsWqqrxl3wZ6Mrp/9BZlOErzCo4jAZ017W/IPBlEkcFz6srUI2
         cpOeodB1g4knY6L71HRW6XDhBLd+atQ+/TQ2SjJgiaiIdqYo/dW6Gme96nFLfZim3Tg3
         jF2g==
X-Gm-Message-State: AOAM533PnQ7boYaXJm1uW4zjzRou+ymkRRmmpcou2ZVehLVP2nbZzZnd
        7iSEUtuyxrfY1mm0abSZlKM=
X-Google-Smtp-Source: ABdhPJwMsYPaI5k1LQxBIxNMpx3TM4N0ZNqtvC6wqgGswojRco6agz9kV9FutvN8m2zX6kJEFT4OMQ==
X-Received: by 2002:a05:6402:5202:b0:419:2b9f:7dd3 with SMTP id s2-20020a056402520200b004192b9f7dd3mr5832177edd.224.1648117829965;
        Thu, 24 Mar 2022 03:30:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a4-20020a170906274400b006da9456e802sm962013ejd.102.2022.03.24.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 03:30:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Do not use mapping cache for job submissions
Date:   Thu, 24 Mar 2022 11:30:25 +0100
Message-Id: <20220324103025.2660775-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Buffer mappings used in job submissions are usually small and not
rapidly reused as opposed to framebuffers (which are usually large and
rapidly reused, for example when page-flipping between double-buffered
framebuffers). Avoid going through the mapping cache for these buffers
since the cache would also lead to leaks if nobody is ever releasing
the cache's last reference. For DRM/KMS these last references are
dropped when the framebuffers are removed and therefore no longer
needed.

While at it, also add a note about the need to explicitly remove the
final reference to the mapping in the cache.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/job.c | 4 ++--
 include/linux/host1x.h   | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 9424b3c08ab2..f81f3b9f7510 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -176,7 +176,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		map = host1x_bo_pin(dev, bo, direction, &client->cache);
+		map = host1x_bo_pin(dev, bo, direction, NULL);
 		if (IS_ERR(map)) {
 			host1x_bo_put(bo);
 			err = PTR_ERR(map);
@@ -226,7 +226,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE, &host->cache);
+		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE, NULL);
 		if (IS_ERR(map)) {
 			host1x_bo_put(g->bo);
 			err = PTR_ERR(map);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e8dc5bc41f79..46081afd0ca0 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -31,6 +31,11 @@ u64 host1x_get_dma_mask(struct host1x *host1x);
  * struct host1x_bo_cache - host1x buffer object cache
  * @mappings: list of mappings
  * @lock: synchronizes accesses to the list of mappings
+ *
+ * Note that entries are not periodically evicted from this cache and instead need to be
+ * explicitly released. This is used primarily for DRM/KMS where the cache's reference is
+ * released when the last reference to a buffer object represented by a mapping in this
+ * cache is dropped.
  */
 struct host1x_bo_cache {
 	struct list_head mappings;
-- 
2.35.1

