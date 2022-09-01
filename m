Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55305ECAAD1
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Sep 2022 12:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbiIAMrg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbiIAMrg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Sep 2022 08:47:36 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9BBA440
        for <linux-tegra@vger.kernel.org>; Thu,  1 Sep 2022 05:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662036454; x=1693572454;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kWGME9fEdG3M8HkVb+YATaForw5QOx/3sgZwk3gITYM=;
  b=lPGzrc4SRWC8bQ4sU210q5DBOcqgvpmHoQoF/p1h9aP2a5tuYWQPi5mI
   6O78gBZ5VrdeMkK4iJEDE/V/zRbPY1MhFJokk0C+6Tsx0Yl8eVh8Jl4pa
   jAG0TsgRI9l1h3KQV/xgS69kXRbsve2Im7+sBsDsS8JqA+Q4Z1dRxbQiG
   nlK5hTSXHqIOWLkfKZapdsjK7IALaL3LJ7rs848T7iRTgEo/gOBjsHQft
   lk6eSkKuTMaH+cU95HJDoE7/z8Krt8PPkQcoUfiK7pWdbNPB3NyQxLm8R
   ZHJpWHSozNJi6COCYPiQfYn2FyEgMN9xg51XaxoBKCf57JxlxQRbsRTbV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="276105067"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="276105067"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 05:47:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="642318075"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 05:47:26 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Subject: [PATCH 0/9] drm: convert to using is_hdmi and has_audio from display info
Date:   Thu,  1 Sep 2022 15:47:02 +0300
Message-Id: <cover.1662036058.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The low-hanging fruit of the drm todo item "Replace
drm_detect_hdmi_monitor() with drm_display_info.is_hdmi", with has_audio
changes on top.

I'm afraid not all of these have been even build tested, let alone
actually tested.


BR,
Jani.


Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> 
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org

Jani Nikula (9):
  drm/edid: parse display info has_audio similar to is_hdmi
  drm/nouveau: convert to using is_hdmi and has_audio from display info
  drm/radeon: convert to using is_hdmi and has_audio from display info
  drm/tegra: convert to using is_hdmi from display info
  drm/exynos: convert to using is_hdmi from display info
  drm/i2c/tda998x: convert to using has_audio from display_info
  drm/sti/sti_hdmi: convert to using is_hdmi from display info
  drm/rockchip: cdn-dp: call drm_connector_update_edid_property()
    unconditionally
  drm/rockchip: convert to using has_audio from display_info

 drivers/gpu/drm/drm_edid.c                  |  6 ++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  5 +++--
 drivers/gpu/drm/i2c/tda998x_drv.c           |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  8 ++++----
 drivers/gpu/drm/nouveau/dispnv50/head.c     |  8 +-------
 drivers/gpu/drm/nouveau/nouveau_connector.c |  2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c  | 10 +++++-----
 drivers/gpu/drm/radeon/evergreen_hdmi.c     |  5 ++---
 drivers/gpu/drm/radeon/radeon_audio.c       |  6 +++---
 drivers/gpu/drm/radeon/radeon_connectors.c  | 12 ++++++------
 drivers/gpu/drm/radeon/radeon_display.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c    |  4 ++--
 drivers/gpu/drm/rockchip/cdn-dp-core.c      |  7 +++----
 drivers/gpu/drm/rockchip/inno_hdmi.c        |  3 ++-
 drivers/gpu/drm/sti/sti_hdmi.c              | 11 ++++++-----
 drivers/gpu/drm/sti/sti_hdmi.h              |  2 --
 drivers/gpu/drm/tegra/hdmi.c                |  9 +--------
 include/drm/drm_connector.h                 |  8 ++++++++
 18 files changed, 55 insertions(+), 55 deletions(-)

-- 
2.34.1

