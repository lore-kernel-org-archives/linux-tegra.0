Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF4EC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378627AbhKZQjL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbhKZQhL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:11 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FCBC061D66;
        Fri, 26 Nov 2021 08:19:46 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m27so25436000lfj.12;
        Fri, 26 Nov 2021 08:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
        b=BJbfUBs27vN/BXdrfZVLl+mcJlwxpt03ZG4BcmkKKYWyfYJy4vev3auqKaPv6mPLXq
         sCQksErcwYoAayxWRm2Fu8khU3NBW4ciWpcYxtaOAU1bBo2TT/sdHvtcOmqRlEpEM0Qy
         cXZnwb29eLcWAJc4cKYTreTbQ0TBZ7SSjP8Bw1fIYr2bOg86wtvJ++7OrAFCPfVNO1Lc
         GNOscG8hx+Ctx4DqIOM9dMx18cRwBS2kTsf0qAFQDs7ksTgB73o+LstacLuJI/RHCsLr
         m6TYv2sSM8TQwO1xrrIfgIlP0d1HbGQfH3+2DKxyAorsM2rpA6yYn2fovZ+lr3Um2+zC
         WznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
        b=N4ShNadMgH6PcOVezsSaSz0qYX3jx55AhQOMCXIgEQM6lRf7mw3Iog0H2b/U0Nmrtr
         G/BAB7qjPW6IskUjaz6znLoGMNCePPdXKiPkIwMcgShdn8rjzXY91je0R6PFbgEfpFaY
         HJ9x/ISQEIv3sdM1lzTO0phTB1k1n4iR9QVM9713Sqisy0MJ4RnckBfNbGAqkW6i8b0A
         YcxtUZneRUOi++JR2bTLYx/t+Nxrlrgj/FnhHW7c/3Bg93vt6OrJ6KFO6oUoWjsO5Bnb
         Q3a78P3iEBcdN2zonMUKM0bHzyxEOMNJXRTDKgldn0Tj5r+vZrtruwBkkDJyUtYTY2vM
         ki8w==
X-Gm-Message-State: AOAM532S9KdL0nnYGuykh28LajId3U51cHOKmG/TYLNvXYdqFa254ua/
        YSozY8mKeSy42Fg+6/wIZXY=
X-Google-Smtp-Source: ABdhPJxyXEvKVmf7LUHm7Bq10BUL0d0eGbpP6e98npXd/QQMkZcwI8MdZNl5vLC50uFeRYPW04jNlQ==
X-Received: by 2002:a05:6512:3da2:: with SMTP id k34mr30230293lfv.605.1637943584717;
        Fri, 26 Nov 2021 08:19:44 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:44 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/20] ASoC: tegra20-spdif: stop setting slave_id
Date:   Fri, 26 Nov 2021 19:17:53 +0300
Message-Id: <20211126161807.15776-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The DMA resource is never set up anywhere, and passing this as slave_id
has not been the proper procedure in a long time.

As a preparation for removing all slave_id references from the ALSA code,
remove this one.

According to Dmitry Osipenko, this driver has never been used and
the mechanism for configuring DMA would not work as it is implemented,
so this part will get rewritten when the driver gets put into use
again in the future.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra20_spdif.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 6f0570cde964..e45e371edc42 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -298,7 +298,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.33.1

