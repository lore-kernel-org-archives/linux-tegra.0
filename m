Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886843551C
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562095; cv=none; b=BE8RxXlPOEGmzcAlj0nSz8kCd5cm7AgpIsP/4QwdGfVPfnKchDULJhMr86yh+tEfskO2NiQKIrpS5sejUny7fwCpXv41YD2HNJvW+svLpoXZwCfy6G/N42raS+fsuhOfiQj5o+slIs9xAkQ7N8aLklyJ5pMNrDqzolZIL55ulF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562095; c=relaxed/simple;
	bh=v9DwgKRLbmJruTxxwltkPfgfMQ/xrenPmg2doUmkQsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eAJTq4pKQDpBKX427fJ9I8eynTphNbF+TT/WX23jVXQ6GrG7srKDR/na6WUplKlBh3jp6VRyawXAVTYxiOOQyK7+qGYYOC7YvphEHyOB1YbHNqVc82eCHi7Am6dr/gPszepYfZ+vsqupw3dcB1/2l/L2Zczkc717WljJ8IFXzqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3KqyiQC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3KqyiQC"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-474560436c3so5204828f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562092; x=1785166892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=l3KqyiQCeEzxAhNC7jfDe+BxazCWzfklEbweA1/7m4E0AdERRFkURnChhxuhaZupHj
         rh6xSFp7/oACUa1cGGqAECLI/xCGTBfqFQ1BoxMjjt4ArCryOu/8rP6RJTMdQR+SrYwd
         ZOPolMaSH6Eiy7QjGjnfTlgT+TB2lR6Tf7Y86Vs1CWHCi+IGsQ3nRbE1zRjl2OcWRTpd
         5hYm/5XBdXRAgOnVA7Umo+IfRyw3qz6qAM/DL9tOX3uopFLBpuYHHcEGj/oJa4mbiy87
         Mw1ZMU+tuc4xpGJM7tKfq9rSwEp8Y8XjGq/Qa6E8lBmpM8b0IytuIoGKyBVTyWMugthJ
         l3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562092; x=1785166892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=fRygOUmnH1yLa7gyC9/QvYx35PmmTUIsOthw5/QA+guMo4r2FqqmV2BSmLeP3SGODQ
         64Zq/JfbNhAHm9z3hxNCErgnkeD/zJZagGcOOkFKjyU0pbMq/yPa9GdJl2ztBbkP6oN9
         6lA2M/SicY5qmK/bci2b0UpAVUbYGAB89yYj634YWCqimRWc+0BjrWoy5xPsEwVPeI3/
         kF3z17UYXnoWCAvSWiJdKxjc0ShyNlCh89DTcfn+hh+z/oQghwoMKUNgyMOJwLSz1JhD
         ygTefiEilJMgAPS9PDVxf7sHZAz/w2l981yxG1lA+r8qb8/I8JCw7UWURFUU3tJHjtCT
         aJyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbZ8HSHxEokS7s5OCwvy1Q4sq6Z9SfifxipoRPBfcsfHcwb65HgAZlETGDwNBk0I+Jv78kdWLdj416ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg32F0ZK4x4gxnRj/Z4AMwMQNgxPDWLHzygd3CHd1FqiWn9cRa
	08mknxpCC3WdwKhUiSsT3SWpxaXny9cAxkbeLMjAlfwUkUUb2hAPSvev
X-Gm-Gg: AR+sD11iXXQpgGsafyDt4GwGTZqiMUw12gRGkvQuXI7PRrmVlQlFKsK0ptLMgP6yXTR
	qFOopKrmMp7RO0B+YE7q6SELGhmcKTFyzeuwypY2CS8Uom80h87Z6+lClchlhNd8bD1EcTS/FCw
	8ScHdnOqzQjDzqrw/ECgUgyjTpk7k7QIiphPtLcQa44avWs/L8K3nsSmp3sm+fL+nwEAK4oE6kK
	mMkPxBJK/0U6n/6NaCZl5ZRSzpBBMQeEjlw8Qdk4ZdkCx6pvNxtMeVU/tR/4mhr4YVsZYjoBwKE
	aXLlDTb6wnYLux8D5TYnWxdEhLuzqsKrzCBTh5geDq7RVZT0RHJNZuPwGHHNofF0Hvj8lPaT4ZZ
	fZbpCObr2eHCKOHSq/u0LvbJcdWYOcyanwg80DXuRd7tlMBsW+wIXAOMwCwMolzyM/xOitUO6kC
	9HHzameOdD6Q==
X-Received: by 2002:a05:6000:29c8:b0:47f:699b:a80c with SMTP id ffacd0b85a97d-47f699ba8a2mr8405565f8f.52.1784562091837;
        Mon, 20 Jul 2026 08:41:31 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:31 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:44 +0200
Subject: [PATCH v2 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-12-5020b630668a@gmail.com>
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
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index e8cb782a6f8e..719568d9f7c2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -11,9 +11,9 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 
 #include "komeda_dev.h"
@@ -635,6 +635,10 @@ static int komeda_attach_bridge(struct device *dev,
 	return err;
 }
 
+static const struct drm_encoder_funcs komeda_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int komeda_crtc_add(struct komeda_kms_dev *kms,
 			   struct komeda_crtc *kcrtc)
 {
@@ -658,7 +662,8 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 	 * bridge
 	 */
 	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
-	err = drm_simple_encoder_init(base, encoder, DRM_MODE_ENCODER_TMDS);
+	err = drm_encoder_init(base, encoder, &komeda_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (err)
 		return err;
 

-- 
2.54.0

