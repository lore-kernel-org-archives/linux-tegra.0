Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28922432BEB
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562069; cv=none; b=nAmhJs6JobajKCkf8Y8dFtZ3TVeUkAhMkA+Cba71oFONwUleBnL9em6zCWKfUuHM83cSLMQjbOhNoIPm1UWsgctJVTPB8E1hBvv+F9bxcujsdGTfFauF2Ce3YM8ziYqwf5MwpcHSndUlTgkdUhuI0gswhlpNavMTopu29IWRgfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562069; c=relaxed/simple;
	bh=FzaaA8oyQ+zKZNM1VMh3E01ofgfkWOkBgZAPrI0ucuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eaDv8dbwZfuPI6q4836Dkg2QyjzhVXSL0SkS3RkTRB4F0BPrsyYFoqvKU7a+sjIJ4CR/SJzCUd2c4zh6rPBA41nBabkChjcXTywdf8v17XWeo2uucQuw+Yqx7tKTZGQRRuWX4g9DQ2y61GUJ8DCpVkcPcTGIxTLh7MrIQWmvnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOTPOO+0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOTPOO+0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so20529215e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562065; x=1785166865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=mOTPOO+0fElvFtp2555k0i2WkL/QfApck5Rz6g48Vmu8ULDBmkjZsInmkQdACZ5HL3
         5dWJRllgRnSN7UmW9VyHS9w/4rzP/bM6pddGHZyCERvOa3UEl8TGOejaAIMb9ndXW7W3
         hHbnH72Mz/jraZBr9r5OlKaU5+DhwEdLW/1uKJTpTe/trpclCXFcDj/CIdMf52HS8hB5
         9ROJv9x+itzZCPGm0ftvY5cJZ+R/i8JE0+BlrdSZHifRPD8YaTgbAsCHFoz91w2xIqFg
         7m3AXggo61rhTsNfCrZvndtFnaJGIo7JUkXMccIMGNglzHCCY7k8lwUwK5ZKLHfPev+c
         lWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562065; x=1785166865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjd+2BbZ6IkIhW8JUSKZxdlN+XT2WH08r3urmJQpGFU=;
        b=DyIsIWpHmBkN7R2I79L7/O0Y6HZjqZ7qfC7qlgSKI8GVd2kPlb7UZyxrLXIHwOUuPV
         SNSnAMgR1zm2LV3d0v8HcAP6waHPo0azAdh2VdiTzyFJJ2WrJ4LhBQ5NcUzvuRi3wAxS
         RExZhwT6J0b0ckhvDHoNy1W4+xNALR+ZQD5jsM69BiuqgwFjtZn+4H75JdMxj/MJK1Vu
         +oMYb18Jkr1SoXtFqiCHIo8arrx3MgF+psfqMgQMLtZ1B4I4Q0iu0yzhl2kxcwCN5dT3
         14FyELIKkrN9J90T1VpkZkixDDYXO5IgeM3DCzjVQSLdr3xOMU9ZqzP8TPA3zAvifkHw
         d+JA==
X-Forwarded-Encrypted: i=1; AHgh+RpriWI8O+RVBh3TidJ5CTcfmpMqDIQhBp8T/m8DT08sJ0GRwpVuWbqWHYVxo98v0xhJ2KlXuPvxgSe6Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7w2v0euW1lwnheQOA1YFPKjk8f5EiBpa3Lq0yiBxGmC6KCNQ
	7XH0hzjLkBDr1NI7JRQSmSBT+0LAC2hF9kx5bzFQAV8pPQBQ8ei8rwZN
X-Gm-Gg: AfdE7ckHhILJUIvZ9UX2VxmXbxHBqDCWC7WK/KdTrzMjwVfm4OVz6fNcRkV6+T/cJRn
	qjEFDrx+gXN07oUg+QOjL+jhvpk1zJIotdGxgMTDR2w7cL+CIESun4PacC4MeQuTvN+hW6DlUhR
	Wg2kWjkbWCT5hQvL2rxp8zppUG3A3dBx3kz0nXgTguf6gTC8OQLKgLe9u7YB+YXGi3LiTaAuttK
	6AaKns+8LBA4QQmov+LThziV/udlr0Ma53LcEHkb92PCaj+oqInMVTgjuCGqZ5lrvDXMO27Ujyo
	SD1+3YDiPPRFTQsH2mQrRnSBiodbTRm9lO//AsL8zGhlGCr693JyHEDuHj0Xm5WjkWZLZFahz/g
	f053nC1a5MxAXzFLTXTHAluDytHupI0qTMn1XPzv5wUFnNFdYt+hvjqGx5w1qht3RQm+fOEpgyc
	oQ8YdGuoZAlg==
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr155975945e9.15.1784562065028;
        Mon, 20 Jul 2026 08:41:05 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:04 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:37 +0200
Subject: [PATCH v2 05/15] drm/kmb: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-5-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 59d0e856392f..13adba96bc78 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -14,8 +14,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1427,6 +1427,10 @@ struct kmb_dsi *kmb_dsi_init(struct platform_device *pdev)
 	return kmb_dsi;
 }
 
+static const struct drm_encoder_funcs kmb_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 {
 	struct drm_encoder *encoder;
@@ -1437,7 +1441,8 @@ int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(dev, encoder, &kmb_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(kmb_dsi->dev, "Failed to init encoder %d\n", ret);
 		return ret;

-- 
2.54.0

