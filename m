Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410BFC61D97
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 17:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbjA0RBY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 12:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbjA0RBX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 12:01:23 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7D0DBC6
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 09:01:21 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id mg12so15412654ejc.5
        for <linux-tegra@vger.kernel.org>; Fri, 27 Jan 2023 09:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dzFTpXHUhXTDotyX20Wwv2xLYaCo/6ROJzl2fHpPAUI=;
        b=mCAlWu96wiqEEyvexcLIqK4hsOnBxfYdTJ5jVseyB+41EBRMy1SkCbfr0JmnpinZVt
         kSJgIzPDUwMCzLpkrewarCP5UAe1J8DBefCfMu36VtU2RphRvEqKyc01DfSKNodZwvJF
         pjlw38NqrUDtVjSJIyWtSEpXKmoI6os+aevNkcdxwayqnZbL/qsODA/ziAaVc/HeeVOL
         L+dv82xZFCahMAK97/Ztu+FbsUxmzoC6cZcXUNfrtBHqg/eBw3KwCUp8Cq8I0SWBzxSH
         tQkbPnY584gkS5xzMBU6rVjM6tm/7fLha1fVx4Q6UTWOvG5zRWS0njWCPp5IQMUt2132
         Vitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzFTpXHUhXTDotyX20Wwv2xLYaCo/6ROJzl2fHpPAUI=;
        b=LDJLpsJd2JrXh5TrhA0tF6irLxCeo3TWbytyvipP/jeiPoUlGEJ3OOTwGm58HgyXuW
         2xByOPHYmlfVI2ZR0dMh+VnOtFS4kcOjH9+3OWSOHNvoXa+7UG0F2JUu8pIBWJ6d+6zW
         /eADZ8GSxxq5B27MqJydQOfCTL0Vd9/akmq4eJH3kubt/vipFiCWWqL9i0fd9XKdf9di
         YbXMVl0chArsXmmXND5zxlH32LTF8nQMgqEA5tml2dJjZcaWARsi/7qmUhtlYFnBNu0B
         MZaWhfa6Ob6do3QO150hPtzrPS6nWsp9BT30vT4BenGrJNAVuaHIAN+0m6OmvY/d3k2B
         nOfg==
X-Gm-Message-State: AO0yUKXNwWDQUkuoZQhoiwI4tClNS8qbQ/fHbQlPBCHGzoyHPwHE2zR8
        Req+lJDsSCLC0Cm50OgLrWyj/Me1el0=
X-Google-Smtp-Source: AK7set/uLNVyKvPS3oX3hGAfVuWPYn6yydQWuoSBzkfIuhTvvD9ZlhhBKDBF+aTltFCZCUnhlebFbQ==
X-Received: by 2002:a17:906:b742:b0:878:7557:bc with SMTP id fx2-20020a170906b74200b00878755700bcmr5883469ejb.41.1674838880297;
        Fri, 27 Jan 2023 09:01:20 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id dk2-20020a170906f0c200b00877e1bb54b0sm2536626ejb.53.2023.01.27.09.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 09:01:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v6.3-rc1
Date:   Fri, 27 Jan 2023 18:01:19 +0100
Message-Id: <20230127170119.495943-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.3-rc1

for you to fetch changes up to 2abdd44e3126e29cc310cbf5f1eda7ca7d979df3:

  drm/tegra: nvdec: Use tegra_dev_iommu_get_stream_id() (2023-01-27 17:49:44 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v6.3-rc1

This set of changes includes a rework of the custom syncpoint interrupt
code to take better advantage of existing DRM/KMS infrastructure.

There's also various bits of cleanup and fixes included.

----------------------------------------------------------------
Mikko Perttunen (7):
      gpu: host1x: Fix mask for syncpoint increment register
      gpu: host1x: Don't skip assigning syncpoints to channels
      drm/tegra: firewall: Check for is_addr_reg existence in IMM check
      gpu: host1x: Implement syncpoint wait using DMA fences
      gpu: host1x: Implement job tracking using DMA fences
      gpu: host1x: Rewrite syncpoint interrupt handling
      gpu: host1x: External timeout/cancellation for fences

Paul Cercueil (1):
      drm/tegra: Remove #ifdef guards for PM related functions

Thierry Reding (5):
      MAINTAINERS: Update Tegra DRM tree
      gpu: host1x: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: vic: Use tegra_dev_iommu_get_stream_id()
      drm/tegra: nvdec: Use tegra_dev_iommu_get_stream_id()

Yushan Zhou (1):
      drm/tegra: Remove redundant null checks before kfree

 MAINTAINERS                                |   2 +-
 drivers/gpu/drm/tegra/dpaux.c              |   6 +-
 drivers/gpu/drm/tegra/firewall.c           |   3 +
 drivers/gpu/drm/tegra/nvdec.c              |  16 +-
 drivers/gpu/drm/tegra/submit.c             |  19 +-
 drivers/gpu/drm/tegra/vic.c                |  39 ++--
 drivers/gpu/host1x/cdma.c                  |  14 +-
 drivers/gpu/host1x/cdma.h                  |   2 +
 drivers/gpu/host1x/context.c               |   8 +-
 drivers/gpu/host1x/debug.c                 |   7 +-
 drivers/gpu/host1x/dev.c                   |   4 +-
 drivers/gpu/host1x/dev.h                   |  10 +-
 drivers/gpu/host1x/fence.c                 | 118 +++++-----
 drivers/gpu/host1x/fence.h                 |  19 +-
 drivers/gpu/host1x/hw/channel_hw.c         |  60 +++---
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |   2 +-
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |   2 +-
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h |   2 +-
 drivers/gpu/host1x/hw/intr_hw.c            |  74 ++-----
 drivers/gpu/host1x/hw/syncpt_hw.c          |   3 -
 drivers/gpu/host1x/intr.c                  | 334 +++++------------------------
 drivers/gpu/host1x/intr.h                  |  83 +------
 drivers/gpu/host1x/job.c                   |  12 +-
 drivers/gpu/host1x/syncpt.c                |  98 ++-------
 drivers/gpu/host1x/syncpt.h                |   3 +-
 include/linux/host1x.h                     |  10 +-
 26 files changed, 285 insertions(+), 665 deletions(-)
