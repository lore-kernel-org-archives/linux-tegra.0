Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0D3C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347823AbhKZQjq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239875AbhKZQhq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:37:46 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E51C061D6A;
        Fri, 26 Nov 2021 08:19:47 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id t26so25465514lfk.9;
        Fri, 26 Nov 2021 08:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mwo4lC7FD/kahBv1NqaH+i3tNvopsZJiJsXaLzIpIZs=;
        b=TCD9cLoCNbfUnZM9J4HcmwXzAfE4L8q7phnym6pZ33wnza+OUwA0voHnXlbFX8BALc
         98huQvHMfRZhR6vs0iXkCJdDzPLwc5Iu+hxNfnAJnOhuly6FVmgiTFQv0PNbYTrY2rHK
         dXyOTzj2XWTpCS6APfNz7Hm9xKXXuqF/C+ZhAAm2IgEouLO7p3q6Mlpn1p7veF13LonA
         /7ZVdUUY7c6q4wvZ6+486FTu58keZbE7EBmxdkLoAiwTtH0JeaxWgQvf0AkdolivqHRy
         bEpOVWzuuV7+krtw1TWDsd1Sze10F/d3Wbvxxvs00NCVytod7kMqi7KRBBzLhKj0lu3v
         rHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mwo4lC7FD/kahBv1NqaH+i3tNvopsZJiJsXaLzIpIZs=;
        b=m/JecNGfoKTGpp32z0lhMWrTr+BWIotFyJKIdMw28s9EzOl9aUfrHLcT14cShKGVYB
         frkxqCZBbO9pvO1OWNcwhsyvrUZ+Q6coDbmL6fRtYv5wVAukkUd2ZeL9Taxs26nqLZHy
         eUmPaokgvW0lZkBP7jTA+lHhC8priGOtLa7jarHm6tNQlAgLGFyQWeSMSoPekC+NI9oF
         pZ6Tvia9+DeIicKavxuYCXYSUu3gYJtp+XCxc5eA9LFAXG7hvpQCDLTIE8GRLc6GGPjR
         uhurnuLxwXzKooCpGO0s8u7BuOOTT79qiZ/r3jfs9g0gDbnn2vFlpfoNTGC+pp1BRmK6
         D1jg==
X-Gm-Message-State: AOAM531S6ckE+3+S+DYtmF4zpPhzrcXvfJ36EeMK3TLPCHB0AKYu12Ji
        vX/80K+21ZTxDKMO+4hxT+c=
X-Google-Smtp-Source: ABdhPJy2HOctdB6ar2RL70kTPxIThtcFWFugw3cBJPBAONKS4zeQwsXwB5N/38mWQcSQnbt2QPuv7A==
X-Received: by 2002:ac2:4e0b:: with SMTP id e11mr30573216lfr.208.1637943585591;
        Fri, 26 Nov 2021 08:19:45 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:45 -0800 (PST)
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
Subject: [PATCH v2 07/20] ASoC: tegra20: spdif: Support device-tree
Date:   Fri, 26 Nov 2021 19:17:54 +0300
Message-Id: <20211126161807.15776-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
index e45e371edc42..6650875d2555 100644
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
@@ -340,10 +341,17 @@ static const struct dev_pm_ops tegra20_spdif_pm_ops = {
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
@@ -354,4 +362,3 @@ module_platform_driver(tegra20_spdif_driver);
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 SPDIF ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.33.1

