Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62179432BC9
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562103; cv=none; b=tuBxCsI/O3yjWoMRaymOhRJQkwp0rm+JdvPkjYxYdwd+d2R5qQaBCCr4JXAkvcoE1DxE0Dn0uBWiZ9T5D5rcwncoXF0z6H1MK86CH7vjhOFQEQbG0cNZwqBl3ZYYsk26cmTCMti9JsglmlCJtD1THAFPdzRVqvYfw8YdJJYkfqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562103; c=relaxed/simple;
	bh=bMs/03E/pLT09J4z4UiyyuHjtplBVReDGtgMdQzn3hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cN1KNi3fVhyHV64i0Q8GjNwwhjAaRp+AWXWFLJEANckJHCTgmd+MeyVkwpogYjovqimlNwOOyRTHJPqF7x+Qm8xPHZ7mwtYz+GFowaGBDMbIr75ftZUtDzhmg1rO8XhmeXbIgCV+GBbrzEQ1kJJDNJNQTmuUJYZak1c5g1eGAec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWmMJTpk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWmMJTpk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so7943340f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562099; x=1785166899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=VWmMJTpkEKEYTYiEghxZdfOKcSv37ci+3ri1jshAFOVvq8hExThRLCqUNgaC/xubDS
         KyCTIBH1J3QuXvDwnkASDjvB6e/jocO9NVWJWciFuM8wToWXOjpCfQF7jgiWwb3UP1LZ
         6M3sUdBXaOp1mGgXXwuDb3+g0eyLDJHH/GHkjurKMdvFAn6hUjKq7uf0sP8G85nLMLGq
         ipXQjN+TpEPzEmrKYe2UE+EOdFUkyq6/1x1KlhV2YFKGQPKt5NTYslf8zCu8ibBU8QwN
         4RjPrBq1yVGcgr5rXpAfBxi8Ywaf1+WSuANm8od4KSKq0Twr3+OWxcHkTC7N8lsZMlh2
         ZfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562099; x=1785166899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=RpOMEX3MvWexOSAYxVgRwvjRsrhiCiDUnbGBGDs35mvrhO8epEzzvptEPi3ekQxsYW
         Io+s+s/zDPIpWSoQCuf38wqNURMqmHPyilRNAnTe5EnFoHdPaqFU3SmpVNvJBOzb0V1B
         LRMeizfINe5vNfZDEKTxypnxU5MHKoT2gznmzV5HJlVesHvPFxcMAemwv5dfrdeedcEN
         I5mmWXfd8xZEYCVYEZfOk3xb64rebL+bOkyLZ99HgpeNLkEbBYuj9ec7stZZaV7+vV7Y
         +GbRxj3qFH3yrDeH4W2CRDcDV7P8uTZsxBQ+svKIY5ATYPGgkr32WUfFhYBHRMapP9Hx
         ArEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1P5g8jh/3kS+Ze68mDMwz9Myy0UQFEVrCG1nhop022lub/odU/wOoiFnJywK6WQhYTpmVN1HV9rzsKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywer+Sj2I+Zy4EhrEJ5t5FVUe8Agy77u8KW8npfzpkLaS6ZiQL1
	R3FKe75LGJ78wYGsVQVIpWddeMa88JEug3q45wn0y7FvoIhQSY4qPdlP
X-Gm-Gg: AR+sD127ao9WAPm7CWr4/EdFJDxgS7HJidI0L3N7F9zmzRpRnZnNgeKMcOPjsvyY/xM
	a0cR3VUvalYhH6N9ujfS47MrX8Jpon42pAB0g8qX+RW1uIvh8f31gMlZOFrONw5xtdMCt1VKv1+
	E4YBP4szuN9KZBvTs3ebRmoklm5/mzYa0kBMrU8Dv9tTymFQF9ArjEY6V2Q7HtOE0aqyyQS002E
	FaL8PYbeUm/R4+Aj9kG8GvV5o2YJFCBascvryzBU8WXQgew1sG3uckoObyjyN86vc1XsUjJu4Q5
	r/2MXfYdMPRJWHGsbvdZbN12YBoFQXy1bkrhsKnUUlUjvOBTl22E5oKkjP/EMc3kzB/G6zD6R11
	ii6CbHir4pNq6x3s6kYIYiJA47w5CaD98HG7pibd8nOeXP+o42jtbwuQ4Cw95MCZ8A8rA3fFKv6
	OrE43ul495ng==
X-Received: by 2002:a5d:5f91:0:b0:46f:7d90:8121 with SMTP id ffacd0b85a97d-47f62305661mr18563371f8f.14.1784562099337;
        Mon, 20 Jul 2026 08:41:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:38 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:46 +0200
Subject: [PATCH v2 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-14-5020b630668a@gmail.com>
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

All driver users of drm_simple_encoder_init() have been converted to
drm_encoder_init(). Drop the helper and open-code its remaining internal
use in drm_simple_display_pipe_init() to prevent new users.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 13 ++-----------
 include/drm/drm_simple_kms_helper.h     |  4 ----
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 8e1d07b9f1e3..7878b9d7d524 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -20,16 +20,6 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type)
-{
-	return drm_encoder_init(dev, encoder,
-				&drm_simple_encoder_funcs_cleanup,
-				encoder_type, NULL);
-}
-EXPORT_SYMBOL(drm_simple_encoder_init);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type)
 {
@@ -363,7 +353,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(dev, encoder, &drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret || !connector)
 		return ret;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index cb672ce0e856..c95f86ff355f 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -68,10 +68,6 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type);
 

-- 
2.54.0

