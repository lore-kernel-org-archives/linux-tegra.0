Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8391EC48BDF
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64375613E7
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhFXHcJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 03:32:09 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:48396 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbhFXHcJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 03:32:09 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 82DCA1FD72;
        Thu, 24 Jun 2021 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624519789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
        b=kR+PfNe4nXnyixyVaRF0RtzNT/Y+BqKf6PYn7AUAVX71qua/7S7+qcmG/hbNt3W7NtB6qC
        NdAeW+V3JZmU48MszT/PTEHAFi6LavvM+BOc/R69BnhmPFNpb2do7IiZl4BHAiUl7vbqYe
        gb6LzTUcYWQDHVro4mw/9B+wescNlTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624519789;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
        b=V09ZCfFQpGvyyZsZioYEqVJyO9lNdN2ZJtxZM8VG5uQx/+rwzENBVnVOyKbDEXhAbreJYn
        Nb2en/6w3HoDtNAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 55DC011C9B;
        Thu, 24 Jun 2021 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624519789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
        b=kR+PfNe4nXnyixyVaRF0RtzNT/Y+BqKf6PYn7AUAVX71qua/7S7+qcmG/hbNt3W7NtB6qC
        NdAeW+V3JZmU48MszT/PTEHAFi6LavvM+BOc/R69BnhmPFNpb2do7IiZl4BHAiUl7vbqYe
        gb6LzTUcYWQDHVro4mw/9B+wescNlTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624519789;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q8l7/1ZMA5t1QeiZYzMCVEERumRmjmV3VZwPqQenFSE=;
        b=V09ZCfFQpGvyyZsZioYEqVJyO9lNdN2ZJtxZM8VG5uQx/+rwzENBVnVOyKbDEXhAbreJYn
        Nb2en/6w3HoDtNAg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id yH4iFGw01GAJfwAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:48 +0000
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
Subject: [PATCH v3 25/27] drm/vmwgfx: Don't set struct drm_device.irq_enabled
Date:   Thu, 24 Jun 2021 09:29:14 +0200
Message-Id: <20210624072916.27703-26-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in vmxgfx. All usage of
the field within vmwgfx can safely be removed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index b9a9b7ddadbd..4b82f5995452 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -292,15 +292,11 @@ void vmw_irq_uninstall(struct drm_device *dev)
 	if (!(dev_priv->capabilities & SVGA_CAP_IRQMASK))
 		return;
 
-	if (!dev->irq_enabled)
-		return;
-
 	vmw_write(dev_priv, SVGA_REG_IRQMASK, 0);
 
 	status = vmw_irq_status_read(dev_priv);
 	vmw_irq_status_write(dev_priv, status);
 
-	dev->irq_enabled = false;
 	free_irq(dev->irq, dev);
 }
 
@@ -315,9 +311,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 {
 	int ret;
 
-	if (dev->irq_enabled)
-		return -EBUSY;
-
 	vmw_irq_preinstall(dev);
 
 	ret = request_threaded_irq(irq, vmw_irq_handler, vmw_thread_fn,
@@ -325,7 +318,6 @@ int vmw_irq_install(struct drm_device *dev, int irq)
 	if (ret < 0)
 		return ret;
 
-	dev->irq_enabled = true;
 	dev->irq = irq;
 
 	return ret;
-- 
2.32.0

