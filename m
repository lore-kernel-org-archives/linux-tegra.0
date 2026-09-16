Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D43BA24E
	for <linux-tegra@vger.kernel.org>; Wed, 16 Sep 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566411; cv=none; b=Fbhhyf4s8S9Fau/4VgScVjgezD5ztk/MAdHLudTGHXYVwXIE2oeyx+ILZP52zunpZ0C0NVsEciyNUVrtBbBqfc7D7BTAypI5otnCMDh8hbZIKTLLwRluPMYrlB+5YvQPL9SyevIuRO/NbAq44Ew6DiHYF/pq4VaodFb6XQlp5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566411; c=relaxed/simple;
	bh=wc7iPWmRJoJiXM8gBa/wgxxArAKokd+J52BFZBvvvDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3PxPBQg6ny/X6MvlJvXYJinm1hFP+mQMxV5AEHYZ+ZJ1h/gAM6lXA4LSjpSrsLdvoXOGP+wdigErI54Y6BuIwt1Jtvb67+9MNSw7KhWxMHRTqqCuGQjOeFmPLpLNKwlygBp8EUQJ4PcOfC4Zm8etGZXDwi03uBYnEfsGERIP/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CD66GLPb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CD66GLPb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B396FC5CD63;
	Wed, 16 Sep 2026 13:47:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B325960337;
	Wed, 16 Sep 2026 13:46:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4434511C7B040;
	Wed, 16 Sep 2026 15:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7w1uPyaYjbV/AzoYagowX8aCeRR8/9jNsyB2/i8ji+c=;
	b=CD66GLPbez6qUMGecDMwJly8JKoywBC1WJmMkpDzjFZPuWVq6yeMis4y+VCYVecsY3WIYm
	vsTHwQ61/noyLOFbuH2W6zMSQuXb2qLUvPlIhnVT50bz0GbCHWdWqHX/9Unmf0zwOdOru6
	LlmYDl/lmfZjOaSV7RWFuEFS/pY7IcwATZO+TbkaIf1QWlNf+Yx+EJPcLd+s31ga3oGG7b
	j5Aq5ByReKclJX44jXbDQYXcdqJgOlfqCTmsMg2qrbaFTKopsM15hucnJuu11yjgWCS8Cj
	U9+qTNQhtCjIbNLNta57oF1BRBsIhnyd0nzOEHKs+j9o8fCl1azbb/U3BjqTIQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:31 +0200
Subject: [PATCH v3 07/19] drm/panel: deprecate panel-bridge APIs
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-7-83afb4f1a707@bootlin.com>
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

Now that a drm_bridge is embedded into every drm_panel, the panel_bridge is
not needed anymore. Its APIs are just accessing the embedded drm_bridge
transparently.

Deprecate them all, encouraging to use the drm_bridge API.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_panel.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 707ad9aa907a..c00529bfb706 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -250,6 +250,9 @@ EXPORT_SYMBOL(drm_bridge_is_panel);
  *
  * @panel: The drm_panel being wrapped.  Must be non-NULL.
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
+ *
  * For drivers converting from directly using drm_panel: The expected
  * usage pattern is that during either encoder module probe or DSI
  * host attach, a drm_panel will be looked up through
@@ -287,9 +290,8 @@ EXPORT_SYMBOL(drm_panel_bridge_add);
  * This is just like drm_panel_bridge_add(), but forces the connector type to
  * @connector_type instead of infering it from the panel.
  *
- * This function is deprecated and should not be used in new drivers. Use
- * drm_panel_bridge_add() instead, and fix panel drivers as necessary if they
- * don't report a connector type.
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
  */
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 					      u32 connector_type)
@@ -306,6 +308,10 @@ EXPORT_SYMBOL(drm_panel_bridge_add_typed);
  * created by drm_panel_bridge_add().
  *
  * @bridge: The drm_bridge being freed.
+ *
+ * This function is deprecated. A drm_bridge is embedded into every panel
+ * and removed when the panel is removed.  Don't use it in new drivers and
+ * update your driver to stop using it.
  */
 void drm_panel_bridge_remove(struct drm_bridge *bridge)
 {
@@ -355,6 +361,9 @@ static void devm_drm_panel_bridge_release(struct device *dev, void *res)
  * @dev: device to tie the bridge lifetime to
  * @panel: The drm_panel being wrapped.  Must be non-NULL.
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
+ *
  * This is the managed version of drm_panel_bridge_add() which automatically
  * calls drm_panel_bridge_remove() when @dev is unbound.
  */
@@ -379,9 +388,8 @@ EXPORT_SYMBOL(devm_drm_panel_bridge_add);
  * This is just like devm_drm_panel_bridge_add(), but forces the connector type
  * to @connector_type instead of infering it from the panel.
  *
- * This function is deprecated and should not be used in new drivers. Use
- * devm_drm_panel_bridge_add() instead, and fix panel drivers as necessary if
- * they don't report a connector type.
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
  */
 struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
@@ -422,6 +430,9 @@ static void drmm_drm_panel_bridge_release(struct drm_device *drm, void *ptr)
  * @drm: DRM device to tie the bridge lifetime to
  * @panel: The drm_panel being wrapped.  Must be non-NULL.
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and update your driver to stop using it.
+ *
  * This is the DRM-managed version of drm_panel_bridge_add() which
  * automatically calls drm_panel_bridge_remove() when @dev is cleaned
  * up.
@@ -472,6 +483,10 @@ EXPORT_SYMBOL(drm_panel_bridge_connector);
  * @port: port in the device tree node
  * @endpoint: endpoint in the device tree node
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and convert your driver to
+ * of_drm_get_bridge_by_endpoint().
+ *
  * Given a DT node's port and endpoint number, finds the connected node
  * and returns the associated bridge if any, or creates and returns a
  * drm panel bridge instance if a panel is connected.
@@ -508,6 +523,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge);
  * @port: port in the device tree node
  * @endpoint: endpoint in the device tree node
  *
+ * This function is deprecated. A drm_bridge is embedded into every panel.
+ * Don't use it in new drivers and convert your driver to
+ * of_drm_get_bridge_by_endpoint().
+ *
  * Given a DT node's port and endpoint number, finds the connected node
  * and returns the associated bridge if any, or creates and returns a
  * drm panel bridge instance if a panel is connected.

-- 
2.55.0

