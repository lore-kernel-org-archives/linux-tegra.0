Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68ED377EB9
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417768; cv=none; b=TYfaoAV0QMYU8oG96TIGhebZbknMDgjXI9TU6FgErzQGJUpK3L1H/s5f1yO2PNz9GgGOoIm0jeu+iTB3uZegq32vtn9znPTAQbF3XkkhPnEgEqpGX1uxliBr52lKH0F/YHIZumsdghAHTN1eL1qWOZWiqDBG4g8CR8v7771Lfks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417768; c=relaxed/simple;
	bh=ZH81L3uHWN97/YC8FIR37Q/EWDlCtHMgy9u61P6CSM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEDosuoX2AlqAcp9EA6KDScQvxdAUszKzYANBPE8LwaHKxsPw4uU1fi6k0L0C2vbkSjcX7ojJVqcSpJ0G1z3mf+vNTrP82RmoSkLfWaJg1rkGk7FoBkiO2eolnxQfxWEH+GTqrdt2aajEaZ5gYOIuR+h1PpzO5OdvKIz+gXnNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4j7j0h6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4j7j0h6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so1120425e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417765; x=1785022565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxJhJqOvpAaSiQeGabxE955gR5KY+0a4asEx/JWs7Lo=;
        b=G4j7j0h6e915Ylzf8+u87qu55Lx+dwUsTf4WeGBevTmLmpqd3bmiWSyzp/MxhzVsjx
         av/Wx4aGeGCxhHUfJihyH3PwSbCRmeiD38x3rRQmPs7RZ7RVP/a7+cK5Uc5kf1B5NxH+
         nkdL4RuccpbutFS31tl441qFYmCVaAg1GWvJPefGg50SCzoB3gR+ChwVBcmhy+I+J162
         dsqpRawUrAs9gn5VG10wtGyi0On0eKFvDmm6XDrptf38xbBePepFcCLmEF4EkKb8R+cS
         FIVmdB4Mbr1vmDhwalszC+lrMYJTmLmuxtNHZ7Bf72ipzQnGny1GjYFpAr4q+uwGb9wt
         wDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417765; x=1785022565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxJhJqOvpAaSiQeGabxE955gR5KY+0a4asEx/JWs7Lo=;
        b=SjBKxvt+BoFEFy5h0L9XGoI5UW+OvEpMMkFgy/+4/yiC4h2r5OQerI+ZfASsLOPyEX
         A5zCHUEJhKDb9o6TucPnzvrVtvOUQyrzLDnj9UZcTLWoYxrseoeKhicR47BdoJNZjG/i
         vPOzhEavA3ndQ9gioWMAtN8UBwTH4d0P1xOjoLgMgDR+US/l2uwBlAzwk2UPg4I95EsE
         /PFYDnOk/MUZywlNAwtG70Kb2NtxJuyFTxZ/GJwK4fLV+nYsyFKBk6lI/xiJdnY1ueP/
         xsoQrmwnBo5bKmONZVD/zyw/Ad0Uds8wW+rRBTNA5USSoOmtkV+1gnyUz5kPttvTUw1u
         aj8g==
X-Forwarded-Encrypted: i=1; AHgh+RolunfRsHQo3Jcaf3/w/vgU/YbPXaJtgsmPj8EfhKKLcKHZFJpA+ZL27CjghYCLM7CckPONurD5P2ZoiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO7OHgqAYZJEv2KS83lBXB5lxHF8vwsdw9ma5lM6EZrMNYJi59
	2mCM7HyDBL1pLQd5BPaA/hCG3A6S4Wosk+fVF1TjosiQm++NKCkeGoC8
X-Gm-Gg: AfdE7cn0wl6/5B5mO5O4ZYVv4jDrdE/4wAge+DdHxcalbtSIxV0c7bOfW0PK38Aaxr9
	5YmBtM4mpPDDrCF4uVf5Cg0+sebNzr4XFV6OzU9SfnkFL+gXfAxpBz/8E2tYTknBuz9eyYnPs0Z
	E0vq0z+yHy53W5kQU7yE6c+vOEthOcvofLeytgJ3aJNO/sEDmV/fLGQQAmiZ9tStu+N3BtfSJ0J
	fygVpmTK6kCOT8Blu+2OtAEQDcL7adgj8dU84wcnEt26xuklA2wpmCqaJtiHWRNpkvlwxlpxQol
	VVwSs8TCHD/G07rE6Jcb18oPZ2tlca3HtyXcx2xw3h7bKTKvWUlsuQGowUGdpJRoPPIF2C3oSVV
	4Zg8tnXiLBG7FUagwLrZu+fWsB4blILJ2KwzpwgOI/7uV5vOyKwpR3dnPa8uoLFLVtp14u/bs9Y
	vmjZ+wrXt8tw==
X-Received: by 2002:a05:600c:4ec6:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-4954d5c913dmr76289525e9.7.1784417764814;
        Sat, 18 Jul 2026 16:36:04 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:04 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:33 +0200
Subject: [PATCH 02/15] drm/xlnx/zynqmp_dpsub: remove dependency on DRM
 simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-2-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index d5f922450565..1d194c2824e3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -30,7 +30,6 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/clk.h>
@@ -417,6 +416,10 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 	.minor				= 0,
 };
 
+static const struct drm_encoder_funcs zynqmp_dpsub_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_encoder *encoder = &dpsub->drm->encoder;
@@ -436,7 +439,13 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	/* Create the encoder and attach the bridge. */
 	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
-	drm_simple_encoder_init(&dpsub->drm->dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(&dpsub->drm->dev, encoder,
+			       &zynqmp_dpsub_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		dev_err(dpsub->dev, "failed to initialize encoder\n");
+		return ret;
+	}
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);

-- 
2.54.0

