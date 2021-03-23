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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4BAC433F8
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3E57619DD
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbhCWPzL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhCWPym (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:42 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A77C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:42 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id r12so27933891ejr.5
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q6m8a91si1cnDHS00dV1ISUdzK3yedRVU6icgkuZGHU=;
        b=Q4orDcvrrZquj5F1jtTTvlyeIff8xpcVU+my69IV0dCxaBY6hHIxA56UrrFz759dqo
         aaGNGLpXz7/mt5DpfAyr7Ul/8Q4OjGyek/HI4PDMrkJVikxG96UJiu1h3hrxOVHzpuXw
         hYOyds1dIoaqgw+8Y35mb00LVzBbuEPrf9OUORPeaq/w0BmXJe1/BOsqaVuTgiU/YFaw
         ExTmQbsFJZcf+LLX0r2jBn7jCaSLl2Rs3tu/Li5KIG6bjE57Ziktp2prTO3F1V3HWJ3B
         0aJnxyyOVs7RnJbq2lWBdQEW7uucij4XSTkuHH8z8w+vkuFsO0Dk4h9kDq65CR8gHGFA
         xEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6m8a91si1cnDHS00dV1ISUdzK3yedRVU6icgkuZGHU=;
        b=kK4S7B4ktinLaba1kBGr+ezY/bgCx8UiV3G13NlBRZKRZ0SY1e759UkU6ghSC9v0iY
         GeXR6n3wRUZmKj5KIV0rwQpQoGOAgYmlx2l/YlK1MODysLpvjAO2kyECDSLvum/zDAJJ
         LpaBPrnTqQa2lWDayi3licBOUdYmOde5QEyTx2/coY3KQBjfOju33CKW609Ci2C5uryl
         eE5FJX/rJGGz1nLGHrU+feN6RerfRIcQ5+VxWWVFji4Tpw7rMkaIFMyWCNuUtBEGumnb
         r7hObgAxOA/EYJv23zBE/H4l2UsKRpiPNjUuqkpovEm2GYhox3+rnaoKH5xzixYwKgpS
         eiyg==
X-Gm-Message-State: AOAM531AcayxOGOmXIo8rfH7DzwBoAiWDYY0j6BdNIXe1cvWxIbfm/hO
        0AiPNceAPRNs+7Vtf8unlYU=
X-Google-Smtp-Source: ABdhPJxfuQJuh6/kUUka0VPQxP/G9nXtoUxnnJwM5UDW2NDN2U9c1LQPQr92SZwuPCF20b1g+G1I2w==
X-Received: by 2002:a17:906:f210:: with SMTP id gt16mr5574600ejb.206.1616514881056;
        Tue, 23 Mar 2021 08:54:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g11sm13185863edw.37.2021.03.23.08.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 8/9] drm/tegra: Count number of display controllers at runtime
Date:   Tue, 23 Mar 2021 16:54:36 +0100
Message-Id: <20210323155437.513497-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to be able to attach planes to all possible display controllers
the exact number of CRTCs must be known. Keep track of the number of the
display controllers that register during initialization.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/tegra/drm.h |  1 +
 drivers/gpu/drm/tegra/hub.c |  6 ++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 4262fd9b9a15..927e6f5a2c24 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2081,6 +2081,16 @@ static bool tegra_dc_has_window_groups(struct tegra_dc *dc)
 	return false;
 }
 
+static int tegra_dc_early_init(struct host1x_client *client)
+{
+	struct drm_device *drm = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = drm->dev_private;
+
+	tegra->num_crtcs++;
+
+	return 0;
+}
+
 static int tegra_dc_init(struct host1x_client *client)
 {
 	struct drm_device *drm = dev_get_drvdata(client->host);
@@ -2229,6 +2239,16 @@ static int tegra_dc_exit(struct host1x_client *client)
 	return 0;
 }
 
+static int tegra_dc_late_exit(struct host1x_client *client)
+{
+	struct drm_device *drm = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = drm->dev_private;
+
+	tegra->num_crtcs--;
+
+	return 0;
+}
+
 static int tegra_dc_runtime_suspend(struct host1x_client *client)
 {
 	struct tegra_dc *dc = host1x_client_to_dc(client);
@@ -2293,8 +2313,10 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
 }
 
 static const struct host1x_client_ops dc_client_ops = {
+	.early_init = tegra_dc_early_init,
 	.init = tegra_dc_init,
 	.exit = tegra_dc_exit,
+	.late_exit = tegra_dc_late_exit,
 	.suspend = tegra_dc_runtime_suspend,
 	.resume = tegra_dc_runtime_resume,
 };
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 34fbcd6abf2f..9a089b93da24 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -56,6 +56,7 @@ struct tegra_drm {
 
 	unsigned int hmask, vmask;
 	unsigned int pitch_align;
+	unsigned int num_crtcs;
 
 	struct tegra_display_hub *hub;
 };
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 617240032c37..500c9d37e654 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -562,9 +562,8 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct tegra_display_hub *hub = tegra->hub;
-	/* planes can be assigned to arbitrary CRTCs */
-	unsigned int possible_crtcs = 0x7;
 	struct tegra_shared_plane *plane;
+	unsigned int possible_crtcs;
 	unsigned int num_formats;
 	const u64 *modifiers;
 	struct drm_plane *p;
@@ -583,6 +582,9 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 
 	p = &plane->base.base;
 
+	/* planes can be assigned to arbitrary CRTCs */
+	possible_crtcs = BIT(tegra->num_crtcs) - 1;
+
 	num_formats = ARRAY_SIZE(tegra_shared_plane_formats);
 	formats = tegra_shared_plane_formats;
 	modifiers = tegra_shared_plane_modifiers;
-- 
2.30.2

