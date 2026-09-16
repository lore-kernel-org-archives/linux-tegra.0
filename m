Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254C551356B
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566488; cv=none; b=GAip94uKeLxTllcczTZZHdYJlqefqdz3DUyBcjIemn4bmQCuI2OUfhm/bmadqZj7s3jhskMd5TRg1UXLww6IuFfxVF1lj+vbc5VoMgXrVd3DTfSPpgprcoJP3rrQ4tKhfvxawEa9W/Xl25vLPVKpwd68BCbItI/ah3oUHdZvyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566488; c=relaxed/simple;
	bh=NGCF1odYpyZpT4jPdVyjbHSa/D4W81AHmfHEdqrPKAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIjbOgIS7B45tmetpzI/V8dQnA3wMeq1Y2oWA9mHXPAGR7bBEgi7ZB5orFZ/QXMQ5J/jSkac5NdbHM3VnCWv3Vig7V0zxVmtG62fiDiFEz8RvacH9EnYFNYHMLqsGSJl40xSdug5GACJX3g+u5KiV+SueWB31412IErJCWVboxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FsjDM4CG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FsjDM4CG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 915E84E40727;
	Wed, 16 Sep 2026 13:47:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C34860337;
	Wed, 16 Sep 2026 13:47:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DD3511C7B038;
	Wed, 16 Sep 2026 15:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9MZSf+qxx8/Ty98JkFRndwTvdhbHq5kenzts5ncPb5U=;
	b=FsjDM4CGhKTpGI7EPMnp1qVnUDiWZ/MvYCX8oJMcOhlwceApl0fdlmtaPgTFfCjdloIJUq
	BcyX4XERNbeVj00xyKgOysccMA9MzsBVQgCrAV6xhR3oUQZ84Fe0LXU+5ifFco3zRTD/M9
	Td5NgPF+IhklwWZehRnZRLwnowV0HuhOgof5SJrHwZuhP64CGoZq47pcVBj4e1wowetaCi
	OwkdwMfw2X5QkU0cp+OQSQwTnGsVIi4eKkytfJw8DITMQNE4FSiMNU8yNvJrLkp9qGwEyP
	lMdG5wZ9Vxznx3WQ0A0ZLNdev5B+D7vM4m9N71DkdWlavyuPEZZyVle1JP7GPQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:40 +0200
Subject: [PATCH v3 16/19] drm/bridge: ssd2825: don't create a panel_bridge
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-16-83afb4f1a707@bootlin.com>
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
already-existing bridge using of_drm_get_bridge_by_endpoint().

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference when not used anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig   |  2 --
 drivers/gpu/drm/bridge/ssd2825.c | 23 +++++------------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 847a6397eb10..c7da6b02d7b6 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -349,8 +349,6 @@ config DRM_SOLOMON_SSD2825
 	depends on SPI_MASTER && OF
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	help
 	  Say Y here if you want support for the Solomon SSD2825 RGB/DSI
 	  SPI bridge driver.
diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm/bridge/ssd2825.c
index b0142d6d40dc..71877699dfab 100644
--- a/drivers/gpu/drm/bridge/ssd2825.c
+++ b/drivers/gpu/drm/bridge/ssd2825.c
@@ -17,7 +17,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <video/mipi_display.h>
 
 #define SSD2825_DEVICE_ID_REG			0xb0
@@ -114,7 +113,6 @@ static const struct regulator_bulk_data ssd2825_supplies[] = {
 
 struct ssd2825_dsi_output {
 	struct mipi_dsi_device *dev;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 };
 
@@ -277,7 +275,6 @@ static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host, struct mipi_dsi_d
 {
 	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	struct device_node *ep;
 	int ret;
 
@@ -295,20 +292,14 @@ static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host, struct mipi_dsi_d
 		return -EOPNOTSUPP;
 	}
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel, &bridge);
-	if (ret)
-		return ret;
+	bridge = of_drm_get_bridge_by_endpoint(host->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DSI);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
+	bridge->type = DRM_MODE_CONNECTOR_DSI;
 
 	priv->output.dev = dev;
 	priv->output.bridge = bridge;
-	priv->output.panel = panel;
 
 	priv->dsi_lanes = dev->lanes;
 
@@ -333,8 +324,7 @@ static int ssd2825_dsi_host_detach(struct mipi_dsi_host *host, struct mipi_dsi_d
 	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
 
 	drm_bridge_remove(&priv->bridge);
-	if (priv->output.panel)
-		drm_panel_bridge_remove(priv->output.bridge);
+	drm_bridge_put(priv->output.bridge);
 
 	return 0;
 }
@@ -579,9 +569,6 @@ static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Initial DSI configuration register set */
 	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
 	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
-
-	if (priv->output.panel)
-		drm_panel_enable(priv->output.panel);
 }
 
 static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,

-- 
2.55.0

