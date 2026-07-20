Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934C42EEA2
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562065; cv=none; b=eYgGVq9NMKaMwTGEmiROSSt4+Q/Lh6RVm15P8Q/dEihdwfWnfPvL/G/7sYnTDYdUPthY6iqiGeNPi/9QMH+69oEWvZAkR4zv75xbt5fGph4AUJDqpH3PqAWhADccwfPIFpkIEMT/9AKkMufE34TJ/N6uBPz5/tsfbo0wpJhIjlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562065; c=relaxed/simple;
	bh=4Aj055TlPMxBq8UoEMyCmOSuvgCOAi6uSPvqm4WRBDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lR8ciRvJM6V8s6xgxor5XqwgRIkM+cAH+yXuvZNci6j9A02vouqrZ1v1w20HuDaBlIgdcy6x0gLBFuOBiuP1CK3w3e/pyOB6BCU7Eajz+poqnkkSuNFi34/g7U4qNYYJ7OMW5kV04Gt8Dq9QoU12CwwLLhZE17Jh/CPd+ZdSS5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwhmea/W; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwhmea/W"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-476d8e647e9so9368246f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562061; x=1785166861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=Iwhmea/WizYIleQClcFKrkFG6sRPq/AjprR1lG8YSfLCuK9IXXL0dkN0a5XHOV3+Uy
         hydQGnGFsZ9r8GBVKh0tm8dl3HLXNx5pUelUBaB+Me6bzevI+50xoeWO2IqU4BFLoZR5
         jJniLUIn/vhqjDWwdeUEPu5eJgqfYCg8poZnAbGnP96rn+1p6ffu7D22hwZLLcMR+O2n
         TThSvUgFj/8b28wMmBPHSQAkeDQw6ACHboln3/VeYt0zmyIpus5oUjVh5NmAFX1XbCsb
         OYO1CQuVFfpJb3yVLCoL3fJAqN7lcRXLgnDh+RDeapR11oXuTH8YZfKrcksfMw6aBney
         y4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562061; x=1785166861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=S/QubfG6iRbACL4ucxgGaKxiLhydC6Ocu+BulCy8BahqfHNZoTsZWvDpspoVRRMjmc
         G2PXBEqtb819FHDCf/JVF18+8IqykwCcQnR2j4ji14G5yv8lVQ+Za6b5OhHR+Cbkg84G
         DXp7rXcg/mozK1Kz0/crqvqIb8bldUn2IOE+i+6dSS2Hr/W3eH/Df4Uf17dujvxD4xCj
         jFc1AiC3H/d6GR8kzETnq0PCxdZAG0go4IxzEchkxQaHPTXruQzr2zCe2eQXcaSUXBr1
         fG+gYqS+HoEPYT+dhWUM5D0+uXct4cEeYvI7X5f1AZqqb/Yh2qEkVM0VT+CRlTlV5HDl
         5xGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpM1PxDokfrWAr+6VjjMdInDmobwHwHLqum2y+WBHRBfNHqL2cgSqbJBQPffqsE63KleQ3PMzS+jI6aNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAEWvgGzM2HJVfg3W1V8Kb2j3ZKhTjDmiFphxYNI9d9D+HoU8w
	CTR2CaT0k0P5U0y1c44+w/9TD2C0awIN33qeVASfPQw4K5jZDnrUKcYx
X-Gm-Gg: AR+sD10ClisrMt+wbaXsOtnVMegPrzO/ck75eEpvMufrk8RXSqA1SKZF3aqDteSgFQ5
	940ROadq9r2jdwMWsjzIgWQa7+4zk7oqGBg0zI8bB/rRUDObX55NYlpy7YL1va7KyMx8AnfK1tN
	0trFBsjo44OZkLI+yIrTEdXFCZxB6pPfVtzgWAl0zpA5B9grs1pZx/Jc/FstonfzJ0m8mOtQgGX
	mqYNjGClJhBOWB88lQg8knYwGr4d1FSf/KUzLxOQ3Q5qX4vzoj47dKGY39F4Xosev3zaRXUYN3C
	5e3qzg4+y+uxnTwe0qeHft9ygI2GS9RFvLwWzz6PfWtez16aja5DAPCBSejHSTcvYiEi+Dlfdld
	4Eo9pLqUFdBpDV9hvXgeHPabVsoeBnS7xtIJ5COSh0E+4SfpylMFhPo84hDqzepc6bn+Sx7uEIi
	FYYsd/MXLN7Q==
X-Received: by 2002:a05:6000:178f:b0:47f:7261:3a58 with SMTP id ffacd0b85a97d-47f72613ae8mr9133006f8f.1.1784562061166;
        Mon, 20 Jul 2026 08:41:01 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:00 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:36 +0200
Subject: [PATCH v2 04/15] drm/fsl-dcu: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-4-5020b630668a@gmail.com>
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519e32..c2b788bfa8f9 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -11,14 +11,18 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
 #include "fsl_tcon.h"
 
+static const struct drm_encoder_funcs fsl_dcu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc)
 {
@@ -31,8 +35,8 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_simple_encoder_init(fsl_dev->drm, encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(fsl_dev->drm, encoder, &fsl_dcu_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0

