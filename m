Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB649C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 13:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8696561460
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 13:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhENNza (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 May 2021 09:55:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:58256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhENNza (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 May 2021 09:55:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B88A96145D;
        Fri, 14 May 2021 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621000458;
        bh=haYYppupxvHuhUIKA3QMcFKRuxX9YTEisX5WRN7glNs=;
        h=From:To:Cc:Subject:Date:From;
        b=JITqAa6PVGHDm2jgSPG4RO7XwojkLMDFukp6ytGeWwTHklP1fCLIetId/duPWnh3C
         xJTMtQwZ4ujnRrTZiCIEoTPGJv4HWvsYzcO79j2k5r3gvyD4CCcvLQD59snvjDXDOQ
         H/+XhRIEMe+puYhqVqT5RwqZHhzB6jaSiIF4IfertEVkeRzeT0cdf5XlQVW9GM2uki
         ICnmPEpnJEDSYPQvcYytX1c4PB7sJnJ1m8e3IJGkP70Tm3v1OtaOM932QMdPVSeOry
         PFK4dkmjRhJOclJA0yXO4GVSAideUMgDD0qOuB5RWxUma9iMaFxM5KBGAlP1h5TNWh
         7sU3Qi+fEoAfg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: fix 32-bit DMA address calculation
Date:   Fri, 14 May 2021 15:53:18 +0200
Message-Id: <20210514135328.2543521-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gcc points out an invalid bit shift operation on 32-bit architectures
with 64-bit dma_addr_t:

drivers/gpu/drm/tegra/hub.c: In function 'tegra_shared_plane_atomic_update':
include/vdso/bits.h:7:40: error: left shift count >= width of type [-Werror=shift-count-overflow]
    7 | #define BIT(nr)                 (UL(1) << (nr))
      |                                        ^~
drivers/gpu/drm/tegra/hub.c:513:25: note: in expansion of macro 'BIT'
  513 |                 base |= BIT(39);
      |                         ^~~

Use the correct BIT_ULL() macro to always generate a 64-bit mask.
Fixes: 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 79bff8b48271..bfae8a02f55b 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -510,7 +510,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	 * dGPU sector layout.
 	 */
 	if (tegra_plane_state->tiling.sector_layout == TEGRA_BO_SECTOR_LAYOUT_GPU)
-		base |= BIT(39);
+		base |= BIT_ULL(39);
 #endif
 
 	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);
-- 
2.29.2

