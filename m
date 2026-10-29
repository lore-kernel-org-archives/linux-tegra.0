Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287788;
	b=qIGsMWpmv2pi00WktL+kbkT2jRadXRw/OFFu2tmpzjuM0TcS10zUBzryT4qclmCD9z/g
	 2AR+xCNVnG9+4hPzrjrATjXH90lx6FMsfyjTJuFnzSvSitYyS7P7BydvAfPaJv3doNhfu
	 Jp58bfZuMtjlvBXc4PAajHmT0Muncr1TT9hA61jS1bXvSx4cMJO/qxLvv4Lhr20+fkJFb
	 +gtZJki3GRviAeKPaJAmhfS82BDTjvxm33BZUeXUC5gvm+fIv0ervF9QvIem5APNoyp7j
	 Pn1VIn2UBASlebpt/OZYYnxtnCUl0lvPniiosFTPJpqrWcHleyG69uGIBFxrbW6hcVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
	b=AdQStAw04PKsZDLCWGoptTVOj0+muqDudNGa6UK3RrG88eQ0WYimRJ5PevHtV+mKYlpu
	 ya/8lJzTdAM7oAgtQ/5MuV3/gDThwckyUz7ZJNr5rP5NMGNkSfc540HYQ/PHnfAXHDk+i
	 e3X/9yY/t7BmXr8011XHzEn9uWkI2RUhNe1nxSo7snq4Kmxrb3pVx4triD6VW8zkfwIq8
	 tCjKTdd86kEzKRJDzsQTEROhqf3BRa1PdKZNimQLvA7fGbcdHWSkjnAF24PPXQ/2W+uWS
	 d8FaIjJbzmQ5+MwgiaJIUKyndXN7Bu6LOBqOFC7zG3w8+rLJk0BjOnyVfkt32y9x3Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I/Ayijzq";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E3606A31F
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6E3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I/Ayijzq
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4159751a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287787; x=1793892587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=I/AyijzqJtk+0Keg1vkGw22wFN5Ptg6AEueeNJfZVfw/XLEHb4rT1UOB/I9jn4wGiQ
         gzrC1vAUUg0LLaGG6N8fsoJUBgGiOOwgtRNr4HzEkKJ1NDMFfCTxgmFwmD3o0/UM1vcv
         qRa4wgLoqUryVEz15l2Scf3SQzkuygPM4CleOcCkxJ7Eox7wy8YUCHKl1Ib2EiKzgITx
         VcImxrEOLuDAdjPcXfdxQPGoPpUyjggEOoBQzSYjuT3HXQ2ClGO40vBGHUzxzlGEq3AO
         z4TPJZ/WVs+LYSoZstlJ2SdIMsMuKbl3+3QMXSwE9/v7TDz4UQt+J023PZSB8HERFN/p
         m48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287787; x=1793892587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=W/HwuW9rkpvBXoTkVKvQYTorYdkb85sljAOvYcn0oKEqhATETSb3OW89NIEnMWIhUk
         1C18nYT8hxO7sSS7yyudShJi3I9Tv21CWp5BlNqIJdMzHCplInAo+sL/+xOhpx29L4Ho
         1BILKgNFOcM1Awwd0fC26CZz88FRVRJC+qa737dgQKXgIVUybCvaDDd+YPxQZwfv+c8b
         dOXUk+We/CVfOYLWF9UAXXWB0hz+7eD8x1jNOOakc1yc/a3VI8gQAdTLRKjOHOSOoDD/
         ODPN6KR6iZ9Y6tLQORTEXRAxU6npEzlQU9AiWH6PPjmWOa8hD9xhNyh3KdaJtDVXAml+
         ryaw==
X-Forwarded-Encrypted: i=1; AKwUvBwXw+CbqQ/62/W36NRmg3xMmLExTVNi8cWlXsqZX1gs0KpBrPIfGYEESmeUeEcWTggbTYcBzD7Sx1RTMg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7/0KaeYpGhhxQGZx05WxGfJ+A8scdiZ0ZQbP4hdj/1u8K49Ym
	PAKfamQeGgALBCvvcbd9V85ZP91E2ziHwJqTKGoV+YgCB3j4tLQtNnSP
X-Gm-Gg: AYBFou1VTSQpPGtWlYeSwYFgydGA9FxDWDH5zO2YG5LL+hMQkriHP3vRwHCnI/EajUw
	uRBiZ1HStwdygk0hyMAw9ksSn3HHTLpZ6sE3HU8GW36SMk8IwMT9NDQPFoa9QBfZD8Kk/oHwY9b
	y8h5GhXlHx4pgg0RINh6Epu1QVn0YkfmQed7z6GMSDTW/mr4gEUPHnt2+faSCmKQzlDA+s4e4WD
	Y4FPb2uJTey9nmKKLkK9OZRjL+ztD2J8pg0x54Q9uza83Z9gB59ZFeg+jzgCnI0IuxAr1hx3quQ
	el+ikCgcugjERcCeIweMvH8DBWmLlJggoIfceCglazR7EPX+XmQ9NhSuA5C2Fldl7kYU3CSWhkJ
	GLCa9+X6B7Qw4/mht/aY3dF/68hvGkNyJq5q2Oa9VVDoUaOP5MyIaQue+8WUU4+c1fllUrkSiAF
	0gGWLQyCXsW9HY6NlZHK7x2q0fDgx6y8Cxn0NezBoy/ZtNTgoGzOSZMr7cIjAZUZ2ZT9TEO27LD
	xUqYddirVj2ePWWvXossSByVbd5blywvGA9HiOdgA+rIKdToQhQ7W63c9BXrQlfA/D4dELsq+iU
	5Oicu+v3PqFPXQHi8Mk5Nw9Zt3XFx80XVXODB4Olf+fwf4rizw==
X-Received: by 2002:a17:907:7250:b0:c2a:b1cc:158d with SMTP id a640c23a62f3a-c49bdf67b9emr532113866b.32.1793287786503;
        Thu, 29 Oct 2026 08:29:46 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 09/11] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu, 29 Oct 2026 17:29:07 +0200
Message-ID: <20261029152909.234584-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

