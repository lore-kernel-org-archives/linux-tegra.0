Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2D1E7D0A2
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Sep 2023 19:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjIUTrU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Sep 2023 15:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjIUTrF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Sep 2023 15:47:05 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EDFA70F3
        for <linux-tegra@vger.kernel.org>; Thu, 21 Sep 2023 12:28:30 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-565e54cb93aso795685a12.3
        for <linux-tegra@vger.kernel.org>; Thu, 21 Sep 2023 12:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695324510; x=1695929310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjE+v7+9YV8M91Wchnv2I6StT/F66BSqTQ0jlAjsGeo=;
        b=Bz1MvDOX7w4+rP0FNtborBxKeiu3FaZeNyukwwR+dENSq0XFjkS3x58nk6JLljhkut
         9Bf5b1xmPqCpm0hKi/d5PjJfmXDqp1C++oies7+hAuEvwdeDvUD+M9+tjdhGOuIU4DWz
         mbPP0JazvVEMqW6y57JGa1DfJhLXtbTvLXRAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695324510; x=1695929310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjE+v7+9YV8M91Wchnv2I6StT/F66BSqTQ0jlAjsGeo=;
        b=xM0i4nnr9qfYHWNZNb5zfuT//zMx4/OiZH5YK1UK5Si2uamZLJRbJe1aaKs0OA3FOb
         bMxEc7mc+fgOIMYsw0r/smhKM8rC7YPRTZBq1j/wqD+AzshRoFUsUI1dMVSai4fksXXM
         u8o7jWmdwQIDquUYbt2Ekc38QaxTlcDJs9GkhPM2QV5gZHTKenZmxn3VCFtL9c1La/gx
         fIkvFAuSa2FGOdWrd1U/zeEo3Anjx4Cw2J9k7Q2uTHNJW7iTzWg8dG+1pKCHBK6Eu6ya
         flO0PbEWuHGjdlOOnT983qdCjUMiPL2uwN+HtiykKNKpLQ7L7QKV0NANi8mmAp3Og8wY
         /eIg==
X-Gm-Message-State: AOJu0Yz+QS2SNFcUDhwmwVZYOgaRui82QSuRfdswZzfqDn/J6ZwWHj8E
        WoM0pmu3VgBtH2JkqeUhakSrlA==
X-Google-Smtp-Source: AGHT+IE+we6oLujL1MkhnRpx7DOVM1KJZ/SsmSrAejYsuJZcNIFP8yRibQZNs1+sdIdQDwROK48mpw==
X-Received: by 2002:a05:6a20:840d:b0:154:6480:83b4 with SMTP id c13-20020a056a20840d00b00154648083b4mr7513077pzd.14.1695324509805;
        Thu, 21 Sep 2023 12:28:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e6ed:6d49:f262:8041])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 12:28:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>, airlied@gmail.com,
        daniel@ffwll.ch, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        mperttunen@nvidia.com, thierry.reding@gmail.com
Subject: [RFT PATCH v2 05/12] drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
Date:   Thu, 21 Sep 2023 12:26:48 -0700
Message-ID: <20230921122641.RFT.v2.5.Ifb4450979b62976fd5a98847dade2e5b377d47c8@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

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
2.42.0.515.g380fc7ccd1-goog

