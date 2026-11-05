Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887572;
	b=WPTo79d4CcpH7Ek8nnrimwPcGxtDXjrXCVaqvOOLvkt0TM9ZVRODPE+en9eS0bLNftpy
	 ihv4imV1E4RbQ3aYz3/PM3v6pCvQgroWe3dRH3L4l8j7b4ONk3LwpVDqLUQEauIGaQv+A
	 A6yzQKDe4HHg47Zk5LJnr/8bqI0OrchazWcPgJpKYDVHcK5E3VeL/s7OIbfbDkKn1UMhB
	 YRPd2bzaCO7wkMStBRzraX+V+5TQJSQB56AfkWhlyNtFkGZ9Qw1ewiRrhn+nqMgB1Wy52
	 51NUJ+Fb1wWYgdWQRfLEvQCzcU5+MH73lbzv7Jk+ZiNFF20Gvl6//AcuoJZINSDzyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
	b=w0HuiVxT+8jUwKsHriju31tmFt9SKnPsqakBUtJ7tOs9bMGmTxCyYkCFNPw7vovw22RH
	 hQW7O0yuNa6rsA/5l/fR+VlaVHT+Rt+IOU9N2pTxm9HIiMY6OA4qJb/rn0Cp2xZfL13s2
	 8PZHX1/7YHY9aRMptOG4wDutix3bv3IMjaxj6Ul+38bEiDNQd3hHjX4tz7EMLL8dmv3P0
	 SswnirpVyRLDzODfy8yXP3h1BX+3lnDiBrzsxhZyxtKSQF4cBrWIKvKJ84HBQpnmEWWZG
	 u9xWFKiQaN413GMqDcQ7NWRbyuy1IfiPRnyPnUkAYC3WPSVSgTGmxlq+kP800HTZyeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeOavdYD;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2277606D82F
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2277606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeOavdYD
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso166283f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887570; x=1794492370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=UeOavdYDA9GU0sX0AIbUGnWqM0Qk4FJllDP19Y+wzPPKdyLCPH2T7CzOUJDdho6dYs
         aZnsmYJNYQOCdPemSGl3/wCasCvyVEeE4TJpJrlGB7ODypQuOqw/JDPwS1R8caJ4tlcW
         Y4K85Bpfh0ei98bnGyRgQcVZpPJ0NXvXqiiQXgIgm9fVIPJGJRaRl6IxWOmT3/Okzse8
         t+Ja2KQkaG6H6D4t4be/NdrHqXreSEIM7wT1/AkRQm/jovAtd5C4007e4bSUCeMMeaV9
         eDMmar98AfsVxt/z7DyAUFCyy+fDbftMdxftqkVYyTrlBrWUL7s6IV7O1JFq9d9q1ZLD
         unUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887570; x=1794492370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=BlgMhihXH6wSh7InPdfr8rs1OAkk+FRPw7ERaWU7wvtDgQNsiwPdyTF4QTHeMH47lb
         E1t04125HO41XYGMv57peJhnnt7s82hzS11VeYnU2Rd3dffZiqEyD1/vmiVNpPxOPZLb
         mTZoiX+Q1Eg6BUP77/O9dZvcsxblMtudZQxBntPinWiv276t67nvBSO4AI/ieKFglgPQ
         +k60VHd/pjQ5FuMyyDh5mHIdZ1+wsUudJfNsn+wdweY0HAZLpovjwRCVUgXT4J306clB
         F2M2i9El+kPsf5Mc749MgNHsof1p2l2xyIPOmIzpxX0BWyWlLTpCiVhIVZCrQD47M9i8
         MxHA==
X-Forwarded-Encrypted: i=1; AKwUvBxkx5sVE8AbYN+7txjmhd4yGQ+VZYweEh4TnAdBEypVm2lTUMERGTTt0evtFet+3AJK439F774vaa8eJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y0ziTbYVTOzLOEjnw+8VSkHSL4KjIEI3DamxSnJGT6RkyyEcy
	G1aTiau36MVdHhh8L0M/hlDwKybCTgK7TmzN7uCnAhkextITBglmHZyP
X-Gm-Gg: AYBFou3nA6uHOgXJNCLouVtURA6jRBrE8BoVj1PL2OUmsJzsbPkeUvZ4lN2F5CMX30V
	YdVOpfq6OxhxxWWE6921zSl8yt7NSI3rnp5UqTuD4LZAzx9kDeVMpfg8VnUsQHpbNiW+xDQgmGr
	X5JNsVLsqZlDDdFyB2wzGv2ZA96c0mC7N0VvQ9WfjLAlgRBF7VQud0Nx6mUvjgUe7pgN5s2c7MA
	etZd8bmmXc2fbZ+d5sKq4Lc7zUijCWe/QorZECKpLIJRnQ2WT6najVPMUAuuAoDBOlCpukQoSNK
	4dgA1uJpSAA3TZB7oKhm50BpiHdpdDcx9HiWWu7UtQrJBNQ2D5t3WA3xoNYLDD9sQtkr15nVAw5
	a6jzcIv4jiQ2lQO9T88dIAovzplKPEo3jHehlPtRDk9KqVnt0zRIZ5gZBMII53VNAyS4oYBjeyK
	7rK4NQpXRSNTgFQSb6r3bBB+9TXU/Ut87c0oHaDlqxHCQuqEePA92d35wkd6Q1nWVMgnIgK5Cjm
	iQu8jerNUGXLPFgWisHUwWT9vBY1trulO5XUOcKvhAV3eElWGK9XSnePivrnTqVKr5VR4d5gWlG
	54xCE7XrHEMbM1r8igP58x0Mdzk0YMCjpJ148V77bAZfrgOa9DVA89Cu1hmtK9YgntFVdvQ=
X-Received: by 2002:a05:6000:2c03:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e6e4fca93mr39774284f8f.51.1793887569888;
        Thu, 05 Nov 2026 06:06:09 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/10] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu,  5 Nov 2026 16:05:08 +0200
Message-ID: <20261105140510.165165-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 7dea0cac61233..d8f41d1ca350e 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_display_mode *mode;
@@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	mode = &crtc_state->adjusted_mode;
 
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, output->bridge);
+	if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	else
 		value &= ~BIT(PIN_LVS);
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		value &= ~BIT(PIN_LSC0);
+	else
+		value |= BIT(PIN_LSC0);
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= BIT(PIN_LSPI);
+	else
+		value &= ~BIT(PIN_LSPI);
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

