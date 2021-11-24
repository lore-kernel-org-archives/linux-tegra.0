Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F42BC4321E
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Nov 2021 22:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351533AbhKXWJv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 17:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344965AbhKXWJr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 17:09:47 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5811CC061574;
        Wed, 24 Nov 2021 14:06:37 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i63so8427458lji.3;
        Wed, 24 Nov 2021 14:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1JU496kEAul2Xrq2ly7/mGbdp4YdTxxslXy87kjnkVE=;
        b=UqwzU78ytiFl6/Y/ntkoBchG3Lc6SXt6mrHGgPBCHW5nh9kTIg+ls1wTiTKE4yID3C
         we6f23L5TPwplR8LoL/OQ9Cp5QLkkALk6tyAMys6W6VkLak7/ZwmqIqbKtayFHFkxD31
         LnTAE+RnHWBlZOGQrmklnFF1nUKQDd82jjO7PCZVmrcNOMS3Fz6Lvt3wSV0a+bSf4gOe
         VfNb0TCxamCV9LKcR2Rrf05Elmd04arCw0ITH9RiP7vPHuhjMzO4bisyW1gmlkl64Ctv
         GC8BtGu6I+eOvvfVohuGYchkVfQ5MRCz2ObBvNX7O4YGCtPv6Wug/RWU1+ySuc8hlE+c
         EWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JU496kEAul2Xrq2ly7/mGbdp4YdTxxslXy87kjnkVE=;
        b=6CQDvTixX5Ah+hxa/0FLLsK+zxmFYkEJkIQ9BDO6ac2ZMoujRnJo+fmAEJtIDLxVj+
         3m593VLGKnGuwd6KZw0uGpS8KFzruXVDOf854K1Y2oHtmJ7tG3ImJNnk1a1Nk7jwtuvu
         rdle+V5o+6I9jOwooaA8KmbNOoKQJtIUfiZksfr+an5KlQbteEBbTT0d5osrezP0TqEJ
         c2DoSVazonqau1Nc2lwlHnx/iNjC3sK+9sJFfEaDPw1a9dKdUcv/ihVXffZ66YovApKl
         557bBPh+c5sFIVEe9ZLe9BCJB/CDgtpokMqHJgRceraJbFSSXcPnh+3EzPPnpt/LPSPu
         FA7A==
X-Gm-Message-State: AOAM533J6BF1CcwWC6dtb+DxxYHboCiXioYm2AaT3V3wkJXhodyAn8HL
        A6cM/n1VYWKmW1l4tZFEDIKFd6AmP0g=
X-Google-Smtp-Source: ABdhPJyzNTbRmF53l+Iw649bJHHzEY01rJ+pkrDrJDSRRi2322Eki64x9PXyd93QePOA6hecAJIOhA==
X-Received: by 2002:a2e:9450:: with SMTP id o16mr19173212ljh.444.1637791595711;
        Wed, 24 Nov 2021 14:06:35 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:06:35 -0800 (PST)
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
Subject: [PATCH v1 06/20] ASoC: tegra20: spdif: Support device-tree
Date:   Thu, 25 Nov 2021 01:00:43 +0300
Message-Id: <20211124220057.15763-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20 S/PDIF driver was added in a pre-DT era and was never used since
that time. Revive driver by adding device-tree support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 57a6c576b91f..bd81df5378d1 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -332,10 +333,17 @@ static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 			   tegra20_spdif_runtime_resume, NULL)
 };
 
+static const struct of_device_id tegra20_spdif_of_match[] = {
+	{ .compatible = "nvidia,tegra20-spdif", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra20_spdif_of_match);
+
 static struct platform_driver tegra20_spdif_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &tegra20_spdif_pm_ops,
+		.of_match_table = tegra20_spdif_of_match,
 	},
 	.probe = tegra20_spdif_platform_probe,
 	.remove = tegra20_spdif_platform_remove,
@@ -346,4 +354,3 @@ module_platform_driver(tegra20_spdif_driver);
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 SPDIF ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.33.1

