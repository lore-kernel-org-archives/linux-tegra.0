Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308F331EDA
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417776; cv=none; b=IxxUy9v01/6Dmi9Rjl/Tas826dvcWfVk+5HtFT4kFDXLzWO9UCyvdoU3kuzHKcSMGzpbSXHUXGaTnBVVLcHeUi24bZ+niNrK69B7o/MbrAAGEQ4T1ZU+Vn9UEsIs6uEl3GjTgoMP/5hEqNi4Vxrp+70l3Qou+obyeC2n8uwCzkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417776; c=relaxed/simple;
	bh=4Aj055TlPMxBq8UoEMyCmOSuvgCOAi6uSPvqm4WRBDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUCTRxIgfjI8UKSmqOLPJuCON25e9RA+sft7v3lsnPwt38OlzpnJSVnLsxcilMBR0+5URyh5esXdcgHy7GbJUZNNZwMcNd8MWnou27raMleNYdduiS7byRVGh5Y7KzUeG1Ypd1dNFG1RYDAVKUxP4yrL5j+aP7oiAXPVD5jYSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnFx/1dt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnFx/1dt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so10947205e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417772; x=1785022572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=XnFx/1dtm3RW6m9R0DWqGv1xBjRKS8nlj7WYVeLLTUirEGpNiF9SKFnvEHpweceN7g
         aFVc9eCoB57VfuoOwn/9Qbb4SItofgCiD2Br+ZIlUjbydII2Aldw1uRcAiofMGafvfyB
         ZTyTlnrUbYyS4l23FfhwAFl7AHn4JCi3L49WMg/RM3dV7887DAm3i9M85ZcBEqkBVRz3
         BDkU5rgHT3r5sQcbKqCXB7xQfQVoFAz0vXKPAPdBfqeA65frKeosUoeiEvdYwLMh+XNm
         SUIbXYFDRO2DoFvH6ozEL717LsQv+EXaSyNgvQbIxgHsJGK1u+Nzxm+uFFU+XnNBkDBW
         pGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417772; x=1785022572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=GdfgL2nOVJeog3SGdef+IMyC6y7T33xb1R7VpaAVIfLnKWl5h0LJainPOy+8u7twdj
         TGTz2JKwDd2lbfNgBc+2S5dwrDIWrnNeaE+jLtEeHT9aTNHCZHb4T7aIQQtxdRDWcejL
         mC8Kvb20/eeTUkEety643dTn8fSJr5tDBJoCJmJKgGQ0D+Vu4tH3ix4Z/b32cMbIXVc4
         DOtu55f7+8gID8aCXcKkqUWhOxu05z/9fKgwjw+JHYPkNyoPK2XJ2kf6GarmvFsvGDYh
         eTg18qPkSxGpYCth/z9EZb2cpJbazYVB/ImkfTlmL4pMPVsEbmlimOqmLsgGzQMYWXfx
         t0tw==
X-Forwarded-Encrypted: i=1; AHgh+Rokhm8Xzs/KvF6ZCWz0ZzifKcVkMPcGlM205JQ3qqRlZrb0j4Q9PPHBbzGDZewVAQeN56jSIRHIMF93Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEOcg6GHf5Mw1laD707t3KVKefVeFlv6CPQoEdKoaPwpecoNc
	r83qWe2Dqw90i7UuT1hEAS6wquKtrssPh659lAV/jQyPz0pxRZ5g8woR
X-Gm-Gg: AfdE7clWTByNi8wbBoxi4WKuUd8Npsn56nEFJhlnGmvRIwwEfuk0ug18JR+WYKN51ES
	yU58I4rcY35XSD605CASssEOvw1NRi/HXL5GIBVu7C5MPrVjkd/6lY4HCwAGUo3tsUrF7PSeU0u
	UnRBr3iaWWwETfpUN8dyaH6+B+ha6Zkuo6eCXXy8uGnHOA8T1PJoj4sd3byWZhXE3itnm0rIOnz
	PnuOfiSMEpozvZmvkXrisE+WXkhvrzVEmgI/Eg8QBI/0PyyBRLrlKP2pSdqmktyMT9IyFV9mLzq
	YKD5noJOXlnGdL0dIBsWqsFEttx0uEwhEaeYR4kjLuL+dhxBuE3UU+EXF9b7ZcqUoy+dReU186Q
	XvaEMvzslyVTW+AKY7PPGA/aMStj9H0rqSLWDrliNSmomaTNMK3x1xaGSpPgtFLj7ZNZZuORnj7
	99xPBH3TmOGQ==
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id 5b1f17b1804b1-49553d85ea0mr35374355e9.14.1784417772455;
        Sat, 18 Jul 2026 16:36:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:11 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:35 +0200
Subject: [PATCH 04/15] drm/fsl-dcu: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-4-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519e32..c2b788bfa8f9 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -11,14 +11,18 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
 #include "fsl_tcon.h"
 
+static const struct drm_encoder_funcs fsl_dcu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc)
 {
@@ -31,8 +35,8 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_simple_encoder_init(fsl_dev->drm, encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(fsl_dev->drm, encoder, &fsl_dcu_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0

