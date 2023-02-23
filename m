Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5DCC61DA4
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Feb 2023 10:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbjBWKZ4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Feb 2023 05:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbjBWKZz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Feb 2023 05:25:55 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE9B38658
        for <linux-tegra@vger.kernel.org>; Thu, 23 Feb 2023 02:25:47 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id p8so10395435wrt.12
        for <linux-tegra@vger.kernel.org>; Thu, 23 Feb 2023 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlrKU6rn07geT4orfWdVqlLTnDffT91o3x/NRA6aKEA=;
        b=ByQJyJs8NczwjE/yY/NA9y1uXSGpcEPVKNokS160EGUbfwzrIjhl5B5v5mYUSxFqnG
         UysHc0IQB7jVmMtXYRm+EuKvRAdknWVv0A6GtisNh4r6uUOQMc2LBJoBo4A0hG0nnkBc
         zs4paSHXd2t8FIVo3kqolR4pSC3+GkQKt0QoxyUAFQTwF6ktzZH+B3lfqfq0WHZRNzoR
         YT7kOkn4Hzge2YH3/2IaAzi9ROOKtZFnKId2xdLnxYHA15rCX0kXJ9cUhZu+icJSREl5
         Q2E4snZdYYQ5bGwNqDx1JyxoS1ee7akiqX8OXltBO2gj6/lcphyf1I+bCOSVja9+iPWh
         GkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlrKU6rn07geT4orfWdVqlLTnDffT91o3x/NRA6aKEA=;
        b=KVCdVBPrxmlDvLVbpo/vHqhXuaQmueLw8IbzQI81g90mKHOf5wRvErW3EcjbnMCaNd
         v1kCxDfeaIfN79v/iRD41WAgQJptAXqvYkOH5DRrdUJ92L6BXsilgmng1AE8wxQXBrdh
         Azx+5U59HXg8zyy9CtZzXhF+YZVUczLCyekiu72fY05tharbYu0/KaWtrAmP2eP19hAN
         glo8cbpFijQ/Rdq3T+tMNtYo/hfaWT+uNuBnndD1/soYUDI5TQd9/GoNzXxbNP4dk6PY
         qvTIGDZyk7EgNeYLUlQSZ27RoH9v00P6LHqp+xB/OJLjiYHNWoqdrzA6KCrjFgFyMrXm
         u9QA==
X-Gm-Message-State: AO0yUKWSXd9oQRRVa8w57wFGu6sJXCHY5OXKA6/oyOkLlKoMpCJP6FU/
        sCXUHwleZ7RGvpYMZg3YdFA=
X-Google-Smtp-Source: AK7set8wURpVNospRGnv72m7acakiRiTSkcZT/wwW4hnsX/wTq0LxxVtdG7J9FkZ3eDKnwloASoNig==
X-Received: by 2002:a05:6000:1045:b0:2c5:56ff:4321 with SMTP id c5-20020a056000104500b002c556ff4321mr10525401wrx.4.1677147945736;
        Thu, 23 Feb 2023 02:25:45 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b002c3e3ee7d1asm364276wru.79.2023.02.23.02.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 02:25:45 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: allow compile test on !ARM
Date:   Thu, 23 Feb 2023 11:25:43 +0100
Message-Id: <20230223102543.883907-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This compile tests on x86 just perfectly fine.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/Kconfig | 2 +-
 drivers/gpu/host1x/Kconfig    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index c36323f1c7e6..56453ca277c2 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_TEGRA
 	tristate "NVIDIA Tegra DRM"
-	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on DRM
 	depends on OF
diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 1861a8180d3f..e6c78ae2003a 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -5,7 +5,7 @@ config TEGRA_HOST1X_CONTEXT_BUS
 
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
-	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on ARCH_TEGRA || COMPILE_TEST
 	select DMA_SHARED_BUFFER
 	select TEGRA_HOST1X_CONTEXT_BUS
 	select IOMMU_IOVA
-- 
2.34.1

