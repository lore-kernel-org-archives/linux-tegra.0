Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C1CC433C1
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 262E8619C9
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhCZOva (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhCZOvY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:24 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB7FC0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:23 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k8so5933264wrc.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GBUopuwRuoU809B1RvDUEH/H8rKOYACoDyOwEHmoXWc=;
        b=Z+yZnpimiNbbiycvDQ5RIgnrO/2zLAts7i1gjj/fdmUpJca6mwGi6GanM1ojjleRpX
         GfCabLmrTdvO5Yuen8Ukx7J5Dq7rN9qkYsnV9SkEvfC6VsmJjlupkDRc5QXTQrWmoc8p
         RNWMWILC9pUi5Ls9KMip6XzXhtnW2tleP/LU390Im5rHTqxjHqq6Au+HCz/VyfbGLFqz
         i9iHxhIgxplXJbLy8IikUUY5JMejzPM2pTf/9eAopOwKrNQvNQ46V6PWvpbw4aXtp+Da
         y905sPFIZoVkZVhwN9VWfIU+kHWk7or0kKIPPnqqUg7atfVDLqv4BiM0xmcpkhcDR7al
         06Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GBUopuwRuoU809B1RvDUEH/H8rKOYACoDyOwEHmoXWc=;
        b=reDWLfjY2PIcIJIuW7amsZXwiU+d8ClFNIyxXm7MCRTTtu8NkE17cQn2F883in+hC7
         NsWLEpIy1ax6sefgZnY0m9xvQlHLjjx9NA+FY6SAGw9hch+DajsYD34Ihcu/9ZrOrc0g
         wE145ohbAyZpxlq7jkeQ7fwxsZa4jynC0oE7SgvyoKLCDlASM4WyBwwCmrM6xqq4ri5L
         Iwwvr9Tm7566SiLQAuH15v8SDJTmcTzetaUdfgpkEVKJ2yXZH/InUprsAn7HmwVXa2zF
         5q39yH09neH8YP0GCsd9Cg2yY0TzCtsTeN/xPAOnua9yYQ+2hgKUwdH5GJ2Qv9P4HivV
         uZRg==
X-Gm-Message-State: AOAM531c62r5pn6YzKkJoFbsWle8Lbrm4efyBND9+DFMCwrs1gFn+G1f
        Ig50eIqdeC0vPGfyQ3Qu1FQ=
X-Google-Smtp-Source: ABdhPJx4qpTguGUDobXvwQdijzOIGyAko1v4hxfrWV2ZDnLh6WaljMY8gK92Nv3iOiffb+/LgBoR4w==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr14808648wru.316.1616770282500;
        Fri, 26 Mar 2021 07:51:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h62sm14048068wmf.37.2021.03.26.07.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:21 -0700 (PDT)
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
Subject: [PATCH v2 00/10] drm/tegra: Various improvements
Date:   Fri, 26 Mar 2021 15:51:29 +0100
Message-Id: <20210326145139.467072-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this fixes a couple of oddities like slightly off DMA masks and add
support for hardware cursors on newer chips as well as support for the
sector layout bit in NVIDIA framebuffer modifiers.

The first patch in this set is a small helper that I think might be
useful to other drivers eventually, but if it isn't it's easily
something I can carry in the Tegra driver. It'd be great to get an
Acked-by on it from one of the drm-misc maintainers so that I can take
it through the Tegra tree.

James, I've added you on Cc on this one because it makes use of the
extended framebuffer modifiers that you introduced a while back to
support the sector layout mux on Tegra194. It'd be great to get your
thoughts on this just so this is used as expected.

Changes in v2:
- add patch 2 that makes use of the new fourcc_mod_is_vendor() macro
- use more drm_rect helpers for hardware cursor support

Thanks,
Thierry

Thierry Reding (10):
  drm/fourcc: Add macros to determine the modifier vendor
  drm/arm: malidp: Use fourcc_mod_is_vendor() helper
  drm/tegra: dc: Inherit DMA mask
  drm/tegra: dc: Parameterize maximum resolution
  drm/tegra: dc: Implement hardware cursor on Tegra186 and later
  drm/tegra: fb: Add diagnostics for framebuffer modifiers
  drm/tegra: gem: Add a clarifying comment
  gpu: host1x: Add early init and late exit callbacks
  drm/tegra: Count number of display controllers at runtime
  drm/tegra: Support sector layout on Tegra194

 drivers/gpu/drm/arm/malidp_planes.c |   2 +-
 drivers/gpu/drm/tegra/dc.c          | 101 +++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/dc.h          |   6 ++
 drivers/gpu/drm/tegra/drm.c         |  13 +++-
 drivers/gpu/drm/tegra/drm.h         |   5 ++
 drivers/gpu/drm/tegra/fb.c          |  10 +++
 drivers/gpu/drm/tegra/gem.h         |   6 ++
 drivers/gpu/drm/tegra/hub.c         |  41 ++++++++++-
 drivers/gpu/drm/tegra/plane.c       |  32 +++++++++
 drivers/gpu/host1x/bus.c            |  31 +++++++++
 include/linux/host1x.h              |   2 +
 include/uapi/drm/drm_fourcc.h       |   6 ++
 12 files changed, 241 insertions(+), 14 deletions(-)

-- 
2.30.2

