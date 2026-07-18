Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A037BE7C
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417793; cv=none; b=UWMvKeyPR4MaRAs4/R1E3Qf2gSXp6flQxJFkwWw8GbcibT8DWT2Y+x58jWI2NlUUFMRiXek8PX0gknLdeIM6yxKaeklRvX5zP5knHsweC1ALRKx+7WFLmREdTWMWXQryR1jRq754uE1p/ZzGD7g0FdPcWEUQ7ssYf2oDOPT6+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417793; c=relaxed/simple;
	bh=xtpstExKIgCbeQEE7Wf+l6VvB9HewQ24E1EuTt+0AL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dL20rwJhVtQoUc79Em2QvYqoksxTR1uZysB1OIIkl9M58/0zHqKXdegUmHdqJ2Kj68ByTbb2HcPvmZ4pSNxs+shgDKFfAenETQyqUj73vAxnUgzfd9WZHIRm6YbvvXHIvNFBWNKV30jzFb+wKfNZ1Z6HggjvFcfrM8PGQSpmlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN+Tq+6F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN+Tq+6F"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so1122375e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417790; x=1785022590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=qN+Tq+6Fdz3IFVf+WFkRf67B0LszU9n2GxJMigkBjUpT/KjD1MOfXcw/tNlPfJd7lT
         8QpJTWresaKPTMPHEbouCyHPXGPmKGIwDrmSgt7QZQKSi+roTE2jsadKW8talFxTfdVK
         y9aq7QsiUN3sWZydXuJb6spEiXkzDDDLGHys0A/9KibwDXGsRD3eHB0dEqmzgc9UeEpH
         QJXBfkrOCup82nDNfSRPKnUIR573eRujavT47SL2dj4NJnisavRBAsrL9uUHEZ1+Ec/G
         jNbHIwyFQSh5huQeNRaJbG2vl6qnPzw9NM7iMq1wrdIqBnhJovzcUxla3lh/mKPyV1YT
         cSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417790; x=1785022590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8dh5aQckfiP03vdZ5nRuu+LA2oP+sZO4zs8QLavR/M=;
        b=qYWejBkYwg7e/Lk8sffnG6WmKBh7xkd6R+j3VVi5mVizgFDQativyGuM3eZD0bVIPF
         dv+kur20lqSGfcyvPExv93YYSnSBGNAJmpojJsqj35StIyZOUgIrvL6iaDYBy79YcVGT
         Curox6fVbY94jM7USsgl5nap1EtL1byOipX6+3WJWT3LrcOou0Zw3NKBlq3kl80uk1M+
         wExIT9CthxCxEWGG2yVviPdyf2Kq8vp2Sq5vRMB/mtERMFrVsVIfJ3LoYhD4yoNYE4wf
         CSa3OyOYzxwSjim0GS9PoWOfBlT467oJvcsE29TsQ4URJY36ACnQYn4V2cl5XH5SYroD
         BqhQ==
X-Forwarded-Encrypted: i=1; AHgh+RobwgMQJhVEX2pQ1YrcVHG+POiSF2iKqaqUL4cAlmC9KIKDYpQ4YK5KdBMfdgLgrgkMKdsvWJcOCHSvjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy7YLFNO2FPtTlCTtdEVquEbRsI2M/Njxu6KmsW/0Rl8gVnCK6
	t/aqYUNY0D5hKT940N/Zqw6MBFjwftEnB+u1mT/NPlLIp45yJSA/Ye1r
X-Gm-Gg: AfdE7cmDt6yLVpj4okaqk04aYQDmJT5Tmp9q2VSEVMGg+koNdzxjig7tOLtH4i5tkVt
	yKDcQ58OLcLARiY0JEe4aGxHnv84ynpOKGwe2cqHAxuWSpT4qHufs9ZP5/tZJQW3ZyKVuxxjrLK
	egGMZ5fXYuqXBBlFr2Ir0J57YZPR0z96Z7wxv0+IOYw6E1SbqhdhRh32/IjDWZQrcL9sjF5vyKI
	03jSeu7xpLWscFqFh17aHjzagFgCQ+UC6s+1S67lpBdq80Rw8h2ReXZbLJQCh+YdyjTsn1JwPmS
	rnDIye3zIuEBJU4t5nHyYQdHHPKT3HizoGpnNg5GUemzVEK0SvCUwkSBJNkUaAMO+FtpIOJnjTB
	K9bM1UpIjssQTKdN2JoP/QZPBpEqyuxswg7KFooNn4xMSBUs9QV/4csKVYr7xBn3fQ4IqfpXp3k
	rtc51gk1J/ag==
X-Received: by 2002:a05:600c:6dc9:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-4954a5151e5mr67150965e9.27.1784417789982;
        Sat, 18 Jul 2026 16:36:29 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:29 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:40 +0200
Subject: [PATCH 09/15] drm/mediatek: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-9-a78c509e3062@gmail.com>
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

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3f3f56eed3f9..7cd136bd9605 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -21,12 +21,12 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
@@ -913,12 +913,16 @@ void mtk_dsi_ddp_stop(struct device *dev)
 	mtk_dsi_poweroff(dsi);
 }
 
+static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
 
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		drm_err(drm, "Failed to encoder init to drm\n");
 		return ret;

-- 
2.54.0

