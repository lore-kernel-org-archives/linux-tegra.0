Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66020C04FCF
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F37961374
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbhDARnB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbhDARki (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:40:38 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07545C03114C
        for <linux-tegra@vger.kernel.org>; Thu,  1 Apr 2021 09:44:04 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ap14so3893877ejc.0
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbBymjnK5qWdYo7MlqhrBdTdQGD9WJNQMeUiu8Vdtbw=;
        b=srhUXOWtpK70FX/489ZMjEje8HmMvEsvKB8jPNjiuXaG2WqMxIWVsn/sLQnI28G8jo
         sH+B07iQTeP7G1pyMkKtw1hZw04WbWvOwOy/hl6In3gRI61MBLmO8HYM9aI/wzzGKFBR
         MGxjXwEItjyiM9jz3ewjfW3JOhgAR+OdVXk68ELvif8Mbhl0O2L5PcbJE4Ssdk+jIjnQ
         /+hG8C9kTnlkz3VKkznmimGNfUfes6y6jMu3S1s047JbJfXtCeACkEpn37p4Va7hk+zY
         wfcxQiRCCj0PqNcGHgyAqGdL16/4pll4SyzNK5mk5CSmoQS7sQ10Fu6khgL7GSY+L6PK
         oUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbBymjnK5qWdYo7MlqhrBdTdQGD9WJNQMeUiu8Vdtbw=;
        b=s0880PLCJ+Z2DmwGAyaxS4DDClxV9lYvtq/VBh2MYq7FL8mSrFqQR80I2ycI9Slt/J
         IBFkLZ/RYpjkLEkKmXaMbbkrKLBsN8ZjJvmgu0UtNTdg0hQXWnD4oaqJQbsmhP+euRD1
         JTkmvDP83kkDmyuq4dULirPp+c5fV9aryvl4uS/fMxm+eItWIVoXayuQx1a4E08/EavM
         Iv9+gcvcX2ZI8AZpxQY388+JK37M0qxrjeMJhMxoYihdQ/NelBv1NDaeS3rHcHdygq4S
         RrtHV887bgQ6txvDyxYptCiCpzA7VaeWKwVPjAn3nCIEHlonmhcmKsDP7HCcbQQRs/c/
         ybmQ==
X-Gm-Message-State: AOAM533hlFMygqe1OiboECz8zKZHd515s8ji9Zy1R4Fsmcq1i/h+scf8
        v+89NTOtlcqHEgpVrG6Q1E8=
X-Google-Smtp-Source: ABdhPJxhhD4eRsC8Xv+3tlnUU8+B2wmAvhcbDlncYIXIwTJo7UQhS4IDlFYy3qBp0G9Zp92/pKQVHQ==
X-Received: by 2002:a17:906:2bc3:: with SMTP id n3mr10070426ejg.418.1617295442757;
        Thu, 01 Apr 2021 09:44:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j25sm3792809edy.9.2021.04.01.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:44:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.13-rc1
Date:   Thu,  1 Apr 2021 18:44:30 +0200
Message-Id: <20210401164430.3349105-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 51c3b916a4d7e24b4918925965867fdd9bd8dd59:

  Merge tag 'drm-misc-next-2021-03-03' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-03-16 17:08:46 +1000)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.13-rc1

for you to fetch changes up to 7b6f846785f41d57917e36851c120cfbe87f0809:

  drm/tegra: Support sector layout on Tegra194 (2021-03-31 17:42:14 +0200)

Note that I've based this on your pull of drm-misc-next-2021-03-03 and
the drm/tegra/for-5.12-rc6 fixes branch that I just sent out a PR for
because otherwise there would've been a bunch of non-trivial conflicts.

The shortlog below includes everything from drm/tegra/for-5.12-rc6 for
clarity.

Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.13-rc1

The changes this time around contain a couple of fixes for host1x along
with some improvements for Tegra DRM. Most notably the Tegra DRM driver
now supports the hardware cursor on Tegra186 and later, more correctly
reflects the capabilities of the display pipelines on various Tegra SoC
generations and knows how to deal with the dGPU sector layout by using
framebuffer modifiers.

----------------------------------------------------------------
Dmitry Osipenko (1):
      drm/tegra: dc: Don't set PLL clock to 0Hz

Jon Hunter (1):
      gpu: host1x: Fix Tegra194 syncpt interrupt threshold

Mikko Perttunen (9):
      gpu: host1x: Use different lock classes for each client
      gpu: host1x: Allow syncpoints without associated client
      gpu: host1x: Show number of pending waiters in debugfs
      gpu: host1x: Remove cancelled waiters immediately
      gpu: host1x: Use HW-equivalent syncpoint expiration check
      gpu: host1x: Cleanup and refcounting for syncpoints
      gpu: host1x: Reset max value when freeing a syncpoint
      gpu: host1x: Reserve VBLANK syncpoints at initialization
      gpu: host1x: Assign intr waiter inside lock

Thierry Reding (11):
      drm/tegra: dc: Restore coupling of display controllers
      drm/tegra: sor: Grab runtime PM reference across reset
      Merge branch 'drm/tegra/fixes' into drm/tegra/for-next
      gpu: host1x: Add early init and late exit callbacks
      drm/tegra: dc: Inherit DMA mask
      drm/tegra: dc: Parameterize maximum resolution
      drm/tegra: dc: Implement hardware cursor on Tegra186 and later
      drm/tegra: fb: Add diagnostics for framebuffer modifiers
      drm/tegra: gem: Add a clarifying comment
      drm/tegra: Count number of display controllers at runtime
      drm/tegra: Support sector layout on Tegra194

 drivers/gpu/drm/tegra/dc.c             | 143 ++++++++++++++++++-----
 drivers/gpu/drm/tegra/dc.h             |   6 +
 drivers/gpu/drm/tegra/drm.c            |  27 +++--
 drivers/gpu/drm/tegra/drm.h            |   5 +
 drivers/gpu/drm/tegra/fb.c             |  10 ++
 drivers/gpu/drm/tegra/gem.h            |   6 +
 drivers/gpu/drm/tegra/gr2d.c           |   4 +-
 drivers/gpu/drm/tegra/gr3d.c           |   4 +-
 drivers/gpu/drm/tegra/hub.c            |  41 ++++++-
 drivers/gpu/drm/tegra/plane.c          |  32 ++++++
 drivers/gpu/drm/tegra/sor.c            |   7 ++
 drivers/gpu/drm/tegra/vic.c            |   4 +-
 drivers/gpu/host1x/bus.c               |  41 ++++++-
 drivers/gpu/host1x/cdma.c              |  11 +-
 drivers/gpu/host1x/debug.c             |  14 ++-
 drivers/gpu/host1x/dev.c               |   6 +
 drivers/gpu/host1x/dev.h               |  13 ++-
 drivers/gpu/host1x/hw/cdma_hw.c        |   2 +-
 drivers/gpu/host1x/hw/channel_hw.c     |  10 +-
 drivers/gpu/host1x/hw/debug_hw.c       |   2 +-
 drivers/gpu/host1x/hw/hw_host1x07_vm.h |   2 +-
 drivers/gpu/host1x/intr.c              |  28 +++--
 drivers/gpu/host1x/intr.h              |   4 +-
 drivers/gpu/host1x/job.c               |   5 +-
 drivers/gpu/host1x/syncpt.c            | 202 ++++++++++++++++++++-------------
 drivers/gpu/host1x/syncpt.h            |   4 +-
 drivers/staging/media/tegra-video/vi.c |   6 +-
 include/linux/host1x.h                 |  27 ++++-
 28 files changed, 494 insertions(+), 172 deletions(-)
