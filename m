Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E781FC4338F
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:36:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5E8F60E9B
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Aug 2021 16:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbhHMQgr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Aug 2021 12:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233827AbhHMQgq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 12:36:46 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CC1C061756
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:36:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g138so7246364wmg.4
        for <linux-tegra@vger.kernel.org>; Fri, 13 Aug 2021 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/unfGG7boShaQnBZTjeWb6L7ezxIs4AzIdOoHVH6Jk=;
        b=SjbFbUpYtS+J0ujRt+A5RE1tIn5EziFk+gvUeGZC54fjSuGHHhgWfXe2mlnSIV6/Y1
         KCQdYeIP86KGtEqzh73p3gLOm/8MgSwa+vhdtN2QMzh5TLbk4usG8iQXIR1CajztHr3X
         Syzo0nbcCT9nSqS4OFRMwjKk7wDLbGeg6AkutdzRpWWp//9Qef6cFz+enrsaHto+znTC
         5R4HKkJoKMrwg358k++rvrvXCLrPpp+251+rAerodX+w6FUME/YQPy1C7vlqMXuoDW7w
         LJhcPePFk6a8xyoG33br5Zml+JfEKFRnLAs3MIYl7LyL7J8VZdczN6NTj2x+Y7z6RX0G
         UPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/unfGG7boShaQnBZTjeWb6L7ezxIs4AzIdOoHVH6Jk=;
        b=L5X3MVBRoCfWYHQxTwamCxI+q2Kjkbo9H6hl6FsSh1nosFAVW9yqkIeQnTBrguai58
         oGtYW7diXRhvMH+/ocOdG0i2BNScFNkf944HCCDnPXVKwTsTg8o1kpsXsDU6iwGoqUFT
         mT0emPP1GkWPfvn3/4EB28rDq0MRu+Be7QogSmz2CwbvJCbc0jzy8n1tvNoDZeV4IF5G
         EGWk+QAax+raI2o2yT9EbEp1G3iKrX/0v7+J9hAULmZsFPr53I0FmgokREFp7kGKd3zd
         77q/VA5v1GiGb2OATZ7ftPZTI/7U5gDS82qU6bOa6bg9S13m7I577zPEtrRsMTx4NK14
         TXSQ==
X-Gm-Message-State: AOAM531eHrh6z1BRoOJdSUayHALFjO+LNf52k4GM6Uz4v6mvz3zoBbnL
        ciZ/sjCFzg82U8d5A3x0uxlGnzuxB/k=
X-Google-Smtp-Source: ABdhPJwHdWd/8g3Q0zoWVubbkpRNTmluDdpLphAT3vZh35G0CtGsmCLit025TiZHZTSRRjAESv3H7g==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr3566110wmc.150.1628872578279;
        Fri, 13 Aug 2021 09:36:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s12sm2099923wru.41.2021.08.13.09.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:36:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.15-rc1
Date:   Fri, 13 Aug 2021 18:36:16 +0200
Message-Id: <20210813163616.2822355-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.15-rc1

for you to fetch changes up to fed0289394173509b3150617e17739d0094ce88e:

  gpu: host1x: debug: Dump DMASTART and DMAEND register (2021-08-13 18:23:32 +0200)

Once you've merged these I plan to push the libdrm changes which are
going to use this new ABI and which also contain some basic sanity tests
that we want to start running for regression testing.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.15-rc1

The bulk of these changes is a more modern ABI that can be efficiently
used on newer SoCs as well as older ones. The userspace parts for this
are available here:

  - libdrm support: https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
  - VAAPI driver: https://github.com/cyndis/vaapi-tegra-driver

In addition, existing userspace from the grate reverse-engineering
project has been updated to use this new ABI:

  - X11 driver: https://github.com/grate-driver/xf86-video-opentegra
  - 3D driver: https://github.com/grate-driver/grate

Other than that, there's also support for display memory bandwidth
management for various generations and a bit of cleanup.

----------------------------------------------------------------
Dmitry Osipenko (2):
      drm/tegra: dc: Support memory bandwidth management
      drm/tegra: dc: Extend debug stats with total number of events

Mikko Perttunen (15):
      gpu: host1x: Add DMA fence implementation
      gpu: host1x: Add no-recovery mode
      gpu: host1x: Add job release callback
      gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
      gpu: host1x: Add option to skip firewall for a job
      drm/tegra: Extract tegra_gem_lookup()
      drm/tegra: Add new UAPI to header
      drm/tegra: Boot VIC during runtime PM resume
      drm/tegra: Allocate per-engine channel in core code
      drm/tegra: Implement new UAPI
      drm/tegra: Implement syncpoint management UAPI
      drm/tegra: Implement syncpoint wait UAPI
      drm/tegra: Implement job submission part of new UAPI
      drm/tegra: Add job firewall
      drm/tegra: Bump driver version

Thierry Reding (3):
      gpu: host1x: debug: Use dma_addr_t more consistently
      gpu: host1x: debug: Dump only relevant parts of CDMA push buffer
      gpu: host1x: debug: Dump DMASTART and DMAEND register

 drivers/gpu/drm/tegra/Kconfig              |   1 +
 drivers/gpu/drm/tegra/Makefile             |   3 +
 drivers/gpu/drm/tegra/dc.c                 | 358 ++++++++++++++++-
 drivers/gpu/drm/tegra/dc.h                 |  17 +
 drivers/gpu/drm/tegra/drm.c                |  98 +++--
 drivers/gpu/drm/tegra/drm.h                |  12 +
 drivers/gpu/drm/tegra/firewall.c           | 254 ++++++++++++
 drivers/gpu/drm/tegra/gem.c                |  13 +
 drivers/gpu/drm/tegra/gem.h                |   2 +
 drivers/gpu/drm/tegra/plane.c              | 117 ++++++
 drivers/gpu/drm/tegra/plane.h              |  16 +
 drivers/gpu/drm/tegra/submit.c             | 625 +++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.h             |  21 +
 drivers/gpu/drm/tegra/uapi.c               | 338 ++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h               |  58 +++
 drivers/gpu/drm/tegra/vic.c                | 112 +++---
 drivers/gpu/host1x/Makefile                |   1 +
 drivers/gpu/host1x/cdma.c                  |  58 ++-
 drivers/gpu/host1x/fence.c                 | 168 ++++++++
 drivers/gpu/host1x/fence.h                 |  13 +
 drivers/gpu/host1x/hw/channel_hw.c         |  87 +++-
 drivers/gpu/host1x/hw/debug_hw.c           |  32 +-
 drivers/gpu/host1x/hw/debug_hw_1x01.c      |   8 +-
 drivers/gpu/host1x/hw/debug_hw_1x06.c      |  16 +-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |  12 +
 drivers/gpu/host1x/intr.c                  |   9 +
 drivers/gpu/host1x/intr.h                  |   2 +
 drivers/gpu/host1x/job.c                   |  98 +++--
 drivers/gpu/host1x/job.h                   |  16 +
 drivers/gpu/host1x/syncpt.c                |   2 +
 drivers/gpu/host1x/syncpt.h                |  12 +
 include/linux/host1x.h                     |  27 +-
 include/uapi/drm/tegra_drm.h               | 425 ++++++++++++++++++--
 37 files changed, 2882 insertions(+), 197 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h
