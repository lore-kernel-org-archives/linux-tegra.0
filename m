Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966ACC433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62FDF619C9
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCZOwI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhCZOvx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:53 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB78C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:53 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so5069732wml.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6fn6UM6Nh/EXUxmXhSBxOyP31iyXGR/4D1U+rCif0l4=;
        b=Eg6shYcrFmlsqdM+MPA8GmwZHsnjgYUKzhnwPO+aYirf6URfUO5p8sqxBGFSCYA5X6
         ijPHv7zJwlMfu41PHsGAUs8CqmGKbt6G6XA5tvNCHW152JbyhS2fxtIF9IiAPbbzmA8S
         wMW89mrmyn7mw9gZCPI4LgIhlqbuiGhsAMkJyEM6MUSi80qc0zV8UbrHtllGcyyaFrLq
         JaKYrP2Z6QxyfR9edSfv60ekGKtqDmpAB6REG2D+3oxlmXExRRh6QtAT7WKNk8jLIIwY
         nuxvBWyFXjyJk7yILLSvsA8J4MExCna/JSb74IGpLb0j+qjsrrrQYMk0ZLhhNdJ+GS7N
         Miug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6fn6UM6Nh/EXUxmXhSBxOyP31iyXGR/4D1U+rCif0l4=;
        b=EmlslZrEfV7BCOX9WvubecSfoecBkiHNiAAYwIkjV1Ncs+3lY8c3NRwaKe4veuUP8M
         N6KX0LWStZuYQAOINkLiT+e0YNUmyPS8MoCk5+QU7TWiXz4CTzTdLTpKPstn17Kf1Oe9
         o9AdC4PK5Exx+B/TrMGXsFvGynbCwpc6toRJdVvufY70CmUVg4G+7K/zejemjIHwZaUI
         5bcabxC1FnnWOxzrAJXEjRqqslKIdsy1xP6PGNmRmeCGMiRJ/amkK3Im1R/+yU4/SCQX
         CfA1kwgMFJv5cmUEa/Jzq0WyJKZ8b36n0o689bKsghd484n9WSAuBL+WP2t7jkdKmaA3
         NsbA==
X-Gm-Message-State: AOAM532nlWcUPpHd5Y5ZcQwiLrvpGy+NyDwkH21BBZxoKxRCaOe/Ghpy
        4E8PTTmxQ1Whddc9uWYJbJQ=
X-Google-Smtp-Source: ABdhPJzwH9mxCZM1pnbGD+hQ+dJrkZcDheDCapm6XbTF8/sBCyy6SnrcN6DkEP6bFPpyd1oRH3/LBQ==
X-Received: by 2002:a1c:a74b:: with SMTP id q72mr13292847wme.158.1616770312023;
        Fri, 26 Mar 2021 07:51:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u2sm13245309wrp.12.2021.03.26.07.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 09/10] drm/tegra: Count number of display controllers at runtime
Date:   Fri, 26 Mar 2021 15:51:38 +0100
Message-Id: <20210326145139.467072-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
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
index 7758d64822ae..0c51f0bb17a9 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2078,6 +2078,16 @@ static bool tegra_dc_has_window_groups(struct tegra_dc *dc)
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
@@ -2226,6 +2236,16 @@ static int tegra_dc_exit(struct host1x_client *client)
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
@@ -2290,8 +2310,10 @@ static int tegra_dc_runtime_resume(struct host1x_client *client)
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

