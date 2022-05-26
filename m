Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FADC4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 26 May 2022 11:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbiEZLo7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 May 2022 07:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347265AbiEZLoj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 May 2022 07:44:39 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA79146B3C
        for <linux-tegra@vger.kernel.org>; Thu, 26 May 2022 04:44:22 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id o9-20020a17090a0a0900b001df3fc52ea7so4199975pjo.3
        for <linux-tegra@vger.kernel.org>; Thu, 26 May 2022 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDQmr69N/dl5Dq6JBRKXlWACskRSPFONQYIFomxUe+4=;
        b=fjSvNeVTUzzKQj774ztXjpUw9ebSX9tuHPbUVSBhP2kCSmHxqdjdLVvoZi4zRsOwAo
         IuM3v4wlNfUCWAfOlajUQ3TK04x0FgViwJGJ98eo5eYpWI3wY+ughlZaZ5U/altE/sr0
         O1dEBMXcZdtXQpOV2RMwY81ZfdHLdKV+Iw6FkzSC82sNSfSULfuSOHzeLRCWs0mBVMD+
         1L2XZwGHgUzeGy4KLIKQOtggFj2X+KjfLDIAJeHaGKj7Qffz/I+/MOy4ZG7/RJn1d0+6
         556j/tr8OQqeNXwZDQr8+i3boAhpqvMSgfKmN09MBu7L/Yl6QoDPqfhEu0y686C5Hyu6
         jmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDQmr69N/dl5Dq6JBRKXlWACskRSPFONQYIFomxUe+4=;
        b=t62mmoId2ygynQCraDObdx/JBsP8Xqw1nBcQPxl6jp5KM110+t8Mj1T/i7X98urNz+
         IZOdI0f0x6TG7Pt21rFvY9/JOtsdjOxRJ90uMNmBdLbfdoNOw718+AAbf4t/bVSZVbme
         yXDRJmG09QwM2/oVGt0XlWX8rnMTXJLIu2N7Ui8i/Bifycv0oZ3zoMgIvRqWTMHF2uef
         +MQFpAQyiyY6/EExmbWExvv8SRtKeWtoMbbau9I/nmn/2NkX2wikzB3z7giPx/ZX0Fmc
         F0XBDn8ngV1hJYiQKM8kVB8nCzTvduXTCDQOcwnaigP6uwXvyue1dfIyOl3ZOQrYHWHH
         zGuA==
X-Gm-Message-State: AOAM533ey2VbMx4BP1z0C9cHNsvSF6ZPkqeoQmmIVmhvQJhGgbtq+ch3
        0WzPYU/uTZCKHX1QkVli3eqAtw==
X-Google-Smtp-Source: ABdhPJxByslYzaPrFJBCGZDzY/gRdK8UOblXVaYz51u2TNu9nIEwRROLsSZebLnfRSSRxACNF3ljLA==
X-Received: by 2002:a17:90a:ead5:b0:1df:8229:87b7 with SMTP id ev21-20020a17090aead500b001df822987b7mr2253959pjb.104.1653565462245;
        Thu, 26 May 2022 04:44:22 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id u21-20020a631415000000b003c14af50626sm1262487pgl.62.2022.05.26.04.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 04:44:21 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 18/31] media: tegra: Migrate to dev_pm_opp_set_config()
Date:   Thu, 26 May 2022 17:12:17 +0530
Message-Id: <67b10cc516558405bfff0fc7749cee9d3bf02fc0.1653564321.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1653564321.git.viresh.kumar@linaro.org>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/memory/tegra/tegra124-emc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 908f8d5392b2..d1e8f9ffef63 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1395,13 +1395,17 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
 static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 {
 	u32 hw_version = BIT(tegra_sku_info.soc_speedo_id);
-	struct opp_table *hw_opp_table;
+	struct opp_table *opp_table;
 	int err;
+	struct dev_pm_opp_config config = {
+		.supported_hw = &hw_version,
+		.supported_hw_count = 1,
+	};
 
-	hw_opp_table = dev_pm_opp_set_supported_hw(emc->dev, &hw_version, 1);
-	err = PTR_ERR_OR_ZERO(hw_opp_table);
+	opp_table = dev_pm_opp_set_config(emc->dev, &config);
+	err = PTR_ERR_OR_ZERO(opp_table);
 	if (err) {
-		dev_err(emc->dev, "failed to set OPP supported HW: %d\n", err);
+		dev_err(emc->dev, "failed to set OPP config: %d\n", err);
 		return err;
 	}
 
@@ -1430,7 +1434,7 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
 remove_table:
 	dev_pm_opp_of_remove_table(emc->dev);
 put_hw_table:
-	dev_pm_opp_put_supported_hw(hw_opp_table);
+	dev_pm_opp_clear_config(opp_table);
 
 	return err;
 }
-- 
2.31.1.272.g89b43f80a514

