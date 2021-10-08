Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AC0C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B885C61040
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Oct 2021 20:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhJHUZd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbhJHUZd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Oct 2021 16:25:33 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFDCC061570
        for <linux-tegra@vger.kernel.org>; Fri,  8 Oct 2021 13:23:37 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id e12so33141078wra.4
        for <linux-tegra@vger.kernel.org>; Fri, 08 Oct 2021 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6H3abf9n7GKV0/tbso3ZKE2NhDrvxoh3P1AHHFYNCCk=;
        b=eTbcTcnLhw5VIYf9hR+7LJff0l2f3gXDjBeU39YTKvSrOxiBucnUZqzUTnVQfl/ll0
         TRsDDJLb3hAA54bEE3IOvWyRwY4L3WvVVao2aZsL1xYeBLYdCU/zI8PHq09Poh0MKXdI
         Vyh5l7lQ+3nG8nrKKgULLzEY338Vj6KoBbbruFYBfN6oe2Qd69ejYha2wozl6wz/vqtX
         48CkolNhYlZPZbaJPIRDtl4zfd/XD7Tsw6t/wfmPvKUXQTIlPjIItEysf7UdZfGXTsby
         6wgP0QkXCoOfA7jGvXzwJL5qk3mGZRXZERH1yZdqR2da0pkqQEGXV+jvLRPOD6t9SyFa
         A4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6H3abf9n7GKV0/tbso3ZKE2NhDrvxoh3P1AHHFYNCCk=;
        b=6JCD2DOLRBR7ryQxfB9Xv3lxPzvGfWMwQJxvrGVJuLqtV/CwAoLci3Hc266+ZkNiTy
         aowqBdyQ5D9CaD6mVw2iVPOyqukNK1O+xYt4NUZTgM/M5WcgXvZBCBoxl7TtFFlqxqb0
         OT2Q6Tor/lzJp3q/PhgWtmCyE18QzFT83xlk1w969fQwloSstN0DXFB6VZdXor9f2bPI
         /kphgl3LZZDlueMsqVcmqPFPNBYAr3AXPqKxiZraxswzh3EpFBpBDCsUz8uZpLoUmccG
         r8KmZQv8tKya+wsr04gj99brjdlYXnq4X4sp0dbb9vWqrJfBeQ89EHItqb3TnXVi7u02
         SwTQ==
X-Gm-Message-State: AOAM532eap2vGwqP9ERXWOBlMgdCnMZEQ9RSSTYReydWqi4SeWH4kzgd
        8cCA42wh080uuZF/zxGsPIxRxWy9q7M=
X-Google-Smtp-Source: ABdhPJym5qWTcy6qP9dvUIZq5kG2wYppJ/oI6/KjYNsZkZDLq0Ej9IIYwO5MLONCLpdMUfsw0Q/RRA==
X-Received: by 2002:adf:8bcf:: with SMTP id w15mr7018668wra.144.1633724616210;
        Fri, 08 Oct 2021 13:23:36 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f22sm327609wrd.8.2021.10.08.13.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:23:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.16-rc1
Date:   Fri,  8 Oct 2021 22:23:34 +0200
Message-Id: <20211008202334.1679411-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit c3dbfb9c49eef7d07904e5fd5e158dd6688bbab3:

  gpu: host1x: Plug potential memory leak (2021-09-16 18:06:52 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.16-rc1

for you to fetch changes up to 5dccbc9de8f0071eb731b4de81d0638ea6c06a53:

  drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+ (2021-10-08 21:17:38 +0200)

This is based on the drm/tegra/for-5.15-rc3 tag that you pulled a couple
of weeks ago. As mentioned last time already, the userspace for the new
NVDEC driver can be found here:

  https://github.com/cyndis/vaapi-tegra-driver

I'm sending this a week earlier than usual because I'm out of office
next week.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.16-rc1

This contains a fairly large rework that makes the buffer objects behave
more according to what the DMA-BUF infrastructure expects. A buffer
object cache is implemented on top of that to make certain operations
such as page-flipping more efficient by avoiding needless map/unmap
operations. This in turn is useful to implement asynchronous commits to
support legacy cursor updates.

Another fairly big addition is the NVDEC driver. This uses the updated
UABI introduced in v5.15-rc1 to provide access to the video decode
engines found on Tegra210 and later.

The remainder of these changes is an assortment of cleanups and minor
fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      gpu: host1x: select CONFIG_DMA_SHARED_BUFFER

Dmitry Osipenko (2):
      drm/tegra: dc: rgb: Move PCLK shifter programming to CRTC
      drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+

Mikko Perttunen (3):
      drm/tegra: Add NVDEC driver
      drm/tegra: Bump VIC/NVDEC clock rates to Fmax
      drm/tegra: vic: Use autosuspend

Randy Dunlap (1):
      gpu: host1x: Drop excess kernel-doc entry @key

Thierry Reding (6):
      drm/tegra: Implement correct DMA-BUF semantics
      drm/tegra: Implement buffer object cache
      drm/tegra: Do not reference tegra_plane_funcs directly
      drm/tegra: Propagate errors from drm_gem_plane_helper_prepare_fb()
      drm/tegra: Support asynchronous commits for cursor
      drm/tegra: gr2d: Explicitly control module reset

Wan Jiabing (1):
      drm/tegra: Remove duplicate struct declaration

 drivers/gpu/drm/tegra/Makefile |   3 +-
 drivers/gpu/drm/tegra/dc.c     | 117 ++++++++--
 drivers/gpu/drm/tegra/dc.h     |   1 +
 drivers/gpu/drm/tegra/drm.c    |   4 +
 drivers/gpu/drm/tegra/drm.h    |   1 +
 drivers/gpu/drm/tegra/gem.c    | 171 +++++++++------
 drivers/gpu/drm/tegra/gr2d.c   |  33 ++-
 drivers/gpu/drm/tegra/hub.h    |   1 -
 drivers/gpu/drm/tegra/nvdec.c  | 470 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.c  |  65 ++----
 drivers/gpu/drm/tegra/plane.h  |   2 +-
 drivers/gpu/drm/tegra/rgb.c    |  53 ++++-
 drivers/gpu/drm/tegra/submit.c |  63 ++++--
 drivers/gpu/drm/tegra/uapi.c   |  68 +++---
 drivers/gpu/drm/tegra/uapi.h   |   5 +-
 drivers/gpu/drm/tegra/vic.c    |   8 +
 drivers/gpu/host1x/Kconfig     |   1 +
 drivers/gpu/host1x/bus.c       |  79 ++++++-
 drivers/gpu/host1x/dev.c       |  20 ++
 drivers/gpu/host1x/dev.h       |   2 +
 drivers/gpu/host1x/job.c       | 160 +++++---------
 drivers/gpu/host1x/job.h       |   6 +-
 include/linux/host1x.h         |  75 +++++--
 23 files changed, 1087 insertions(+), 321 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c
