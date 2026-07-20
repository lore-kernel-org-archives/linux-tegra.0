Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA67840929F
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562049; cv=none; b=qUNCiQhwpTRU+qi6WJoqElLTKvdI4VpdJc4v926uDVKqq/VsM5W5znKzPfJO1/ppFeYMrCkeGqJAvtvQGVnAbfTmSd6NxY5XTEdzD/K4mIBDCqpmanWRC2pPkmio6Q1UEEtg/ZyLuUJOR0stEqvpVoD8OyesZVK7M3EdnJ5TO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562049; c=relaxed/simple;
	bh=mfEjaMH0TBdC/ZK8n1+F49JSV1pp/UfoGo41Uw6GS6s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sIZl4JwZqMnt772OAw+qK0lCEy8yrYUX4m300REvTvFAJLsPqyHqE/1OCGpfwCdMR2cxcFAKe3T+w/GCTmZS81NYtKK4YP0gljW5hAm8sHPmvVVA5sEziqFqL6z3ORi3TTY99zbg99xQWzwESifWPZSi6T39GTigUtbgagv4LWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgQu0z+i; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgQu0z+i"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47df43bfb07so2742991f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562046; x=1785166846; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+RhVkb1Ieh+bhF0gQzF1Ju+q7qk3GiWptVGwICJBljM=;
        b=PgQu0z+iJJqHsPW8yt5EjZpQouA11UsLnx2D4wcezrOwTJ5kmvbFl3gCejTBu3nE0v
         GBOk4FxZdWfqnqEUfGiwGSa1AvK5D8hRc1oj17IGAkh/N6/r4F8y1Uu0PLLqDjOHIsVy
         BZvB0aOHqvyvecGbIl52ybXhEmQtJqGA66KNrCuaL2H0V4/KeqypVaO0W+On3BbtHODN
         m/eR5XthSTAKjjM7/+OaUDhyl/l8i7VdO51JwweiXN/LUX3BCIDliz+CFLRJzSDafvFL
         wXWZPM0pyz8D+vV4jzi9s9+YhGzothNQ8AUwmnvnXfpCrxF8mHdv/sRNrHeP3l3tSvDj
         WWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562046; x=1785166846;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+RhVkb1Ieh+bhF0gQzF1Ju+q7qk3GiWptVGwICJBljM=;
        b=Q2+75Q9GCYLuThlx1C1RR19WlPw4YIeB5rTNF7cpg8C20FF+hxhI/PGKtx6kTaLxhV
         /uAT4+DD2ueknk2z/ijEkoTkrs8ePvnd/17H8MVmS2uIjuU07eUVb5F4SpsAeqqk1cF7
         c2SrLgm18UgBNUfUUw6C0v172pt6i55Res4wLDqw8I2dqPft7UwJPCsZM40bj0feM47y
         yyiTK423TTvOCArKwCVcDpKHTPr9zTVR+NrLGCKDFsNjShep9doBMewxzLUBvK0S0/8P
         wpEtc5C5G9pcZnKz5sZ6TytPCP5R7BLnYcVVVKwPJy54Bl1aEDKNc8PyS3v/PKSw9o8J
         FjGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJXwR9+wiwzcB9jFK/rF3skZ0vyBAajhEICihEfeB/QxEaPPs6ybeogHQlhh0eV18nFtRNQA7x1wtJsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy/MXUdDTpd0UIBJ51zSNelKOBJ/LWFm656XLRSiu8EXVjxKgI
	VQ2QaetOCI3GFPVrt9GApRcZVzqcNOaNZZphv5dEvXNnE6EBjyKrOvV1
X-Gm-Gg: AR+sD13B8SvOhFx/X55ntbcGX9MXEob8B8r2SCJ2FJ51b1jPJ4VYEE9218LOMLuoIhd
	aNysW7r6xNbWrI8hnpfQEWR+DywVhl4bSQ/JzLRYEXFuxVj+UCw+rEvfdVVTDKSHr0fx8ygu6l1
	4tdtBhWkZIGesO8qBi+GbpOqrKfoaHrqly1Y40uHRvPTwBRqPr6U6rwbBDXqbenkLgHZFKadU+X
	LOnjcHYK0VxGwIPdG5EPfNeiabuxK3Wpr8teh6UNnXIUYhhJhyCJ8SImUcpUyggwfQSxklFA8HR
	uBG1tqGfOggU6tBVpYxGybKUqbmlWmBrPdLs2FvP7FWDTY+JWNVD5BKbqFzalfWn0z8w2ElUzpH
	v2lDUxteKGB+duPARYm48Rd1HskaifA86ga3TX1GSB8lPle3nbhCRv3XofoR4Ng9lpCvNyrLcC0
	gYD/2XGy8aqw==
X-Received: by 2002:a05:6000:4310:b0:47e:b336:6385 with SMTP id ffacd0b85a97d-47f622d054fmr17529323f8f.0.1784562045728;
        Mon, 20 Jul 2026 08:40:45 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:45 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
Date: Mon, 20 Jul 2026 17:40:32 +0200
Message-Id: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFBXmoC/3WNyw6CMBBFf4V0bU2pysOV/2EIKdMBxtCWtNhoC
 P8uYFy6PMm958wsoCcM7JrMzGOkQM6uIA8Jg17ZDjnplZkUMhN5WnDtTR3IjAPWaMFp9DVZmrg
 WWanOAHlbNGx9jx5beu3me/Xl8GweCNOm2xY9hcn5956O6bb7Vcq/lZhywVVewEWUeBKZvHVG0
 XAEZ1i1LMsHAbIKNtAAAAA=
X-Change-ID: 20260718-drm_simple_encoder_init-d069a4cc7f8b
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

This series open-codes all remaining drm_simple_encoder_init() users by
calling drm_encoder_init() directly and providing driver-local
drm_encoder_funcs where needed. After the driver conversions, the helper
is removed and the completed DRM todo item is dropped.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Changes in v2:
- Change logging to consistently use drm_err()
- Link to v1: https://patch.msgid.link/20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com

To: Jingoo Han <jingoohan1@gmail.com>
To: Inki Dae <inki.dae@samsung.com>
To: Seung-Woo Kim <sw0312.kim@samsung.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Michal Simek <michal.simek@amd.com>
To: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Stefan Agner <stefan@agner.ch>
To: Alison Wang <alison.wang@nxp.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: David Airlie <airlied@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
To: Chia-I Wu <olvaffe@gmail.com>
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Xinliang Liu <xinliang.liu@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Yongqin Liu <yongqin.liu@linaro.org>
To: John Stultz <jstultz@google.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: virtualization@lists.linux.dev
Cc: imx@lists.linux.dev
Cc: linux-mediatek@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-doc@vger.kernel.org

---
Diogo Silva (15):
      drm/exynos: remove dependency on DRM simple helpers
      drm/xlnx/zynqmp_dpsub: remove dependency on DRM simple helpers
      drm/tegra: remove dependency on DRM simple helpers
      drm/fsl-dcu: remove dependency on DRM simple helpers
      drm/kmb: remove dependency on DRM simple helpers
      drm/virtio: remove dependency on DRM simple helpers
      drm/tidss: remove dependency on DRM simple helpers
      drm/imx: remove dependency on DRM simple helpers
      drm/mediatek: remove dependency on DRM simple helpers
      drm/renesas/shmobile: remove dependency on DRM simple helpers
      drm/hisilicon/kirin: remove dependency on DRM simple helpers
      drm/arm/komeda: remove dependency on DRM simple helpers
      drm/meson: remove dependency on DRM simple helpers
      drm/drm_simple: remove deprecated drm_simple_encoder_init function
      Documentation/gpu: remove completed drm_simple_encoder_init() todo

 Documentation/gpu/todo.rst                        | 15 ---------------
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c  |  9 +++++++--
 drivers/gpu/drm/drm_simple_kms_helper.c           | 13 ++-----------
 drivers/gpu/drm/exynos/exynos_dp.c                | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c           | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c           | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c          | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 14 ++++++++++++--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c         | 10 +++++++---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c      |  9 +++++++--
 drivers/gpu/drm/imx/dc/dc-kms.c                   |  8 ++++++--
 drivers/gpu/drm/kmb/kmb_dsi.c                     |  9 +++++++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c        | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c         | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c        | 11 ++++++++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 drivers/gpu/drm/tegra/dsi.c                       | 16 +++++++++++++---
 drivers/gpu/drm/tegra/rgb.c                       | 15 +++++++++++++--
 drivers/gpu/drm/tidss/tidss_encoder.c             | 10 +++++++---
 drivers/gpu/drm/virtio/virtgpu_display.c          | 12 ++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c                 | 14 ++++++++++++--
 include/drm/drm_simple_kms_helper.h               |  4 ----
 23 files changed, 183 insertions(+), 78 deletions(-)
---
base-commit: e1113c37ba4f166e37dec74a729e6dfd8cba1687
change-id: 20260718-drm_simple_encoder_init-d069a4cc7f8b

Best regards,
--  
Diogo Silva <diogompaissilva@gmail.com>

