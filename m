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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F317FC433E3
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB3C8619DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbhCWPyl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbhCWPyf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:35 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54661C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:35 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id e14so9713515ejz.11
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
        b=loYgVysE6ORMaaMt+k/B9ApXcwMnpLlrv67LOGmHWZRnexFCFZncKpUuMfgKCQmh+p
         axH8lHObUHObNM04MuUjgUAUnqKLyo8o+1Z3d3M5cZaww0R2IRxS+Q7P6kT+M6/zpZad
         zyMtZdHpUgmVGb3WskwMhhIvaLIssSj3xzotZUU1AEpTQUI4F1uhxAXHgJmVmY7glgVZ
         U2qOcEy1AUIs9Ic5LsZLGEH4le/0grWDlGS9hduRtUikBvMVS9MJBxQwkAtBoHiftdTA
         SQwyY+dILqqDDBKgNoUfbEMoMZw0FRU70e0ENTXtdU0Up8fMxOM5D6vPhJJ5vofY+RH2
         dQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4EQdWnddGJ/kQ9X+WOHcXmmOLEE1Ao3uU331cQ38SAg=;
        b=k7mkbYviSjyM1YG/IjwlhFUFGhVt70pOWgO/FJiCvVLnXARf4ByCMizW9t+ThLAejT
         lIrQ7+AU1E446Su2Od1zuCCqWgVqiyE4X75ZQB2dOy9RaSxF1Qu/LKG98GfaP4I5QnrN
         rTmbDNG1XedtsTnRqonPdUtV1cbWeFlOlaG/NzoDAqhZuIL2099Cr1BuWLkWf0sK4Ik3
         WiRkhyN7j/oKnPLk3nabAXqM9p7gqE50G+doV/96LosvfXO7WFodkpfOGVFLDpe82auc
         d4hIZwRY+ycrE1gqbj1xqZC7CrBplwoFu/omGg8PaPBFHMq3/Q1eWvXj5/D3ej/tkFkX
         4i6Q==
X-Gm-Message-State: AOAM530Khwy08vG6QajC14cLTtvZu6UsQoag21G7SHtJFclJldqgPOph
        4QIh9VLvvseRDvkQg44NROc=
X-Google-Smtp-Source: ABdhPJx1K2gXlVJwe1h9YPR2Ax4XDjLRHlSeprdecLslQwhR+AZ6J7RDvfjb1/Z6UkfBvMzUKADe6A==
X-Received: by 2002:a17:906:9386:: with SMTP id l6mr5471956ejx.455.1616514874065;
        Tue, 23 Mar 2021 08:54:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y9sm11295319ejd.110.2021.03.23.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 5/9] drm/tegra: fb: Add diagnostics for framebuffer modifiers
Date:   Tue, 23 Mar 2021 16:54:33 +0100
Message-Id: <20210323155437.513497-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a debug message to let the user know when a framebuffer modifier is
not supported.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 01939c57fc74..350f33206076 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -86,6 +86,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 		break;
 
 	default:
+		DRM_DEBUG_KMS("unknown format modifier: %llx\n", modifier);
 		return -EINVAL;
 	}
 
-- 
2.30.2

