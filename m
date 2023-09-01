Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B960CA0FFA
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Sep 2023 23:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351276AbjIAXoC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Sep 2023 19:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351302AbjIAXn6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Sep 2023 19:43:58 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F90170B
        for <linux-tegra@vger.kernel.org>; Fri,  1 Sep 2023 16:43:19 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68bedc0c268so2192316b3a.0
        for <linux-tegra@vger.kernel.org>; Fri, 01 Sep 2023 16:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693611761; x=1694216561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQWyzi0Qz9s7AgC5vmSBsF4S5izX7bpWF4dQoTwwlFk=;
        b=jhUQa6qXTunywrIOeBZdxAC0cZcKoiae62syhjWvn2iIBqYXWYMtrPCoHaxnZuRClA
         zc1aeCY9/w3g+jG9YcaRJ8LBOIE29AIrQqzq7yMDRQOwbvxy+TClLjkC7V0PmbL6/kFY
         7XhjT1BndeQjl5wx4XxG7YQ35+SubywsTRd8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611761; x=1694216561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQWyzi0Qz9s7AgC5vmSBsF4S5izX7bpWF4dQoTwwlFk=;
        b=lnD5tG3aGxSn/SMoZALifzF6CA9SgD3qVb5VOPTkInWbQ/0DQQJR8LFvNrbsEjRHVo
         5LsSqK/BlTo3giSUUHNRA/sBjDcc2IdKWm9PIZmfcYes+jFOts+26+Q7oKSf0rN1PGpp
         8IywksfzO8cVHsD0aRznmm2q3vy3JqHrpRmyYees+KMTPLLsvaV2ojM5j6pVQ+2MQHdv
         SraPr0H/pVfQq/Tcbe+sHexSnJ2EA4MsDIGRq9buwoOFf4UjD9VyVhwAdOUxnlThM93B
         pv6UU7tAz0oF33/Saj35/Fw7/ZjsDldk4lhJkasv1tptknrBANI5/u/KZcanXQSu4Fns
         yCdw==
X-Gm-Message-State: AOJu0YyZa6H2qvDzNQoTpfcFt9MY1Qb4oBus+dgw4jxL97BoGQ7/C+Iy
        aIrz1+27qqIvAn6sPTxsP1z/5Q==
X-Google-Smtp-Source: AGHT+IF5BMwzbAVcMICDe8gM+PDdxCL3nr7AkrZf9oUjU4217SZ+nxlT0MJiiAfrSttf6dGmLwxm3Q==
X-Received: by 2002:a05:6a20:9144:b0:135:110c:c6de with SMTP id x4-20020a056a20914400b00135110cc6demr5402182pzc.6.1693611761326;
        Fri, 01 Sep 2023 16:42:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
        by smtp.gmail.com with ESMTPSA id o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 16:42:40 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>, airlied@gmail.com,
        daniel@ffwll.ch, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        mperttunen@nvidia.com, thierry.reding@gmail.com
Subject: [RFT PATCH 07/15] drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
Date:   Fri,  1 Sep 2023 16:41:18 -0700
Message-ID: <20230901164111.RFT.7.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/tegra/drm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ff36171c8fb7..ce2d4153f7bd 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1312,6 +1312,11 @@ static int host1x_drm_remove(struct host1x_device *dev)
 	return 0;
 }
 
+static void host1x_drm_shutdown(struct host1x_device *dev)
+{
+	drm_atomic_helper_shutdown(dev_get_drvdata(&dev->dev));
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int host1x_drm_suspend(struct device *dev)
 {
@@ -1380,6 +1385,7 @@ static struct host1x_driver host1x_drm_driver = {
 	},
 	.probe = host1x_drm_probe,
 	.remove = host1x_drm_remove,
+	.shutdown = host1x_drm_shutdown,
 	.subdevs = host1x_drm_subdevs,
 };
 
-- 
2.42.0.283.g2d96d420d3-goog

