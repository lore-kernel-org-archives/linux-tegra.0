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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42CFC433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62D6264DEB
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 19:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhA2Tiz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 14:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233042AbhA2Tiw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 14:38:52 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAFFC061573
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:38:11 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id n14so5019140qvg.5
        for <linux-tegra@vger.kernel.org>; Fri, 29 Jan 2021 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4fGzrN6PFTAJYkRPyb9kzsjSHgmSvwhuhlysknOYXYA=;
        b=i6oSb7UAaMqU4PIDGWm0yU7Y/uPJJh1eDrYwsw3CF/XyUsSZAr9es25MVA2DGtlBFz
         u7rhUfXmjPZeIKdsIN/pY4LwCDQzqLl8oYX0AUHSjMyfQs+BHCa7KAOE/Naw9LO7Vxrw
         ZRjzLLaejtrFnBuNSrHN5Hc6hyow6BWajlW8OC9xDNUtK4a8CJE6R8q4P0lCCOHWOd+B
         JM50toQNcZke7C0UdF60Zcnt0cqe1wUU1qzLZ8gZuK7e9qQnS3BjBA9E0f6RvLWm18lR
         5InP1O48dP07vCLuj4Eq+I3ISlmtCgGEbWfxwiwOJPqGd46oObORvcm3qVMzSBMcE/c9
         7lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4fGzrN6PFTAJYkRPyb9kzsjSHgmSvwhuhlysknOYXYA=;
        b=Qui3rhMCbDcs9U7+FpcPKz+TIAHlhenOaj8wY3WRCvl/qgCwSRbcz4sbLsuQYG9vb8
         67AsC4bkzMlFVi/T02T/hC99gk6w9Zu2L5DvO2rhYGJrsQB6ztlez+1eGKWEEvAbI5m7
         QcCakqp0m7+10R5Eedt5DYs21nrUwCvkZz8csMHozmIY8tNfRuQm6iGpU8vroprmOUaf
         /K8BR1fKn9sm4GvV2Wsfxm2qxHYXtscjf1ctV7I5lcCc+XzM0YKmFi7TlAeW6nRNE3RK
         c/9/oqCYZxju+rXDf8XovyNe2QXZbZ5w/M1B4iFNwsCLXaCTsR/d7WpikjNTdxyViYHl
         daNA==
X-Gm-Message-State: AOAM530QEBB3p1AvZx30pzUkj5nW/m7+CWLBUm4pRS6G6gT5Gzc+H51Q
        A/QGyWZwCTV5uPREjcS0G6A=
X-Google-Smtp-Source: ABdhPJytot/Qn5Gn2Zuh5rqErTSAuk9UolhUla6tra+YOX2FqMS77YGZywgL7wPppFvu2Vop4MVMlg==
X-Received: by 2002:a0c:b4d1:: with SMTP id h17mr5299486qvf.53.1611949091101;
        Fri, 29 Jan 2021 11:38:11 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r17sm6389910qta.78.2021.01.29.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:38:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.12-rc1
Date:   Fri, 29 Jan 2021 20:38:07 +0100
Message-Id: <20210129193807.3653456-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.12-rc1

for you to fetch changes up to dcdfe2712b68f1e9dbf4f1a96ad59b80e5cc0ef7:

  drm/tegra: Fix reference leak when pm_runtime_get_sync() fails (2021-01-15 17:24:51 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.12-rc1

Adds support for newer firmware image versions of the Video Image
Composer (VIC) and adds a comment clarifying the use of the STREAMID
registers. Fixes a couple of issues with display and gr2d on older
Tegra SoCs such as Tegra114, as well as a runtime PM reference leak.

----------------------------------------------------------------
Dmitry Osipenko (3):
      drm/tegra: dc: Enable display controller driver for Tegra114
      drm/tegra: gr2d: Correct swapped device-tree compatibles
      drm/tegra: gr2d: Add compatible for Tegra114

Mikko Perttunen (2):
      drm/tegra: falcon: Support newer VIC firmware
      drm/tegra: vic: Add comments on STREAMID registers

Qinglang Miao (1):
      drm/tegra: Fix reference leak when pm_runtime_get_sync() fails

 drivers/gpu/drm/tegra/dc.c     |  2 +-
 drivers/gpu/drm/tegra/drm.c    |  2 ++
 drivers/gpu/drm/tegra/dsi.c    |  2 +-
 drivers/gpu/drm/tegra/falcon.c |  9 +++++----
 drivers/gpu/drm/tegra/gr2d.c   |  9 +++++++--
 drivers/gpu/drm/tegra/hdmi.c   |  2 +-
 drivers/gpu/drm/tegra/hub.c    |  2 +-
 drivers/gpu/drm/tegra/sor.c    |  2 +-
 drivers/gpu/drm/tegra/vic.c    | 35 ++++++++++++++++++++++++++---------
 9 files changed, 45 insertions(+), 20 deletions(-)
