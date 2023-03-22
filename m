Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBD7C6FD1F
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 10:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjCVKjY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 06:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjCVKjX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 06:39:23 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D98126B2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 03:39:19 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id i9so16482280wrp.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679481558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XjCFWIdk/OBBpQo2sqZH+I80w/slGKfrFxaeLpLREk=;
        b=bmH6vs1mHvltqpdQtblKP3eHF3VVXfpgB2k65mnpbHvo7KuztPsa2hpE9zhCy9TIPL
         HGmU0Ah4in5Jx1xNb86e32yCJJ/+E3e8oANuVOvEZ4gOWkV4rbQ54s4qDQuAVcjm2Ruf
         hC7gUdwE8ooBwWFiwPhTOZPl8zxTTMqQwhWtRmKQ3ETeT6mqqbxlI1SF4qD8mzf1LBQZ
         WmQU98JmTwbsGbgrEcIDL4LrVzoJhOEC1BKGglroj3HFuo0i8cG/UqQYkvlHT2hucFvX
         ufv1jOsu100J10Upr6kKU4ADoOVpoYlSmmwhPV1S+vc5BqoQv/4LJ7/90OC+zSB47v14
         XYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679481558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XjCFWIdk/OBBpQo2sqZH+I80w/slGKfrFxaeLpLREk=;
        b=ODPFtJQ47aCE3FDu3u9mMBFF54OhINQqFQPocLLB6ty4mfaYwUuHFpzpb2MyRWU+YM
         yeT908ZJLpbcLqkTSnAfkVaMcN8RnLh7X8w1SSAGPQCQfX+Zp6St5hioRi0Sohym+Q0X
         /4e/3YedLKN1SpDBnd5KKEVZ5Ryj2EWzEP3nJ9zVcDkLPhWmmV9KkSI4reI5Lb7rDpsT
         ZoXv1yIWq2GQtu7RzzlyYdrVUswa506/1YvYHM/Y2PMShD7W3JYq8gy5h+OWk1ho4uU0
         KDKf/tktu+xdSiOeqGL7+n148HO+6fzxIA1tQP/dbjyn4Uiqd8taJlkqC2we8LEN3EmO
         vpGA==
X-Gm-Message-State: AO0yUKUYQBO55kXijv2n0NHx1pwsbiVVO/nhwSUEr73kufRCni0xN8ff
        NY1SH3niEgCH/uQVY0mi77pw/j4CjDE=
X-Google-Smtp-Source: AK7set//7k+L5Zef0BTWxoz1woyjauoL5xE7hwYCrLZYFH/PgOU0aRx6WwyZhXLrtrob9cU82bLNGw==
X-Received: by 2002:adf:ef8c:0:b0:2cf:ef5d:4ee7 with SMTP id d12-20020adfef8c000000b002cfef5d4ee7mr4316704wro.69.1679481557874;
        Wed, 22 Mar 2023 03:39:17 -0700 (PDT)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
        by smtp.gmail.com with ESMTPSA id s20-20020a7bc394000000b003ee3e075d1csm4084694wmj.22.2023.03.22.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:39:17 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: allow compile test on !ARM v2
Date:   Wed, 22 Mar 2023 11:39:15 +0100
Message-Id: <20230322103915.376533-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This compile tests on x86 just perfectly fine.

v2: fix missing include complained by kernel test robot

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/Kconfig | 2 +-
 drivers/gpu/drm/tegra/gem.c   | 1 +
 drivers/gpu/host1x/Kconfig    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

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
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index bce991a2ccc0..dea38892d6e6 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -13,6 +13,7 @@
 #include <linux/dma-buf.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
+#include <linux/vmalloc.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
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

