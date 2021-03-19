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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D6FC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 07:07:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75F4A64F69
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Mar 2021 07:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbhCSHGp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Mar 2021 03:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbhCSHG3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Mar 2021 03:06:29 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DC2C06174A
        for <linux-tegra@vger.kernel.org>; Fri, 19 Mar 2021 00:06:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u9so7964765ejj.7
        for <linux-tegra@vger.kernel.org>; Fri, 19 Mar 2021 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awbkTFj7QLP6bW2rMHzN+bTcHkE9ABdCa+aqiLawiHY=;
        b=LKwNoBOYkMlvY1TPGUbSz89JSimEmpAtOpTtOQVRPAfOGDJIUyrhXmSFqBjy4sDSGH
         fo4t0BJiKCUO74klnmwuW+ynOyJI69AyuSQx/vxXxDa9SL/rec3X4dv2ZhrcVHNsuoP7
         ETMPAYYji4vxjFw7NqiA9Rpc4280xCNSxL/I5Tr/0oa/8yQq5oM/LrR72hcbLQgeb/Ag
         wlZlzHGP72d6nINStD0mrSNZPaDFLfKfYlLWC5H5D3mUwmr3D9BT3LtLobsCKwunV8N6
         TBI4s4LZqxqgwCoqWAb6juG+lic8qAa0Lb62f8rBqr38ncIMw7gDpMlIp4f+xIpU3szx
         Pi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=awbkTFj7QLP6bW2rMHzN+bTcHkE9ABdCa+aqiLawiHY=;
        b=kRJQCeDZVuNzP6lQUQ6A5Azy/QD3dI4YUT+jS8dP1cs97GWYUwFx2eH6gDo16aK/Zo
         DnXoiwtqh6VUWPi3uuaSqj/10ms6t+RQnBO+rN0Ucges3eea42uka0qZzSDA2Bspqu+T
         eQ9H4y5bI77PbSMWY5ZNeKs3ClwTwyUzojfaW1pFvSeEojtpFx94q00O9sy2TuXLZVHQ
         CZD5lNbA6cdxTTJurFUYCOAzIhAqppZAtdrT7n+O3xma0DuoCORj+9DaYSyJrUiORCj6
         vGZ9Q2HhXZ2bg4tjZ9tl3sjTtr8F5UF2XZOWzsQcF8RiHVaOg84vW5NILasgQtUS8zs7
         NDCQ==
X-Gm-Message-State: AOAM5313Aq81NlR4pNpR0UoPX2kBrv8i6f3ZEprJWLvVhuTCfC5yNiYn
        qUIApU2IF+U7/WTkZ+EEAXQ+eRf2Bus=
X-Google-Smtp-Source: ABdhPJzx1K8fVJT+02rkH4k2Hp6IPaMA7iKJMXrcVE/JSgLmXOwokj2EnLSLsTClog+LwYkltBSOHQ==
X-Received: by 2002:a17:906:3952:: with SMTP id g18mr2737443eje.104.1616137586487;
        Fri, 19 Mar 2021 00:06:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v8sm3508489edc.30.2021.03.19.00.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 00:06:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] drm/tegra: dc: Restore coupling of display controllers
Date:   Fri, 19 Mar 2021 08:06:37 +0100
Message-Id: <20210319070637.675964-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Coupling of display controllers used to rely on runtime PM to take the
companion controller out of reset. Commit fd67e9c6ed5a ("drm/tegra: Do
not implement runtime PM") accidentally broke this when runtime PM was
removed.

Restore this functionality by reusing the hierarchical host1x client
suspend/resume infrastructure that's similar to runtime PM and which
perfectly fits this use-case.

Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
Reported-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 795b4e457ab6..2585ba70b706 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2519,22 +2519,18 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 	 * POWER_CONTROL registers during CRTC enabling.
 	 */
 	if (dc->soc->coupled_pm && dc->pipe == 1) {
-		u32 flags = DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER;
-		struct device_link *link;
-		struct device *partner;
+		struct device *companion;
+		struct tegra_dc *parent;
 
-		partner = driver_find_device(dc->dev->driver, NULL, NULL,
-					     tegra_dc_match_by_pipe);
-		if (!partner)
+		companion = driver_find_device(dc->dev->driver, NULL, (const void *)0,
+					       tegra_dc_match_by_pipe);
+		if (!companion)
 			return -EPROBE_DEFER;
 
-		link = device_link_add(dc->dev, partner, flags);
-		if (!link) {
-			dev_err(dc->dev, "failed to link controllers\n");
-			return -EINVAL;
-		}
+		parent = dev_get_drvdata(companion);
+		dc->client.parent = &parent->client;
 
-		dev_dbg(dc->dev, "coupled to %s\n", dev_name(partner));
+		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
 	}
 
 	return 0;
-- 
2.30.2

