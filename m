Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D9433BB1
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562078; cv=none; b=d7eL9Mpgr8+s6ve7XPZFYrGHWfItka6LGpd85c341Q0bnlH8xCKnr6w9LGiuNgV5VgKK+vi83RtdKTBU8sveuw6rrkkjqGiPTzlKC4K3cdUF2R4PhWcYeFTPdl7r68hfch3OZQQiEB3iPCps7dp8UkUh2EHPypJkVacxv0W7TV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562078; c=relaxed/simple;
	bh=HdxpWSHVTZnagqWd9UGqEZtDSs8wJ971uoSLZwkj04A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqKDgabiw1fUNjwIKqmQBu6PmueGdF8agg6qNpVEYG1ZbbOzHR99hbGb50GwRwgiZrIfwgUL3f5IUCRquH9GavepHGYAMX0O7NgCqTr2OiM1Pf/0i4LlpIm1zbqgEJzlsjkc6f1T0hZxCu+ZLHGis8uory4SE0UzCS56C+wCYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifpynGoV; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifpynGoV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f633e6058so2900304f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562073; x=1785166873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=ifpynGoV4SFFXmDXj/N0kA0WITPIodx5d6p8MSCd+9l/k+dvefMzB3LPNOn//ldTbp
         i3Et44uJZb0c9nahYz16xJbri7VTwvwb/u0qbjTAYYTxD1JkvDfGxhwPm04kniao2/B6
         xSW7/VmSe99yh4Ocm2FE5v1PqvFhc51R5BUMaOwBQgfjEYbRSUS/Px1rF/7E+QBUR0qd
         QwTWAAygOPxwrcWVqtnQQjKzLxFhRRV+e9G8KmRy48J+qvI85NMD0SBumBBZzgtwdXiq
         Dy0l6ZAmg/xAwfZIkVg1m0Aeb1eA14Y1bk7w0MHOxrA7aDOA5wbgjpUa6DhwJTftu65v
         9w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562073; x=1785166873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=fp1Zgp2l4MwNH+4OYRS9Pm3bdWaqjjoZY81+yr7YfyjoJroComG6MHvQeYcQDcMq7g
         S9sbdx8Pq34kLIKmc6ZC4WjIJALVmyPDTgzgzecArky16he27aHX8D4j3vQFgo2VdwFU
         7JRbEFgOn4Wx2a0IfQd96r9dOPg3nuEoOa58pI3AMuQNGxtCydMSNQ+VZIzusaaXu3y3
         I3AkG9N9oP00cEdKeqNsTNXqawr12DSuxdp5EUecphIbGZfahIMaBjvgh1IxWdq1+yOX
         4TmDb2ZPxMSq8Fm+rosqQ9pPk2wC7US6WrVGgRtsK7DCDuSYNS9FUsPg9oJJk6+AbNN2
         vzzg==
X-Forwarded-Encrypted: i=1; AHgh+RqyrTcJzxkZAjqX3UYtcFrZLyP73bEUN6gLXs+LSeWy6d872ozYXVRQfu1TFocYPOlCmzeRDPzRTY5qSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtiR5rICXkp6zmuYNMyr+E0uRIUQbwchURoUCmtSJrhXYOLwl
	+PzQvR8qgkUTliGb6AWQtmnY0UsAB6OkEBiEQ9d0dpvKLI+rmLIOmcIQ
X-Gm-Gg: AR+sD10KAh8YJiiTljL0ZtgWTKw2Q/EChWfzhZozXpkIpIvZc0J6TvRLmQVXZd9EXwq
	KR7TD/yxf0w6/PhJLDR6WPs+0+tw0CYbM7HsAUDYAh9lkEK3V/jiYP+PWXd0a7OQExaEubw/GdK
	Dw+NZp6CJ/9xdz29y50H7gPWQm3VCqcIbqvYoIsukJPO13ujm2GQS2PaHT5VnqATJjxn6mwjENu
	E/azdkv3VGMMm+PZ5W7TFh66INtDQenZEmInMW/WJv/MqbUHuxKMTJyy4/fZjm3+PIU4J8BkVqa
	ysXJYJ35sdALc6A85QTO4DTbzSQTJQ+bfSkdMJP/THTpKi211vkIsTwYNzgCUUyJM0L7BCj4X/m
	OikpzDRX30fgjYQ/ErPIhJysZ7Jdmgh5CxIywAA7uyY135xbzoJRaZe4iUrD6vpcdND8Iw/iUN1
	DSuchTrY11Lg==
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr18153184f8f.14.1784562072745;
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:39 +0200
Subject: [PATCH v2 07/15] drm/tidss: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-7-5020b630668a@gmail.com>
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 698f8d964ca0..10dbcc6cdf6a 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -9,11 +9,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +81,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +99,8 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_encoder_funcs, encoder_type, NULL);
 	if (ret)
 		return ret;
 

-- 
2.54.0

