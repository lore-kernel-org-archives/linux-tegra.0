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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9F3C433E0
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1251A61954
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhC1Xm2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 19:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhC1XmZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 19:42:25 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBA3C061756
        for <linux-tegra@vger.kernel.org>; Sun, 28 Mar 2021 16:42:25 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id q26so10911892qkm.6
        for <linux-tegra@vger.kernel.org>; Sun, 28 Mar 2021 16:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=itHFjcc0HHEjD8/QZKzRDfHBiqClATPJH3jmZ+mXHJM=;
        b=ac9dj5yz+kBU4bumk7JSHyDbyFWc1Xio4+cyGoxIJbl1s0LSPZKH0VCu4P+5eNuDQO
         J74cEydJQ25uusun2CVrtYdFoFevNHv9zQLBFJevcAJCFf3Eicw+ZiSi+p4yBuKnwZTB
         ubG14+fdD9TJxkqOUdRpY16/aWEJ2x9PJidqK5LaU+cZPZyMk0wlBKNTDx2t/KrN52am
         qz41pfF9WwJnYO9BJ7ft37ANQWEV/B/dgO05bIKkKmzcv9xhFZBEOXHZGtpdkmMa1V5L
         YYsiK3i2ujk9QkCsJ8Ggf1mhRmB0O2Vj1Lo0X8ZIcqybIKaPxSBQ88AjM18tAAcih3i3
         Et2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=itHFjcc0HHEjD8/QZKzRDfHBiqClATPJH3jmZ+mXHJM=;
        b=Ad8oQmomOj2nTeDQU6P0X5rUU+uqMqFOdnW0ew58QZVhXD2P+df66/GXO9sXkWeygG
         RBkW2eTqWG2NFn6Fnh0y63nOEG4XkPCJrrrs0XPFaYC9VOcp3upYbknnDxpxU2cVrZwe
         4ZuEkXd8mShrpO/GuqCgSubVmgDh9/nwnlnvUH1Jr32qUPjlNIYEDZVLoR5rWi7D9Vsv
         N7mVLwtor4skRrK8ba5bm8d74G+XBXIsCSNOK3JmjTv5/IjyzqL7UrIiLBkUtJ45s/I1
         BcY+zj5xBnCh1qM+wsfFMaVz/GMWpx2VoQ8poKsfATV/+b+VlBtDLbQLLOqZ+ZA8eofP
         VjYg==
X-Gm-Message-State: AOAM533P7OWYG+lXLIjBtHirUeN45hhiWQFpIaHUmsbCFt8KHs0k/gHB
        96+W3FKUrcKfez/G8HKje5E=
X-Google-Smtp-Source: ABdhPJwLsk109xh3k2+bEHIFVVVmGTt8cVxrc1Ya6c7QuIjX0xtLX/fraJUxT4QTcUiJ7QZBMRK6Ng==
X-Received: by 2002:a05:620a:14ac:: with SMTP id x12mr22843641qkj.409.1616974944529;
        Sun, 28 Mar 2021 16:42:24 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id o21sm9900848qtp.72.2021.03.28.16.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 16:42:24 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/2] drm/tegra: Add back arm_iommu_detach_device()
Date:   Mon, 29 Mar 2021 02:41:42 +0300
Message-Id: <20210328234142.12920-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210328234142.12920-1-digetx@gmail.com>
References: <20210328234142.12920-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The case of CONFIG_ARM_DMA_USE_IOMMU=y was found to be broken for
DRM driver. Add back the workaround using arm_iommu_detach_device()
as a temporary solution.

Cc: stable@vger.kernel.org
Fixes: fa6661b7aa0b ("drm/tegra: Optionally attach clients to the IOMMU")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 90709c38c993..a949cb678e08 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,6 +20,10 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#endif
+
 #include "drm.h"
 #include "gem.h"
 
@@ -909,6 +913,17 @@ int host1x_client_iommu_attach(struct host1x_client *client)
 	struct iommu_group *group = NULL;
 	int err;
 
+#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
+	if (client->dev->archdata.mapping) {
+		struct dma_iommu_mapping *mapping =
+				to_dma_iommu_mapping(client->dev);
+		arm_iommu_detach_device(client->dev);
+		arm_iommu_release_mapping(mapping);
+
+		domain = iommu_get_domain_for_dev(client->dev);
+	}
+#endif
+
 	/*
 	 * If the host1x client is already attached to an IOMMU domain that is
 	 * not the shared IOMMU domain, don't try to attach it to a different
-- 
2.30.2

