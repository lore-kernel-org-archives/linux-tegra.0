Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD7AC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Jul 2022 12:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234295AbiGDMJH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Jul 2022 08:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbiGDMIn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Jul 2022 08:08:43 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF98C120A3
        for <linux-tegra@vger.kernel.org>; Mon,  4 Jul 2022 05:08:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id s21so4607207pjq.4
        for <linux-tegra@vger.kernel.org>; Mon, 04 Jul 2022 05:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MkV+K20z+SrLBFTmdhzZDzVO0y1dFuzDvpTTKeDqBqE=;
        b=i67LpLjm+RKEUcX9+AseN1xHAQF8gguDnDeVc16EdRZV3zXrM/xuJY3hhlgtLsx0ok
         T9jmkGkhFH/kfvg9VVtKDik3j4TEigCWm1J04DznjoQqilFMlH2CLx/D1otcfI23fNZl
         6Hb5WzKGYHFNTs56dwxX0HlcVuEjUw8o2fiMf13exT+gHNf4Pp5wbyVZV5uCkrr2RK2n
         D2S1r9SEC+mObAnXYmZsKRpZ0qUYrOCqXt2gwl0mLWfNIiJNPFRa09F8+GvDYBirW9O2
         sWJVYtrePJfMMCyUTCaaltaUK3NpNWLdEPdHNpiFXYDZk1HNFjRbabdRWkg/lbssqSnc
         0fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkV+K20z+SrLBFTmdhzZDzVO0y1dFuzDvpTTKeDqBqE=;
        b=j9SMOrl0vAJbJ/OP+48xGTwJLB1Q/K9vnIDX2CU9r7jv+W55ZL9Zh0XT1AWlJb0zON
         3ddcrfsYmWnMm4qgpoFLWJevwxny5vspPKXFP5JevCQuE6NMcZn6x8jEhtMoZ7mEgCkJ
         CcWaozLr0nmY2tWYAP//PpK+vLh8YjhYIPGo2narc9jDSs3w3RclO99XZRJTu9B26E1I
         3Eoz/Ms6gvC80Vm2X88ckDjGA36/f8VB1KN0XX2sydPHeOogqwdh2RST+dYzocaERXis
         FKyWCja68emYYMiyKSWLyOedOYft1fImdneV+m2xaTHJQ/IO22J/CkcF+Ypfk66ZzThS
         0RSQ==
X-Gm-Message-State: AJIora/x9kOxbWUX1YYdkriAoocqZ9/rgs6mOjPHcMikdaeOL44EieB0
        CV/r3RU7n+VnFNk1A/xJxBkgEA==
X-Google-Smtp-Source: AGRyM1uSBj2VWwaqLWtNB6ZoVvhK4MFRceFAZjuhKW7adcehXBDxa0PbgVVv7V2mcOW2hlDSqUbQrA==
X-Received: by 2002:a17:90b:1807:b0:1ef:8aa5:1158 with SMTP id lw7-20020a17090b180700b001ef8aa51158mr4472242pjb.163.1656936513213;
        Mon, 04 Jul 2022 05:08:33 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aba1600b001ec71be4145sm12468028pjr.2.2022.07.04.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 05:08:32 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 08/20] soc/tegra: Add comment over devm_pm_opp_set_clkname()
Date:   Mon,  4 Jul 2022 17:37:46 +0530
Message-Id: <2f93b66f785b91c720aacd3cdb152fbf1e375141.1656935522.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656935522.git.viresh.kumar@linaro.org>
References: <cover.1656935522.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Explain why special handling was required here, it isn't obvious at all.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/soc/tegra/common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 32c346b72635..9f3fdeb1a11c 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -108,6 +108,13 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
 	u32 hw_version;
 	int err;
 
+	/*
+	 * For some devices we don't have any OPP table in the DT, and in order
+	 * to use the same code path for all the devices, we create a dummy OPP
+	 * table for them via this call. The dummy OPP table is only capable of
+	 * doing clk_set_rate() on invocation of dev_pm_opp_set_rate() and
+	 * doesn't provide any other functionality.
+	 */
 	err = devm_pm_opp_set_clkname(dev, NULL);
 	if (err) {
 		dev_err(dev, "failed to set OPP clk: %d\n", err);
-- 
2.31.1.272.g89b43f80a514

