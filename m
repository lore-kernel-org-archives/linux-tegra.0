Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063A4C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Feb 2022 16:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243011AbiBYQdf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Feb 2022 11:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243027AbiBYQda (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Feb 2022 11:33:30 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41504A8ED3
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:32:54 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d28so5348597wra.4
        for <linux-tegra@vger.kernel.org>; Fri, 25 Feb 2022 08:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pcnpMGkUTwrOq6wVD6KDZaXy5/GdTI9lT9U97nS7O4s=;
        b=OT2dbyd+i3BammGBmQ7seIq+G/W89xOguMk7ZOmU3RGt+q+4q5MOMApY2hmn1v4ZtS
         tRWfhh6zV8GBPDv4M4WgpjiAcIISYhGN62/un1z6+/nOOGGZZWPVecsX4NL6MPjH6hSK
         aPM9DX2aNuk4Saw4NyJvi+dfgL1B5g00JPqzDvL1lI86n4jwEE5zozq69DuRVLXiz2tb
         oeRZ4loKnhca4NC10OovgafbKlSFMcIUXrIEykKiv+pNn08tAbcjWLE04l9loLcHWCnA
         MPOH0XkCZjT4XDGkLHt37wTw17Tyn3XsE4k62M0tmr4IZyifU7DNQuPXO+srQaH/JAKg
         gcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pcnpMGkUTwrOq6wVD6KDZaXy5/GdTI9lT9U97nS7O4s=;
        b=jQnvMGyFAVce2ldFRVf7rrWA1Op/xKz1Zvhke4H7OtgXfZGK/EZg9YJOzritEv6Ks9
         huh/1L4Oof+9HpijBi3mPOvXuk1LJJ3mIVo2m1rDuYo24FB1dE307lgThP373L+eAPOK
         gBwXJkoyjAKlCqzJAv7Ib94Ra9MXo4LBx9jtKqeXYuBfBiU+kZbepm40nSgPPrcIicPV
         VXIvimqJvzVlOXCPcl7s/Kc8qKYA6piuYXp7tZURxEGH+UZUkM/rHuxbSpG/nFAZyLzH
         1Otr32HTdxwll9lw3GDK9cYNtNWrbNq8tXxH7qCOTTz+LJib9ifSBf0fppYF0+V3+nTT
         NY/Q==
X-Gm-Message-State: AOAM5319j698F/Ukvsg6crNQmShnofEfSRh7wE2NZeTMNRJGrvp0XgBw
        jHJKJlwffdI324CIQjahA2s=
X-Google-Smtp-Source: ABdhPJxHrcf/hcepc+TJ2lVBWStLolYNEo/QWbjcFrnuG5b+myntxby6A1xyg7CzQ3cgZOw640/yTQ==
X-Received: by 2002:a5d:410c:0:b0:1ef:766b:ef5b with SMTP id l12-20020a5d410c000000b001ef766bef5bmr1692763wrp.183.1645806772593;
        Fri, 25 Feb 2022 08:32:52 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b001edc107e4f7sm3985207wrq.81.2022.02.25.08.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:32:51 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.18-rc1
Date:   Fri, 25 Feb 2022 17:32:50 +0100
Message-Id: <20220225163250.1063101-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit 8913e1aea4b32a866343b14e565c62cec54f3f78:

  drm/tegra: dpaux: Populate AUX bus (2022-02-23 13:00:37 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.18-rc1

for you to fetch changes up to b53c24f69199b88671293de503f1f999a762f4f9:

  drm/tegra: Support YVYU, VYUY and YU24 formats (2022-02-25 16:37:40 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.18-rc1

This contains a couple more minor fixes that didn't seem urgent enough
for v5.17. On top of that this improves YUV format support on older
chips.

----------------------------------------------------------------
Christophe JAILLET (2):
      gpu: host1x: Fix an error handling path in 'host1x_probe()'
      gpu: host1x: Fix a memory leak in 'host1x_remove()'

Dmitry Osipenko (1):
      drm/tegra: Use dev_err_probe()

Miaoqian Lin (1):
      drm/tegra: Fix reference leak in tegra_dsi_ganged_probe

Thierry Reding (3):
      drm/tegra: Fix planar formats on Tegra186 and later
      drm/tegra: Support semi-planar formats on Tegra114+
      drm/tegra: Support YVYU, VYUY and YU24 formats

chiminghao (1):
      drm/tegra: dpaux: Remove unneeded variable

 drivers/gpu/drm/tegra/dc.c    | 50 ++++++++++++++++++-----------
 drivers/gpu/drm/tegra/dc.h    |  7 +++++
 drivers/gpu/drm/tegra/dpaux.c |  3 +-
 drivers/gpu/drm/tegra/dsi.c   |  4 ++-
 drivers/gpu/drm/tegra/hdmi.c  | 34 ++++++--------------
 drivers/gpu/drm/tegra/hub.c   | 24 ++++++++------
 drivers/gpu/drm/tegra/plane.c | 73 ++++++++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/plane.h |  2 +-
 drivers/gpu/host1x/dev.c      |  8 +++--
 9 files changed, 140 insertions(+), 65 deletions(-)
