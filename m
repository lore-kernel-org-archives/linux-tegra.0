Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576033E4C92;
	Thu, 23 Apr 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935911; cv=none; b=BluibCNAYVbv6cy98vMp4RArXv7Nnixa0X3KxH4MCBSmSyYO6Cvb9whfCPy0zv7xgRo8OR++FqqDHW3Hc+bxuYIfALFBoKBORKGXSZC9ZrkkdjoavIT9RnDeJI9qzk2lOqw9t2fQyvIQZM2xbIl5UzmKjRwTqGrzgB2sD2KxMvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935911; c=relaxed/simple;
	bh=viXZcU4Co6hL1xspXvA+0ezJWB1HjYah2ZD3mKKP7Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1H/WVJxehJGht8JB4CgEEPB5v+dc7gjr3Zmr/Qt7ydBL6vppa7BoxnR9f/M33SEa3UYagQ53hndvxfTRu+AmrIFtFUw9OY9DKFFPz8lOP8Bvj/JxGndYb9EKAezueUYHdS9yw9IM/P/UNcPAmXSDn+qLAXm75BpCeBZX0W3E40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U6lBAuEm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U6lBAuEm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A1AFC5EF0D;
	Thu, 23 Apr 2026 09:19:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDEF460495;
	Thu, 23 Apr 2026 09:18:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D01D510460BF2;
	Thu, 23 Apr 2026 11:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776935896; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aHaNwGRsoUdIwFjwTHJYKxtK/qocJVFaiYxjNfS379g=;
	b=U6lBAuEmyZoHG3q1xl3CbQJPPneyiYCEs2YwZYqICXGZKWZxlXouP2n3L1ivPvaUSnPKXU
	fhpVUTKQKxjk2kpBfupJ6TM1i3mBVsi1Jv5srkhYO9d57SlD+VDBRu4diJki5VAfCCyjWX
	zOvF6Wkn0EEczft1Zh0BsxePmCOYutw+8BjK4xrWrAHmQWJO0cqHkIWolSA1xTr5VTFNVF
	oqmowl1dchpbhH4fKl/7c8KUccb+TXEoY4UBq1LB4upmeVqbRkSVlaikFzRxlvokl807WL
	TMnvZd2SrhELR2OIgjWw5NdXHMStrd5O2kHYN0EBRHJsnzIcXLxZYHO22bffrg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 23 Apr 2026 11:16:56 +0200
Subject: [PATCH v2 02/41] drm: adp: remove now-redundant call to
 drm_connector_attach_encoder()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-drm-bridge-connector-attach_encoder-v2-2-2ae6ca69b390@bootlin.com>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Liu Ying <victor.liu@nxp.com>, Douglas Anderson <dianders@chromium.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, asahi@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

drm_connector_attach_encoder() is now called by
drm_bridge_connector_init().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/adp/adp_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 4554cf75565e..0a11820d5b8a 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -444,8 +444,6 @@ static int adp_setup_mode_config(struct adp_drv_private *adp)
 	if (IS_ERR(adp->connector))
 		return PTR_ERR(adp->connector);
 
-	drm_connector_attach_encoder(adp->connector, adp->encoder);
-
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0) {
 		drm_err(drm, "failed to initialize vblank");

-- 
2.53.0

