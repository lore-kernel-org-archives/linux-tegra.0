Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02279C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 09:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D908F61157
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 09:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbhI0Jis (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Sep 2021 05:38:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233587AbhI0Jiq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 05:38:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01D8460F70;
        Mon, 27 Sep 2021 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632735429;
        bh=Zc+cRcPoCslqC2hryc2DSKxFbJzV6gD9X3WZFDKlLi4=;
        h=From:To:Cc:Subject:Date:From;
        b=SH876qjZtMQ46iEO1vY1tzTwXYROEpuqYTuZ53cWe80jEfWemAPB1uNXJJwF0IS1G
         GQQyAAjlHnJh3pVJ3UOPtJZet3G2Bh2v8LSbJYXS/xEAL+JbNThSzR8nX6iVqX9ZI8
         klsLSUZeK9JA7DBGSu1y4FtuVcIe4xZ4napE/xvBmBKJdcU4GDEszlA1G7UbMNjHCC
         R/Seb8lROXKu7wmSAUW9XfIDCSIa1fkRsEluwHpyqnWHWmW1KnhgF4WRB0zGlzjo0E
         Eg7W4Lu/bdwESjC9aM4g4kIXqLCN/omnofoJD6u5ZrXbgPIO+fpriuh5mxfnbmBo0T
         bkmHXS6szV/+Q==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: host1x: select CONFIG_DMA_SHARED_BUFFER
Date:   Mon, 27 Sep 2021 11:36:59 +0200
Message-Id: <20210927093705.458573-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Linking fails when dma-buf is disabled:

ld.lld: error: undefined symbol: dma_fence_release
>>> referenced by fence.c
>>>               gpu/host1x/fence.o:(host1x_syncpt_fence_enable_signaling) in archive drivers/built-in.a
>>> referenced by fence.c
>>>               gpu/host1x/fence.o:(host1x_fence_signal) in archive drivers/built-in.a
>>> referenced by fence.c
>>>               gpu/host1x/fence.o:(do_fence_timeout) in archive drivers/built-in.a

Fixes: 687db2207b1b ("gpu: host1x: Add DMA fence implementation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/host1x/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 6dab94adf25e..6815b4db17c1 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -2,6 +2,7 @@
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
 	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	select DMA_SHARED_BUFFER
 	select IOMMU_IOVA
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
-- 
2.29.2

