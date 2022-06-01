Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C22C4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Jun 2022 10:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbiFAKFf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Jun 2022 06:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351872AbiFAKE5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Jun 2022 06:04:57 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0163F8B2
        for <linux-tegra@vger.kernel.org>; Wed,  1 Jun 2022 03:03:40 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id y24so670419wmq.5
        for <linux-tegra@vger.kernel.org>; Wed, 01 Jun 2022 03:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fDESduiqeDUdczoJ6Fv4btIu6tiSoUo0J3rQKZ/xYis=;
        b=T6oTt7BEdJaAcew2vNrT8re+CQk0A5bt+/rhexe3HE9dNR/NgMZnKKxZK9L58bcihk
         U/hWeND0gykKQhflEguBdI4c9B2GMbHYZ3sESMZPKT/99KB+5UUREHB+RhH9G0SBnjYH
         KFWmyj2bStU0GcDsLsBTzKFSIrXGT0g59scazBhSaUmGIhYcXriDIbw4jxkVZIEwLoxA
         xpNUgZrL7AVY0sD2nIOa4pu7D/qc+xZqP8zOPExeYUxHraIn7+YqZmveDcb6+0qZDoF+
         s9WCBfG0Qtbw1rRAWQemZLxhHqxGcPpznO4Olbyz1+p293Kg7Xnjw73/Z3JjgrHALq6t
         lnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fDESduiqeDUdczoJ6Fv4btIu6tiSoUo0J3rQKZ/xYis=;
        b=6r+kaux6dDa56z6eo9gmrYKqY25u4IgjL/BSewCuj3HxOWFL5IBos/WfzrDOPxgjI4
         spT7nsE1zAoPB4CDz8K0IAUoJoaVVW0y8DCV6+IjC8SAMyT+dlmz2AlMy/liHKUHOqxO
         jV5FDCR95dOfQQoJPwiT56XdTim+mYvasgj6R+7TtUHOITgRd9E0bHwPyy6EY+pzk2Lg
         1serILKRsN6GQRy08Xvo71OG+njRH6f5rOq2TUgru/DIb1ZTELT6ZJM2MnMmom4piX4H
         2KURHSLhZiaxFGt9/6V/qD7FLZZCKjbliCiEcyWV9aKjvbJhvYj1R3SvrICtMz0CssEF
         /5DA==
X-Gm-Message-State: AOAM530ykt2KI5SrEzk8u5+qia1QkL5FP41AgKt3N1XmFouW28YhB0QP
        AsVYT/DecbX0xzNebCazQ7Q=
X-Google-Smtp-Source: ABdhPJw6JdSDeKJqxdfa0rmKW4BlLHfkEJjPchGzUVGCCSNxDOG8c2PaUjb+3Nr2MUNurvvVI5PWKw==
X-Received: by 2002:a05:600c:384c:b0:398:e5d2:bfc9 with SMTP id s12-20020a05600c384c00b00398e5d2bfc9mr19734446wmr.180.1654077818694;
        Wed, 01 Jun 2022 03:03:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k12-20020adfd84c000000b0021126891b05sm863013wrl.61.2022.06.01.03.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 03:03:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Preparatory work for v5.19
Date:   Wed,  1 Jun 2022 12:03:35 +0200
Message-Id: <20220601100335.3841301-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit cb7e1abc2c73633e1eefa168ab2dad6e838899c9:

  drm/tegra: gem: Do not try to dereference ERR_PTR() (2022-05-06 15:52:49 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.19-prep-work

for you to fetch changes up to 597b89d30b42dcc8e6b262e6876b42dde66f97f0:

  gpu: host1x: Add context bus (2022-06-01 11:50:42 +0200)

I realize that this is quite late, but as mentioned in the tag
description, this doesn't actually add anything new and is only
to simplify dependency handling for a new feature that we have
planned for v5.20, so it'd be great if we can still get this
in.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Preparatory work for v5.19

This contains a single patch from a series that's ready to go for v5.10
but is also a shared build-time dependency for an IOMMU series that is
planned for v5.20. The idea is to take this into v5.19 to fulfill that
dependency and remove the need for close coordination for the two
series.

----------------------------------------------------------------
Mikko Perttunen (1):
      gpu: host1x: Add context bus

 drivers/gpu/Makefile               |  3 +--
 drivers/gpu/host1x/Kconfig         |  5 +++++
 drivers/gpu/host1x/Makefile        |  1 +
 drivers/gpu/host1x/context_bus.c   | 31 +++++++++++++++++++++++++++++++
 include/linux/host1x_context_bus.h | 15 +++++++++++++++
 5 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/host1x/context_bus.c
 create mode 100644 include/linux/host1x_context_bus.h
