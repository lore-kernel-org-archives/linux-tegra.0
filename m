Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3642349CE4
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417772; cv=none; b=sqR5TqHKcqtu2xGF/yWg/gOps9FC/Obb3oMmkzgYq1bxC9llCfIyEm3xZBmRHbXk8CmD4/T6y+GR0TAsqhuZm01uaGOykddWIaweJDFBt6TXACjU0Yi6m91x3CrlY5ESAQ6yty6jQ638WnHJls4kuMMrL3kLbghTuHp9J5pofLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417772; c=relaxed/simple;
	bh=vUlV0bfkxAr1ke6u+O++/m3ul17qgcqKWxREUGJ4Esw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oevCnAed11WZBGXT9ik6QnAtv6jmJzPZMtWizlAEOK4bzUG0R3Dce70CMStaHt85p/OpyYfK7U3er6es8sPeuQgH4jnNVjkGiQ0R2dog59QRaZc67ViawoGlhKbD6IK0moV6y8nqcnrYAb4JoHU74XTkjZlGL4lsAneJJ8GsEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0lNWXVk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0lNWXVk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso4773525e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417769; x=1785022569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FjNP86ptWMOuru/pKfvMOeLrB2j6SXLcAuojoL3wm4=;
        b=S0lNWXVk4ndU1tsc5BOhCHwEl0rLabZ20znooQYAq6mBYDWjlAjORz6Fqv+IiU1v6s
         8pu04eA+MLqHOS6sR0JUWfXLbe5OD7gduD7/I1L749fRxczlDPJV0OMdeStNeX/ZeLDX
         UmjOgePqI71YRP4piTRycrxwzJ4hLrIx+wF8bQLN2yndHafqDP9XyIkV1zoATF4qUSfT
         Yizgv23GeluLLbDgXyF/7qDSLDoQCTWEtubGHmm3g/FFlSmvpsvMDxkeX6sBaA3gXjw/
         bMMO6aNEyptBSqt5sx8wZ4l93QBzOJPVkXr3zX3Qyw0Tv4TXyjhg6gxC35bq3rhkag1I
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417769; x=1785022569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FjNP86ptWMOuru/pKfvMOeLrB2j6SXLcAuojoL3wm4=;
        b=f3uz6rlBh0mURqspuqqX5sN4UAEFpOFNKpfebMB+QdwzZ5M6kRoLvCB9kjFKeSxums
         HfseevZCsjf+ufSGA144qLek1+KBhSG4j/otO9qiNSH7wWO4LpI5aY4l4FvU5ZzXJ74G
         sS5sC/jrosBIxBcUq3sXbsBRu1TWUwbHpqS+aDTU3M2Qpj94dDi6srBqRFPSDdrEBOCT
         36N+aURTPNb+DeOMS4CLN1+rArWGKdRsZlq3BBEMlhVWrK2OU3kJJrF6VxY6uzITVJqf
         MR2WZ3MZsig/wIS69ItWH3hoeR79f5Sl9AGoEYU7z5GnMP/wQj/RpbzC12tirGLjswcr
         qGYw==
X-Forwarded-Encrypted: i=1; AHgh+Rqr1PouoONu4yUM/B8Imw6NGMbiFvuSKWAd/7w2pgvdhoBxfvEHV/QktOE/ou57Dc7fPOCdK4fsgsZfXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYta1zNKDpHexdufVp69MBgaEP76IyOwkxxwFB5XEJXj6Qy9ne
	fKl8yHE4/1JS8zbGjQcEDlkMTZ5chhUWLeTAX9VQLNNNxhGYbaNtUjQs
X-Gm-Gg: AfdE7cn2xfa5T6F6EY20mmLir+6793hMWTCbjoKbJMG27jZhWWP0Ob1S51NaoT1YwJH
	RhpzdDEFdHjrrSNpHKMHPvLyFSwF7zB1+jw76tDxSNlKDS+pQywEqhmsLb5v0Xrrd5wCRVhqwOE
	Pm3dlXxG6yrrGZbccrvjCabr+3KHMpKny37XO7evsTyYgDjgRJhPiglnhfzHf5V/Ilhq96hEdvX
	RFIFUKe6okYOnUVLR/fkndlzwrK+bPgi8AJ5V+7px0VHZVdBKGBRW821n6GPRYZHoRgWa7Guoej
	gGQroSoyTidoxugtAES0mhxqSz9XXpB0LqLqDiqw9kB852pj2JbWiXNROvWEdg3QFn2QZ6KiHA6
	yOuUElUKRYDolKAtISNboT2qqIoM/wUX7HyHgOL/BGT6R5/IXYbRmZ8JO44+Sl4j+fKGoWzybj/
	Mbe55BPtgs/bR10kQKka/h
X-Received: by 2002:a7b:ce84:0:b0:495:4487:61af with SMTP id 5b1f17b1804b1-4954a51659emr61464735e9.36.1784417768965;
        Sat, 18 Jul 2026 16:36:08 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:07 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:34 +0200
Subject: [PATCH 03/15] drm/tegra: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-3-a78c509e3062@gmail.com>
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

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 17 ++++++++++++++---
 drivers/gpu/drm/tegra/rgb.c | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index e7fdd8c7ac12..840e118716b2 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -20,11 +20,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -1055,6 +1055,10 @@ tegra_dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_funcs = {
 	.disable = tegra_dsi_encoder_disable,
 	.enable = tegra_dsi_encoder_enable,
@@ -1078,8 +1082,15 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_simple_encoder_init(drm, &dsi->output.encoder,
-					DRM_MODE_ENCODER_DSI);
+		err = drm_encoder_init(drm, &dsi->output.encoder,
+				       &tegra_dsi_encoder_funcs,
+				       DRM_MODE_ENCODER_DSI, NULL);
+		if (err) {
+			dev_err(dsi->dev, "failed to initialize encoder: %d\n",
+				err);
+			return err;
+		}
+
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index e67fbb2362e6..337925c30d67 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -194,6 +194,10 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 	.disable = tegra_rgb_encoder_disable,
 	.enable = tegra_rgb_encoder_enable,
@@ -305,7 +309,13 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
-	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
+	err = drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
+	if (err) {
+		dev_err(output->dev, "failed to initialize encoder: %d\n", err);
+		return err;
+	}
+
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 

-- 
2.54.0

