Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F29511195;
	Wed, 16 Sep 2026 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566460; cv=none; b=nyGQbnJgHpvPaq0abVVj5Df56U2iqCE7kU5hMGLdarwMURxvfSxA5r/G0arC4YFkqVe4jlaPbVPXOzN4TAnhut+AZIl+bp88Hq0YirWOwFMnsZ/5GMs62p91ng9EA8xP4NnY1b0RlEx8yuvr9+f/suxPf+D0VGnNuS+x/Roedq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566460; c=relaxed/simple;
	bh=eTpWazme9lelTHh/MSYxuXX4Q7bGyw/vNIL2dQsJsnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMW53/lCkOKuxYBdiE4o9T334nUPUqmUbskaaoVaLf64v9tn/DCsCtMPahFciW8rs0HjXt1wP85ZAhTkW4ctK2XZdfGSShToFJOJ76XksLDyXobAW1QyqO29842OOE9IIapzgjgKYQgOsQgjUPzveCeNM2wP5uoiEPba/xyMh28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=stJ7pcSM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="stJ7pcSM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5347B1A07A8;
	Wed, 16 Sep 2026 13:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2580F60337;
	Wed, 16 Sep 2026 13:47:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7739B11C7B03A;
	Wed, 16 Sep 2026 15:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F5yJhJPNA3btj/uGTb70cyHyjYgUd7jvRnU4XSDRWHQ=;
	b=stJ7pcSMxhptZLIqoyaWMV1hH4b9QQQk7L+xVlggg8oZ2HFD1RYTe1AO07Us9PNoiShZyW
	7/pb0vWC3oB0rFJbdQuWiwcDzkGRZ1elh1YLtKxevTBxSlRDB4rUQ/kqyJE/KLobMHiaHI
	5ZbcTbOrLHR4XIPQyToJru4eirdg+Rkr4R5mYnrS/AEgeXCnws0Z1lXECyj8JGmErM7Qdt
	GrW7AC9t2kQc6cnPAtdPjazwEyHFTph8VS5P52CG30ZMHJg/z0t4HErFlbkIQxyRXdGGsj
	MYs/A9Ml/n2T/xWLZseOhyHMlpo+twpUo9KC0Y8zVTj2pB8+GXh8PZYl2SMHng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:36 +0200
Subject: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Now a panel_bridge is automatically created for every drm_panel and the
panel-bridge API is just a deprecated wrapper to access it.

Update and simplify the code by just getting a reference to the
already-existing bridge using of_drm_find_and_get_bridge().

Also keep the "connected to non-panel bridge (unsupported)\n" error logic
by using the drm_bridge_is_panel() function.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mcde/Kconfig    |  1 -
 drivers/gpu/drm/mcde/mcde_dsi.c | 41 +++++++++--------------------------------
 2 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/mcde/Kconfig b/drivers/gpu/drm/mcde/Kconfig
index 6ebfb930cbfa..81e7d3796c06 100644
--- a/drivers/gpu/drm/mcde/Kconfig
+++ b/drivers/gpu/drm/mcde/Kconfig
@@ -10,7 +10,6 @@ config DRM_MCDE
 	select DRM_MIPI_DSI
 	select DRM_BRIDGE
 	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	help
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 77cf253a2152..daac8d67913d 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -37,7 +37,6 @@ struct mcde_dsi {
 	struct device *dev;
 	struct mcde *mcde;
 	struct drm_bridge bridge;
-	struct drm_panel *panel;
 	struct mipi_dsi_host dsi_host;
 	struct mipi_dsi_device *mdsi;
 	const struct drm_display_mode *mode;
@@ -1074,7 +1073,6 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
-	struct drm_panel *panel = NULL;
 	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 
 	if (!of_get_available_child_count(dev->of_node)) {
@@ -1102,40 +1100,21 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 
 	/* Look for a panel as a child to this node */
 	for_each_available_child_of_node_scoped(dev->of_node, child) {
-		panel = of_drm_find_panel(child);
-		if (IS_ERR(panel)) {
-			dev_err(dev, "failed to find panel try bridge (%ld)\n",
-				PTR_ERR(panel));
-			panel = NULL;
-
-			bridge = of_drm_find_and_get_bridge(child);
-			if (!bridge) {
-				dev_err(dev, "failed to find bridge\n");
-				return -EINVAL;
-			}
+		bridge = of_drm_find_and_get_bridge(child);
+		if (!bridge) {
+			dev_err(dev, "failed to find bridge\n");
+			return -EINVAL;
 		}
 
-		if (panel || bridge)
-			break;
+		break;
 	}
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge)) {
-			dev_err(dev, "error adding panel bridge\n");
-			return PTR_ERR(bridge);
-		}
-		drm_bridge_get(bridge);
-		dev_info(dev, "connected to panel\n");
-		d->panel = panel;
-	} else if (bridge) {
+	if (!bridge) {
+		dev_err(dev, "no bridge\n");
+		return -ENODEV;
+	} else if (!drm_bridge_is_panel(bridge)) {
 		/* TODO: AV8100 HDMI encoder goes here for example */
 		dev_info(dev, "connected to non-panel bridge (unsupported)\n");
 		return -ENODEV;
-	} else {
-		dev_err(dev, "no panel or bridge\n");
-		return -ENODEV;
 	}
 
 	d->bridge.next_bridge = drm_bridge_get(bridge);
@@ -1157,8 +1136,6 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
-	if (d->panel)
-		drm_panel_bridge_remove(d->bridge.next_bridge);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }

-- 
2.55.0

