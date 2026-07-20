Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D80435A9E
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562088; cv=none; b=NNywwNwtxYqExzZx8DsitvKGtxMrTi+efwzv//j2nK51O49/QZipIiqcJRMGEd/Oq6eUvDiVGphFnMEHGJGrvaRFmt6Kxz3xCBBju9hRRO1wsO+Lb7IySQSt8h6uPuYSsXj7zG1YwLm/lsR6NBqNtJhQvuvQdCV6JIRWxTy+81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562088; c=relaxed/simple;
	bh=l+SJq54PDPW0D7z8ZwWtaXQW066KSgEiZsyj7f7pch8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npdao2WA2w95DNP5F7y594ouMHZuxrp02WJ5DcE0cbC58ihUGk05OMech202P+WiamdVtJKVvzhoX2zJY16bLb2U82ZQ3QC341kBsQqvs7wURN1WxcDaARWdEK/AjM8dwqNeYCaI9ESb3uJp5NziTO/y3s4Xt2NV/FdXcxL96Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQVswAsy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQVswAsy"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f7854678bso336477f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562084; x=1785166884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=BQVswAsyvORrB0Suv9iO7ee9CFbv4m7Qp5uBZceX3awFykXTV7igkVlICzS79hmSsi
         QYJh0Q98f41z2g8Pz3H8eRPyddyqHwlxsuXkr1QBjVqrm0ad7FB7dfk7w9E4grKYakW0
         +KKjr484w0MnJYFv+fs68TxU5mtyTph6kVNwri4jngahLs0t+g7TYR4AgLEH9vQahfFL
         C/s/XfIZFinwh0Dcxqqdtvf5ZCDc1Jcqn9HZTUwGRu3mvGw0EGPibo3XkdXQLO0dh1jS
         JZav6ej9sm3G3wOUil+nWX6hanU+Z63UoxRJiyUijMwecxw2TLYLxUVlY28WeApIew++
         +Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562084; x=1785166884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=bCpjBRiOLbQeftiCq04WFBHcYnHnLggUcJm34MHjdtq2couqNAyw9IJSKxlBRRcsJu
         Lo8qu01sytUsGttSK0eGY8qzuQJ0F2KGiWrl503PU4b0/9WKcT4k8y4266gZyIU/ZhEq
         wZdQXoea4X58juQ8+h84IJYmz2y4Bb4oGKgJ9J9aWswOT9GyheeIxzn9lKIhZt9s5LNV
         W9Zub5177L/vyWpzjQhlgpExtMIQBDs/BFPULCPWvHS6FKHwhgpiV9TERij/5AHZSJVO
         0UFfvpn6MYGM5Ez2UQiOVW6xoAkk9F59Mum023osxS3mqSB0dlyt21aMqCvhzEqhEWEM
         a5VA==
X-Forwarded-Encrypted: i=1; AHgh+RrEpSuAm0/XckBierUw7BP9gwa7aZx2BOYEJtLyFqVSVRFjlyCjVuUYx4j3FwJVwnRAGVT0HR/dOJMURw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGu5j7/cgrokMWk+Tu+WglSkEk7BB7RxqoscnY7HHu7c/p5u9+
	zGkXZsIaCKthJVyPSwNxFeUQYjd13E064YOYqFsZLba3EQWI0TirKWI9
X-Gm-Gg: AfdE7cnxghZoZKa0cFbXdOZkESoifY3ivRP1s+ZyIGlKbjU4DHHNpdtzhFTQDIMHYqF
	0IFx9qUENtlfLbRKizipJo9NrCTzWo4u0kJNLg/0KOMZVQpOmo8wCbA8mz7xX/u0uqMoIQekeCg
	VW0M4J0ADFd/+12capj6zO/9G3Y/uGJETW68T9kH0ILuqAuIWx2dBz4KAoGKUue73mFDuFyuJVk
	ECzLHlo+KjtAxY7olKH2EkF9s6Idvh/wyNBCR61Q6+oLPssJaIiJP5E+q2iJrcIIpNwfufc3Z8K
	JDTKAbSPpa6FpYvUrlANoc0okD83oscsniybAmtZalbkc+ZM68zeSIV6kuSIB2F/FRuBlMUpO1l
	ZK1UCQy3I5bePbpHgY1qqS1dXM0e3WCInfL/yFLQLhPnWynvECLOBeTqpRcw0s/fw5kI6F39stx
	s69uxOImYwUg==
X-Received: by 2002:a05:600c:4fc2:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-4955b0224c7mr79919205e9.26.1784562084325;
        Mon, 20 Jul 2026 08:41:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:23 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:42 +0200
Subject: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
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
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 1a2b9b68af6f..2dc477c7eda6 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -29,7 +30,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <video/videomode.h>
@@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
 };
 
+static const struct drm_encoder_funcs shmob_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /* -----------------------------------------------------------------------------
  * Encoder
  */
@@ -448,8 +452,8 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 	encoder->possible_crtcs = 1;
 
-	ret = drm_simple_encoder_init(&sdev->ddev, encoder,
-				      DRM_MODE_ENCODER_DPI);
+	ret = drm_encoder_init(&sdev->ddev, encoder, &shmob_encoder_funcs,
+			       DRM_MODE_ENCODER_DPI, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0

