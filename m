Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A74236CDE3
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417785; cv=none; b=ZkvJSUBw+iKh4lu29eSRV9pj8EO/92F/Cvugu+kDyJbjjBPtMFKyPzl8lavkuJaVGmH3xs+8bP/qoFbs/pgv1mF9k5BCNFZUgiTvQZTywPnNQQSkFaXnALJt24RoFK0iGt+3flGYAVto/tk4Mu6MqtnSOWU7gKbl/E2bRh2mhf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417785; c=relaxed/simple;
	bh=HdxpWSHVTZnagqWd9UGqEZtDSs8wJ971uoSLZwkj04A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcFBqhtq4vAr3F3TA95rs5V6tGYhHQEGLeL9a81QJawJypf3mlWTA/vLamcr9IH0GkGtH/Gimte2wkWpEY4M9RO3TQI2+bqCGMxggS7z41OwGONxiF8NYaS9pi3boRpntK1IQ89I2pHOFEWHs5sceyDzRwxB58XLzD/GURvETk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCBHPNTc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCBHPNTc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b966dd74so36649455e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417782; x=1785022582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=iCBHPNTcmL2rah7W12QJ5bx8SROL5KuvmYbegOMFlT8oz3sMXFzkVJEoqZAM7iPuCC
         GsPgVt0aX6Qq6HPQlvIa/g9qV3WmVJGAhVO6n8PXNvsH4EVmZkSYWw+IkDkrzgUFRwDH
         fDyTuZpo4Wz9FLsgNsUiWt2CFk+4m90Id76zwg/tAWn0thM2llgPAkBWiwf06B5o2vBS
         Y9b6JZFhlJ0jWmNnTJTTz9drKmYhyfIF/rVseUYiWb8Cshn9NRDceqdoGq4Z9Eiq6Gtv
         xyln555qmks2oIa9dLsZPQfvHioVpl+EzehQ+65b/3LAYMsXApfkEJ5L4yY6raxrRwWf
         yhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417782; x=1785022582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=WlMghrLUNROl3eIeEtvMZJANO8Oa0FQp2YRT6B7InnCpEwR5/lP9p1zMQO1Teo8AgB
         jIdnGbUq3/nDH7VqUBOW0KeeRD7V4TEbLKz5ulDv/r92i7kxJC4B3T4Zr/namP1S80yJ
         e0fdGi3DjOo4P7p97mI7B1zVVgRlAswk9neWsplZklZVL+IfSsQX7ZYD2LyYPt/3AtCP
         LjVcus1BNdu1td3Lt7CAgKPsTIhH8WwE6sVu6oqv2MK0ys8nhsFMhsNbqSgZj6nvCfxj
         fIQYIeQ5z3XU6qsaoRxF1QdH+Ukkbr6R9+kSzwWKlIKMEDNwLnLLinqA92NZJKp3SadE
         E0IA==
X-Forwarded-Encrypted: i=1; AHgh+RohLcxE/vmotRrSBkGodm2Q4S9VKnS4v7iTf7bdMQviNZADKGmIvDn9jpV/kBL+sxVP8b7+jCRrRaSORw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNO9MTjqcQYBZWV7rUmsAVrvkMC82Kf7jV5XA7idsbeNjFjxv6
	z1vY2r8oNewwfC7KEkyfNEnmgBNo5ZDHep7flvhjSgmDMFRSTBjQRBIZ
X-Gm-Gg: AfdE7cmWjKmGMYa6QWR5TDCNwHn6s8HRhlcHxopYAwM21GyhbArdwuaDEDlPGuXLIR5
	zEmJ/vcsleHPOjaz3QvQp4U78OoAjhBuB6GA2FOmcWPhRWC7Tj02xlp0SD3COhH0c7LaRtjrm0N
	wd8oR5S3Vh2LQKwvTnSNvdS1X7lArkWka4DX/152PnYSQvASubButwpVrYDDXc+VP1Y9RNqCW5f
	h56lCi4FrGqJ38tEiGdWg7VJKylWhM1wTjGmjbRLhSJ1F2rvvw1tT6gdflpPhBY4oGDuBvRfb9b
	6bw5nCcWBFv+QuxSRyy9B2m7OTr/s4IFquEudtnIwSi5370DVttfoFVQwSboq4DWue1CEct2d+e
	vHR/3n5o0iT/RLQmlI0CbAZgi/zMDW08Pex6VZRtyN0P1bmcfsT/wHl7ciovZ5CrSW7kf+Q+nVJ
	FrdOuQdXV9xQ==
X-Received: by 2002:a05:600c:4746:b0:495:4d07:4fcb with SMTP id 5b1f17b1804b1-4954d0784c6mr79013155e9.36.1784417782504;
        Sat, 18 Jul 2026 16:36:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:21 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:38 +0200
Subject: [PATCH 07/15] drm/tidss: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-7-a78c509e3062@gmail.com>
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

