Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FAF2F5461
	for <linux-tegra@vger.kernel.org>; Wed,  8 Oct 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912127; cv=none; b=bSmI/cRXiikokLegWxd8jLgJq5kItMxj01hYo1kJBKEgmlILY2XZudrnOrFz80O/EtrFs83c7itANheK20k08Y2UDC3C+ZHHVIDv3G7PwPqkPzdGTsj8k7vqnubMS2dHuX+L/zswiz1DeoBtM4VZnirZAy3oEwzJLLmBJR96vaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912127; c=relaxed/simple;
	bh=0Ne+TrGBDrX3c10etUDnWFPIq6tGiw8KBjG6kT7gL3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Os1k+mdR4sPE4ftb4QI8iWx8OfB9msp0/T4e3aViYiB2/va6crGhgWv0B8JT4VOREwB3E1ujPIiUQPJSIOtoB5YujetmtlREcIh7MHl+H0hDGxD0Sf3jVVSx3ZqUR0we1y/72Wjp8NX6yhGebr+aPmYDF5utcS6qhJ4w9+ef6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8x7cF3D; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8x7cF3D"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57f1b88354eso7165152e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 08 Oct 2025 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759912124; x=1760516924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV9bEo+jpzFCLNbrvyE91xLWTJAB/c8fcrn62g9WVnM=;
        b=O8x7cF3DphlQtsulEAM5U/b6e810sgh4xgJ4hAaOXoQ7cu2nc6F+wN1zRWSx/btMnl
         kWXoGUZHeMHFgWYX58Ra/5w25fM+ZX2OiorbuFR0+TfJq6jpSRPnH9CM/2JKFyCngFAd
         kWciwkmOX/6luJVBpqJqLJUh4LlKV957+9siybmivx9GZ3juF6HOM8GIP6jL9W089G/P
         x4rjoyciPm6MC2E2TUF7f+wnACY3vhgygXFPKRQ2/gQ5iPdpUlW1z0S6clgDPprz6rUi
         QCZvVqJQv9N33cehCkLW6ZQhsYzKYxpM0b3+3Z9NfS4DtWCfvbOy/xSI6EZhVndX9UV9
         Z7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912124; x=1760516924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uV9bEo+jpzFCLNbrvyE91xLWTJAB/c8fcrn62g9WVnM=;
        b=H9ATvIBIrk5nDtbR0WoR84vFx4Se3ItH7yiT9KBscks3qxrQgS+7NEHzRNsiIdAlTk
         yAevRx/aRyajBOtvzvFTqa1+gQGoB6B18a0dyITvRKT0eIN5hwW23wsXy3YV1hnFz7+A
         5BORsvA0VmHYhBWKwQ2C1dulPBsDfb4+p9H6RqlCQFdZhhDqHPEQ/gCsk3THcTdc/Q0M
         7ePK9RA4Vp5EiPAzckMRFhPyYDjb8I9eZkyKm8paef3qX1mbECfbuUAaQTvHGVV3EyDH
         gG2UyPm6x9YSfrC6lbaoLl3kyhEfQW3TI010jwu9gLdlxQ6asD43Adm1Ui97oW6nvzph
         5WrA==
X-Forwarded-Encrypted: i=1; AJvYcCVqu9ZlkkaHMYAKS+Je3McDZEL9lYBXUSLIN1SEF/wCmbAZmKhUi/eF0FAAByeUZoUUJClcB+GofcLlww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBbZKcANgXF1WrE/MBacz108s6cUPX179uLszMCrbt+t+2u6MI
	aF+ga3D5kHTCunRRqVM/TH22l7BS8/aev8rzNS/QKwDeV4+XSsH4n2Gt
X-Gm-Gg: ASbGncupt/8pZ5fcLoZEY5/Na7RlRtIivqauSZQsV8hTiopwkySP792LSXcG7SB+HL7
	narvBZy7+S/JdeTm/SR9rcMtaepya0SLNyC0GI0PmIGgyldcGJtxIjufwm8mj7a3/pzP3wW/Biz
	ZIDJQyaMoqWJsumhUXV/RrRDLV0h6QLhl9zv2Va0BnIGSoDDwCTzFrpba6Ky0Rh6yQfJCsCbUVC
	fwLk6EToeg6RPCaCZS1PVA9mQi7l2fvnB///Z0Fr6JD5e3u3i3YqsGVIGuMOzgAI9ZNwlEKyFL8
	44edWJ+zxCADvUCpWbVoNktCso9f5Aqh8jEvOgSji7Of2BSqurCtyBo6u+v9sOx5GCsCf6RJsAs
	muxhP2bEIZxZ50m+PtE8y2lINYVUL9OUTrc8vwA==
X-Google-Smtp-Source: AGHT+IFIW595D9hFhReYazPCYD5IL0kfVrXBukuOyPqDZomqnbAGHxukrmHmJaTHzusxTCMjXJg+5A==
X-Received: by 2002:a05:6512:3e29:b0:57b:cebe:ce04 with SMTP id 2adb3069b0e04-5906d896bb8mr627734e87.1.1759912123399;
        Wed, 08 Oct 2025 01:28:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124649sm6968733e87.15.2025.10.08.01.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:28:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/7] gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support
Date: Wed,  8 Oct 2025 11:27:57 +0300
Message-ID: <20251008082800.67718-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008082800.67718-1-clamor95@gmail.com>
References: <20251008082800.67718-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung LTL106AL01 is a 10.6" FWXGA (1366x768) simple LVDS panel found in
Microsoft Surface RT tablet.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 81350ef50295..753149a9ac3f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4191,6 +4191,37 @@ static const struct panel_desc samsung_ltl101al01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing samsung_ltl106al01_timing = {
+	.pixelclock = { 71980000, 71980000, 71980000 },
+	.hactive = { 1366, 1366, 1366 },
+	.hfront_porch = { 56, 56, 56 },
+	.hback_porch = { 106, 106, 106 },
+	.hsync_len = { 14, 14, 14 },
+	.vactive = { 768, 768, 768 },
+	.vfront_porch = { 3, 3, 3 },
+	.vback_porch = { 6, 6, 6 },
+	.vsync_len = { 1, 1, 1 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc samsung_ltl106al01 = {
+	.timings = &samsung_ltl106al01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 235,
+		.height = 132,
+	},
+	.delay = {
+		.prepare = 5,
+		.enable = 10,
+		.disable = 10,
+		.unprepare = 5,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -5355,6 +5386,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,ltl101al01",
 		.data = &samsung_ltl101al01,
+	}, {
+		.compatible = "samsung,ltl106al01",
+		.data = &samsung_ltl106al01,
 	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
-- 
2.48.1

