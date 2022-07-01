Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A89C43334
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Jul 2022 08:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbiGAIWp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Jul 2022 04:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiGAIV6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Jul 2022 04:21:58 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2805D70E4A
        for <linux-tegra@vger.kernel.org>; Fri,  1 Jul 2022 01:21:30 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id b2so1704771plx.7
        for <linux-tegra@vger.kernel.org>; Fri, 01 Jul 2022 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=63pbLSKne9f5UCaDcrJmMmenMVeEUp+bxWKacPvU73Q=;
        b=PRw8pWiNZY18pWGJgVJIoN7OQ1s2yw48mle6GY/4XbqXfOM8W+/dPuxPjnVsAfDGVD
         A8m3pSEoZP2W9Wg38cQ0bbaNVAzWswoC+nKCFc5XCEUUvMoqG+yW9f+wcJB9/ETVNZdE
         nKZmCNjpve7XuRAN7ahyVkdcfDMzxh43YpC8OXHMdkvtfaGo7J4qx9vShhtdTpHbehD5
         wVHcFFMn7nLHFi/wvIRCCZVlt95Rq/qbO3FoUn/v11UMiq4rPMaLoG3T6vdbH0dMdE+P
         8U33SaenNIGQFDAOssieTM5n/BXEZBYaAw6ptyOuBYLvlncREiMhWug52kkrzT9h7GP7
         raLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63pbLSKne9f5UCaDcrJmMmenMVeEUp+bxWKacPvU73Q=;
        b=klfkW4w6xWfVlyDXJe14CoNZY1CxaOlbhdrhCN/nY4lGJqCSM9/Y848Z1ylFKds3JD
         2/SwIKgaQkElQRKEqQsZHs7YZ2z3/wpnwposGQbhrOb1GKDVIB4O1Q6mYA+kf+hwMjXT
         32/WWRNk1gw3aitLibaLRyNngf34F3+c1RGF/3wZL0W11Ircb/S41WIRE4JGoTcqu7vS
         DcaFmAUGsu2MmFqCrpnGO/ZvK3eaPHtFzPjxhqLZe8/+6CB1MZQ7HkEKXBdvqhFuA4jH
         Hc6uNFDjVdzvKgKAZTkK4dD6ZV+od/Km5zfdm/gN6gTEpmMvci50WI/pxQqQPzl4Juzf
         hsvg==
X-Gm-Message-State: AJIora95yWApqdQGuQxD6EwFpgDf6wB5mODNyNvNxaq+1PQOG45bql0t
        A1ueFFIt0VfIFPdybechNyu/gQ==
X-Google-Smtp-Source: AGRyM1uxAmkNLUVQoSG5Xz0/hnQf267BwGjWNVZUTXaOfD1kC8GpNyCWX61Jw76VoQZ5wANEVlh6sw==
X-Received: by 2002:a17:902:e84a:b0:16a:5435:b5fc with SMTP id t10-20020a170902e84a00b0016a5435b5fcmr20837549plg.119.1656663689707;
        Fri, 01 Jul 2022 01:21:29 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id d59-20020a17090a6f4100b001ec7ba41fe7sm6182063pjk.48.2022.07.01.01.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:21:29 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 16/30] drm/tegra: Migrate to dev_pm_opp_set_config()
Date:   Fri,  1 Jul 2022 13:50:11 +0530
Message-Id: <b77a02f0ceaeb252f554f5378c2407c6463caad1.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/tegra/gr3d.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index a1fd3113ea96..05c45c104e13 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -389,6 +389,10 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 	struct device_link *link;
 	unsigned int i;
 	int err;
+	struct dev_pm_opp_config config = {
+		.genpd_names = opp_genpd_names,
+		.virt_devs = &opp_virt_devs,
+	};
 
 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
 					 "#power-domain-cells");
@@ -421,7 +425,7 @@ static int gr3d_init_power(struct device *dev, struct gr3d *gr3d)
 	if (dev->pm_domain)
 		return 0;
 
-	err = devm_pm_opp_attach_genpd(dev, opp_genpd_names, &opp_virt_devs);
+	err = devm_pm_opp_set_config(dev, &config);
 	if (err)
 		return err;
 
-- 
2.31.1.272.g89b43f80a514

