Return-Path: <SRS0=+r4X=D6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690A3C61DD8
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Oct 2020 12:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B15620795
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Oct 2020 12:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="O7XtUKdU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463617AbgJWMWl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Oct 2020 08:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463615AbgJWMWl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Oct 2020 08:22:41 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EA7C0613D2
        for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2020 05:22:40 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c16so1299019wmd.2
        for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2020 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bzJDwk0UaarTjwek7p43Z5eixveGA653vMI0wrr+vtQ=;
        b=O7XtUKdUBPSf9TjLYloRodYjrCetvjKcziZsGwqdmp+Blvk1kTPVSzDdF53/vbY41S
         rGw2KSNwfdBQw6B+naDwbPdKVdsKnqJsdN3WRk468+ZCIfcysezqIDmR/VSH+MjvDNPk
         Da7owdM++heskVUNzJscqLKTBxQj80xXMID7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bzJDwk0UaarTjwek7p43Z5eixveGA653vMI0wrr+vtQ=;
        b=Hy0XyM/HYOFAaiaSZF0Ng3e7wuATqMtbPfv088tHBFfTqz1y7djv2OpzOU6+wExdCd
         W3QJXuMVw7CjUA2CkTrsPUvDXl9YfpLiscfWeDW/8LMC9DI8PrsQ3m0sFWVAgJ7zqMJf
         6TxqmPfA5NdS5VODCs/bTGYVfWSpO3PA4vo5GrPm4GPgRkd1Z8Xt76gZcZNz4dfyKzUr
         R7mc99NVU6HEw8nmTeLg1ItexAwVG7hKzsaMTWmNsijdrncV81dHaaB42bb/v1g4ueRj
         w2uCxFbSzYETPRd3oTPTnSpKqoMpIfj4VqX9/QloFA7d4XqVY9d1dQrDe24wmmadBrQy
         eIIw==
X-Gm-Message-State: AOAM530ztqSvJ6tdF7sqqPLYrfJDynkWr988RmsqtIjhhoYcqVbf0Bkz
        sseq10lbb0AeU8O9NUSnHvnsUQ==
X-Google-Smtp-Source: ABdhPJyDkgbwbjJTuMMSi0+tdHz3l1gq3xGatm+DQh9W5oe3VMttDmbcRcQlKZBYRGpdXsMMICyaRw==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr2175657wmi.12.1603455759419;
        Fri, 23 Oct 2020 05:22:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:38 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 15/65] drm/tegra: Annotate dma-fence critical section in commit path
Date:   Fri, 23 Oct 2020 14:21:26 +0200
Message-Id: <20201023122216.2373294-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Again ends just after drm_atomic_helper_commit_hw_done(), but with the
twist that we need to make sure we're only annotate the custom
version. And not the other clause which just calls
drm_atomic_helper_commit_tail_rpm(), which is already annotated.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index f0f581cd345e..24f353c1cee8 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -65,11 +65,14 @@ static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct tegra_drm *tegra = drm->dev_private;
 
 	if (tegra->hub) {
+		bool fence_cookie = dma_fence_begin_signalling();
+
 		drm_atomic_helper_commit_modeset_disables(drm, old_state);
 		tegra_display_hub_atomic_commit(drm, old_state);
 		drm_atomic_helper_commit_planes(drm, old_state, 0);
 		drm_atomic_helper_commit_modeset_enables(drm, old_state);
 		drm_atomic_helper_commit_hw_done(old_state);
+		dma_fence_end_signalling(fence_cookie);
 		drm_atomic_helper_wait_for_vblanks(drm, old_state);
 		drm_atomic_helper_cleanup_planes(drm, old_state);
 	} else {
-- 
2.28.0

