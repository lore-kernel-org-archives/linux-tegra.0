Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE7942E8DF
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562061; cv=none; b=AVhSDHAvM31OEHEoiRWZble8cl2dnXdt5oCTHYkmJrvQY6FiusxUt48B/ovWSHM8Yb4Yum+SZ/tFitny4xnrMtHe53uRnXMTuFv9Unyv9dxm4fKrkgrNwS5WbTLSqNg2gll7gxxJo8O4XFmh3XtscKVSKYosn2Vp5HEJ74vyE3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562061; c=relaxed/simple;
	bh=X02XAkJ/qvwOROXqM6gNmWkrEK5vY8c0WEEa1+0hPmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wtjny/4stYcT7YtyXI6W2MRKZZRyNRfhUM3NKhGJgLpHd7nTDeC3vYAblc5QxsGhuu7bpAi29fOdMeLqHYU4eUVfOdVgugCwHzghfIb85rBD6ij/z1XiStxmSdRn/COCxZ/r7UQNwGwFg8rxAYNlXUOPwfGdMGAG7pELBu8wSrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzUYvdSo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzUYvdSo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f785467faso722981f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562057; x=1785166857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=;
        b=SzUYvdSo3TPZZJ6wjyfuAwXtBMXTSjAzO/X45V/j+xmqa50j2FxcIQNilFenvrVC5T
         BEt8wwrgoPLik4ca0b/k92wWEiwjS9CZaKzDONsAaDNJkUsRstIYVcunVM2yGbrCDukd
         ctidm4j2ZZBlkThOMCKup0x2o9iJZpmIs4zIew2FU9DcgICgkXfmIn/girrcZkarteC+
         s2TL6LHH/szM5g4GMq9oHYXbOD0VrIyMC2VD2jqLZ589g0u0vpyZzKOTkrLV9UPuC3hW
         HbERsdUGTsCA/lWsjzHALRAZ2ogKqqUZn0JGfb5XRbO1yUIxGYLg4gW4bWZs4rTQpCcP
         pgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562057; x=1785166857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7zJzFQDZ2ba/zKljTx71fkG4BHmnEG0mOPFGgp16IY=;
        b=Tqn9jb/EJWyg0f+YxARivFLPQ0i0+FFh6DkWLOHYhCS2c4E1BgR8WXXORfhwN33o/d
         8YoeekqSAc97ixXAhfb5tdIRYLS4cG1LpROyd3rth2ufsH36hpPwWLqgtYeeAQuzq+h4
         2sT2fBDh1gTjYy1Kh3m1Zny9gdT6UUBYvnymhNfQC9LeBdUjSPrXWlKLVPTPL4AY0fLE
         dlitN3FGAjSv3ZiK19eafNjfSwRUfToEE2rJZQPamfxduQa7aZLmcuJTWYwt4QdJCrK+
         VNNGewKB3NrkQk7KaTdxk3+6/Cr4lFG2ncvoaOt6zAB/nkjDAX0yT644QhETIg5NeX8L
         DWjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYQ9f6MxrfdyaBEzaycuJQ/6fTauM22MF7Uu10f79Ge1o5oBDfRufQu4P4DF/4oGDnHm7R7O16ZaRb3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhTnHUNRGeY/VelNAapReGYx57BLJXNDclJf8brVYaJfNGwHp
	LwWVinpQccByh03F61B3exj/TFeMy3NOErhshVrCyeVNZtitD8TnzyOp
X-Gm-Gg: AR+sD10vCM3j/pBjP2RplwFxv4y0+6BobUTW9pIIktcPhuibR+wA7ONwh6+aTw88TDp
	0A7AVY5SjC3IrWdj8vxd+tDbClPX9s+vRZfoy+Lhm98R62/zL6sr7l4FBcX/Hs74gURFiT6C1Lq
	Nvo2HNjIiy72f2nbktJmWs0TfMhWF/hvNNPEsQ6uqbVKTtCbtN+kdsS01I9ym/j/bMn9oTOmicd
	6m01uAEMl2+SyUck3dsVsy2zbUF9mSEVQdXHRzEhTm4v+Aryf6J0VWSGDY+9vjlM9qaXLCl13si
	9ud7ndeZwkkFHS3nKWKDoLwTe86Zl41a9S+UoGdOLW0JSzh3uOYoMrguT772KfQIgjFzyaNuHlc
	3i4NGyEDaPJCOz8Da9SKGYvMho6zFbWb667/bkZDWoEaupjhm5//ZygXUqCGNZLRdJtXXVmR8GV
	28mmfkAT0o6Q==
X-Received: by 2002:a5d:6f02:0:b0:47f:7154:ab20 with SMTP id ffacd0b85a97d-47f7154ae17mr8536055f8f.37.1784562057410;
        Mon, 20 Jul 2026 08:40:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:56 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:35 +0200
Subject: [PATCH v2 03/15] drm/tegra: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-3-5020b630668a@gmail.com>
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
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 16 +++++++++++++---
 drivers/gpu/drm/tegra/rgb.c | 15 +++++++++++++--
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index e7fdd8c7ac12..3f818c195e9a 100644
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
@@ -1078,8 +1082,14 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_simple_encoder_init(drm, &dsi->output.encoder,
-					DRM_MODE_ENCODER_DSI);
+		err = drm_encoder_init(drm, &dsi->output.encoder,
+				       &tegra_dsi_encoder_funcs,
+				       DRM_MODE_ENCODER_DSI, NULL);
+		if (err) {
+			drm_err(drm, "failed to initialize encoder: %d\n", err);
+			return err;
+		}
+
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index e67fbb2362e6..bc1c93c7554c 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -9,7 +9,8 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_print.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -194,6 +195,10 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 	.disable = tegra_rgb_encoder_disable,
 	.enable = tegra_rgb_encoder_enable,
@@ -305,7 +310,13 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
-	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
+	err = drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
+	if (err) {
+		drm_err(drm, "failed to initialize encoder: %d\n", err);
+		return err;
+	}
+
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 

-- 
2.54.0

