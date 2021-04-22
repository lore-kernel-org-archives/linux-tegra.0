Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9AAC433B4
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 11:35:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 542616145C
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 11:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbhDVLfp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Apr 2021 07:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbhDVLfp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Apr 2021 07:35:45 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9A7C06138C
        for <linux-tegra@vger.kernel.org>; Thu, 22 Apr 2021 04:35:09 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m9so31710027wrx.3
        for <linux-tegra@vger.kernel.org>; Thu, 22 Apr 2021 04:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nesQIfMK+IRA17P6tXXIkpXFOP6516pK+CAAmZXiyyQ=;
        b=RhrVbOBr+ZTTZC+LRLoruKwjZQua0h/acVoW8lowAFUm8W5rEJoG/dfoHoWhb7uDtI
         AcqAzJyW9K4jtEvSpb3omnXZyrhFCUf0bDScialHScz3A3olefuHdblE81bLIvnyldiz
         ZLsNSuu1vXzo4Y5VPGI5dLRWEnBhbWU4B40epR0mdVf2/wMmnZBGy5bVqnMw0oaJatxN
         PF06h6EvcN/FQA7QtA42pX5cYZQLY5OHANW97/uTQs3ssu8td7zj/4Vf/HIrbZyVQ0OW
         lWazLWPKaLfZaV6hOGlTKpv/hz6vFFqH9wpSXd878rubD0Kbeykkq2uvCtQkVElEF1Ny
         /ZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nesQIfMK+IRA17P6tXXIkpXFOP6516pK+CAAmZXiyyQ=;
        b=XQ+BQmPLIEwgSggfXlZw+D4pXO4yjEneS4OfC+7yaUosLcmKfJw5Gt2NBdDkMDhO8s
         XNOdXzDOyVts4+lEFP+McYaENM2B1tpEG3Baq53by/umLIUqREmQ3h4qLRdIkiBeXRNX
         Ic8292YDj77lhr4aeFP0vD7OQH9wi4xh7kh9Ats+/hPtyooyjN9cgslKJhBFrbYPbs0H
         nmj6r2H0kZW7jllJH4Gz96IJv7iFZpI67BsLrt2Am6gaxg/9lLUZkiRD7Vo3ks1hWCfv
         W3dlQIz5JEczEJllpJnC5oJGllVSXRZ9XhnA5fLLs/cIY8kklKVSDwthfN92u2/8OIgX
         Sy0g==
X-Gm-Message-State: AOAM532lBcJC2RDYvmTkxTc0J7CDWVDp5218auyCxC1bI8SdJA0mfCXm
        JzJTBdm1NldA8s0Etsp8rQIjFQ==
X-Google-Smtp-Source: ABdhPJz/kbxkcLITLyWEZrr8GDI8FPMwCbwPkj6TzcuC+3PHfDz7qgMR6PolesBs2ZD1ZRV/pWxlSw==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr3657463wrp.115.1619091308380;
        Thu, 22 Apr 2021 04:35:08 -0700 (PDT)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:e88d:2580:c20:b786])
        by smtp.gmail.com with ESMTPSA id u6sm3237890wml.23.2021.04.22.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 04:35:07 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org
Cc:     Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amitk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dingsenjie <dingsenjie@yulong.com>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        linux-pm@vger.kernel.org (open list:THERMAL),
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] thermal/drivers/tegra: Remove a pointless call get_thermal_instance()
Date:   Thu, 22 Apr 2021 13:34:55 +0200
Message-Id: <20210422113457.51578-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver is calling get_thermal_instance() but the lookup can happen
directly. Remove the call to get_thermal_instance().

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/tegra/soctherm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 8e303e9d1dc0..355fdf32cbc1 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -621,9 +621,8 @@ static int tegra_thermctl_set_trip_temp(void *data, int trip, int temp)
 				continue;
 
 			cdev = ts->throt_cfgs[i].cdev;
-			if (get_thermal_instance(tz, cdev, trip))
-				stc = find_throttle_cfg_by_name(ts, cdev->type);
-			else
+			stc = find_throttle_cfg_by_name(ts, cdev->type);
+			if (!stc)
 				continue;
 
 			return throttrip_program(dev, sg, stc, temp);
@@ -806,9 +805,8 @@ static int tegra_soctherm_set_hwtrips(struct device *dev,
 			continue;
 
 		cdev = ts->throt_cfgs[i].cdev;
-		if (get_thermal_instance(tz, cdev, trip))
-			stc = find_throttle_cfg_by_name(ts, cdev->type);
-		else
+		stc = find_throttle_cfg_by_name(ts, cdev->type);
+		if (!stc)
 			continue;
 
 		ret = throttrip_program(dev, sg, stc, temperature);
-- 
2.25.1

