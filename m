Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4BDC47088
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1850600CC
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhEWX6F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbhEWX6E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:58:04 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB92C06138B;
        Sun, 23 May 2021 16:56:35 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id t17so14502723ljd.9;
        Sun, 23 May 2021 16:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AqIoL8w6UW8nZZQW4Ci4myc0ad3mcz0KynC5WY0Sz8A=;
        b=CdwiSwwGxruJPsrcExQZXd+thphvqthJtvltwu8MjAEeiP34K5ntFdrxNpRTVBEWgc
         KEC8dcdF4l3TuMG7TOMtWJV6ttPR4hD+0xBO3ER9G9dbQsqaULwlw8krwb3KRfZH3fWn
         1GkEdtTlzQAPXnntzONcv3COzlApbQ6/g9pFJ6EmhrdLPJyP9JCpD3tIAxfOzvNV+iIa
         cnPUNIhDtPgjjHni6Z9D9AZT189MU3UblxBFEYnf5ptbzuzaf3EjEym1t5x4mSu/B2AU
         nD25VhBKX2LFHtafrIKpud2oFAMtcpXMrnMFfyKgMlNBih0gMwTaNY6XIidv1WR9JuGp
         79iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AqIoL8w6UW8nZZQW4Ci4myc0ad3mcz0KynC5WY0Sz8A=;
        b=Z00MoDZFD20D2LXRhhMHeNI/yTxUcsBcLF4W/IvbC+unBANhZ/q+NCmwgBIBZ2naf1
         eJt3p8ZUm8Luq1yTxlp0ulJIh/AuryqwR/YCo4ne3zuxOrBUg3Ddfy1ULI+KoRTmBoJD
         bGmCf2eWUFZe4zmDNGOwiX2x+TpSW53zjqucenA9DAVDQh/HMKlag67PQLrEHFKjubnx
         EjbxJDLTmiBLZJVRxMq8qji6aSiSWpa2CYZYDdUNiSc7V0eFUu7HH5uqR0wvnO5xX83m
         pJX4HQXEHiBCWcLYPusOA7Y+wDNgGAxUNtPTCRqE1nlE3DJVgRKOSY6rD85H+nVSHm5p
         xmmQ==
X-Gm-Message-State: AOAM532v6x28OHgoC12eiwC7W2DTxtLBX963tbLECCnDJPjkXSI8LEIx
        l4s7H5CVIAJ80eybDDVBZaqb2onpfhI=
X-Google-Smtp-Source: ABdhPJzvXCYRUvjdpvm97UZ/DwBEkwCqXYw7tSvJBy8GMv2Qxgp2uFDwc3ZHwmcDjtAK6cKsb9hZ6g==
X-Received: by 2002:a2e:b44f:: with SMTP id o15mr15180872ljm.497.1621814193846;
        Sun, 23 May 2021 16:56:33 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id h4sm1092987lfv.247.2021.05.23.16.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:56:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/7] thermal/core: Export thermal_cooling_device_stats_update()
Date:   Mon, 24 May 2021 02:56:16 +0300
Message-Id: <20210523235620.31538-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523235620.31538-1-digetx@gmail.com>
References: <20210523235620.31538-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

NVIDIA Tegra30 thermal sensor driver has a hardware-controlled CPU cooling
feature that halves CPU frequency once a specified trip point is breached.
In order to account the hardware state transitions, which are reported by
interrupt, the sensor driver needs to report the cooling state transition
and this is done by thermal_cooling_device_stats_update(). The sensor
driver could be compiled as a loadable driver module, but this API
function isn't exported, hence export it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/thermal/thermal_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/thermal_sysfs.c b/drivers/thermal/thermal_sysfs.c
index 1c4aac8464a7..ab373280f853 100644
--- a/drivers/thermal/thermal_sysfs.c
+++ b/drivers/thermal/thermal_sysfs.c
@@ -690,6 +690,7 @@ void thermal_cooling_device_stats_update(struct thermal_cooling_device *cdev,
 unlock:
 	spin_unlock(&stats->lock);
 }
+EXPORT_SYMBOL_GPL(thermal_cooling_device_stats_update);
 
 static ssize_t total_trans_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
-- 
2.30.2

