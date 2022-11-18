Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DB6C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 17:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242359AbiKRRfE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 12:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242549AbiKRRef (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 12:34:35 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B08DEA
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 09:33:28 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id t25so14699133ejb.8
        for <linux-tegra@vger.kernel.org>; Fri, 18 Nov 2022 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WS9M7nkv2mKxuRQYxJibp6IkMyIes9Ra8OJxrBmXq2E=;
        b=AG5X4Mx7ggQNxcG2GnNzp/jza2KW7WuKAt7WSV38XtpT6fZJsnFPOUZP07475Y0QH0
         T9to1PK04EBx2IZbKLsD3Kipx5izeQRZAw7qKKQfYIAsKWpyuqKHm0flrHz9N6TZCayi
         bYxjB4l3owYwisEArqQJYD8q0by/8ozKY1eDv16aZqXym6MJx1z08YFPnpHLCkPaV4f9
         85/1XWfcTpZk+XpSGMxGvkv3jCQDoG6YFpEaNLGbBc93y0YZBr3VivcYBzPrbZGgFSsI
         IT+N2Q2KcoZ0teAEO9BQMf4noqNZJqX3oTortle78ggVOlbx8t3BqkUR9pWeasGBvx37
         XiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS9M7nkv2mKxuRQYxJibp6IkMyIes9Ra8OJxrBmXq2E=;
        b=H88QxupFDiprqCLzYnbf6Evu4abzpOzCLRT2uf/UGug+yNCUxGhsQQpz5Q0TJ3vvub
         4zb1/2PIPhpKRxyiFoPauKLzVdvRlT6VKaONxLBKIUK0S7d3A+EwGCeacTLB377Vor5T
         Zz2wJQ1rsqSIbgkpgFa+2P8HT5FnRD9Xd4GkSR+56X/qgSAy+dp7n+Bwqgsp6/Jjapv6
         UWXKXaQSgwmSNppBHUszTSSLA58DYSSoqBvc687R87KYB+N3QN1XYnPZnlgaeYEx+0/c
         NqJlSd+HfxPqmcMP6iFSm+JiCY8MSkb8VOwrOHdMQe+BWjmwvjfU9SgAMFiZslglRrX9
         TARg==
X-Gm-Message-State: ANoB5plhc4TjweTYHwd+KR6oW1QhX7ZcYCYzcy64p5Y6Y2ClE9SV7Mh7
        /oTZa3soJewhVwhhCqkSmt4=
X-Google-Smtp-Source: AA0mqf5ZKXHkqOO6dvbQohrlWrETz58kuWgCM+pm3YRZ2ZJ4I/0EP1TxQ3zyD/H5iI12/i0+KLjcrA==
X-Received: by 2002:a17:906:c405:b0:7aa:4560:2dc7 with SMTP id u5-20020a170906c40500b007aa45602dc7mr7018337ejz.33.1668792806633;
        Fri, 18 Nov 2022 09:33:26 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906310100b0078df26efb7dsm1940498ejx.107.2022.11.18.09.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:33:26 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v6.2-rc1
Date:   Fri, 18 Nov 2022 18:33:25 +0100
Message-Id: <20221118173325.742647-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit c2418f911a31a266af4fbaca998dc73d3676475a:

  gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-18 09:33:20 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.2-rc1

for you to fetch changes up to 1eb336ed12cda68cb207dbdb6918dc60b151ef6a:

  gpu: host1x: Staticize host1x_syncpt_fence_ops (2022-11-18 09:33:31 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v6.2-rc1

This contains a bunch of cleanups across the board as well as support
for the NVDEC hardware found on the Tegra234 SoC.

----------------------------------------------------------------
Dmitry Torokhov (1):
      drm/tegra: Switch to using devm_fwnode_gpiod_get()

Jani Nikula (1):
      drm/tegra: Convert to using is_hdmi from display info

Liu Shixin (1):
      gpu: host1x: Use DEFINE_SHOW_ATTRIBUTE to simplify debugfs code

Mikko Perttunen (6):
      gpu: host1x: Select context device based on attached IOMMU
      memory: tegra: Add API for retrieving carveout bounds
      gpu: host1x: Add stream ID register data for NVDEC on Tegra234
      drm/tegra: nvdec: Support multiple clocks
      drm/tegra: Add code for booting RISC-V based engines
      drm/tegra: Add Tegra234 support to NVDEC driver

Qing Wang (1):
      drm/tegra: Switch over to vmemdup_user()

Thierry Reding (2):
      gpu: host1x: Update host1x_memory_context_alloc() !IOMMU_API stub
      gpu: host1x: Staticize host1x_syncpt_fence_ops

Zhang Zekun (1):
      drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()

ruanjinjie (1):
      drm/tegra: Make gather_bo_ops static

 drivers/gpu/drm/tegra/Makefile  |   3 +-
 drivers/gpu/drm/tegra/dc.c      |   4 +-
 drivers/gpu/drm/tegra/drm.c     |   1 +
 drivers/gpu/drm/tegra/hdmi.c    |   9 +--
 drivers/gpu/drm/tegra/nvdec.c   | 171 ++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/tegra/output.c  |  10 +--
 drivers/gpu/drm/tegra/riscv.c   | 106 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/riscv.h   |  30 +++++++
 drivers/gpu/drm/tegra/submit.c  |  13 +--
 drivers/gpu/drm/tegra/uapi.c    |   2 +-
 drivers/gpu/host1x/context.c    |   4 +
 drivers/gpu/host1x/debug.c      |  28 +------
 drivers/gpu/host1x/dev.c        |  12 +++
 drivers/gpu/host1x/fence.c      |   2 +-
 drivers/memory/tegra/mc.c       |  25 ++++++
 drivers/memory/tegra/tegra234.c |   5 ++
 include/linux/host1x.h          |   2 +
 include/soc/tegra/mc.h          |  11 +++
 18 files changed, 362 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/riscv.c
 create mode 100644 drivers/gpu/drm/tegra/riscv.h
