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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF426C433E4
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B786F619D7
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhCWPyl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhCWPyi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9ECC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:37 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id jy13so27900653ejc.2
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
        b=NUwrKMc8rrSC+eHA/HzSJExKE+kjjVRABul+FSW56sqfRpDiwccyNmaZhvaYC3/y0A
         b53QhZdBwN7NYFbgRHcO421gpHsKQZ8+S+K+BfPNh0ezYBQgwFH6iq2JWLAjDFL7cfbO
         1lmYI8ErGWEcjatruNSl4Rn9zUBdI5b9sjAG8CR2ZC54fKBXQiSG/z+58+FCpwg2hhbx
         /1My360BwzNES7yWftFEgDR+XDAuHtDZsKnhsWSZaG1FJwQtFEjOrJrzTD1TG8Bz2IQ7
         u+145jR7sVkiwPrWeS5G2PzEUfZGKpiNARWJkUzOi1kMhlfpwqpOIjkd3b6D9oPLT/RO
         a/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReoCKHRk0Yzv54SDAezUoYwx+obEQfebobD2IUY1RHo=;
        b=gGHCVtpy7VBVxY/Q+fdtSVniqkyRKxZE+pqNXeocg0YLM2fV77aeRaP8NZGcwM6+cw
         vxD45oEJIM2x83UzSBKvZzhJJQ9AqX2Bfe2Eleb/bBk+J65jUP+iusPKTCdL3+g3Q0oG
         9pIRo5wn6Ywk0wRuj+Q/dyqstBZILT1eJvyxGTySVDTrdGfHG6KFLSyXdxPKYZyjEcjZ
         5UI3GBegM2Rhl9UOhbxmRKtohq6BXnCn62DvzMEoXKy6kPGZeZ5VM7Amlkioo3Kfkz22
         hUjykvmrC5mZaqqnhTAhHReHvCCJtkkZAGwT8wxEvsyXWY4AqZCXMwi4Sp4LoY5HMKUA
         D+rA==
X-Gm-Message-State: AOAM533iOJDml013H7bfdGARcrocrU7y4jxmI4THC6PeyMpJh6rlyYc6
        4ZoZw8FupN3KbCPZP4PvBmg=
X-Google-Smtp-Source: ABdhPJwqE9dHjw9jqCC9q3tRdPTxXRT/J/y3S8CbWp8WVtOsqf/5YB3tyyFWrR7dVspq5PCyY/Yz4Q==
X-Received: by 2002:a17:906:5797:: with SMTP id k23mr5675918ejq.515.1616514876428;
        Tue, 23 Mar 2021 08:54:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id jv19sm11351191ejc.74.2021.03.23.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
Date:   Tue, 23 Mar 2021 16:54:34 +0100
Message-Id: <20210323155437.513497-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
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

