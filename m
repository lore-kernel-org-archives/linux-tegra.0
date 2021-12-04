Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0DBC433FE
	for <linux-tegra@archiver.kernel.org>; Sat,  4 Dec 2021 15:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243062AbhLDPEU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 4 Dec 2021 10:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhLDPET (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Dec 2021 10:04:19 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F80C0613F8
        for <linux-tegra@vger.kernel.org>; Sat,  4 Dec 2021 07:00:53 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bu18so14039275lfb.0
        for <linux-tegra@vger.kernel.org>; Sat, 04 Dec 2021 07:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUZ5ExutM6B5yJccyr9Cu97p+0ks170euyuhrd2NTzw=;
        b=W8svX2uENQDjdTut7hVcpUhIPObjWmnFbmyrx4LzcWTxb25YftZgI7u0jIN2uBPu38
         tosP2XvA+yTyIv2it80vK4RdKOMLr4p+HA6mm9FcWis3pszvVJckC01KMJcgLeKZVURM
         V/7Z0hBVDZXrs3J5hIyqBX5rrjUXU71+/O5dnwIwKNbiLB2goKlU8doTZD1knynDmA5c
         xxfWpwB3qClqldJ0qFbVN1GPTbSznNaN6v2Q9NZaKWb7nY9dr7BHUgm5fRPTe6fQMcGI
         TDqo62I+igWF+lz90xW6fHrUdb6xCmNsspx4j1V3MHaAvekJmN60LWpL23vV7L7+DdaB
         +0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUZ5ExutM6B5yJccyr9Cu97p+0ks170euyuhrd2NTzw=;
        b=gKU2EDqhNDgGbUD7h2C4gMdS2a5j4/rRdWzTq0LJjSetkwT4UUnQG5CUuNoRS0xudl
         hOlIbMnjwUrC1zrylJxwBu6lV09dU2QhRtx6v8uZ5A7wYYHrC0FRzL6CeJUM4VI2usIW
         Z5Ad1y3b2R7FxpS+MppQa0NQcCUqgfSdoRVejGJaDDvzohCzFJ3+fsNvDWY8hZN3GQiD
         gT4Ji93Dn3y18wlJQwZupRXVH5FXtM/uspmX2WV1taAEtdQEk/wqs6GivwNmb3VY7lgO
         /Kxa2ArWCN4OpHwDxfL39ZNqVfDzhUEVW4nkBYGvrwbaEJef96mWuLWkxn/eI7MrRR7T
         HRfQ==
X-Gm-Message-State: AOAM531cWnuab7e3icJRObCW/eS4op6VzavzS8nBZs2NJLJyf8ka7UEj
        EraF2uVTIDHHeckV9FW04Ik=
X-Google-Smtp-Source: ABdhPJw+5g+hFIov4C8gRKVImMKTc8boF47mGlpH2lw9c+y6s5HYv4Zqfp71dCqP+PeNzWne8g9EkA==
X-Received: by 2002:a19:6752:: with SMTP id e18mr23775803lfj.195.1638630052027;
        Sat, 04 Dec 2021 07:00:52 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id t4sm859185lfe.220.2021.12.04.07.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 07:00:51 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/2] gpu: host1x: Add back arm_iommu_detach_device()
Date:   Sat,  4 Dec 2021 17:58:48 +0300
Message-Id: <20211204145849.4034-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204145849.4034-1-digetx@gmail.com>
References: <20211204145849.4034-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Host1x DMA buffer isn't mapped properly when CONFIG_ARM_DMA_USE_IOMMU=y.
The memory management code of Host1x driver has a longstanding overhaul
overdue and it's not obvious where the problem is in this case. Hence
let's add back the old workaround which we already had sometime before.
It explicitly detaches Host1x device from the offending implicit IOMMU
domain. This fixes a completely broken Host1x DMA in case of ARM32
multiplatform kernel config.

Cc: stable@vger.kernel.org
Fixes: af1cbfb9bf0f ("gpu: host1x: Support DMA mapping of buffers"
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index c42ab78327e7..f5b4dcded088 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -22,6 +22,10 @@
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 #include "bus.h"
 #include "channel.h"
 #include "debug.h"
@@ -263,6 +267,17 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
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
2.33.1

