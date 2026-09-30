Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF227443A88
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 07:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751968; cv=none; b=VmF2DhiJMrbIXx0C5ZzRP6DNO7c1d27bLwwR6C00qvAW79GXW+nJ4royFOUO7lsBM7QXYXr9iF1DfuXANKJNIp58zR5dek7kUC3OtxMMkAT9kxaupgAsY7coxgh2+d6Fu6kPt+wL3WLmHs5K18VSKzLBa2zc+gjAnIYxfWjxU2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751968; c=relaxed/simple;
	bh=Ha01hsZDiYdgpSf73lToPHzbXl2XlTznc+VkbTZDF/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYZ+VRF9tuZem05GCR4s5g9NdCEnP/qX7lLgbJoqr9ep2WBxyA6mkwcIgigsnAO5X54dsWmAhW9e4jLgjCx61RBjS7V0wmS19CLP/VNETQPAW1sTK+yvUDiZcV1plByzF3vlyb8KG0YONphGhR0+8+JvZOTUA1aBiv3BsUeVHdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra4fq7ob; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra4fq7ob"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so2900402f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 00:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751959; x=1791356759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvheFf3XK3bdnPCaCOmKnThnJ8pBY5xBPxq0xunjLCk=;
        b=ra4fq7obcKNyz+B5Kp8w4ukzfSiDFBX9NpafdZy4Edt0eWOiLPFCWa7prR3UjD1fVq
         9PPvwqO5PKYk16grj9CiKtavxJRbT+BQE9LHaJgeJMp0cNO9YxunBzPXz4VCv/TncfxG
         nDQuD+CQsQyxkey/G187rplVgjroB3v6IQywT0bgMbLaoqh0uNBFFWPgqu82Kik0E9Ll
         D6LesyrPjEKB/qtjQszWfrdLSJsagZtyzuNQZ6weHpFGYyt2OaSdq8wKVgcmuEpmDdFU
         c+fCWg/kBgP8mTiiaG3whBeo7etSM4/PHeDg/NRDf7XdW/4outerQIuBy2O1/ta7MnKX
         BSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751959; x=1791356759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvheFf3XK3bdnPCaCOmKnThnJ8pBY5xBPxq0xunjLCk=;
        b=IELbGkE0xps4NH1hrb4Qh0ZP/1oot1ztSV4yrK7bZxUPLYvl5ebmL+I/Jf+VYBTVXN
         Z35Iawh8+hBsSeGv/zEIA0/SVx5UNizsnpN+eOqxjrGrVToz+hJsWFM/PhWtXu63c8Gc
         TFA50CsLF6Z1YwknMC1fSv4T+i1QS8RrvC9ay3vYkfwse5tAdUZcRGt8N9/HuOWKRonm
         OBj2erO//2KaezgBklZjc3PAZijKb9BZPWEsDeXB6yKQJ8Tic5DrB9NYwRGfd0nRzSkV
         9/255FMly7F62lBzeIW3WFBnetBncAck8l71bMWdelqpiWHNIkj0IaQLasg1wcaz254B
         Lu/A==
X-Forwarded-Encrypted: i=1; AKwUvByyqwQQr2atd+C+TYQvzQonvRnhkYIK//7wogU82R8pzXjROW7IL4y5SJB/b3z8ELbZkpIHZhhWqlb/nw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJWkdoHXTA7qApkqbw40/Q8viXIsenenNg3wDko7NalHf1FD4e0
	cb10XeyxhXg7xDJblAJ/vJVzMQCcszRyHtIJu7GLouz+srtUcT9Usb0O
X-Gm-Gg: AYBFou0h4GXIrhc+m/aZxqymf7Wk6xdmrcWkajCEtPAAojuDEFPTv1TOKS7gaXerWr1
	XzwZQWaz+uli990XzUBkysiynNcNiF5fbaZKE44CoqkbZhSdQgIBTXvc8P1708Mm6IPUHcOYTDm
	xGdugC82soKjQ71DuXu0B4jElN/4maPHNWXkl3vN6zhnEJSZD8BpTCD2kPBwpkcojgg0zi+mVEe
	ez5aUDH/HO5R+GdCuaVlrU1gABJKJHDhRIRKnNsaRAS5p3rKUcx1en21K0JxpmxvySlrnSh16th
	xWaQF6g34lkQe+VZY9iSpYsgPTraD2nYn+CK7rbSrEQsp8SfxPlvl1owl/vjka9/oVgMgN4mFmJ
	hjQQXo3gxM6UgMgnRthXSVweJZDwTgvHMQXbxopjGm5u2kYATpt6mqVrZoLwgArzXH0iSLWPvJX
	Ur2XPgI83D7CamQ8fkFmArsIfaFeTwjdu/o9FNtJ7c5kJi/UyVJN4OQuU0LkPckv/4VDBNwjFkc
	pJHzdojaVztmdGRE2VexC48OdwGCg==
X-Received: by 2002:adf:e00d:0:20b0:488:89ad:56c0 with SMTP id ffacd0b85a97d-48b03c72c0amr13090f8f.11.1790751958677;
        Wed, 30 Sep 2026 00:05:58 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:57 -0700 (PDT)
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
Subject: [PATCH v1 2/6] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Wed, 30 Sep 2026 10:05:31 +0300
Message-ID: <20260930070535.47130-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
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
 drivers/gpu/drm/tegra/rgb.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index bc1c93c7554c5..e72e076b13d5f 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -103,14 +104,19 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
-	u32 value;
+	struct drm_bridge_state *bridge_state;
+	u32 bus_flags, value;
+
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_bridge_get_current_state(output->bridge);
+	bus_flags = bridge_state->input_bus_cfg.flags;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -123,11 +129,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	else
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
+		value |= LSC0_OUTPUT_POLARITY_LOW;
+	else
+		value &= ~LSC0_OUTPUT_POLARITY_LOW;
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

