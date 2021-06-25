Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F273AC49EA7
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 08:22:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE2BB61426
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Jun 2021 08:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhFYIYu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Jun 2021 04:24:50 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:34612 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbhFYIYt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 04:24:49 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 461791FE59;
        Fri, 25 Jun 2021 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
        b=W888Bid/cwe7OvhgPpbpeW6HO4y/LtFvzNXdGjC0L7eX7jTOWHez5DVo8YTC4wbrowJt2l
        78STX3etyjzYBkEY3/ZNztGJBAqwjn7QgagSt1mYU2Z4DporOqUmw63fT/u3Kx2mpRkSrn
        QfmysRfn9YoaalY2gy+I5GYcAyxEeYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609348;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
        b=IyMpBO36rSzIgYWvkMVS5YmIDTj2HEJ8P+Wob/ikUGG55daM31/MsGfHUc691qwnQxl8ud
        LVJMZByeVTf9pmCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 2BC8611C9B;
        Fri, 25 Jun 2021 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
        b=W888Bid/cwe7OvhgPpbpeW6HO4y/LtFvzNXdGjC0L7eX7jTOWHez5DVo8YTC4wbrowJt2l
        78STX3etyjzYBkEY3/ZNztGJBAqwjn7QgagSt1mYU2Z4DporOqUmw63fT/u3Kx2mpRkSrn
        QfmysRfn9YoaalY2gy+I5GYcAyxEeYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609348;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
        b=IyMpBO36rSzIgYWvkMVS5YmIDTj2HEJ8P+Wob/ikUGG55daM31/MsGfHUc691qwnQxl8ud
        LVJMZByeVTf9pmCw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id kL3fCUOS1WAISwAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:27 +0000
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
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 03/27] drm/radeon: Track IRQ state in local device state
Date:   Fri, 25 Jun 2021 10:21:58 +0200
Message-Id: <20210625082222.3845-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct radeon_device.irq.installed. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/radeon/radeon_fence.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 0d8ef2368adf..7ec581363e23 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -288,7 +288,7 @@ static void radeon_fence_check_lockup(struct work_struct *work)
 		return;
 	}
 
-	if (fence_drv->delayed_irq && rdev->ddev->irq_enabled) {
+	if (fence_drv->delayed_irq && rdev->irq.installed) {
 		unsigned long irqflags;
 
 		fence_drv->delayed_irq = false;
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 84d0b1a3355f..a36ce826d0c0 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -357,7 +357,7 @@ void radeon_irq_kms_sw_irq_get(struct radeon_device *rdev, int ring)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_inc_return(&rdev->irq.ring_int[ring]) == 1) {
@@ -396,7 +396,7 @@ void radeon_irq_kms_sw_irq_put(struct radeon_device *rdev, int ring)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_dec_and_test(&rdev->irq.ring_int[ring])) {
@@ -422,7 +422,7 @@ void radeon_irq_kms_pflip_irq_get(struct radeon_device *rdev, int crtc)
 	if (crtc < 0 || crtc >= rdev->num_crtc)
 		return;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_inc_return(&rdev->irq.pflip[crtc]) == 1) {
@@ -448,7 +448,7 @@ void radeon_irq_kms_pflip_irq_put(struct radeon_device *rdev, int crtc)
 	if (crtc < 0 || crtc >= rdev->num_crtc)
 		return;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_dec_and_test(&rdev->irq.pflip[crtc])) {
@@ -470,7 +470,7 @@ void radeon_irq_kms_enable_afmt(struct radeon_device *rdev, int block)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -492,7 +492,7 @@ void radeon_irq_kms_disable_afmt(struct radeon_device *rdev, int block)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -514,7 +514,7 @@ void radeon_irq_kms_enable_hpd(struct radeon_device *rdev, unsigned hpd_mask)
 	unsigned long irqflags;
 	int i;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -537,7 +537,7 @@ void radeon_irq_kms_disable_hpd(struct radeon_device *rdev, unsigned hpd_mask)
 	unsigned long irqflags;
 	int i;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
-- 
2.32.0

