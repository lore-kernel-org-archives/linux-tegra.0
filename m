Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8843803DE
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417810; cv=none; b=kWxYJx9/k/btKIOht510b0/m1eKqP8fp+YhqVR1h6fIVSqsM+LJMpTLjqCPR9GZxToII4qDbQGSOKSyC63G6NPRXuWROXbD9RPRCIl1zt8LcFX3YNz0sKmFdIWvQ7baqBa/tv+sA5mu+bGu4PK7JLxHF2TNuHmri00ArZTkiwlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417810; c=relaxed/simple;
	bh=bMs/03E/pLT09J4z4UiyyuHjtplBVReDGtgMdQzn3hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dydeeNqXWwcnf8ZW7l/AhIRnKxUzlbFZA/UTduXFqyWj1lY9PvJDdmvHLa8dUeTGpbsxbVW6SM9gK+BWgCmsvWKqsko75PT+ZigsKum+bqtijz5FF9hJax3BC14P28LUsqUsNkkxqEYxWEmQvR+InzN7AtCTFIBFOgWuny4tOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMIEQMLj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMIEQMLj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4423685e9.2
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417806; x=1785022606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=sMIEQMLjQCVRM3KE3fRDECqJ7BJSeIYIFTtB+8Jd6rz4tcnQdyuF+eZ3/ODIExoQnG
         n0RxBtFxkCb/bMuAPWMFCKNKkHY3GX4uj9fAEZZGVbI966vwcfYai+8hN07k4IPjLfUY
         yKCLOpcBipWD8zy9/qpY74ZtLPtWkgV+/q0fnatdFdT/P/L4gAuUG3mpTCL3o61hwfnX
         UOE6Q4O4u0gnWufNbPZKnR2u34m1ru6MnDH1Iefxfku5mVG4typaSVd7bpPx07gJJ9bR
         F95VUvcs9TGmo5sMlqFvgvfoYIuf/GP1jyrhsY0Zs/mGpbHiUbwxvJUsE1eufaXUzkAV
         xMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417806; x=1785022606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=eOaGRsZGqWjwgDYdl0NluWfNedK6lfQvzu3wiJUz9KMAPP8GB2WVksAn0qpKnNO0IN
         YzABERpa+qgs2WxOt6iuipQA057suk6g8TZkFbsET1fqVHQFepobtsv+/iuzVWPrNeVO
         kVxYsOtmZhltrlkBUIg2tPT1vRtKkYlXpN73o7dZU8ROHE4BPE2uGhzmXhxwh//p3zHt
         8gSaxAxL5pw+oFrGulrVdM42VqwjmxOrq0wsxQhRzUumCC0nYjvzcIbtSOd1dBvWNGDC
         JUQ6vFOthe5dntsRhdOzgCFwjoNGYaH8v5Vo0n6Nm9oO3NbWblsxlT924dCn28IzGiFu
         06tg==
X-Forwarded-Encrypted: i=1; AHgh+RqGr0QpX554Eh+Jb76UpkUHcQCdhtAqXFK7Slgm85BbCi9UY0SJX2UNKhTxoZz0TJE3lxwtevrXws6MvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+QmctaI+HYpI7fk3jReyG05DRcX2SzOm37Sgs7Fb1pPAp8o0
	+hKBS/Y9G5Oy21SIKb6Ubl/HGkesmUL/C3J6Vu/icA9KIgLY8L5XxjzR
X-Gm-Gg: AfdE7ckY2eVyZ6T5OZIyk/j7yFljMl1LY3OHmPaYAqL7oVbMK4H6p3olAD9ZIqWZBVZ
	3LYezXUhX2qiGNLq+qJCghHydZlp4gE5cda73KQmTev67JVO+JGdTQZuWZM3FoWksBpswZyBNMf
	V1AdiKfZbSwoJN/oFfZpn6whzng36HqDWQoYcyG9ezUxArZ8zHHMRldLAL9P9jXfGYk2F9MQ5pX
	PhUGhDsO27JQh6G2W6trJBKeciyOycSIkWcFx3LB9x92QQrGXCZHQZFQz3F/l0WeR0QCsADnOoW
	Pbod21cjDGDJJNybNjeirbotbQHBL9WO1sQHgBlgasAk7qMzB3g2s9qqTX3N/lOlzZzKzI1fnO1
	ITcL1K7NhKy1wz6czncnB8Zb+tapXMRUzIgNkyo4aKrRK5dlnVWA5CH8e2VnKHyTmWpanY0qPXs
	vZOGykKA1dIw==
X-Received: by 2002:a05:600c:1c28:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4954a3d0be6mr96444645e9.3.1784417806328;
        Sat, 18 Jul 2026 16:36:46 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:45 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:45 +0200
Subject: [PATCH 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-14-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
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

All driver users of drm_simple_encoder_init() have been converted to
drm_encoder_init(). Drop the helper and open-code its remaining internal
use in drm_simple_display_pipe_init() to prevent new users.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 13 ++-----------
 include/drm/drm_simple_kms_helper.h     |  4 ----
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 8e1d07b9f1e3..7878b9d7d524 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -20,16 +20,6 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type)
-{
-	return drm_encoder_init(dev, encoder,
-				&drm_simple_encoder_funcs_cleanup,
-				encoder_type, NULL);
-}
-EXPORT_SYMBOL(drm_simple_encoder_init);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type)
 {
@@ -363,7 +353,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(dev, encoder, &drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret || !connector)
 		return ret;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index cb672ce0e856..c95f86ff355f 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -68,10 +68,6 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type);
 

-- 
2.54.0

