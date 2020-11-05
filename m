Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C98C4742C
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 14:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 521F222203
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 14:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSfGiLj1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731085AbgKEOwQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 09:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730871AbgKEOwQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 09:52:16 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0EDC0613CF
        for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2020 06:52:15 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a65so1539273wme.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2020 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KKycVwNcN4IWLbGSyRzWYkLNsHKS3R2bLFdIm3mqe8=;
        b=WSfGiLj1AtIr3Mr5iw/J8/JMfzybNz781V7wTogkME2iCY5pRK2wWg8HlsZzIOtkKq
         ki8wRPLECzRJASu7rk0b9PjAenZiRTjua9ICZPJr3zEiPWj9eU6rW7eeQ8gn4kE7QmLd
         OUuXIAsL3nHS/0kw0QQxS9RtHovm/+2FAajjJ6RnVPCQoCOm9kUje1d6B0A3OuCABiO4
         1HGZh+RJgtcoPMqxtU+8zAIiTxumn+ZHI/bp4XSajjur0ftLr49rsOzF3E5xPcB4FRI2
         oa+NugSZZR1XLISINFrM3XCDcp7LlzxFloSAGS0DmgRFC5ruF56/olBaYTLmwJj532ea
         NHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KKycVwNcN4IWLbGSyRzWYkLNsHKS3R2bLFdIm3mqe8=;
        b=gjN75wNLAX8QArA2cSlGA2xrTS9Bvo+F3Oe0ZYuSKiwoiqTR/9GRSpdyKCVGDFbBuq
         OWexzR0cOe4euipmRIeR/LP2Y5Ub+6UfVSPkOsxb1UwsN9S3oRuBQQYARpRy5hAHxm8m
         Bj5bYudJEpBn4Y6JAlNpcPJ9gHiIbsEqmhl3bA5jqjqwGWHslqbhXm4HI+m4Gxua7QBl
         TsZjiEoXT78e3l3sxuGmlMAsF7xPnLpavCVgzkZfAadX7qbHZgHAPBVVf2+CptugCeX8
         VVn/mNG17A/IEL7mH7pcQ5B294oXyJYvKTsVMYkvqI4cAaSlK/5km88HysASrOTJ1i7V
         uJ9w==
X-Gm-Message-State: AOAM530RL+GS5qUuHfZJCIGiyYzHoakF4RfR0I8pCiV9RUj2eW+iPg0w
        TP8AgZVGk0x8yf8lIDlfHDk/Aw==
X-Google-Smtp-Source: ABdhPJwv3vBJOFuk/npzxyZAo4HZ1+ZwOqI3+/ois9rIDQtSy2R+EWO6d4lgC3qrR1jiNCMNVeB9BA==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr3234684wmu.85.1604587934709;
        Thu, 05 Nov 2020 06:52:14 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:52:13 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        David Francis <David.Francis@amd.com>,
        dri-devel@lists.freedesktop.org,
        Fabio Estevam <festevam@gmail.com>,
        Gareth Hughes <gareth@valinux.com>,
        Huang Rui <ray.huang@amd.com>, Jason Yan <yanaijie@huawei.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jg1.han@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linaro-mm-sig@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Date:   Thu,  5 Nov 2020 14:44:58 +0000
Message-Id: <20201105144517.1826692-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

There are 5000 warnings to work through.

It will take a couple more sets.

Lee Jones (19):
  gpu: host1x: bus: Add missing description for 'driver'
  gpu: ipu-v3: ipu-di: Strip out 2 unused 'di_sync_config' entries
  gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as __always_unused
  gpu: drm: omapdrm: omap_irq: Fix a couple of doc-rot issues
  gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as always_unused
  gpu: drm: scheduler: sched_main: Provide missing description for
    'sched' paramter
  gpu: drm: scheduler: sched_entity: Demote non-conformant kernel-doc
    headers
  gpu: drm: omapdrm: dss: dsi: Rework and remove a few unused variables
  gpu: drm: selftests: test-drm_framebuffer: Remove set but unused
    variable 'fb'
  gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of
    kernel-doc abuses
  gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
  gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
    'analogix_dp_write_byte_to_dpcd'
  gpu: drm: ttm: ttm_tt: Demote kernel-doc header format abuses
  gpu: drm: selftests: test-drm_dp_mst_helper: Place 'struct
    drm_dp_sideband_msg_req_body' onto the heap
  gpu: drm: radeon: radeon_drv: Remove unused variable 'ret'
  gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
    kernel-doc header
  gpu: drm: radeon: radeon_device: Fix a bunch of kernel-doc
    misdemeanours
  gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
  gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
    'analogix_dp_start_aux_transaction'

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  6 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 88 -------------------
 drivers/gpu/drm/imx/ipuv3-plane.c             |  2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c             |  9 +-
 drivers/gpu/drm/omapdrm/omap_irq.c            |  6 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c  |  2 +-
 drivers/gpu/drm/panel/panel-simple.c          |  2 +
 drivers/gpu/drm/radeon/radeon_device.c        | 23 ++---
 drivers/gpu/drm/radeon/radeon_drv.c           |  3 +-
 drivers/gpu/drm/scheduler/sched_entity.c      |  4 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  1 +
 .../drm/selftests/test-drm_dp_mst_helper.c    | 29 +++---
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  3 +-
 drivers/gpu/drm/selftests/test-drm_mm.c       |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 23 ++---
 drivers/gpu/drm/ttm/ttm_tt.c                  |  4 +-
 drivers/gpu/host1x/bus.c                      |  1 +
 drivers/gpu/ipu-v3/ipu-di.c                   |  4 -
 18 files changed, 59 insertions(+), 153 deletions(-)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: David Francis <David.Francis@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gareth Hughes <gareth@valinux.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Jason Yan <yanaijie@huawei.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jingoo Han <jg1.han@samsung.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linaro-mm-sig@lists.linaro.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
-- 
2.25.1

