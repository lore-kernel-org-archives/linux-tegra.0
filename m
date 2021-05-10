Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07617C43460
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DABEA61623
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 22:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhEJWlz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 18:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhEJWly (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 18:41:54 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C93CC061760;
        Mon, 10 May 2021 15:40:46 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c15so8232179ljr.7;
        Mon, 10 May 2021 15:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XcXraiNoRPU0G8oGIVhPyNHE4YAr90zRs8GgZNjViE0=;
        b=gYh5LkV7XvUW4kbi1nokWJ6vRz+twU2SdWZGo7mE/xltMSxuIknFbhivLHS43Ng9N3
         0EYG8iP5vnoTAwvsxfrAX6uL0VI7LEyBnNzJR9qTvg41R1bDundCitToynH0TKrXHvHt
         6jQTIaXvWkblUArZwZvNjrMqG+vV11Sw7a/CzNcbyT1aQpq4tOKSCPIniXoCLb7eLzle
         IAI4m/HpyqQc+Y4nk5/vRJhrFr1eTndlcXkYruGtMWZjDyp4dgYOvyjz06OkZr7JOoNt
         cx2CEvsVikicbkWKXlNILH+J76bPgRh6/GU4v97HDJCOr7lAP4YiEg4YiQDcyZuqLmYN
         5x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XcXraiNoRPU0G8oGIVhPyNHE4YAr90zRs8GgZNjViE0=;
        b=gswozKegZQpgzL7VshyuNkvQvRI2Au4+4DKLGACHCk78urYjC+rUpIl5Y0jvr9VqpC
         X9s9IGBPdhFguqC/6auZTlEoNwVZEYPZ2izKkTY32DjHzIhJoavPl84mmvKKg8NMvEUh
         Xk8X5uY2m7q54oBmp8JJ1y2ojGXlS9JytSNruPb9dXEELrIHiKAST7G5kVlPCWCiuJ8+
         l5eHl6Fq1ecOlSD5/d0au47GmkIE4WPZ5XsxRIXNpClliO4VLX5ESbdb6LbRCwYBeEMR
         wtqo9d044Nu7cs3cJOMy804rFpicBpvCrfbng75bKvmA0wTaunSPQnPK3/r4YkyvuD8z
         FXlg==
X-Gm-Message-State: AOAM531uIkI5U3pUqj7XwgAfjkzDjLgHGdommpC4CyOECnuYN7EWee4O
        L8R1dkOuUmdf1uywlYBdBHM=
X-Google-Smtp-Source: ABdhPJxMRnQ08rEufSrDdsfnq9h0+gYydbKITigZsxcpueb+BNjPzIPY0PgMk2gX53MXWhCZHWisQg==
X-Received: by 2002:a2e:a308:: with SMTP id l8mr21664173lje.235.1620686444867;
        Mon, 10 May 2021 15:40:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id g24sm2780698lja.63.2021.05.10.15.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:40:44 -0700 (PDT)
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
Subject: [PATCH v1 2/7] thermal: thermal_of: Stop zone device before unregistering it
Date:   Tue, 11 May 2021 01:38:11 +0300
Message-Id: <20210510223816.18565-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510223816.18565-1-digetx@gmail.com>
References: <20210510223816.18565-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Zone device is enabled after thermal_zone_of_sensor_register() completion,
but it's not disabled before senors if unregistered, leaving temperature
polling active. This results in accessing a disabled zone device and
produces a warning about this problem. Stop zone device before
unregistering it in order to fix this "use-after-free" problem.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/thermal/thermal_of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 5b76f9a1280d..6379f26a335f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -559,6 +559,9 @@ void thermal_zone_of_sensor_unregister(struct device *dev,
 	if (!tz)
 		return;
 
+	/* stop temperature polling */
+	thermal_zone_device_disable(tzd);
+
 	mutex_lock(&tzd->lock);
 	tzd->ops->get_temp = NULL;
 	tzd->ops->get_trend = NULL;
-- 
2.30.2

