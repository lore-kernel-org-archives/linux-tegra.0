Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04447C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1401611C4
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhIPJpl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbhIPJpl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 05:45:41 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BA8C061574
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:20 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso6897105wme.4
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AVKdrbzIrE9dLJQ15eCGOL8LxPqi/Q9epUelIQZtiEk=;
        b=bUyApd5wx9fiXju/Xi8m/UUXPT9XRV7Dax/KTtTwyE7LywZxZsymSvW8o0/j5dKBGE
         6dMGXlYSYKcv7Q8Xm1Q9Qh8kytyCsxrofLMNYnpGkWYAYGSHl7UDfu8lF/9Nn9A0egL3
         qK8oWO1RPF2w/pHDA97soEwmhSMxDMJfrEFhw0fkwoRRAIhaM3rirG+fPZGxr/Tmb3XY
         fH+P4eR0jZET3rzBshoSArXBvh7jQWEq2swESJGE/PZimufR6ebKcNyqjE/8kHXR3Hln
         TJe8xvdZnD0HDXcnbJSmdSP3yGN/9EI4r8ebYKFo3kT1QDpeBiuf2pnzi/G9I/0xijYj
         zfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVKdrbzIrE9dLJQ15eCGOL8LxPqi/Q9epUelIQZtiEk=;
        b=L7xRKmVtCKohhWNBV+JSmwVphcZ/XHYDVYpkQsS7PmP9vQk0fuu5KExFxFZrHxZfhn
         321958fEV58EeF53YyyKC+BboxyT3JHkKYJILm08vgtBGp1Dsxi3CUwWmEEW61yEGn1y
         gxt93hfTxuPG13I3LoTzGEpty3oYY03REhUZL9eopnTbNETMIw62Qez9IoMX6J+9VHTP
         FP11F6S9TyAAV4wLwZ6g0gxDa5isyBg812hLbSmzW2cyv9O124DuZ1cHaSq4dkZUJpkP
         KO/z7yCGPCuvc+ahi74Io7c9mO92KYhnuMW2lQ1Fea/5DmoLhlmsADkc2uGKGu+M5jQN
         rgNA==
X-Gm-Message-State: AOAM530l7EwS03z/omy8xh0Wxut5GAAxaQe3IycOismCwcwgULopcPDV
        LXQrUolB/g9JN/g4QusARSnseMzWFaE=
X-Google-Smtp-Source: ABdhPJwhoWAvoQQbyfkZKZMTCo/cPZfKxgTq9NvwRZ9XGaSNx+O1S4yJaI5k8NExfpJzdZhUJ0ZHtg==
X-Received: by 2002:a1c:488:: with SMTP id 130mr4082699wme.156.1631785459308;
        Thu, 16 Sep 2021 02:44:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id m1sm2535410wmq.10.2021.09.16.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 02:44:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 6/6] drm/tegra: Support asynchronous commits for cursor
Date:   Thu, 16 Sep 2021 11:44:04 +0200
Message-Id: <20210916094404.888267-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This adds support for asynchronously updating the cursor plane, which
enables support for the legacy cursor IOCTLs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 80 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 2025b18d2f63..d9a8df51e3e2 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -890,11 +890,9 @@ static int tegra_cursor_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void tegra_cursor_atomic_update(struct drm_plane *plane,
-				       struct drm_atomic_state *state)
+static void __tegra_cursor_atomic_update(struct drm_plane *plane,
+					 struct drm_plane_state *new_state)
 {
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
 	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
 	struct tegra_drm *tegra = plane->dev->dev_private;
@@ -990,6 +988,14 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_POSITION);
 }
 
+static void tegra_cursor_atomic_update(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+
+	__tegra_cursor_atomic_update(plane, new_state);
+}
+
 static void tegra_cursor_atomic_disable(struct drm_plane *plane,
 					struct drm_atomic_state *state)
 {
@@ -1009,12 +1015,78 @@ static void tegra_cursor_atomic_disable(struct drm_plane *plane,
 	tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
 }
 
+static int tegra_cursor_atomic_async_check(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *crtc_state;
+	int min_scale, max_scale;
+	int err;
+
+	crtc_state = drm_atomic_get_existing_crtc_state(state, new_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return -EINVAL;
+
+	if (!crtc_state->active)
+		return -EINVAL;
+
+	if (plane->state->crtc != new_state->crtc ||
+	    plane->state->src_w != new_state->src_w ||
+	    plane->state->src_h != new_state->src_h ||
+	    plane->state->crtc_w != new_state->crtc_w ||
+	    plane->state->crtc_h != new_state->crtc_h ||
+	    plane->state->fb != new_state->fb ||
+	    plane->state->fb == NULL)
+		return -EINVAL;
+
+	min_scale = (1 << 16) / 8;
+	max_scale = (8 << 16) / 1;
+
+	err = drm_atomic_helper_check_plane_state(new_state, crtc_state, min_scale, max_scale,
+						  true, true);
+	if (err < 0)
+		return err;
+
+	if (new_state->visible != plane->state->visible)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void tegra_cursor_atomic_async_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
+
+	plane->state->src_x = new_state->src_x;
+	plane->state->src_y = new_state->src_y;
+	plane->state->crtc_x = new_state->crtc_x;
+	plane->state->crtc_y = new_state->crtc_y;
+
+	if (new_state->visible) {
+		struct tegra_plane *p = to_tegra_plane(plane);
+		u32 value;
+
+		__tegra_cursor_atomic_update(plane, new_state);
+
+		value = (WIN_A_ACT_REQ << p->index) << 8 | GENERAL_UPDATE;
+		tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+		(void)tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
+
+		value = (WIN_A_ACT_REQ << p->index) | GENERAL_ACT_REQ;
+		tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
+		(void)tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
+	}
+}
+
 static const struct drm_plane_helper_funcs tegra_cursor_plane_helper_funcs = {
 	.prepare_fb = tegra_plane_prepare_fb,
 	.cleanup_fb = tegra_plane_cleanup_fb,
 	.atomic_check = tegra_cursor_atomic_check,
 	.atomic_update = tegra_cursor_atomic_update,
 	.atomic_disable = tegra_cursor_atomic_disable,
+	.atomic_async_check = tegra_cursor_atomic_async_check,
+	.atomic_async_update = tegra_cursor_atomic_async_update,
 };
 
 static const uint64_t linear_modifiers[] = {
-- 
2.33.0

