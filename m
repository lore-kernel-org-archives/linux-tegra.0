Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA16C433E8
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8804361A10
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhCZOwH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhCZOvs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:48 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DC3C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:48 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e18so5921935wrt.6
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
        b=iEK6+aZlJrXx8XjCJnAXlLR4InbGYUVx2dt2D4tb6J2ipv7Uq6hWX4QXYtZ/qXIdHT
         kIYC3R9TlP7L7v4kPpu/1xGzTac4zByImZwVADMw/eHuCr7PIHlWwZ5+Ho5sEM+nuzSI
         l80ke7Vy7X508jjRY1XAJc0SD6123/gqEo8RgzMsQHAY6akz+z7GH6FHkJ/s0J6RHUEe
         cMfQLWCpRB1NDb9OmS+wO/vZOGxIcjq1ipUrh6e1tvLO4aklf0uDWcr2dvi//XBkXHNi
         cWMDvkNT0wZCtHWTNApmN/g0za0pqaAkQFc+GhSziGhj1MhbYSMuMWefrOEsr5f6afLa
         OsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
        b=gHrDmTyRL56uIxFMVNSBVWNevk7Rr325pOAOSn5hHk6aTSDdBTVrRARm6KOCpLefYC
         iGeNgVlK6lFVYHydCtzvJRXoaP2VtPzMOC5WHQ+QN3bP7rhtNKAQvUSclamT3xEgYk9A
         Ke7jesnn0F8dvKdwRdYwWgfMhTzn2VJq2d+efnvFkPObzd3Y7V3pSA5CZj+6XCQ5GJt7
         ova4SRGD6Hy1L2gXhYAW7YkA5XEcqLSu7X0H7zCsEDA0Apgf87doyxH8tX5JL/ycptw+
         RPyInln4skcpvnympmzIDfLp/o1eiHSg5riSleeUKUk/q/oxljddUT7AaBNM913z0ab3
         7Gow==
X-Gm-Message-State: AOAM531/O3Eh8LAsF3A/9UBMK2Ryqa/uGDdzZEMfOhQj+9Hdaz7QtHAU
        kr7O6d4waxtpQmVIgjO6hfU=
X-Google-Smtp-Source: ABdhPJwlfUjZQv3XsgfKDmclqEDIXzXXcqW+GBTKFrjaojuEtGrfrq6RFk8w1RFXCoMn9hgvOf9zlg==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr14938857wrc.271.1616770307017;
        Fri, 26 Mar 2021 07:51:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j123sm10902561wmb.1.2021.03.26.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:45 -0700 (PDT)
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
Subject: [PATCH v2 07/10] drm/tegra: gem: Add a clarifying comment
Date:   Fri, 26 Mar 2021 15:51:36 +0100
Message-Id: <20210326145139.467072-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Clarify when a fixed IOV address can be used and when a buffer has to
be mapped before the IOVA can be used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 19e8847a164b..793da5d675d2 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -119,6 +119,14 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		dma_addr_t phys_addr, *phys;
 		struct sg_table *sgt;
 
+		/*
+		 * If we're not attached to a domain, we already stored the
+		 * physical address when the buffer was allocated. If we're
+		 * part of a group that's shared between all display
+		 * controllers, we've also already mapped the framebuffer
+		 * through the SMMU. In both cases we can short-circuit the
+		 * code below and retrieve the stored IOV address.
+		 */
 		if (!domain || dc->client.group)
 			phys = &phys_addr;
 		else
-- 
2.30.2

