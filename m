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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C12C433C1
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E198A61948
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhC1Xm2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 19:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbhC1XmY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 19:42:24 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0531C061756
        for <linux-tegra@vger.kernel.org>; Sun, 28 Mar 2021 16:42:23 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id q26so10911807qkm.6
        for <linux-tegra@vger.kernel.org>; Sun, 28 Mar 2021 16:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTqt/IVdoBlaweXDgOQKvMZ70/sSbJXfKH4bXe6aqUM=;
        b=gFX5ao+Q598pGd/nrbaYkgTyuyk7q5H00T/LXO/arsc0O/9mvCQEFBVYEOZ2TSBLRR
         ma4M6lU8PSt5aU5Mq0Xb0MMgMWUAIQH1fvvCBTxWsNB09yoa6vY50DZthHeFWAFmU5ua
         0inlPz5d3dOsMAC2tO/wgM8eAMU+Br4M7QaiveO0XrEw5Niow6GJehlJx030x3Z988Xw
         w9+5a2G+KVY71BU6rLIoKuaAWskeYr0RBqjYa+mV6R8Q8qtQfOiQZZJR97+mn2OEy6b2
         dufh1Mkch8gON1dnaxfhOWcdo4+/YW7JB1Bw7Vx1qnKcf95FeOTpMjbVf1EAV2ucijkB
         VU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTqt/IVdoBlaweXDgOQKvMZ70/sSbJXfKH4bXe6aqUM=;
        b=VgNjYnrWw+Zxf93XEtBW/HBwnQ3h+KCcGQOtsAkcNuQUEhEA2wLGd3m+NK4Co/op7o
         fd2RLliT5mB9b55MQ3NCirclrYAXmiG/1wEOl+rU7RBvzvEV6iK8Xbx6Lw3hsG3xiFfP
         mGeRqV/uEANdtjuHGNeqUidMQPEkDAKOIhZ0Pe3HT7//KXBEi3uvNo6N5yNBU2tb6TK0
         zo1CLdJ/rdNLTx4tQ1wQ3ve4CdTZ2UxF6RdZQllwxJn5IvVcy+v9OsT30Vc2vHOwL0Y+
         JHM+VSzNMA2g+3o59sn3XfBF1Dvrr/J/YbuiToudzrZCCFoQimCvuZ+QAFMoSWtHkT+G
         1Dsg==
X-Gm-Message-State: AOAM530r8pbtYcBwoGnmGgSWNnxc/i/dnKOFpMgHlDVvDI0StlWCJvdc
        d1XZ6lAj2/n4v/Ow7r5ocyw=
X-Google-Smtp-Source: ABdhPJz145Az4LUx7LhDMvD7ZV5b6PUHcvEPr/qXE19/8MCJO3m4SnTCjocT6soNLQfHxskoa0mKEw==
X-Received: by 2002:a37:a603:: with SMTP id p3mr22782756qke.362.1616974942840;
        Sun, 28 Mar 2021 16:42:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id o21sm9900848qtp.72.2021.03.28.16.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 16:42:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] gpu: host1x: Add back arm_iommu_detach_device()
Date:   Mon, 29 Mar 2021 02:41:41 +0300
Message-Id: <20210328234142.12920-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The case of CONFIG_ARM_DMA_USE_IOMMU=y was found to be broken for
host1x driver. Add back the workaround using arm_iommu_detach_device()
as a temporary solution.

Cc: stable@vger.kernel.org
Fixes: af1cbfb9bf0f ("gpu: host1x: Support DMA mapping of buffers"
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d0ebb70e2fdd..a2c09dca4eef 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -18,6 +18,10 @@
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 #include "bus.h"
 #include "channel.h"
 #include "debug.h"
@@ -232,6 +236,17 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
 	int err;
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+	if (host->dev->archdata.mapping) {
+		struct dma_iommu_mapping *mapping =
+				to_dma_iommu_mapping(host->dev);
+		arm_iommu_detach_device(host->dev);
+		arm_iommu_release_mapping(mapping);
+
+		domain = iommu_get_domain_for_dev(host->dev);
+	}
+#endif
+
 	/*
 	 * We may not always want to enable IOMMU support (for example if the
 	 * host1x firewall is already enabled and we don't support addressing
-- 
2.30.2

