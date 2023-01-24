Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F49AC61D97
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234232AbjAXNkQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjAXNkO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:40:14 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A411BE5;
        Tue, 24 Jan 2023 05:40:12 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A31021FDAB;
        Tue, 24 Jan 2023 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674567611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=uuz5Gc28I72toEzheVihb1NwF+5uagOX/baEUlcny3Q=;
        b=hnjjRtK70vrWP/7Gtb7cZ/1R+kREJ760PS5GaDoZ12OKFhjC/IJkKqbnIDlkSQ2i8iN/eR
        LmTVJbR345Pgjx6cv9/5L/IiyA63fue54pngFshqdFQuPjW+Gju/4twDP5JSW4i0LyMGUO
        LVGUnTNvkGbdjxhzQmOIXoLYSTqUwYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674567611;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=uuz5Gc28I72toEzheVihb1NwF+5uagOX/baEUlcny3Q=;
        b=vx6CvAe2lKURVdi0Scdb3/tFfnQYlvS5+85D0ZsHJ1qgDXPb0/H8RdzQNDJ+rsyJdgoioW
        AdAQeQgWurK1DFCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5CC6913487;
        Tue, 24 Jan 2023 13:40:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5SCjFbvfz2PWZgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:11 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/10] drm/fb-helper: Various cleanups
Date:   Tue, 24 Jan 2023 14:40:00 +0100
Message-Id: <20230124134010.30263-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add various cleanups and changes to DRM's fbdev helpers and the
generic fbdev emulation. There's no clear theme here, just lots
of small things that need to be updated.
 
In the end, the code will better reflect which parts are in the 
DRM client, which is fbdev emulation, and which are shared fbdev
helpers.

v2:
	* cleanups in drm_fbdev_fb_destroy() (Sam)
	* fix declaration of drm_fb_helper_unprepare()

Thomas Zimmermann (10):
  drm/client: Test for connectors before sending hotplug event
  drm/client: Add hotplug_failed flag
  drm/fb-helper: Introduce drm_fb_helper_unprepare()
  drm/fbdev-generic: Initialize fb-helper structure in generic setup
  drm/fb-helper: Remove preferred_bpp parameter from fbdev internals
  drm/fb-helper: Initialize fb-helper's preferred BPP in prepare
    function
  drm/fbdev-generic: Minimize hotplug error handling
  drm/fbdev-generic: Minimize client unregistering
  drm/fbdev-generic: Inline clean-up helpers into drm_fbdev_fb_destroy()
  drm/fbdev-generic: Rename struct fb_info 'fbi' to 'info'

 drivers/gpu/drm/armada/armada_fbdev.c      |   4 +-
 drivers/gpu/drm/drm_client.c               |  10 ++
 drivers/gpu/drm/drm_fb_helper.c            |  58 ++++++---
 drivers/gpu/drm/drm_fbdev_generic.c        | 131 ++++++++-------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |   4 +-
 drivers/gpu/drm/gma500/framebuffer.c       |   4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c |  11 +-
 drivers/gpu/drm/msm/msm_fbdev.c            |   4 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |   4 +-
 drivers/gpu/drm/radeon/radeon_fb.c         |   4 +-
 drivers/gpu/drm/tegra/fb.c                 |   7 +-
 include/drm/drm_client.h                   |   8 ++
 include/drm/drm_fb_helper.h                |   8 +-
 13 files changed, 134 insertions(+), 123 deletions(-)


base-commit: 7d3e7f64a42d66ba8da6e7b66a8d85457ef84570
-- 
2.39.0

