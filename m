Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD07C433E2
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 944B1619D7
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbhCWPyk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbhCWPyX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:23 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D71C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:22 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id b7so27940047ejv.1
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOUSgKbb+tmQ6BrVeKX3GQ/KKdKuR8BaRfZ6V+0QOT4=;
        b=PdNm6zM8dkCzDqL3k4NIqcGauz36a1hvKs0EcVaQqVfRO0r6OkTXUIfiKm6c3R+N/4
         4QCL/TJjW/ehjsj2A2AMSeiIZOdB5BBeMjAD9emf5rKD0wVzJ+c5eA2GgFA9gkBT/kcs
         OuXGZXe3Mv41RX4IvKbaS5A6fhF9FBILwUy7eaGELt2wVjchs7JkHOYQ0RkYHqF3LKDK
         +hWG7RUnqVx+lPk5/yU0GxVniXz0Taz3ysubj8DuDgLE6t8ekF/o/thMPGswLts4rsjy
         yMGj2qfd9Fz+RDVawAP0aD0lwUL4U93SjjT8/hc8uZ+GrkprwAfpIO7FLsm+NTcQ1Rzc
         QCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOUSgKbb+tmQ6BrVeKX3GQ/KKdKuR8BaRfZ6V+0QOT4=;
        b=FXpSTQNsjU09p3I4Lo7QWDAsCArzb/9jcI+aXxj4U5FUmmSq9H6vS9LY+W/ItSJ6x4
         ek26gHFbEpVY6eHVOUKGBchmViSHhUikecU/Jdi3HqESqN4T6IxbwNwvEmSDgdBlvEFr
         SnP+7t0RLV5c9cwHIgFpf4WJ6fToCeCpvawSwnWPxvwkSU929rtBdK17LWbx7lwa8ONp
         G7M2dC60LYESGioD0DJCdd28LAFwr8ZBvaV9PMWghEN8Tm9uqcLP5xWXRCxKif6AT1ex
         NrqSDI1pBZay6pQ+JGNdVxXB5uzPJUft2Ctc3ryj1O+8/DWXzMA+3eb6/U1A53bf2DEO
         OLXA==
X-Gm-Message-State: AOAM530pFZm83kw7uvg//FijdcWiCJj4k5s7dbqguznaBmenrzfHVJKJ
        Y6HKGs1RBJ936kta+zXMCLM=
X-Google-Smtp-Source: ABdhPJzue6N2LpPyzl3guDAdUNcg5kxuK19d7aYM/Y2bGxBU8KIujBuzZgBTweoetJBGMtGtvXH4tA==
X-Received: by 2002:a17:906:c45a:: with SMTP id ck26mr5468014ejb.125.1616514861376;
        Tue, 23 Mar 2021 08:54:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r17sm11535164ejz.109.2021.03.23.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 0/9] drm/tegra: Various improvements
Date:   Tue, 23 Mar 2021 16:54:28 +0100
Message-Id: <20210323155437.513497-1-thierry.reding@gmail.com>
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

Thanks,
Thierry

Thierry Reding (9):
  drm/fourcc: Add macro to check for the modifier vendor
  drm/tegra: dc: Inherit DMA mask
  drm/tegra: dc: Parameterize maximum resolution
  drm/tegra: dc: Implement hardware cursor on Tegra186 and later
  drm/tegra: fb: Add diagnostics for framebuffer modifiers
  drm/tegra: gem: Add a clarifying comment
  gpu: host1x: Add early init and late exit callbacks
  drm/tegra: Count number of display controllers at runtime
  drm/tegra: Support sector layout on Tegra194

 drivers/gpu/drm/tegra/dc.c    | 104 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/dc.h    |   6 ++
 drivers/gpu/drm/tegra/drm.c   |  13 ++++-
 drivers/gpu/drm/tegra/drm.h   |   5 ++
 drivers/gpu/drm/tegra/fb.c    |  10 ++++
 drivers/gpu/drm/tegra/gem.h   |   6 ++
 drivers/gpu/drm/tegra/hub.c   |  41 +++++++++++++-
 drivers/gpu/drm/tegra/plane.c |  32 +++++++++++
 drivers/gpu/host1x/bus.c      |  31 ++++++++++
 include/linux/host1x.h        |   2 +
 include/uapi/drm/drm_fourcc.h |   3 +
 11 files changed, 240 insertions(+), 13 deletions(-)

-- 
2.30.2

