Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62B8C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352229AbhKXWKL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344749AbhKXWJq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:46 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7B6C061574;
        Wed, 24 Nov 2021 14:06:36 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id k2so8426670lji.4;
        Wed, 24 Nov 2021 14:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GOTn7eXs/dAu+lzrstonS6bV/obhXYqPBxpagkI+NbQ=;
        b=BNzkIwDk3BqFtBCJnlx+pZQmG/hQM1mUvfdYmbK/URC1F7GJOyjCp6Dqw6Y6iSof3C
         AG6tZ/JnxcJIZp6CdFsRG30x78DWDWb+/ORdS5UeGUa9Q6EDRlcmDHjXKzDL5imjfzOz
         mHcg2mQyhXw0jwBL2Q81ZRQqvhvK74gMqRSUvJwAaiprZG7XzxytciuM4wHuDny9H2OW
         rEU1VKKCPULetRjUQHwAW9v+0p1yrCfyfYGZW9DrPxAnr/r75XAB1B3KjR7ayez0Js0Z
         5vR6nGFjosAxh4Xd7C6uZe1wY5X1BUUYZQlPCV7IoXZs8NJ7sAEhxjT/Ky10YifQqYCP
         cp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GOTn7eXs/dAu+lzrstonS6bV/obhXYqPBxpagkI+NbQ=;
        b=HkQucvbb8zIWo98xVeF8xwEtyfHoRGIvk1j8DIQGGcDOkYDKIjyrlq56mUd9s+GFP/
         A37BrZcSxGWyFDYUEETDbYdwxk+2D3NU6pIIJmGIkHeDtGB2+v9YMTYxnozJBaQFfJKL
         SyYDfT0aRkQQzuuXibesWa2vE4fPNeX+wx9xJwXDsMbDhrnDAutJ08fa0VRIGw24F5M9
         Y8BiT/xs4vAqgeFS6wLRWmjyXMoVWMqZ53qB1Ui9uJfwRAzQdt0dR4XWoFvtL8l73q/x
         NYvTOj1n3aoBQc5Qa4O8AYdCMcngMawBiQ8+gQ25I+Xmi2E/+IaaepSGuMQbAr5o5/+3
         VPlw==
X-Gm-Message-State: AOAM530X+GVz6tkjvsWhdHvCkdDybR713/LH+bw+zvQ2ClcMqcmTPaZ0
        +VGZRDJGKaAApmMIPMHP83E=
X-Google-Smtp-Source: ABdhPJyy8BytKEHwI+l4vFi0hWhPaJ69lP21xhKGo+0hoS+udh1c27JbDvdGiJMcQHn8m0xcPOexFA==
X-Received: by 2002:a2e:b711:: with SMTP id j17mr20929790ljo.39.1637791594526;
        Wed, 24 Nov 2021 14:06:34 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:34 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 05/20] ASoC: tegra20-spdif: stop setting slave_id
Date:   Thu, 25 Nov 2021 01:00:42 +0300
Message-Id: <20211124220057.15763-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
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
index 7751575cd6d6..57a6c576b91f 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -290,7 +290,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.33.1

