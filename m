Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E8B36606A
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131496; cv=none; b=oSc/lV1UPJNGnst09McD5dIdpKx4Sc/pkbEQJmvFfRt0Q/EaUhs/c+wiSXPnNXWDSO98iYeptC2DmR81+VKEVlaLTEFXHpqvfn7FS4C/UBPpbvoBQkuRMQ9wx2A0kRvGq1p1OlmN5JWmff74lHneNW6KSRtIPEcUORNyiHdUn1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131496; c=relaxed/simple;
	bh=gr0swvEQ0IvAy7Ct+2h58VUn/TehcKJEfIt0P7+gIsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXv7Tjjq663UCteyRx11E5yAu5W61GBCfePvYoiqC+MX4sZo4x++s/jLScHv3QNHzPHRlc/ZFt4JvgVr9tpMlS6K8Rbwmv6WBBq54wvT+aKWcsy6fbhoctV7ZEYnzXqt6X8Avon8oUdv873aHnVtaz+EGD2lxODymvqBdSHmZmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOvfsGS8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOvfsGS8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3809605e9.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131491; x=1791736291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLhusyP0ZK9/MPigGSZNdEACXF2TD7fqbQDb9u0lwRw=;
        b=iOvfsGS89kY5Oytu8EmrN9kzcwz4qsaZanLw5A0dXlSOgOrnp+oJtLrdftpJj8qMGu
         U1VbAF9cYpEJMN3GlBKYF13zyBLBxvraOEoNftgBZwu9jSiY6zXKz8f3bNEIqz2xtiPW
         l5ZBqaAogMJdTYWddBHpI8isuRMC1e3T6h57oDhaxn6CkuvZjqXrEq7hwrj61Jgl4/el
         xmEYnfgI58ck5vd4btZIYV8V222veXffjbOCZh5ouBPmDuZqCVjkY1MCctUAybqSpD7o
         xhiAZ38CeekRqOHfq7dWC0YP9SixgmWHtuhd8EpomYr1JMAVY12pmlLfKrCy7TBTKi29
         cOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131491; x=1791736291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sLhusyP0ZK9/MPigGSZNdEACXF2TD7fqbQDb9u0lwRw=;
        b=quDsR6rhgwLQXCw4tSinYp6CyKW0+jeQvz+m75XrHi3Y30Vab/Q0TdJh/nsBh9n0DD
         jEQ1psB9g2APMnyIdFGpoO1iGJ1yUACUA6q55PmDKYlEeLY/LpnU5xohS+fs8OSqwToz
         2VqlLfjoiL3qXNPz4cGnorgqLw3m9XptAJpx5x6SbNNHWl7kajbePtjyGtcLB55A03DW
         riN75y/uoMCxf2tFdBnLuxHZxsMMpnkbOc9dxpOj93fCiag2qeNK0ZQkRIgjqEpqzbkT
         n5JC8L9/HxvYP/dryPMh/PLNVc8/Ktt9W23ITdC4FhPqqfHs9zfEmCbE28SBrgr/j9+j
         on3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwf9u139pmUrlIlhuN1RlHE5YWu7dOMbu9mJ3RdN7nJXgofpzaxCJ11KE7hldnU8ZdigjVa2vawwDK82A==@vger.kernel.org
X-Gm-Message-State: AFuF++nHqbp+E1cLnEFEpxCeLkeyARrehTOhr0Ou2iBaWPGstGnGZ+wl
	jWPrWBNpdnqp1CLoHnNAGO8SvXqUrY6zNjFECVODcYPqGixeEUXXy/7I
X-Gm-Gg: AYBFou0CHSvn0ff1KIYAOeZAd81B7r5buUjYKh+tyw4ApWCxAl87nfM7IrMwAOw/pPn
	XazzBsCiQnr9pwo3WPVlkyDp6ZTZ4ls/aBkgeuHejQecq+6zfyKYHF3QD9XlAZO6vTvWTz1VcZT
	b7iuc5Pjg+1WclTRZU4y5ogxnDQa+1jCdOV1Q0Ie6OYrl4ryBVt/d+mQfNdW4imsS5gJhzX35HE
	XJs5FK9JvDF81/KuhNGrJZe3FK3e99KLRhFI1xjxCIUv5Tgf+9wRWkFdUiYL9VlgphRICoSnX6n
	N8tC2M4CBwPsDh0eCsSySHYq66Knu9T47uRgkefTmjSay+Y0JK0BeGS6rfLKCswGkgA+QKPz+95
	4f32FfMwLwGmM3ewhrX2jQXn2STOaC3gHlXnJmUo4qD7p+FheajRhSCbi0zFId66cOiOQeVa7Mw
	co3Mpy/dw2orRcTFXrqS26gWElCgVyfcLg3MzHGY+4JkutGQVXAMWwOZ9TctnV929Rcg9WzrInw
	RgWcqf/TKp3PD27LGs=
X-Received: by 2002:a05:600c:3b05:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a027561e0fmr137493995e9.13.1791131491320;
        Sun, 04 Oct 2026 09:31:31 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Sun,  4 Oct 2026 19:31:09 +0300
Message-ID: <20261004163114.181800-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index bc1c93c7554c5..8167447cec900 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -103,14 +104,24 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
-	u32 value;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_flags, value;
+
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_bridge_get_current_state(output->bridge);
+	if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -123,11 +134,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	else
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		value &= ~LSC0_OUTPUT_POLARITY_LOW;
+	else
+		value |= LSC0_OUTPUT_POLARITY_LOW;
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= LSPI_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LSPI_OUTPUT_POLARITY_LOW;
+
+	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	/* configure DATA order and alignment */
+	value = DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
+
+	if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
+		value |= DISP_ALIGNMENT_LSB;
+	else
+		value &= ~DISP_ALIGNMENT_LSB;
+
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
 
 	tegra_dc_commit(rgb->dc);
-- 
2.53.0

