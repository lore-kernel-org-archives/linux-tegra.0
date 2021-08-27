Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A6DC4320E
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A49A460FF2
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245398AbhH0NYC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245305AbhH0NYA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46D9C061757
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:11 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so5049447wmi.0
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q07/zJ4l6bN3OVZuHzMIPljl9eKvXtVjqqFXO7nBrYg=;
        b=Qa/F0OHWuNdvNTeGwwzuJyQl4PCdCElOVQUmdS20Zx1c6OtCdjwI4nl+in9wXXdl6Y
         Ke19wsFlJdpxqaLTGNXmTdEnZbaEvR4jFyBJ38Do+XMz1YZt+cBYwC3/ymiQ4Y1ybYjO
         dVt9+77fBK+lgYIsl5Waf6UspSG6cMiW3h+qBeJbCv8vipkLvcFmIJglH3at3MhFvN8a
         hz1nbxkGGb7EByOkixRkKCqJwPwQrBIhXzviGRB2EYeNA1jf1Pox8KYrmnZNRNUP3DdD
         DuGSCgqQO+27vQWC4dMIEkBHk3Gt5ikMJV8NfxdEdlNWNC1XoS8hKXZcTy3ZDzP8GjPb
         IiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q07/zJ4l6bN3OVZuHzMIPljl9eKvXtVjqqFXO7nBrYg=;
        b=GHdtoWQU5JU8n+0sxAY2+ghAgz6dMbMY0QgOguZSp4/wTFyURoD20vW3ZayN9EfeJJ
         u3/OkoG0+QLuRaduoM+aUVpavSnGTlf0kNJEt5YvYbOoDV4oXYYy0b3i2kqzNY7d7ZW2
         xzW8pLbgVow3CBg92B1PdVin6spnyKy2t+qb56gkvBo6jSSP8pc48UHK3tdY4Tk5sASQ
         A/iiVzchsG31q9fk20qacj+WZy56WZUkjojQ5An6V4R8s80Z77eIurv5mG5aTo+kaIGp
         bDzrO05t0VMmXnhusnCWGiIj+LM3DazfyKaeSEFt42gbtMRCBnbc+3s6roAAbFRQdWz2
         NWzA==
X-Gm-Message-State: AOAM5314Fb2D0tRREQMW21IP+Rrnn800OaretNEfQLod8GLhvmfkq97P
        Hhdf2bTCJl0atS6Mf4aO9VQ62+KsBeg=
X-Google-Smtp-Source: ABdhPJzraMp57uBGM/dCEdchH23yRAeM2wMJDlQMk0lw3VNwgDIyA7NiR66CbiNk+KB22MDwOw9Zkg==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr9005149wmj.181.1630070590361;
        Fri, 27 Aug 2021 06:23:10 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n10sm6292100wrw.76.2021.08.27.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 00/25] Update Tegra support
Date:   Fri, 27 Aug 2021 15:22:40 +0200
Message-Id: <20210827132305.3572077-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi all,

this is the userspace part of the kernel patches that were recently
merged into drm-next:

  https://patchwork.freedesktop.org/series/92378/

The goal is to provide a userspace implementation of the UAPI exposed by
the kernel and show its usage in some test programs that can also be
used for basic sanity testing. More complete userspace implementations
are available here:

  * https://github.com/cyndis/vaapi-tegra-driver
  * https://github.com/grate-driver/xf86-video-opentegra
  * https://github.com/grate-driver/grate

Thierry

Thierry Reding (25):
  tegra: Indent according to .editorconfig
  tegra: Remove unused IOCTL implementations
  tegra: Extract common buffer object allocation code
  tegra: Fix mmap() of GEM buffer objects
  tegra: Add flink helpers
  tegra: Add PRIME support helpers
  tegra: Make API more consistent
  tegra: Install tegra-openclose test
  tegra: Update for new UABI
  tegra: Include private.h in list of source files
  tegra: Add channel APIs
  tegra: Add job and push buffer APIs
  tegra: Add syncpoint APIs
  tests: tegra: Add helper library for tests
  tests: tegra: Add gr2d-fill test
  tests: tegra: Add syncpt-wait test
  tests: tegra: Add syncpoint timeout test
  tests: tegra: Add VIC support
  tests: tegra: Add VIC 3.0 support
  tests: tegra: Add VIC 4.0 support
  tests: tegra: Add VIC 4.1 support
  tests: tegra: Add VIC 4.2 support
  tests: tegra: Add VIC clear test
  tests: tegra: Add VIC blit test
  tests: tegra: Add VIC flip test

 include/drm/tegra_drm.h      | 429 +++++++++++++++++++++++--
 tegra/channel.c              | 195 ++++++++++++
 tegra/job.c                  | 187 +++++++++++
 tegra/meson.build            |   7 +-
 tegra/private.h              |  85 ++++-
 tegra/pushbuf.c              | 184 +++++++++++
 tegra/syncpt.c               | 101 ++++++
 tegra/tegra-symbols.txt      |  27 +-
 tegra/tegra.c                | 392 ++++++++++++-----------
 tegra/tegra.h                |  95 +++++-
 tests/tegra/.gitignore       |   3 +-
 tests/tegra/drm-test-tegra.c | 147 +++++++++
 tests/tegra/drm-test-tegra.h |  55 ++++
 tests/tegra/drm-test.c       | 248 +++++++++++++++
 tests/tegra/drm-test.h       |  72 +++++
 tests/tegra/gr2d-fill.c      | 146 +++++++++
 tests/tegra/host1x.h         |  34 ++
 tests/tegra/meson.build      |  88 +++++-
 tests/tegra/openclose.c      |  52 +--
 tests/tegra/syncpt-timeout.c | 163 ++++++++++
 tests/tegra/syncpt-wait.c    | 151 +++++++++
 tests/tegra/vic-blit.c       | 333 +++++++++++++++++++
 tests/tegra/vic-clear.c      | 173 ++++++++++
 tests/tegra/vic-flip.c       | 333 +++++++++++++++++++
 tests/tegra/vic.c            | 177 +++++++++++
 tests/tegra/vic.h            | 181 +++++++++++
 tests/tegra/vic30.c          | 509 +++++++++++++++++++++++++++++
 tests/tegra/vic30.h          | 439 ++++++++++++++++++++++++++
 tests/tegra/vic40.c          | 412 ++++++++++++++++++++++++
 tests/tegra/vic40.h          | 285 +++++++++++++++++
 tests/tegra/vic41.c          | 416 ++++++++++++++++++++++++
 tests/tegra/vic41.h          | 372 ++++++++++++++++++++++
 tests/tegra/vic42.c          | 423 +++++++++++++++++++++++++
 tests/tegra/vic42.h          | 597 +++++++++++++++++++++++++++++++++++
 34 files changed, 7248 insertions(+), 263 deletions(-)
 create mode 100644 tegra/channel.c
 create mode 100644 tegra/job.c
 create mode 100644 tegra/pushbuf.c
 create mode 100644 tegra/syncpt.c
 create mode 100644 tests/tegra/drm-test-tegra.c
 create mode 100644 tests/tegra/drm-test-tegra.h
 create mode 100644 tests/tegra/drm-test.c
 create mode 100644 tests/tegra/drm-test.h
 create mode 100644 tests/tegra/gr2d-fill.c
 create mode 100644 tests/tegra/host1x.h
 create mode 100644 tests/tegra/syncpt-timeout.c
 create mode 100644 tests/tegra/syncpt-wait.c
 create mode 100644 tests/tegra/vic-blit.c
 create mode 100644 tests/tegra/vic-clear.c
 create mode 100644 tests/tegra/vic-flip.c
 create mode 100644 tests/tegra/vic.c
 create mode 100644 tests/tegra/vic.h
 create mode 100644 tests/tegra/vic30.c
 create mode 100644 tests/tegra/vic30.h
 create mode 100644 tests/tegra/vic40.c
 create mode 100644 tests/tegra/vic40.h
 create mode 100644 tests/tegra/vic41.c
 create mode 100644 tests/tegra/vic41.h
 create mode 100644 tests/tegra/vic42.c
 create mode 100644 tests/tegra/vic42.h

-- 
2.32.0

