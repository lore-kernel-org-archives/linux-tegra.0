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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F25C43462
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D454A6112E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235778AbhDASD1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237019AbhDAR7U (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:59:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E1BC02FEBB
        for <linux-tegra@vger.kernel.org>; Thu,  1 Apr 2021 09:33:27 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id l18so2635013edc.9
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfFpqI43eJgDiJE4Cw9nOr2GFi0mzVDy5zrF8LXVf+0=;
        b=CFJD+VPr916K0gehBZFqH8bQGo8WTKTP31fbZvSFlLTVGKwaBe/DTSx+6zQ5aQyUf0
         yosjwFcrp1uKyQ2vcNVGbwFHz0b/rCWm6uuGtFw26ypI2l0h4DyYAJhyBqijAt/k3SUM
         uw/FUh56Qx0jUABI2r77x3+WLe0th9nN9MAwQx7srdxbop6lMWagadQgNbp+2vDe6Whx
         GYRTndqN+hB5V68H26tIOPVfdOzEm+sFrJ6P8OQ9kkrL2QggUrD2gVm0J5TZ/QbRhCg5
         0B9RA4GvNfBWgefXy9VcD1eXyjjuSojJOh7TBIqagwx5MUZf5i+QwuepJjIQKhiBxhIc
         tSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nfFpqI43eJgDiJE4Cw9nOr2GFi0mzVDy5zrF8LXVf+0=;
        b=V/KUFNBs3bi8fJlfHfGda4vjW9DzjdkNGKHKNK7OWiNYq5qM2ZbQbVXGtUbYxdT8jb
         zESfxGGxzo5Jff5i7xAVCDGb1BHJ+jp6qyTMLkfaSxkKA1RZC0suEHiSZN7IhElMJP+1
         c6EBf6fN1lFHfyx/fHz6ZsFsxdP1nyTghcU6U5amSTe/QzwLCbgFaEuKg3f1MQanKj74
         a0lqeIAtHm6T71kdQZsaIzosLw0lR/KEoJmTDt1edbtgFY50Efc7X+lL+3okkzY+4+88
         0oG1MekfFsAZMDVtZzSCDcN+q5UbA9fH+PJFCEThRysrCWg2UdMa5MZRHfrP0rCh7WTT
         zroQ==
X-Gm-Message-State: AOAM533QJQbwvM/s7QQtrad2RPGsClbBRzuoBaZWal3UKaKcxKuEBh4r
        7beQpF/MT+ZqKJ7ltBQ+n+w=
X-Google-Smtp-Source: ABdhPJy9X2kL/rAMLcFBwpaXEzx4be0cmrVI1XATJ4YBuUp7KPU3K4BY+1azqmitwoigIukeyAT/Gw==
X-Received: by 2002:aa7:c150:: with SMTP id r16mr10710923edp.96.1617294806265;
        Thu, 01 Apr 2021 09:33:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q16sm3927233edv.61.2021.04.01.09.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:33:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.12-rc6
Date:   Thu,  1 Apr 2021 18:33:52 +0200
Message-Id: <20210401163352.3348296-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.12-rc6

for you to fetch changes up to ac097aecfef0bb289ca53d2fe0b73fc7e1612a05:

  drm/tegra: sor: Grab runtime PM reference across reset (2021-03-30 19:51:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.12-rc6

This contains a couple of fixes for various issues such as lockdep
warnings, runtime PM references, coupled display controllers and
misconfigured PLLs.

----------------------------------------------------------------
Dmitry Osipenko (1):
      drm/tegra: dc: Don't set PLL clock to 0Hz

Mikko Perttunen (1):
      gpu: host1x: Use different lock classes for each client

Thierry Reding (2):
      drm/tegra: dc: Restore coupling of display controllers
      drm/tegra: sor: Grab runtime PM reference across reset

 drivers/gpu/drm/tegra/dc.c  | 30 +++++++++++++-----------------
 drivers/gpu/drm/tegra/sor.c |  7 +++++++
 drivers/gpu/host1x/bus.c    | 10 ++++++----
 include/linux/host1x.h      |  9 ++++++++-
 4 files changed, 34 insertions(+), 22 deletions(-)
