Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23DCC433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 16:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbiEFQoD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 12:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238906AbiEFQnw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 12:43:52 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762FB60DA3
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 09:40:08 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u3so10771664wrg.3
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5XmAlB868Me7XdZm7tKpDsuLZe0k+kDPLDXK6yzVvWA=;
        b=PzJABz2jL/6nfUgPV/pAvQ0bftjwk0rISzuPHbJet20Rn6ESk8rvVp2ER72NRLEpxZ
         as3pyMWT/VlkC9z6gxtjTVcrMtsIiGAQE4kNZYZTJ3QX1HZ/mUfGYegXJ+9h1Nw1qp95
         /sMsd/froLJG8eciRGmO+YnMRUCERElsH/7P0fbu/cnuOJ2ZHbIcYFzeLTgcvt5tFRag
         krnMQ/imDctXRhECMXQlFc46/m4p5S6XQEpN9C/XudvDrQVNEDjeB/f6DxYB6uspP+DM
         RHENUN9HsUhvYI7ySNzIh7uaaX0t91dV2vtRDO28yl94yI/oAxZ8OV3IsPdWwJoW1WlS
         8Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5XmAlB868Me7XdZm7tKpDsuLZe0k+kDPLDXK6yzVvWA=;
        b=srGGFhxLZCad/qvtP8u/8aOo/3FtOe0l8cHvXIJxp4a9MLqR69lninI5g/UW9imZOS
         kUDqqNkrFbKD9gTZ1e0UeJYhOHAJ7/VZR7iNEwS9VGKJS6TRbRRTS+Q/Eyd9WKz5UJ1M
         jK/GZVv15Bq1EPT86TfE8dMudi1OQ/HCvOOCvASHu7tM0ieZ3+eOmv0V5QkNExGS+iuf
         NEUoe8E/v9i4vhr1A8olD0cASkPkk7dzfrX9sKvsfN2K6EL/X+klEYn5A2pj4YRjaygS
         1u+/4xzIfN6EIg6nqi0Ox2xutCtIYGuczmSYRB4Hxj83x2FJ0PZU5KitWZ3WNLh2im9X
         bpSA==
X-Gm-Message-State: AOAM533VXsgZXnYHcClra2SOJ3EAkCeTdpZ1SC9d/v5ZjO8+lWxllNvX
        IumrM1YaYfTbk7/jygqBz7I=
X-Google-Smtp-Source: ABdhPJx97TTbsp/OHW/LF/B6Lbrx21gRnToqU+JQN7hU5s6+zwVIzeuNundhawEpsoEWLnItgOTZPQ==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id a3-20020a056000188300b00205c0cb33c6mr3488480wri.39.1651855206855;
        Fri, 06 May 2022 09:40:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c1d8d00b003942a244f3dsm4913622wms.22.2022.05.06.09.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 09:40:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.19-rc1
Date:   Fri,  6 May 2022 18:40:04 +0200
Message-Id: <20220506164004.3922226-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.19-rc1

for you to fetch changes up to cb7e1abc2c73633e1eefa168ab2dad6e838899c9:

  drm/tegra: gem: Do not try to dereference ERR_PTR() (2022-05-06 15:52:49 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.19-rc1

Only a few fixes this time, and some debuggability improvements.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tegra: vic: Fix unused-function warnings

Jon Hunter (1):
      gpu: host1x: Show all allocated syncpts via debugfs

Randy Dunlap (1):
      gpu: host1x: Fix a kernel-doc warning

Thierry Reding (2):
      gpu: host1x: Do not use mapping cache for job submissions
      drm/tegra: gem: Do not try to dereference ERR_PTR()

 drivers/gpu/drm/tegra/gem.c |  1 +
 drivers/gpu/drm/tegra/vic.c |  5 ++---
 drivers/gpu/host1x/debug.c  | 11 +++++++----
 drivers/gpu/host1x/job.c    |  4 ++--
 include/linux/host1x.h      |  6 ++++++
 5 files changed, 18 insertions(+), 9 deletions(-)
