Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16124C41535
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Oct 2022 09:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbiJCJ3K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Oct 2022 05:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiJCJ2A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Oct 2022 05:28:00 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7B638687
        for <linux-tegra@vger.kernel.org>; Mon,  3 Oct 2022 02:27:01 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u10so15656096wrq.2
        for <linux-tegra@vger.kernel.org>; Mon, 03 Oct 2022 02:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=mFSgZTaipm7xmr3EZbI2P6hL0ODEi0vI0xyRaY7cB2lrRd25caRnXRiETYkIwyUlhA
         tzNRCBenT9eVVAaNY+k1ZQoyhFKKYiANfmYgpl+eJqoAbwu+gqNQ81lNvEOmSDnoISg3
         6QHsvqLHULU4cB5seIQZa0iMVKxLt7YzULq4oq+TzolVy1hiThmLmL1sKDE0tmn1GiV8
         kYcxBewGbGKYMC5/6v51E/zXc2L4MXcaZFq6bvcJGMowjQVc28Cg0u7bs5jODtykh7Xc
         hk1Lr7MSY/er1RxcnJIVZfYfktCqmvFK1WuDnMeeNlj4eibLJWrePDEycuq9WyPQm+d9
         mELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YzUTWEHUQYeukAyJEfTuM3PzyJlxwwnF0DoykmVbPWw=;
        b=Pdf1eB/Om3h2s0HvrJvIgtaZdO7HHadr34qf4lIOd2T+agwSIoez67yLZqBQiNyr/4
         XIfLNpAm2xEoyTpqmZ0Tk3XyEsC8hUDGsEk+Uk7N+VAmT2XcjAUdWV9FL8g0YNkLDZ1e
         UaCsctlNQmkoU6fkvsLY5xxGxxrxex1gWwchf9LhyL/CMbNXp6iCTXqJHJQqAZWmIQrl
         jRxx0zUn3uAtl0pmKV/mwd9NFDAeax5+IXSoNd2E90xKpA1OqUkm9bJ7cx6eC3ppz0/1
         EbKa55Yxyifg4CzMC8L+IiI8DaS4m0EQKvu8BiKoS1OUTMdObvF5o1uWyrNoNZjxJePZ
         yzQQ==
X-Gm-Message-State: ACrzQf0NhEyDeSk1BUrbH+V+kqiBKZWSVBYhpwde7KtN7FOH0LxIbQ2D
        aoedd6sQx+f705sMN/CIiu1uiw==
X-Google-Smtp-Source: AMsMyM6QQOOVAFyLI6odJXRKjJ5dFCdMEwfTWc5YaKDr3/nRVGjaYYAU1boZOw4Lonx+2y1NEXgHxQ==
X-Received: by 2002:a05:6000:1c5:b0:22e:3c0b:5c8 with SMTP id t5-20020a05600001c500b0022e3c0b05c8mr2819474wrx.622.1664789200187;
        Mon, 03 Oct 2022 02:26:40 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:f3a:9f5e:1605:a75a])
        by smtp.gmail.com with ESMTPSA id ay3-20020a5d6f03000000b0022cc157bf26sm9707520wrb.85.2022.10.03.02.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 02:26:39 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v8 08/29] thermal/drivers/exynos: of_thermal_get_ntrips()
Date:   Mon,  3 Oct 2022 11:25:41 +0200
Message-Id: <20221003092602.1323944-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003092602.1323944-1-daniel.lezcano@linaro.org>
References: <20221003092602.1323944-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The thermal core framework allows to get the number of thermal trips,
use it instead of visiting the thermal core structure internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 0e33d32a9d2e..91e6860b5ec4 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -260,6 +260,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tzd = data->tzd;
+	int num_trips = thermal_zone_get_num_trips(tzd);
 	unsigned int status;
 	int ret = 0, temp;
 
@@ -271,12 +272,12 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		goto out;
 	}
 
-	if (of_thermal_get_ntrips(tzd) > data->ntrip) {
+	if (num_trips > data->ntrip) {
 		dev_info(&pdev->dev,
 			 "More trip points than supported by this TMU.\n");
 		dev_info(&pdev->dev,
 			 "%d trip points should be configured in polling mode.\n",
-			 (of_thermal_get_ntrips(tzd) - data->ntrip));
+			 num_trips - data->ntrip);
 	}
 
 	mutex_lock(&data->lock);
@@ -289,7 +290,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		ret = -EBUSY;
 	} else {
 		int i, ntrips =
-			min_t(int, of_thermal_get_ntrips(tzd), data->ntrip);
+			min_t(int, num_trips, data->ntrip);
 
 		data->tmu_initialize(pdev);
 
-- 
2.34.1

