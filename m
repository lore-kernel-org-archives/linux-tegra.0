Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F14C48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A44F613CA
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhFKQwW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhFKQwV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:52:21 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4160AC061574
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:50:23 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso8960542wmj.2
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nVmUib6sDfDxsq9PQu+EpPYJQfq0CrzzM05aiercm/U=;
        b=KhhZl/b2Ow3W3yc2DcOr0wyxc3rUaJAjd1ueuuU/Y9RCqpWRkC2VDwJ53fipizSte3
         clfOV8Y+wC38okeLQyYfXvYpCrUBRFvCEIH7nSR5S2zStuRmlOAvT8DxHk6+OJ49eqqF
         jFSpNLnrf5P/ZIWDbpPhLyDz0dDP35sbQaX08u7ofZs5rXQ/UHgF56FKrV7SPQZ4p+KM
         pgBwBJ6T/O6EE0Re24ilA31254pb+TmpDMiFmva7JCgbObT5hU7eHmZR1sSL5jXJ8mho
         fbzCS1Qber1ydUEBmw6vNnV3thhtT4VWRnI82dk+rShSU9PVekwpkifuBjAWYxa6qmzU
         EjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nVmUib6sDfDxsq9PQu+EpPYJQfq0CrzzM05aiercm/U=;
        b=omUG/TRvBYRkmWuhUNX9Nu9CJJ73T7pfCGvs6B35ub2T7QD7DBkMnv66gKRAsRiOyz
         lmh/hRYR7x8ZGqMwN8l+VHn4n+3w9BVncBANbbPbxF/1qIUgXfTH4UyL3WWhpTBfWSOQ
         K5ZB5KySlMoDo9Q5RB/CFK+lm6fb6MPObNoO/CG2zWXcZTEP2hl6tWgVkq3SsxejcjKf
         6fJr+XEEoQjLrcwN4C1eQa2v2ZwLohLOtxwpV7kA++0IApuvpSVygibp9uj8S90u4/E3
         FyyO7XOCSjx7kOQmdwkQ+ljNh74UydAgBNIcgP4IKZhxr74QRA/YSlHihqlQO2PTKyyG
         Y0zw==
X-Gm-Message-State: AOAM533w85pVLxvBt7qeJS3rpFbBPOrkLk2s8XxiHwcLNLaLwr56rnZ+
        IAk1VtyGNp3AMHLx0xElRMU=
X-Google-Smtp-Source: ABdhPJwUq5NIrEyc+uROlerUgrn1IVIULU9QdvwWIINCESl1ccBvHB535Tag9zaAcvORuocModFwlA==
X-Received: by 2002:a05:600c:430a:: with SMTP id p10mr4956881wme.155.1623430221767;
        Fri, 11 Jun 2021 09:50:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r3sm6307970wmq.8.2021.06.11.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:50:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:51:57 +0200
Message-Id: <20210611165157.3569315-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 671cc352acd3e2b2832b59787ed8027d9f80ccc9:

  drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT (2021-05-31 14:29:44 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.14-rc1

for you to fetch changes up to 46f99eebda08963e24efdacec5c95fc66b90f600:

  drm/tegra: Don't call SET_APPLICATION_ID in VIC boot (2021-06-11 18:48:36 +0200)

Note that I've based this on the drm/tegra/for-5.13-rc5 fixes PR that
I sent out last week for simplicity.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.14-rc1

The two major changes here are fixed YUV support as well as scaling on
Tegra186 and later. This allows Tegra DRM to be used, for example, as a
video sink for the kmssink gstreamer plugin. The remainder of the
changes are minor fixes.

----------------------------------------------------------------
Mikko Perttunen (1):
      drm/tegra: Don't call SET_APPLICATION_ID in VIC boot

Tan Zhongjun (1):
      drm/tegra: Remove superfluous error messages around platform_get_irq()

Thierry Reding (2):
      drm/tegra: hub: Fix YUV support
      drm/tegra: hub: Implement basic scaling support

 drivers/gpu/drm/tegra/dc.c    |   2 +-
 drivers/gpu/drm/tegra/dc.h    |  26 ++++++
 drivers/gpu/drm/tegra/dpaux.c |   4 +-
 drivers/gpu/drm/tegra/hub.c   | 182 +++++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/tegra/plane.c |  23 +++++-
 drivers/gpu/drm/tegra/plane.h |   3 +-
 drivers/gpu/drm/tegra/vic.c   |   2 -
 drivers/gpu/drm/tegra/vic.h   |   1 -
 8 files changed, 223 insertions(+), 20 deletions(-)
