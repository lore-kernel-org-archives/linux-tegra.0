Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A10C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC13660FD7
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhHQCCr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 22:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbhHQCCr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 22:02:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB46C0613C1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i28so11589171lfl.2
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LeDUZerYgs0/VRyn6Vbc3mu8D8SEh6Gle5d+UtLhMUo=;
        b=erVnpZgPdz0Cy7RoxFgipeGYgGcmWFIZirHU2Yk4K7PY6mna1YszI5U80zIgc98RLd
         vC8K0TfqnJvLWnvy8Soo0VFS6/9k0e8F6tA9qHxnGXUG2ZzQyW7Daag1X1nMMcxudKuF
         NRoEdf5nrRKOrErz1duotOlt5J6nhWtiHU/+Ps6bQcjhpNMkrlBPnM/Qws7WNzxEWerv
         xbXemK9jxt+gLLgRdCn3gG0hXFqEj22GSuUXkwnBj/9GdaIgUSz4Mbpl5b+ejDZMFtsX
         h6kD2adhiS9WizUTw1PkgQT2hFheMzDPjdpQGh8JvWtzpCmWqx4GEBkv9gWC4rajAInn
         Sp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LeDUZerYgs0/VRyn6Vbc3mu8D8SEh6Gle5d+UtLhMUo=;
        b=rplafQ3Qd6kqbVDNO/epTW9zdNyxivNm4Mpup+4jcxNZYV1fapLiYCnhb5Oc5DP9fR
         6hvF6Ijsk8ojH/eLhl07Dp9Xgq3qJdOnA+Qi5rnsppdm2jBUIBTIiHxLQNsJ+0FrA8Xb
         FsY2m+NOysFjtq6VdaahlN69KCaTv4fexbFZl7bQMYEjghxKnzf9QQzUp6NmznXDwEbM
         QsEAc5ij45WvpxMkiu/jo4d64BUmGM7MvN8tjCzHopwtWUqyLqM7PSP0S8+KQcRlcb/D
         mjYST/WLYW9+TUGqPdRvGTTf9A8P9HZSkiFI7CxsMi9asiYx/kO77XJLnEg9TIXiRxUG
         HyGw==
X-Gm-Message-State: AOAM530f6tk4wU84boYiMxjwswom0KsBy09KS0208TMgZbVV5IVjn/yU
        11/MKklmrRfSoKwiI9828BQ=
X-Google-Smtp-Source: ABdhPJzYaXnJVVykD6dXfLHQucjLE9tpup4cVMAKU8bG+LamEsyXCVKCBt2Z/pt9EtUeqkJuA+IC/A==
X-Received: by 2002:a05:6512:ea4:: with SMTP id bi36mr562765lfb.414.1629165733349;
        Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] drm/tegra: dc: Remove unused variables
Date:   Tue, 17 Aug 2021 05:01:51 +0300
Message-Id: <20210817020153.25378-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
References: <20210817020153.25378-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove unused variables from tegra_crtc_update_memory_bandwidth().

Fixes: 04d5d5df9df7 ("drm/tegra: dc: Support memory bandwidth management")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 3 ---
 drivers/gpu/drm/tegra/dc.h | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 16c7aabb94d3..a29d64f87563 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1845,7 +1845,6 @@ tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
 				   bool prepare_bandwidth_transition)
 {
 	const struct tegra_plane_state *old_tegra_state, *new_tegra_state;
-	const struct tegra_dc_state *old_dc_state, *new_dc_state;
 	u32 i, new_avg_bw, old_avg_bw, new_peak_bw, old_peak_bw;
 	const struct drm_plane_state *old_plane_state;
 	const struct drm_crtc_state *old_crtc_state;
@@ -1858,8 +1857,6 @@ tegra_crtc_update_memory_bandwidth(struct drm_crtc *crtc,
 		return;
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
-	old_dc_state = to_const_dc_state(old_crtc_state);
-	new_dc_state = to_const_dc_state(crtc->state);
 
 	if (!crtc->state->active) {
 		if (!old_crtc_state->active)
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index f0cb691852a1..40378308d527 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -35,12 +35,6 @@ static inline struct tegra_dc_state *to_dc_state(struct drm_crtc_state *state)
 	return NULL;
 }
 
-static inline const struct tegra_dc_state *
-to_const_dc_state(const struct drm_crtc_state *state)
-{
-	return to_dc_state((struct drm_crtc_state *)state);
-}
-
 struct tegra_dc_stats {
 	unsigned long frames;
 	unsigned long vblank;
-- 
2.32.0

