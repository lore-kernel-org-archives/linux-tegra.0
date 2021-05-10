Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B003FC4360C
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 904CB61601
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhEJWl4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbhEJWly (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:41:54 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A025C061761;
        Mon, 10 May 2021 15:40:47 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id y9so22762641ljn.6;
        Mon, 10 May 2021 15:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AqIoL8w6UW8nZZQW4Ci4myc0ad3mcz0KynC5WY0Sz8A=;
        b=r48gG7FTNk7nvy6c3GhS4mQRFMjpPOaxlsPn3iyHCwsrM23ZPwYyuub+aYQRMg7NTQ
         /ZfizXIgvSnbAlTCgpMQWOaIJAjJBAgFH5InHz7lyyICJ94qsywnbLinZ6zFz4yWK9vc
         piVyDQHIydAQD6ucoNZMjmxPcOuDLIH+uCjeMR3zvpv+K45+jHhqb9ie3A5ck8bBZDBO
         D+aLZUed9CGLaUomAwbedYJFBePrwylBaewSbqN4QuakSkwTHvSRn1P5bL+hosE30ore
         rwKUhaZzBaJIJBhAdZUQmI3+O4Plq4DsKyai+WOKOFXtAWnlCP+FNyqfmEMS8tj/urF3
         MLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AqIoL8w6UW8nZZQW4Ci4myc0ad3mcz0KynC5WY0Sz8A=;
        b=gFqPxPaSFeFsa2PkhVBNAIWV4lBxVmW7B/kZ1Ko86aMhPDWv6uAhm+lsQsr+EMHpiM
         gdAnZdrJ5Bg2JVPV07Z5a/owJlYi08l1nHpV4vQipVgSrsNGXgQlhi9xQv9hJTYkggZd
         rFDbkbz69oz9JXwQ1/KH5q4NOvDvFwz0QwqMu8HQ+VSKqbipibd8GyzrhcwbD/C6kbtJ
         q7s+UbS68xA90lYfjbKpA/Og5zEWNfoMdcaskTbE+KXFhQ4EXnHQEDnRRbif92aqrCjw
         wCdO5E/q9z5WTDVkaJ37tEtJlFA09b5eShKYOIMUdYsoTkCK8NyNvk+W1u0ywaCfIDED
         3LJw==
X-Gm-Message-State: AOAM532ZptKaSEjG4bARJIvr03c2MKsxx8ZRXEmPtHyWKw7xASTbHV7g
        vsSgTB8SU3OGCJo+qh/zSK4=
X-Google-Smtp-Source: ABdhPJzG8yrER2PU/3DrolB04ZZRRywNSpSErJVJnBgK9UoZ9dRINoVP4bt8DhnMH9ZVXjNER865iQ==
X-Received: by 2002:a05:651c:205e:: with SMTP id t30mr15444805ljo.388.1620686445660;
        Mon, 10 May 2021 15:40:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id g24sm2780698lja.63.2021.05.10.15.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:40:45 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/7] thermal/core: Export thermal_cooling_device_stats_update()
Date:   Tue, 11 May 2021 01:38:12 +0300
Message-Id: <20210510223816.18565-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510223816.18565-1-digetx@gmail.com>
References: <20210510223816.18565-1-digetx@gmail.com>
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

