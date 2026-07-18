Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F2379C28
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417787; cv=none; b=uTaFFDi1H6jFIY0qjtG/EwxjuwMzU217i2CwqzOEA4nZkGE4IuD19cuAQZApGFILb0WYrXyLC9ogjJueCcv/+ZbdZm79utkxESZeF6frm98q6QbhaEyIz43hSMEpHDdXxZMAYDraMUQ/CSlfVMs3mX1XABTZPTaY8d5MmdROq+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417787; c=relaxed/simple;
	bh=uAbddcMyRgpLPl1Ml7UGFgQr7U5XL5NUVGp3YEItfuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2W3xT+LjlnARZNg7oYUtECeSjIJsbVUqZUNaMJcjjnPf6W1DUrFqsQeB3Ss1Br6ZCpc7aeSDUq+fkQbFkpRo2CHrJp2kpTeM4UnPr4nSgUpBPQpSWifhzSsMrLxrKwspgzJ/A1hg6YHD7YbMj1bFts3bthdJnAuwFwUdvPda2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtlCcNee; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtlCcNee"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f7027ca11so202973f8f.3
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417779; x=1785022579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=KtlCcNeegq5ZtXkQLi3SgIe2cScOLVwBgT2+Mp00KKdDJ/F5VTJjghruZIuV0GJyg5
         +2gWRbYwjabq1qIqz3RRIODN7mUTQIw9j7iPfySmd5ctxFzqMs1zJJzmG35jAj6SvR1C
         qcZcE25uATYX+EL5Gmf4QiAmw2Y8Dkmhso26VCB23c6vCAPSgJCF3NgeYsZmZLTXdw5/
         5O/zlSq1enFEEvR71n5feczUq+q/iS98MDItUQ7JQBE5L26NPE19MlYIbV0rZnAwglXJ
         kSfRFeU/Xdc9K/tS6UJNNzzXcwHzeNCmukY1RflNsG9AP9JeKyczPGRymtzq06o1GAwv
         986g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417779; x=1785022579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=h4ngRJreDuHqswJNJeIRXxYVbeNGC8C6Mg+d768ekmIK61o9EOcHYOx0MP6bEGV6rD
         +wOEfzuDq91ilUT0ooqHyB/V1pEvaYktpsyt8pz3SK7NLnLJEi82c4+UQosNRwlobnaK
         ASuyg8w+Yg+ehoqOzXAJLQcWZuyv83mj6QaIGd6IPOVuStCT+Wb8VYdJZAQLmINsfPa9
         kXl1yvqZLK7LiV9J6kApnQb79H68pdL7AfZ6oA9VfavZBjJCzjA5xF8Xz4Gm0Dykt61D
         y4KOtWhStzPqMUPzUzGNc0jM2MBXCvtCz2P40njlJKOPpCzicUuN9zZhowNtEgOvoXBc
         Fk4Q==
X-Forwarded-Encrypted: i=1; AHgh+RozUecidH8rbzHCyFcinrNPtFc8u/8Fvwg9As2Hf7VgZoafPZ/mhYRzQuMQ/c2BV+RsCs22YtHL1YnJxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDqNRYOtsMPr65gVDI9mNUG5FWL6s2vym4H0LF7xo/m8kJaLZE
	NO70usu93tX65zyEcl4S3kga04nrq8u3ttiXrn+OBtTHB+pYseJpE4RC
X-Gm-Gg: AfdE7cmBY4NmFOyYYKnhGH0Xz/rXi3TWMpgXy18JPCRaXwCcBhFMeswpg25qMI/R4wC
	lO3D5ghHoXyXHC1LtbsPG62gZbsweQxIzGQUtNBxvBbUE9iXws9RaQRVCmXLolM43aCY02HxsoP
	z/IZsmvJ+KowWhGSreXmbG8D36gyqbWvCvUulPG7MZRx4z8UCD1AuRXH5dDvi4wg3FBOGmNVpJZ
	tAFQT96vZqyjdohZliaIeskeFdQ+zorgARwk5KXlOTWOa+Xm1ktHOnX4N2gWXUds7zOJLpaozDD
	WVm0/ykrxzv+sr9+RuiQEWS6BBT7c4xqNdhDPDjhgIr/f7xXnwZCZqUJbrT6ZCPLnfoC9anv0OB
	QRDE54eOxwYWc2ZDY9mzvlWbZrbP16xsacOLSYHKrE+ximu8J46vLyZdItgPNPxCrVxsRQpWbBw
	fuMBNLv+RV60g26V0+nC4C
X-Received: by 2002:a7b:ca50:0:b0:495:3fe1:4ce4 with SMTP id 5b1f17b1804b1-4954a40c110mr70449165e9.26.1784417779234;
        Sat, 18 Jul 2026 16:36:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:18 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:37 +0200
Subject: [PATCH 06/15] drm/virtio: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-6-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/virtio/virtgpu_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 44ffffec550f..67023d91d40b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -28,11 +28,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
@@ -232,6 +232,10 @@ static enum drm_mode_status virtio_gpu_conn_mode_valid(struct drm_connector *con
 	return MODE_BAD;
 }
 
+static const struct drm_encoder_funcs virtio_gpu_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs = {
 	.mode_set   = virtio_gpu_enc_mode_set,
 	.enable     = virtio_gpu_enc_enable,
@@ -306,7 +310,11 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, encoder, &virtio_gpu_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 

-- 
2.54.0

