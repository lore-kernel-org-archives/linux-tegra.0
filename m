Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335552;
	b=r+C7V3saL3QQHzIoQ6lQuGsalLvI2DvA7acIcvvpMKiptpMhoOOFzwh0yzKK5VJwNnuh
	 bzcAiJ3Kgqyjr0GX2IhCgbocX1zgK02R6jpOlAUJ1vPY87vDTjWVfsIfom1bjbd0yeQxh
	 PjeUo1/V7Hmqus/cn+VDy46Bn8sO532H+wPF/HVIDyP/flBx4IEoyqGd3LyFervRji5eQ
	 Vl0qFuKPiNJ7JH298xxRgLbM6cPFrDmWai6mZHe2oySqXwVRjXYWTzbhQ+6J7q0DAjrTT
	 2Nho16MDI0E0hRQWQ9FvzCgO772IKVDCyBDbLgsHJwwNOj7riliZryMpB1Qkx9As7jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
	b=YTFECd4M6zDVRv+Rms3yQsbrTjjlJZSeiJqzoyuiG9smRaGJKZWoPhra8Sqs5QuKOZ9x
	 hcIBEC3AU6hxnUTjC5k9NnV2Vs29oWwGvELFvqg0uqkYHnXf/Fmobkng51x523Ms8nUL9
	 JqtZ8XsRGkhXg8sqw7urI9saCh1qZomA44zC3h3IcKwdOo2vsCKkxk7LwVSsN1RlHXdrQ
	 hOMvmLkAXlBKgKBDM3C5SxO/r5NlT1U4u39kUEQSYJh/5AzMnBumX1I4JPIs14+MVmlKL
	 1EIpDO0/SSjFZYxsFl+tBULn8KYwQ7W2LqfHrS5upzZKOo/rxLy5vdNIHzYZnkDATmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXgq32eS;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF91606A32C
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 08:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF91606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXgq32eS
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso2801081a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 00:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335550; x=1795940350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
        b=nXgq32eSWi/S38LFKr3ad4V0ae7GGVX/f4p0sB3WrHLVWONLqYnLLe4BwtYRv8m/2i
         DgTDUpvyrV39rrSYpz/zMuM86bLcEmIsxS7kvYWIV6TSbb9lunXQsmqJxlrm3ZJLoy3W
         +xAQF7H/boKtDm86cjj6NnZHewJ4CLYZi7lUrNFKJNVbKZfODKoo+fZW5RX0E0DWDvRL
         FmAnxiepSoB/P+Wx7YplAAjc0lPY6RZMBkH/q2PZ16rw3ysHQLy7GG0LJzJcZ7KzEk6n
         4HzazObs1IgnQovd+jb3yoT2QXzwbRV79kPABU4WZtIb6sS1hJJ8vRFL6n7FnBLQoui+
         Q16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335550; x=1795940350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3z6P0aYlufuvnlooWGHkbmG4E1HPBYeLov8HTyHzM/I=;
        b=d8RNuG3+2W4/6BxBrou2fbg1mhQlEUp3ny4y1NKGr6K2YuV5za+sNZ58WBsRMuqTKq
         c7ZqkR/Y/DlUI5/0dfbmaju9sLTgFNHg/gLZk+X78hwvW1RhJBotrejaUBAQaqIs1xCL
         qg+LbeJHEJrxgvJUwCP8klSv3H6PZnESZevp7hQGoPIWO8Ig3HgfRW32WXqDfJzfyi3U
         1DwOg4wQ9sx20i384ubpS/jHhoUWR+w2ty1NHU2hr4xxpGPN95WiqRAZ/Pa+j6FNYUh3
         czabjsJNrgsG/o2FG96p/E3a/YVAEj36ZpuHtLV5u+J6h/LRARpoE+Bp68UvBjoHb90E
         KLZw==
X-Forwarded-Encrypted: i=1; AL+hErF2Jg6EcS52agm+L5h8Ma1fL3RyDR81i0i3C+DwRc4NaCxFrfnzgVzjXv1r81q6r3R0TR1Q1ZtIUErODw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HaERSdpaxjguLU2aep/c9O565XuZzJO2eM0bSJIduw+kftM3n
	ERKljDmNLIFKwW55wnqtujAlPyoSsVO3VpMjtfaybstxlQApZgN3rZYc
X-Gm-Gg: AZFdTZfVHcfF1qJ0MOLcJ2V8+y0N0qJfIBPnncaFG2MCj/7A5IbF7oLGHvla/qQGLIl
	fynO8krICHgiwuML8IvsP4ivTbTkqDo3VLWc+AIaZKk/EYkoZGs7YqH0ViGxXs9eMGKyIcEOO7T
	DDOVFBQUIiSe10itmt9An0ac85695InCyPSjMC1baI/8K5tRK11PkYQOMH5RFWLaEGtUx0LF7SW
	saG7Us1wdepapx/hJI0geLmmblnbzbYQU5FXhY62aRO3yLPl6VawUwBw/0qnWVVlCdQeBL2FnRd
	5P5rsXXNvJkI1ZVPppk/FRFK/9jOV+3WXjRMFP/Qv+EGLXE+UbRnDyATJqNCWZm6h5j/qoIrykk
	YGdczPZhLgJL08YiAoExkGBQGsRBGXL2XEbiPFHMQH8VdttmpgJMD4U8Mf5W9wNwuIgfYMJN60b
	TnFZXBtOFigvCjnp028e6IDwmzb6nLQk2X3BMpdJYsSnPJpYBYfeDNif4BNC21AN7/t0FcFq4v7
	ehjnzhvtAuSxbbaq0ZCy320uq8jVSPF8E/8EszvasPYGf3jUnfIEFxwrCMyIHf4dAKP/Na3lwFv
	0zcKm6miaEDXEkuXFC3UCsT7YJ2jBDhE+irMd7LekDJh0wy7WTraKZ34Bx/5RyOJtbfwC5OuSN9
	a1ESaO0xXtQ==
X-Received: by 2002:a05:6402:274d:b0:6ba:92c3:fef7 with SMTP id 4fb4d7f45d1cf-6ba92c4088cmr876330a12.19.1795335550008;
        Sun, 22 Nov 2026 00:19:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:08 -0800 (PST)
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
Subject: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Sun, 22 Nov 2026 10:18:18 +0200
Message-ID: <20261122081820.53199-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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
index d48d498068ac8..faecd6f94359f 100644
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
 		value &= ~LVS_OUTPUT_POLARITY_LOW;
 
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

