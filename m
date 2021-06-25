Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29498C48BC2
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 08:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1390E61436
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 08:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhFYIYs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Jun 2021 04:24:48 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:41830 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhFYIYr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 04:24:47 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C3B8921C23;
        Fri, 25 Jun 2021 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=xmMBjdIQxn88DbEVG5TvHaTNv0fMM7Fk0W+dtuw1P5k=;
        b=c8mqqRyyGvgW96sIBzNkUvBvL9cL2p9CBVkbGrhlqk7HC6jdBkgB+8HQzxgWo22Kj6axOs
        fz/qKGkTy37Qgctvsv5asTkubcrcsvEvHyAxx9AqUmS7WqfIk64opdOyOxjF+V29YhUKKL
        /EB3+wqaeeW+1GcazmAh0rrp7atuNKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609344;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=xmMBjdIQxn88DbEVG5TvHaTNv0fMM7Fk0W+dtuw1P5k=;
        b=rpkFMIxIqKtJO2iW62YOJLHcKB93dVaWkjMtNJVNDBMDnIW1WJDAPufXr013u+Ngc7k7bZ
        4iFa6YeY3o7yg8CA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 9B57111A97;
        Fri, 25 Jun 2021 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=xmMBjdIQxn88DbEVG5TvHaTNv0fMM7Fk0W+dtuw1P5k=;
        b=c8mqqRyyGvgW96sIBzNkUvBvL9cL2p9CBVkbGrhlqk7HC6jdBkgB+8HQzxgWo22Kj6axOs
        fz/qKGkTy37Qgctvsv5asTkubcrcsvEvHyAxx9AqUmS7WqfIk64opdOyOxjF+V29YhUKKL
        /EB3+wqaeeW+1GcazmAh0rrp7atuNKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609344;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=xmMBjdIQxn88DbEVG5TvHaTNv0fMM7Fk0W+dtuw1P5k=;
        b=rpkFMIxIqKtJO2iW62YOJLHcKB93dVaWkjMtNJVNDBMDnIW1WJDAPufXr013u+Ngc7k7bZ
        4iFa6YeY3o7yg8CA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id Ky8IJT+S1WAISwAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:23 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, yannick.fertre@foss.st.com,
        philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, wens@csie.org,
        jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, jani.nikula@linux.intel.com,
        rodrigo.vivi@intel.com, linux@armlinux.org.uk,
        kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 00/27] Deprecate struct drm_device.irq_enabled
Date:   Fri, 25 Jun 2021 10:21:55 +0200
Message-Id: <20210625082222.3845-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Remove references to struct drm_device.irq_enabled from modern
DRM drivers and core.

KMS drivers enable IRQs for their devices internally. They don't
have to keep track of the IRQ state via irq_enabled. For vblanking,
it's cleaner to test for vblanking support directly than to test
for enabled IRQs.

The first 3 patches replace uses of irq_enabled that are not
required.

Patch 4 fixes vblank ioctls to actually test for vblank support
instead of IRQs (for KMS drivers).

The rest of the patchset removes irq_enabled from all non-legacy
drivers. The only exceptions are i915 and omapdrm, which have an
internal dpendency on the field's value. For these drivers, the
state gets duplicated internally.

With the patchset applied, drivers can later switch over to plain
Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.

v4:
	* avoid preprocessor ifdef in drm_wait_vblank_ioctl()
	  (Jani, Thierry)
v3:
	* update armada, i915, rcar-du and vkms as well (Laurent)
	* optimize drm_wait_vblank_ioctl() for KMS (Liviu)
	* move imx/dcss changes into their own patch (Laurentiu)
	* doc cleanups
v2:
	* keep the original test for legacy drivers in
	  drm_wait_vblank_ioctl() (Daniel)

Thomas Zimmermann (27):
  drm/amdgpu: Track IRQ state in local device state
  drm/hibmc: Call drm_irq_uninstall() unconditionally
  drm/radeon: Track IRQ state in local device state
  drm: Don't test for IRQ support in VBLANK ioctls
  drm/armada: Don't set struct drm_device.irq_enabled
  drm/i915: Track IRQ state in local device state
  drm/komeda: Don't set struct drm_device.irq_enabled
  drm/malidp: Don't set struct drm_device.irq_enabled
  drm/exynos: Don't set struct drm_device.irq_enabled
  drm/kirin: Don't set struct drm_device.irq_enabled
  drm/imx: Don't set struct drm_device.irq_enabled
  drm/imx/dcss: Don't set struct drm_device.irq_enabled
  drm/mediatek: Don't set struct drm_device.irq_enabled
  drm/nouveau: Don't set struct drm_device.irq_enabled
  drm/omapdrm: Track IRQ state in local device state
  drm/rcar-du: Don't set struct drm_device.irq_enabled
  drm/rockchip: Don't set struct drm_device.irq_enabled
  drm/sti: Don't set struct drm_device.irq_enabled
  drm/stm: Don't set struct drm_device.irq_enabled
  drm/sun4i: Don't set struct drm_device.irq_enabled
  drm/tegra: Don't set struct drm_device.irq_enabled
  drm/tidss: Don't use struct drm_device.irq_enabled
  drm/vc4: Don't set struct drm_device.irq_enabled
  drm/vkms: Don't set struct drm_device.irq_enabled
  drm/vmwgfx: Don't set struct drm_device.irq_enabled
  drm/xlnx: Don't set struct drm_device.irq_enabled
  drm/zte: Don't set struct drm_device.irq_enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c         |  6 +++---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c |  4 ----
 drivers/gpu/drm/arm/malidp_drv.c                |  4 ----
 drivers/gpu/drm/armada/armada_drv.c             |  2 --
 drivers/gpu/drm/drm_irq.c                       | 13 ++++---------
 drivers/gpu/drm/drm_vblank.c                    | 15 ++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_drv.c         | 10 ----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  3 +--
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 --
 drivers/gpu/drm/i915/i915_drv.h                 |  2 ++
 drivers/gpu/drm/i915/i915_irq.c                 |  8 ++++----
 drivers/gpu/drm/imx/dcss/dcss-kms.c             |  3 ---
 drivers/gpu/drm/imx/imx-drm-core.c              | 11 -----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  6 ------
 drivers/gpu/drm/nouveau/nouveau_drm.c           |  3 ---
 drivers/gpu/drm/omapdrm/omap_drv.h              |  2 ++
 drivers/gpu/drm/omapdrm/omap_irq.c              |  6 +++---
 drivers/gpu/drm/radeon/radeon_fence.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c         | 16 ++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_drv.c           |  2 --
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  6 ------
 drivers/gpu/drm/sti/sti_compositor.c            |  2 --
 drivers/gpu/drm/stm/ltdc.c                      |  3 ---
 drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 --
 drivers/gpu/drm/tegra/drm.c                     |  7 -------
 drivers/gpu/drm/tidss/tidss_irq.c               |  3 ---
 drivers/gpu/drm/vc4/vc4_kms.c                   |  1 -
 drivers/gpu/drm/vkms/vkms_drv.c                 |  2 --
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c             |  8 --------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 --
 drivers/gpu/drm/zte/zx_drm_drv.c                |  6 ------
 31 files changed, 40 insertions(+), 122 deletions(-)


base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.32.0

