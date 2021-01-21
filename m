Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7280BC433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 15:32:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45A6923A21
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 15:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732158AbhAUPby (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 10:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733012AbhAUPbk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 10:31:40 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412B4C0617A7
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 07:30:17 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d16so1477059wro.11
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 07:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQAzN8UBAsfdTXTkBZ6dRfrmqRnXTSBrjsAJTZ8P6uc=;
        b=Q7JvDVtO9Hpd4ANQi8haeAjFqk3Kc4dn2LfwFNdTZI58dVN0BgNEpMsQC1MZOntBqy
         C5t2klIBa+KAwE7BfUDvlyZvAfuSIRblAtIg8Lh4rYvPuErcu/3fzwVfna8LBufm9MLH
         syWX28nrY8r8xj9XJ+gVp2cmsMl7rapMpN9XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQAzN8UBAsfdTXTkBZ6dRfrmqRnXTSBrjsAJTZ8P6uc=;
        b=SqQa1TOUYP/mF134Rna4ywhHpcwj98vzujPFR6Uk06ASDLU2WkX0g0K7/WmfY1wtbZ
         bpbzaNErkYqBnx/Eo0+QC2bEN/cDz8jt/VB+fUncxNiXN3cV70zIBeiIK06syEDKViJ5
         +JZWaP4Aq7myqxy/vuWL1kS4rgqgusR1QUzRVp7S9Q1UGuXvTgwY32uWJcUIr2QVzYOR
         IoY8EHCfFXEHsLXIHjx+JIHF9Qw2Smh6hKPCYQylAwWXLI7xP79tWX/7hF9meYOusvyw
         x3wROgGCAFLEWpP/TAdjl0b45NDPVFzMNPJT44alOzJ6Vb85vGn9DT9tNGyELW4d188j
         G9EA==
X-Gm-Message-State: AOAM532y0Dk3XF9NsJOvu9/9SjL05tgARHOdespFdQUJ+wk0YhucfRHy
        NVMjtBg3vdeVQ8YI2MExMbYMEQ==
X-Google-Smtp-Source: ABdhPJySIeyjU0DFttJ/Gjez4wLoefZbF6u4HTwPeLiDhJXWujZCiZceqpEWSmZjYBYD23R3v7FuEw==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16176wru.200.1611243015928;
        Thu, 21 Jan 2021 07:30:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 07:30:15 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 10/11] drm/tegra: Annotate dma-fence critical section in commit path
Date:   Thu, 21 Jan 2021 16:29:58 +0100
Message-Id: <20210121152959.1725404-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
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
index e45c8414e2a3..ef2b79a903b1 100644
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
2.30.0

