Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEED4534AC;
	Wed, 16 Sep 2026 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566471; cv=none; b=r7fEps1+GGr/2gbepd6sUW+uX5spJ/G9PgKtgAthEYpNSAZoCiHYb+rmFZx+T3Z6bZhaC7uLPkCrlql8ws4ibL3YI7tA232nMEA22RRsTXvms7qOYo5Obe9AOh9RvmUN+fXirZW1MR1kgLtqvAieFK3dPDfOeaQF0YUTXG82ZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566471; c=relaxed/simple;
	bh=U4xL2SjUwof20euDmOxMD1etUXmk8hHADlqF0LnrbIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YqixFgTKsLniKyDsP4l5tM/PfyCLgEQ5AhSkCjXQ3325Caoh0I62/5EWOsZ4hqfoij0BP7vwVUMTaZpry7NnTr8SLLN5g/CW4cTCfK+K9Ss4qUolIj6/tCqOAfVt13T6+L40cqBfIr+g9mgHIfKYMuE1JgcwqGWZROS3LDTET+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j+LjOiVR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j+LjOiVR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F03DDC5CD63;
	Wed, 16 Sep 2026 13:48:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFAD560337;
	Wed, 16 Sep 2026 13:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40C8911C7B035;
	Wed, 16 Sep 2026 15:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PUMg2fB0et95uQDSbRtWmOzHTKa5cLqwreFUewKCGh4=;
	b=j+LjOiVRG5C8lgeqJAN9fvYpi1btsO+fLPNR75iMBB7TCRku8/Nm5mh5mk0cRguolV2VXb
	/338lvksbKfw+ZaijX2ivihEfU5agmr2mwqHBbPpoBTTiVH3ipUaublKAYVi+z5yiI8Dcx
	F3eFlclUHoj1kNZkl90cJ5V/DxxbsEPTMNB/oc9aIKhomPybZNw7Uxy6/L6IzhGTCPAhZy
	5C2oOUBtsBS/FnJQOzeldmcxLi0zPFs2CupbbAdDsk3rc8Bz6/blNflit5TR3ShU+f2IR2
	XSO8zaecW+Fyko+HgV6gnIRfb5S6eKSRFE+5LQ+bN5V0RPNnaV/R64TMnHC6Rw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:38 +0200
Subject: [PATCH v3 14/19] drm/bridge: samsung-dsim: don't create a
 panel_bridge
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-14-83afb4f1a707@bootlin.com>
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig        |  1 -
 drivers/gpu/drm/bridge/samsung-dsim.c | 24 +++++-------------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 0ab3cab92363..4be220f7335c 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -302,7 +302,6 @@ config DRM_SAMSUNG_DSIM
 	depends on OF && HAS_IOMEM
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
-	select DRM_PANEL_BRIDGE
 	select GENERIC_PHY
 	select GENERIC_PHY_MIPI_DPHY
 	help
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5457a7b02a33..ea2837384774 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -25,7 +25,6 @@
 #include <video/mipi_display.h>
 
 #include <drm/bridge/samsung-dsim.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 /* returns true iff both arguments logically differs */
@@ -1898,7 +1897,6 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
-	struct drm_panel *panel;
 	int ret = 0;
 
 	/*
@@ -1913,7 +1911,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		    of_node_name_eq(remote, "ports"))
 			continue;
 
-		goto of_find_panel_or_bridge;
+		goto of_find_bridge;
 	}
 
 	/*
@@ -1927,25 +1925,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 
 	remote = of_graph_get_remote_node(np, 1, 0);
 
-of_find_panel_or_bridge:
+of_find_bridge:
 	if (!remote)
 		return -ENODEV;
 
-	panel = of_drm_find_panel(remote);
-	if (!IS_ERR(panel)) {
-		next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		drm_panel_put(panel);
-		if (IS_ERR(next_bridge)) {
-			ret = PTR_ERR(next_bridge);
-			next_bridge = NULL; // Inhibit the cleanup action on an ERR_PTR
-		} else {
-			drm_bridge_get(next_bridge);
-		}
-	} else {
-		next_bridge = of_drm_find_and_get_bridge(remote);
-		if (!next_bridge)
-			ret = -EINVAL;
-	}
+	next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!next_bridge)
+		ret = -EINVAL;
 
 	of_node_put(remote);
 

-- 
2.55.0

