Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD276C49EA2
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A73FD61027
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Jun 2021 14:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhFVOMX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:12:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:36452 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhFVOMW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 10:12:22 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 96BB721984;
        Tue, 22 Jun 2021 14:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GoNglZRPP44fopTgtKNO/5FpNVm5X099LWZB3EEhRP8=;
        b=qJBdNIl6UaV7smXq1szg7MJd5BDQATnCxs8aVghPi1MBHLX15vBH/kCV56iwatLTejONsS
        1WpiSzFhr1nBUt7FaUH7diXhwyZLPfJvK0qPCXBtyq/kt+z80oZTyZOQOtR+IHqxlUKqi8
        pNgWTcH/jcZjymNM3sOI7NHPuK9NKwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371005;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GoNglZRPP44fopTgtKNO/5FpNVm5X099LWZB3EEhRP8=;
        b=Ms7KgEYGwBcGyQV/ifbNdJsHDAoMzWRHs+8ChqcaySaoGr9wjA8djfaoJZ9sz+Pi9pNsQ9
        d0tGPVJV++W55cDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 7D8EF11A98;
        Tue, 22 Jun 2021 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624371005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GoNglZRPP44fopTgtKNO/5FpNVm5X099LWZB3EEhRP8=;
        b=qJBdNIl6UaV7smXq1szg7MJd5BDQATnCxs8aVghPi1MBHLX15vBH/kCV56iwatLTejONsS
        1WpiSzFhr1nBUt7FaUH7diXhwyZLPfJvK0qPCXBtyq/kt+z80oZTyZOQOtR+IHqxlUKqi8
        pNgWTcH/jcZjymNM3sOI7NHPuK9NKwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624371005;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GoNglZRPP44fopTgtKNO/5FpNVm5X099LWZB3EEhRP8=;
        b=Ms7KgEYGwBcGyQV/ifbNdJsHDAoMzWRHs+8ChqcaySaoGr9wjA8djfaoJZ9sz+Pi9pNsQ9
        d0tGPVJV++W55cDg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id QEnCHTzv0WD3UAAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:04 +0000
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
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/22] drm/amdgpu: Track IRQ state in local device state
Date:   Tue, 22 Jun 2021 16:09:41 +0200
Message-Id: <20210622141002.11590-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct amdgpu_device.irq.installed. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 32ce0e679dc7..7dad44e73cf6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -599,7 +599,7 @@ void amdgpu_irq_gpu_reset_resume_helper(struct amdgpu_device *adev)
 int amdgpu_irq_get(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 		   unsigned type)
 {
-	if (!adev_to_drm(adev)->irq_enabled)
+	if (!adev->irq.installed)
 		return -ENOENT;
 
 	if (type >= src->num_types)
@@ -629,7 +629,7 @@ int amdgpu_irq_get(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 int amdgpu_irq_put(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 		   unsigned type)
 {
-	if (!adev_to_drm(adev)->irq_enabled)
+	if (!adev->irq.installed)
 		return -ENOENT;
 
 	if (type >= src->num_types)
@@ -660,7 +660,7 @@ int amdgpu_irq_put(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 bool amdgpu_irq_enabled(struct amdgpu_device *adev, struct amdgpu_irq_src *src,
 			unsigned type)
 {
-	if (!adev_to_drm(adev)->irq_enabled)
+	if (!adev->irq.installed)
 		return false;
 
 	if (type >= src->num_types)
-- 
2.32.0

