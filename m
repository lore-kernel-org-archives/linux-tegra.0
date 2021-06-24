Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D4FC49EA7
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DA3E6100A
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Jun 2021 07:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhFXHb6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Jun 2021 03:31:58 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:56216 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhFXHb5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Jun 2021 03:31:57 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E93BB2197E;
        Thu, 24 Jun 2021 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624519777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wvcnz4j6Hq3MjYMJtyLI/IeHV+w1RM8qr5Lppsuycr8=;
        b=rRsK/QR3zSc0tyv4cmtKzqJHS7MRGnCtDJwKqOBO2Ib96J8C0ql/MesIqzhebtJzo0Uf8d
        on1RyvRMXTRKaJ0cfLe5z21ER9wkjF6KqJlOrBL5ZP77uTYRSVqxwILMa/uXqk7cgromZE
        X/HxJtdDmD4H0KWKsj5pbGOlnTeuWzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624519777;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wvcnz4j6Hq3MjYMJtyLI/IeHV+w1RM8qr5Lppsuycr8=;
        b=yfGfGzft0nrf2ZNYkkv2WmoUPYS3eb/iPlOcHKgoD2WOlfLae/PhfgNQCh1YJ9F9aiOZVL
        +IoZ+sK2/cJRI6Bw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id C026211C9B;
        Thu, 24 Jun 2021 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624519777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wvcnz4j6Hq3MjYMJtyLI/IeHV+w1RM8qr5Lppsuycr8=;
        b=rRsK/QR3zSc0tyv4cmtKzqJHS7MRGnCtDJwKqOBO2Ib96J8C0ql/MesIqzhebtJzo0Uf8d
        on1RyvRMXTRKaJ0cfLe5z21ER9wkjF6KqJlOrBL5ZP77uTYRSVqxwILMa/uXqk7cgromZE
        X/HxJtdDmD4H0KWKsj5pbGOlnTeuWzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624519777;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wvcnz4j6Hq3MjYMJtyLI/IeHV+w1RM8qr5Lppsuycr8=;
        b=yfGfGzft0nrf2ZNYkkv2WmoUPYS3eb/iPlOcHKgoD2WOlfLae/PhfgNQCh1YJ9F9aiOZVL
        +IoZ+sK2/cJRI6Bw==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id aI4DLmA01GAJfwAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 07:29:36 +0000
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
Subject: [PATCH v3 15/27] drm/omapdrm: Track IRQ state in local device state
Date:   Thu, 24 Jun 2021 09:29:04 +0200
Message-Id: <20210624072916.27703-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210624072916.27703-1-tzimmermann@suse.de>
References: <20210624072916.27703-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct omap_drm_device.irq_enabled. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/omapdrm/omap_drv.h | 2 ++
 drivers/gpu/drm/omapdrm/omap_irq.c | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index d6f136984da9..591d4c273f02 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -48,6 +48,8 @@ struct omap_drm_private {
 	struct dss_device *dss;
 	struct dispc_device *dispc;
 
+	bool irq_enabled;
+
 	unsigned int num_pipes;
 	struct omap_drm_pipeline pipes[8];
 	struct omap_drm_pipeline *channels[8];
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 15148d4b35b5..bb6e3fc18204 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -291,7 +291,7 @@ int omap_drm_irq_install(struct drm_device *dev)
 	if (ret < 0)
 		return ret;
 
-	dev->irq_enabled = true;
+	priv->irq_enabled = true;
 
 	return 0;
 }
@@ -300,10 +300,10 @@ void omap_drm_irq_uninstall(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
 
-	if (!dev->irq_enabled)
+	if (!priv->irq_enabled)
 		return;
 
-	dev->irq_enabled = false;
+	priv->irq_enabled = false;
 
 	dispc_free_irq(priv->dispc, dev);
 }
-- 
2.32.0

