Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D037C433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Mar 2022 12:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbiCAMpQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Mar 2022 07:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234841AbiCAMpO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Mar 2022 07:45:14 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BCC98F5A
        for <linux-tegra@vger.kernel.org>; Tue,  1 Mar 2022 04:44:32 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d17so20294385wrc.9
        for <linux-tegra@vger.kernel.org>; Tue, 01 Mar 2022 04:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NE6g7aBhFEFaU1SdDrP5TjQGRb1erEa1b8QUBNRKP18=;
        b=j8QNPzpBBwBQsNRsgki/IixZuYmjcvTT4n/s4mdWQdEU29kERc5OPyQiZw00O0Q6P1
         4U7qervFacqdo5DSMxwm5qdDcAIhHjlE8VQcCSYnISTmkElcutJFQnYkLU17ZJUpBSX1
         J0wtDaqFPDtSy8xMSaJlAIJArSUuPHYU6nmbF+PabhTXufPApWad9OMVeDB+urqc2tEW
         G0heg/SNI8H/rrcPTZRL4FrLw0x4lqfcqMBlvitAdjExxRrC+7k2cI6Ox9OscZxeF3e7
         S4fwv7u7lUzIYSFZSFla6FCB+7HIDZduKvYzQWEHkGErdYrZT8ZTkNXD4CgtOQ2GzsrR
         Kd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NE6g7aBhFEFaU1SdDrP5TjQGRb1erEa1b8QUBNRKP18=;
        b=EgtwjlkqWqOau6cuvs6sm299iOeHzj+/gPUBhUCNPXDvGjgiRDVSkBpXWL2zx9idHk
         4s8zbDSA9IqMnJNxq/A48z4nZfERhQsyPy9arEct4S99d6MGfV0T/FA/3x+BweaBhTuZ
         ABew0NmsaU5ZoVOxsGYmjvHPKKP6PzltA85hAcP/7QL62LYA5G33BcPgtfbCIlL6chVD
         Z5TJzKNbNcF8qCFzqM93T732IbZlWyEgoT1emnxG3NkcFSGXSmrFIU0VA+6VpKV9ca0Q
         Seoc2P20GW+4vz7kopj1ScLwxUEoXeKl593YgCA4CPQK2CJNAkMPiGzpeWmMVXxyWuhi
         mR+w==
X-Gm-Message-State: AOAM5336qGMDAy/KdapoanFqubD3HaMz0ouF4XDwf9dN2yAChldvyK7a
        w2qx3VJolxT9Zx5d8zz5DB0=
X-Google-Smtp-Source: ABdhPJwpD7PBe27k167crPL9h3picvynqlPbpGDczGmcoFFsSiB9LiyAu9LTQqWF2gPNMOoLBBCXiw==
X-Received: by 2002:a5d:4606:0:b0:1ed:d3c0:19f4 with SMTP id t6-20020a5d4606000000b001edd3c019f4mr20045944wrq.555.1646138671186;
        Tue, 01 Mar 2022 04:44:31 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm13720105wrn.4.2022.03.01.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 04:44:30 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL v2] drm/tegra: Changes for v5.18-rc1
Date:   Tue,  1 Mar 2022 13:44:26 +0100
Message-Id: <20220301124426.1207653-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225163250.1063101-1-thierry.reding@gmail.com>
References: <20220225163250.1063101-1-thierry.reding@gmail.com>
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

for you to fetch changes up to cf5086d35d8c7c2b9cb1ca34590097a5f2f8b588:

  drm/tegra: Support YVYU, VYUY and YU24 formats (2022-03-01 11:13:09 +0100)

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
