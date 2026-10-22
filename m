Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675423;
	b=VwGZpboyekPGSp9TE4o8DkX6ZV4UnKFOKrpVgmNP9/ngiL3Rk6kYInm7yt/088EeYIzA
	 9R3I49xDO2ZfC2EVhQOr5JuliCsaml0Xm21GR2AaPvQy5aklYg2/qWIOU3gg7ToZtMvpj
	 Ts6fkVxcHZZhDRZx/xJ7gsqxc5I5fxsf6v76yi+nSxpWYQh4vCcWHXWcf0b4qioHr+2YG
	 CeS1TmCB+4tPAATSMiemrWLi7FWrXXwFenb3ua9uvCoxevUYOvqqvvQadaJRaOqiUXhEo
	 7mYQuxtpbwgq7+Sqk+3TiqLE6Jz6536dbySIeneYVB5VlG5oUcXeiaZj+5Sv0RtnXrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
	b=iISAshuJnY2fo6Xrl22LK70EVBGDj2xrBt5SdETOYY0ZCsTkMchNqJTvTCnBaPOT4JZr
	 nmm8G0Uk3E9/18PbwkWPXnfm0aZU14Qzj1SJM2Nt4nNFM/P9th66+Vt4dMs23Zf1z8pPN
	 CpqsJtAvb+866BQgqytRefI/GyiPwD6ImWlKnkO+Pu2AvmqrU6rZEypEg5Dd4pGEkGexs
	 +5zf2oubn0253Xj+6tJf8lPZefiJ9xt4YGFxFAGnyeOMKhcfiayWrBvPJXiMUD836nr4e
	 YPr97XSUCnFh3HADyui3J1GoqHybU7xWtag/0v2V6k4Pj0TuMl13ehcu2Jwd/MD2oJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkBhmq5m;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139F2606A323
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkBhmq5m
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso825998a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675421; x=1793280221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=EkBhmq5mBZV4neeVDw3QDVYVEpHfN65BO1zRCLBetcTnYmtQ8fKgUb63Tkq7PWTe4c
         b/5boo7iDILM7RZo8aeoBa5xJmEF79qzTZnRhuFKbpRL/tEspXknbeATPQQZIszfe0yY
         BqMpzr1PcNClD2DHPMmxKTqlmmYDfbj4vOje874AJozMoeEUX1MgU5C/yGh7Imzak9jP
         Bg3bocwEAH7sKC/WABhRJldPF4pfMCvAs81Qhp85o14fkjySemSfpOEgVEjT3o23mEMR
         8O2eUSQmyaG9icElecDr7XSjsYD6Ugvdd7FjMXgemakb4CWsJxDnKt/T73QzZoZOphms
         xqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675421; x=1793280221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXz6d61M5KD13QHimY2yBAnDg5P4a0+gl+DKibpYues=;
        b=E1swkyNgoMj39MM/iJMmhhIqd+MYaUkHN7qKi0mpGqtjoBYxHHHRip45Oq9gMNeUBF
         PQbIZHkL1cM6kfUozbeiUpaNe0FmKaHh09PC94DoIaJ/fXnwkpdyyMvyFUh/LHRQftb2
         nTwyiEied2Sx0LLVZiZyi57XHRiaqWv+2ceJURdyl3WQCi2hXKDcqfe205bXx1Cocr5F
         GsMwPYSFzIJjoqP2hsgX4zo3XmsSll9i6Dv035e9yxL2pjUC4hP7rRr8if/eKgaHkG7L
         ReFdhl7vIrqo1QGhu92xMHUl9Ms9r7Iwphta+20EhdC31H9S4adhHDd5vo+fTfCMGfP5
         Q0Ig==
X-Forwarded-Encrypted: i=1; AKwUvByOCxXXe2TF47jP4cBmkNLqxAMyFFBhvfVx5W7WkBlmCj5GUsrq6grb0Gdz816ZYSCq5eNZPHnNQ/jOUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJIc5J3YsATvNYcDyHKOgNTSUC8SuethVPWlG2sExxqf6AT53ky
	xOQfZHGhpzBEzoqGqAgBPopuOOHgT8q47PpAMVkED0e8oIXCQZA67hxT
X-Gm-Gg: AYBFou0RvZt78CPS1hqy5CZSAi1fRthigCE+/fXjDv0qC0XO1tlsaxW2Y4X3NLO2Wst
	Z6rxhGsDdNIQzSPRZESIpD/3+e4rckNS/Yf1MYabVcF6rRfwLgMT7+2iH/ntP/+LRImIusjlWje
	rjY4kO9gAg6Imd0Aylzqwhdf9lucbrgXSGjBZ8EnQlIHOY1Hlv2YtldE7haqNFI5XeUI/E66j/V
	BFwbsBDsVhtXF//MLN8XDjrdYhd9Sx4Ao6JtrhERgEnlKOx7uGXKFm/2us0FeAfITSw5VMnJFz1
	EZ3mk8ODWtJsu3FMVVSNNmu5+0ith9TmpS3uUw4k34kZ8mtMVcvmGHp53osDjmd0oApAyd5+quG
	m9oUpTz5n4gh3l8Xs8YE0RJi6/vEg9UtaWB394XiuBDoXBAoZXmrE7dg3oUM6L8KhkmGB4kIj44
	yrnuZr1UUqAs1euZsI/rleSqm5gNsZnaUNYV3oLztKP8SVAr2tZRZEJfkO2bwXxolB7xfEzlH+x
	kzek27vpEQNdUwkTfaYEOIuMbMrVmdEYxY6prBIi7HRzJac4r1vTNrZkHbu0j8YhubPeHfVT8qL
	XxiGaP0i4hi8tlprp8mmRZI=
X-Received: by 2002:a05:6402:4246:10b0:6ae:1895:3b3e with SMTP id 4fb4d7f45d1cf-6b41d5cfd2emr2354555a12.6.1792675421106;
        Thu, 22 Oct 2026 06:23:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:38 -0700 (PDT)
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
Subject: [PATCH v4 5/7] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu, 22 Oct 2026 16:22:57 +0300
Message-ID: <20261022132259.240717-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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
 drivers/gpu/drm/tegra/rgb.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index b6d09a8d8e5ea..da9e37fe36689 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -104,14 +105,24 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
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
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -124,11 +135,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
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

