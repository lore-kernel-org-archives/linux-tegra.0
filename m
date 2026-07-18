Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E599833A03A
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417761; cv=none; b=cwiztsh/CWPzTD4wvGMbT0mlRt9kabrHdi38we3YHN6lPI+n5s9URSL1HdNT60Fn2dvl6+Uc76pEap/QBF4oRrsOXAxoU70hC+xE8deY9B3vcLWmMd2/DMIeMJp4jrKcAmtiq+gn6B5pjojA1Cq10UqK5BpJX4LEu7tnlmsZazQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417761; c=relaxed/simple;
	bh=4VckNmYkZcMe07k6xO/fIqj/JsCM+9ZJGLo0Ai8FnTM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kbl/C0UTVI7blxTCQ2fczT0IRzBYqJj470bhOITab68sK3+r4cKhEg3GPZUGs7U2EDksVZYCHpuCU2mFojUDE1Vb1hE6/ZFO2PMrhQOBQK/cg7/Ux6pm2yFezr7imnV9OML4s0n75ywNhShiqOAmzcygojuZa9fstBh4bEqeDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCJxmMwW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCJxmMwW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so36648775e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417758; x=1785022558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fbveywkXEOoKA5l+wqrU0DqqoG4NoX/G8iLvkPe8hb4=;
        b=pCJxmMwWGfj7gh4cUN//Il3BcF2e7Ea+NvvRUgjk8G+IzWYYPC8u21T3mrUim5PY6P
         jH3ha3kPWIPTaM6MZCZLnG5YBeQZKUAKLiBY38jvYzX6MBq7m3iCsZmSFXh2ubazy0kP
         35+4IEbg+PZ0YVoqctysP2dgbwOZ0MpfOjneQhrQj7bBxQrFK/dt0nNcmOTZ5V4AmrYD
         J1q1BAK9meA61De8sBSkUH0oH6g8gxb2OWWs5/uwfIlv9DpO6COfEToFSaRGF9A89cJb
         Cse9UG4L2GH8ZafGhZqCgUg7Az6W9KyFEJ/RMVyp9rT9PZYJ6QkBNVzHTBWNidu+ryue
         s7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417758; x=1785022558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fbveywkXEOoKA5l+wqrU0DqqoG4NoX/G8iLvkPe8hb4=;
        b=EGiVfwnhbo0vIkUN3RjS0/08K4OGRBRbTt/FiKU6NVkswS492CCToIeFyd7RZAfo44
         aWUO3kiwN5TScYloo0dzdYdU1nn6fiw0djOj5fdKmu3BQYR3cS3nGvAog/9YckYsm/cx
         Y5BluyCC78tgLX2Emy5fALVijTM5glpeyiUBDUSjcMBHcjc6g22mVGKWsYxDUg3kW7dm
         A2qf4iraopNLwsYzEBY5jST2sTYqM4mufrUisW1Dnn1B3/Cabf7+VDHR7WymJ3zPAda9
         vrFdavEI6b5qQSr5EUjHNcRgNO/r61qiimuC9SElY+UI/2KXlEJ4pSw5Sxp8DClsysre
         mmvA==
X-Forwarded-Encrypted: i=1; AHgh+RoFnz0CCsiK1tVHiDB4WDdH4J7dQHaNAabpvGhU+JfocfhFHjuZxSlg3VeMrLfrQxlxAntW2JKwmTGZOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4+M2y2ZQI4Kn+iZkWf0wm3mQAmiJtTqLMwo82QRNagZBdK0/
	xyaiS3A2zY0Yx0OWlRzK9vWJmbBeCLOYvP6It15Sjt06kZfku+/3uAiT
X-Gm-Gg: AfdE7ckiLPZ3eLy8cZeU8k2MnViqqVyABhqLeKfkX4TKy1CeLH5VNRxCb1nu0Xv3Ts7
	g5lehafk36hYeoeSJhJR3PK92ZY0jX7qpUBuuG0k3LI3mxKbNUWWt8niSfT1jxwWrztbBgivQ1e
	hxQD4dpzv+v0VqJgYSJj8TdEQWIalDLfr3rm3ftyvvfkQDy+7tlehpA4CZHfUqMXZhUnI1175Q7
	3N6QNn1wiXXJsEdrydULiBRwxeJ6ALXXZqpjuzPHYCrWsrKJEoGaXNr1Smvf39sHKyU06GEolc2
	0A4B5tK9+VMGwlFNLEM/iAcooH68yopOyF+PwuJvA6AW3D5pUeVVXB5n3mO3RyiHHPF/s1gar3v
	3CTmC+qkczReEmEDpREvJEfqhb1ATjA4V3vBPe9dSsgsvCspvIitRaGOJjgfEJe3zvdeuzHUys6
	YYevvhqh/HAA==
X-Received: by 2002:a05:600c:1989:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4954a798f17mr83663665e9.28.1784417757432;
        Sat, 18 Jul 2026 16:35:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:35:56 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH 00/15] drm/drm_simple: remove drm_simple_encoder_init
Date: Sun, 19 Jul 2026 01:35:31 +0200
Message-Id: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQNXGoC/yXM0QqCQBBG4VeRuW5hlVDrVSIWnf2tiVxlRiMQ3
 72tLr+LczYyqMDoXGykeInJlDLKQ0F879INTmI2Vb6qfVO2LuoYTMb5iYDEU4QGSbK46OtTd2R
 uhranXM+KQd6/8+X6t639A7x8d7TvHyUPD1h7AAAA
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
 drivers/gpu/drm/exynos/exynos_drm_dpi.c           | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c           | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c          | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 15 +++++++++++++--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c         | 10 +++++++---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c      |  9 +++++++--
 drivers/gpu/drm/imx/dc/dc-kms.c                   |  8 ++++++--
 drivers/gpu/drm/kmb/kmb_dsi.c                     |  9 +++++++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c        | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c         | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c        | 11 ++++++++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 drivers/gpu/drm/tegra/dsi.c                       | 17 ++++++++++++++---
 drivers/gpu/drm/tegra/rgb.c                       | 14 ++++++++++++--
 drivers/gpu/drm/tidss/tidss_encoder.c             | 10 +++++++---
 drivers/gpu/drm/virtio/virtgpu_display.c          | 12 ++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c                 | 13 +++++++++++--
 include/drm/drm_simple_kms_helper.h               |  4 ----
 23 files changed, 185 insertions(+), 78 deletions(-)
---
base-commit: e55c6b9a3522aaf1441a0662d534c1c7bfa9b860
change-id: 20260718-drm_simple_encoder_init-d069a4cc7f8b

Best regards,
--  
Diogo Silva <diogompaissilva@gmail.com>

