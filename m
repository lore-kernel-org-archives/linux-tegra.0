Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0353C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 20:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D571660FC3
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Oct 2021 20:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhJ2VCR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Oct 2021 17:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhJ2VCQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Oct 2021 17:02:16 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E8AC061570;
        Fri, 29 Oct 2021 13:59:47 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id v2so7144526qve.11;
        Fri, 29 Oct 2021 13:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rMovTAACX/ihZSRmJebH+vpaOvc+wT7zbFs8vRQjPV8=;
        b=Bwj8E0U675vmlz0O0eIc2ZRMCegee94PEa8+0YjSMHl25Pc0AzxfLREIjz4m10UYtZ
         Q1AytQblWAFzuXUMJ6L3F/qO3jPPZdWQ6aWSPbuHIcwy7J2cxbu25f8WcFCveQqvcZeK
         QwcjRd1ArYLryEh0VjH1XNH37FRQ1oE6zJXDpqteNccfN3Tl0OzAbiLecMFthZj7YD7b
         Cj+TrEuVOl1wlNVmnNnPBbhW6ldBKQLOKwM+bPhl3qrTodWw8ESJ+Kw/PiOVKhXxGaD2
         l8goJbRmuLcJFR4khTmC6x1ZTsENUkKHes3XqKJUy7dEXwae8q0nZHX6x3YRFLhG/2Pb
         S9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rMovTAACX/ihZSRmJebH+vpaOvc+wT7zbFs8vRQjPV8=;
        b=kqacQo3EZtHuZOEm2JHPvvFdWPrLrWhNQi5bbLi7/ShsKUZrOwh896o40zzbtr+TZb
         vAWztu5Rj+5qVp7/lqtYwhoHrEXrAkfVctk+k7mCJ5VADuTE9JRF2s2mN+hClrxk1TeH
         AFpISXrr2jwxtWSe8mQp4//2wDqbJ+JkkTJvgrv0kEKIdaHqU+7ESU4da6zforviD/IR
         if2eJg/rr043tpze9rAi8zyKVGAWPBEH3A/DRlQ9J5VAvasdbn2hUXnLMaPbUh3d+vqQ
         tOrVl82rOpHwoNTL/BMRRV96BNFiNYTdYj/F7buoe6Sdx8K3D6uzfCO0q0uaX5pOKRR6
         e/Aw==
X-Gm-Message-State: AOAM531LCDqCwihqyGc9PekhZVMwra/kKxpNFVWJvbIpCJNIUNrzWqxD
        ZjyCE8Dhnt/bJJS50+r+d58=
X-Google-Smtp-Source: ABdhPJyiK1bvMjkAuvYMYK0dZaU/mhiZPqYW93piKE1DNdpjqWQoLiCwUpBLBms5fHPuha+IlCzPgw==
X-Received: by 2002:a05:6214:2606:: with SMTP id gu6mr10137986qvb.30.1635541186845;
        Fri, 29 Oct 2021 13:59:46 -0700 (PDT)
Received: from ubuntu-mate-laptop.eecs.ucf.edu ([132.170.15.255])
        by smtp.gmail.com with ESMTPSA id v17sm4780471qkl.123.2021.10.29.13.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 13:59:46 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        arnd@arndb.de, ulf.hansson@linaro.org
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        fazilyildiran@gmail.com
Subject: [PATCH] soc/tegra: fix unmet dependency on DMADEVICES for TEGRA20_APB_DMA
Date:   Fri, 29 Oct 2021 16:59:45 -0400
Message-Id: <20211029205945.11363-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When SOC_TEGRA_FUSE is selected, and DMADEVICES
is not selected, Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for TEGRA20_APB_DMA
  Depends on [n]: DMADEVICES [=n] && (ARCH_TEGRA [=y] || COMPILE_TEST [=y])
  Selected by [y]:
  - SOC_TEGRA_FUSE [=y] && ARCH_TEGRA [=y] && ARCH_TEGRA_2x_SOC [=y]

This is because SOC_TEGRA_FUSE selects TEGRA20_APB_DMA
without selecting or depending on DMADEVICES, despite
TEGRA20_APB_DMA depending on SOC_TEGRA_FUSE.

This unmet dependency bug was found by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/soc/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 8b53ed1cc67e..ee7f631933c2 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -136,7 +136,7 @@ config SOC_TEGRA_FUSE
 	def_bool y
 	depends on ARCH_TEGRA
 	select SOC_BUS
-	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
+	select TEGRA20_APB_DMA if DMADEVICES && ARCH_TEGRA_2x_SOC
 
 config SOC_TEGRA_FLOWCTRL
 	bool
-- 
2.30.2

