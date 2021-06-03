Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA6EC47082
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 14:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3234F613F1
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 14:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFCOqe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 10:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhFCOqd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 10:46:33 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10644C06174A
        for <linux-tegra@vger.kernel.org>; Thu,  3 Jun 2021 07:44:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id jt22so9628771ejb.7
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZXLqiOa12mOANiH6iRvvdtf+Rzu4NjYP7cxzBWRRCz4=;
        b=O0htkDFetyqZPg96aJ4tEwmk+QMgeSEg2Cv+gVKdr6Z9NSw8vhRn3vABWRYmsuLHWT
         kv8mSJepTmxi9cEk5vQn320xfh7Wrv83OUHQOUxybeGIFOcvRWtVBQAEhYyZ8jvNP5u5
         p1wScg4sc0rmtwnV3JhF47uPFshJkPPG8l7oxYgxOj+8qR7tXCmneMODUHQUqYfUzZoA
         GS2KG5PSdqIZFAVQjQDnRGnJreoKxTdiYCe29qlY2Mk8eoJRykrysnitYGIvOeTgotaB
         j5J+7da/rB3JTRrZnuJDyCHIUEx8Jlq4w7nsRTlTG95O8gUjyjRVMegoTs1C1F9vebHS
         RXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZXLqiOa12mOANiH6iRvvdtf+Rzu4NjYP7cxzBWRRCz4=;
        b=ffokXBzMD6I4PR/+/aUo/drWybdpIU7Cn5FOzCeVxiiqGKCOpEjqtSp5qbBTl0rxOa
         yb9W3BNjT/ZgW8sfP1T3Wi4n584SBSK69vbXaD0rTHd80A9jBrTyiAI62p3mveX17bxd
         t3TUjiwp/aubq01vFpFMCoGnCAaaPKPvjEkjHvTb6ye+lWjczkLkqy0TTs6BXF0LdgW+
         QVKxW8rYT5lRJ7uoQRufpoaRlUcdji+puCkVq6cru3GQJKKYDvrVbmJKs8AWMtev9rHp
         WEouvpKd6tX5+oBJRNojJswijvz5/zNarent2i+lDjr8S73HYIPPZJ6G+qG0hbm8BDP7
         NCsA==
X-Gm-Message-State: AOAM530VOvOaH59zx4vKJehcB44E1jZryr5dKeVg2LlPk+bi9dgdNj+Q
        mFcPqllbDnsYs4eI9Jcs1vo=
X-Google-Smtp-Source: ABdhPJyStZwDn50aWLKiU71mTpym6Ev22KVpxVwBfFs2WgoyNdMlal60WPPy4AWvFhNSuuJ3djKucg==
X-Received: by 2002:a17:907:7b9e:: with SMTP id ne30mr24962413ejc.389.1622731487699;
        Thu, 03 Jun 2021 07:44:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v1sm1558622ejw.117.2021.06.03.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:44:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.13-rc5
Date:   Thu,  3 Jun 2021 16:46:24 +0200
Message-Id: <20210603144624.788861-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.13-rc5

for you to fetch changes up to 671cc352acd3e2b2832b59787ed8027d9f80ccc9:

  drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT (2021-05-31 14:29:44 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.13-rc5

The most important change here fixes a race condition that causes either
HDA or (more frequently) display to malfunction because they race for
enabling the SOR power domain at probe time.

Other than that, there's a couple of build warnings for issues
introduced in v5.13 as well as some minor fixes, such as reference leak
plugs.

----------------------------------------------------------------
Dmitry Osipenko (1):
      drm/tegra: Correct DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT

Lyude Paul (1):
      drm/tegra: Get ref for DP AUX channel, not its ddc adapter

Nathan Chancellor (1):
      drm/tegra: Fix shift overflow in tegra_shared_plane_atomic_update

Pavel Machek (CIP) (1):
      drm/tegra: sor: Do not leak runtime PM reference

Thierry Reding (3):
      gpu: host1x: Split up client initalization and registration
      drm/tegra: sor: Fully initialize SOR before registration
      drm/tegra: sor: Fix AUX device reference leak

 drivers/gpu/drm/tegra/drm.h |  2 +-
 drivers/gpu/drm/tegra/hub.c |  2 +-
 drivers/gpu/drm/tegra/sor.c | 70 +++++++++++++++++++++++++++------------------
 drivers/gpu/host1x/bus.c    | 30 +++++++++++++++----
 include/linux/host1x.h      | 30 +++++++++++++++----
 5 files changed, 92 insertions(+), 42 deletions(-)
