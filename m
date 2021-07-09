Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14883C07E99
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4BA7613CA
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbhGITcD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGITcD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:03 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3C4C0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:18 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v5so13575657wrt.3
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F984kgVhvloPuBXYBd7Yfemhs7n0f7X60aP3To3DVPU=;
        b=C515qcADmxSC5ZdybjgaJYvIDJLvxDxY+v5BZZa2/Mm7l+YOVmbbWJnwUe2R2NvLr0
         knjrEa9CBqbEWnSkuyegvwl3gLqMuzDj7AekmIJkkA046baUUTXCN1jAy+XIqIlXejXt
         Q5vQbHalaq5CBF+3ftjDm7bnbjEFfabw0fhETapP5Ov3Uq3jg4y7OOo0tX6HBIY5cVaa
         iT3FMfd1rXkKw14DO0ydhod//pRFipZ+DDs6s8uj7RuGuew8mqjwZFtMlUkhCpKSYPSW
         Pu0ZWZcTk90XVykukwbzNdYFpPk7tiKgXXrTXJgVNkxOJwbsYY4ADIqEPvrWrs1De/5w
         R3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F984kgVhvloPuBXYBd7Yfemhs7n0f7X60aP3To3DVPU=;
        b=qZArnIVne633Z+U2UelLawT3s2XTJX/yUAFRvN+N0MANSu10XGGBlzOuGpKtWtPEgz
         0o+JzmN2NbtGtsP4Cd4yjHSIvFwhTeT/9HWfnPBOKDkbu164Fj0U2Q8Sj9vP5BbFf8T8
         Wc3OBXkc/o8gNUglw/QGx3fKM8UNCYCugDc7l9qGn+DJy5ZgJAsTZcbtlzbzp+6l08SO
         1MfFv21Ci/2x9yDVTi99/515H8zX3t5R9OSk7p83avJHC5A08S8+nSyiLBbL1nJbgSMH
         RdnBG2W1+Xq0KYXmUIqCqV37tWu5+67LTyJSxUKyTr1MP1tOZa3bocbORyeSIXAp4utZ
         9kvQ==
X-Gm-Message-State: AOAM5306oUM8WczTBOwW41JJmgNGc/L+TdZ0J7VndLMp7Rmemqz2xYR8
        DiU7ICDGh/GbMG1A7uDqCeY=
X-Google-Smtp-Source: ABdhPJxOjLFaXrrD5Sb5Kj3/rW4BvprZp3LhogErPy8s+S4CyYi8qnPKJS4JzX5T25svPe+sNgemuw==
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr5403578wrq.350.1625858956705;
        Fri, 09 Jul 2021 12:29:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y11sm9742859wmi.33.2021.07.09.12.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
Date:   Fri,  9 Jul 2021 21:31:32 +0200
Message-Id: <20210709193146.2859516-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi all,

Mikko has been away for a few weeks, so I've been testing and revising
the new UABI patches in the meantime. There are very minor changes to
the naming of some of the UABI fields, but other than that it's mostly
unchanged from v7.

One notable change is that mappings can now be read-only, write-only,
read-write or none of them (rather than just read-only or read-write),
since those combinations are all supported by the IOMMUs and it might
be useful to make some mappings write-only.

For a full list of changes in v8, see the changelog in patch 6.

I've also updated the libdrm_tegra library to work against this version
of the UABI. A branch can be found here:

  https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8

That contains helper APIs for the concepts introduced in this series and
shows how they can be used in various tests that can be run for sanity
checking.

In addition, Mikko has made updates to the following projects, though
they may need to be updated for the minor changes in v8:

* vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
  Experimental support for MPEG2 and H264 decoding on T210, T186
  and T194.

* xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
  X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.

* grate - https://github.com/grate-driver/grate
  3D rendering testbed for Tegra20, Tegra30, and Tegra114

I plan on putting this into linux-next soon after v5.14-rc1 so that this
can get some soak time.

Thierry

Mikko Perttunen (14):
  gpu: host1x: Add DMA fence implementation
  gpu: host1x: Add no-recovery mode
  gpu: host1x: Add job release callback
  gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
  drm/tegra: Extract tegra_gem_lookup
  drm/tegra: Add new UAPI to header
  drm/tegra: Boot VIC during runtime PM resume
  drm/tegra: Allocate per-engine channel in core code
  drm/tegra: Implement new UAPI
  drm/tegra: Implement syncpoint management UAPI
  drm/tegra: Implement syncpoint wait UAPI
  drm/tegra: Implement job submission part of new UAPI
  drm/tegra: Add job firewall
  drm/tegra: Bump driver version

 drivers/gpu/drm/tegra/Makefile             |   4 +
 drivers/gpu/drm/tegra/drm.c                |  82 ++--
 drivers/gpu/drm/tegra/drm.h                |  12 +
 drivers/gpu/drm/tegra/firewall.c           | 254 ++++++++++
 drivers/gpu/drm/tegra/gather_bo.c          |  81 ++++
 drivers/gpu/drm/tegra/gather_bo.h          |  22 +
 drivers/gpu/drm/tegra/gem.c                |  13 +
 drivers/gpu/drm/tegra/gem.h                |   2 +
 drivers/gpu/drm/tegra/submit.c             | 527 +++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.h             |  21 +
 drivers/gpu/drm/tegra/uapi.c               | 387 +++++++++++++++
 drivers/gpu/drm/tegra/uapi.h               |  58 +++
 drivers/gpu/drm/tegra/vic.c                | 112 ++---
 drivers/gpu/host1x/Makefile                |   1 +
 drivers/gpu/host1x/cdma.c                  |  58 ++-
 drivers/gpu/host1x/fence.c                 | 209 ++++++++
 drivers/gpu/host1x/fence.h                 |  13 +
 drivers/gpu/host1x/hw/channel_hw.c         |  87 +++-
 drivers/gpu/host1x/hw/debug_hw.c           |   9 +-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |  12 +
 drivers/gpu/host1x/intr.c                  |   9 +
 drivers/gpu/host1x/intr.h                  |   2 +
 drivers/gpu/host1x/job.c                   |  77 ++-
 drivers/gpu/host1x/job.h                   |  16 +
 drivers/gpu/host1x/syncpt.c                |   2 +
 drivers/gpu/host1x/syncpt.h                |  12 +
 include/linux/host1x.h                     |  22 +-
 include/uapi/drm/tegra_drm.h               | 425 ++++++++++++++++-
 32 files changed, 2408 insertions(+), 169 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

-- 
2.32.0

