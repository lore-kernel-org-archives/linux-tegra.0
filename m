Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B640305957
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764828421; cv=none; b=BvAvAb6HlE+fSnxbBxZEZ9MTNtPkGW7Ej/Yli8T4QfLTTlegspVmLRZQh92BIkWcgSkYSkxnp9cDgY1F6EzeYDSj1HlwrD7nhT9FkVcvLWW2TP6HwWYweh9gCuy3FMc4mEjJw+SsiCfWVJUBO+Xpp9S7k7RXQBXcw9+6aPdx5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764828421; c=relaxed/simple;
	bh=8+iUUVydqpAz6T10SlyE62zEhHHm5bu3B1mX+Enxrqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ooH7ssstKGdFxW8x1YUNxyk40YAS+HSySpykLCYpFgBhpgM1IIUdEzZvRc0E7SWSwAe/LQD/zNaOdIf+VaC9yqomHqrBxe7JfBUYjznovUhwVmrvY7TxX6O91TBFstj2p0+jehSjY5Sv/eoobxuhPyb5mxlzMcBXB/ln9ZColGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWp+1lOY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWp+1lOY"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b737502f77bso72453866b.2
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764828417; x=1765433217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzQwYBywu5dQ+NXbmQKbTsDDp6aCCRs8Xn3HiCAnbrQ=;
        b=mWp+1lOYUiEZ97p2eQTN8b0Jvtd5gKH6k0/l+NcNb3kPmFxUCJsnecdfs0ZDAU4mYt
         J+mwGKZeWQoMGrjWhwDrrrzgmlUPS+glvWwqZuD+e3VHwfSzEu7tHAZK0KLkj8gvIy14
         k6/s9OrBCbBFBPd+hu2+sffD1wy6rJPMehsCG2gEB0FDDV4Pi9LiA5mlKqOWspMsLhPF
         WTXzQhZVWGQ+GF5Pn8q0DJbPnN0M9WvM0C1FvKgXF883x2FFqJxCw1zGZjWI6z2PaFnQ
         pFVAiOPirQa85AjHdGGVEYNoiOhliPMBdPmwacjXl2E+Yi3AJFVLrQb4uD33pTZs+xiR
         HhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764828417; x=1765433217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzQwYBywu5dQ+NXbmQKbTsDDp6aCCRs8Xn3HiCAnbrQ=;
        b=Li9xD/tJahoMRQka1ZddpM6UyKrDeulCG3Rk2/VwYOFoTdlEfQRTwQ4nbvB6XEo2YT
         /xhnwlcf36vRM35ERveTxAn4U1tBWsn2zfFeNNFp9lJV+dqo80e9QHHfaFtEPvdSR5cQ
         PB55jPz74yxR8tjXJvHbfyGVVn7Buqv0Vhm82VzRmQG9gUg4WPZoI5t+JVcBhNDIRENu
         xRlIuR+1D8wQ0dIWB/MyhT7InhZKM4yYeY8lVQIE23cg+cjmM3uE3pKNr9cK43gwwvk9
         2dH9i97Vf22XQYPTJtjVNuBuOTSEqA/MGNyZgaFwrjGobiTqe7VZMw3S5rU2+WYKd5WN
         l2kg==
X-Forwarded-Encrypted: i=1; AJvYcCVTzZzl2sBpXZQCrKd1Ez8f4IVPubgLD5zhq13M4/KvRjPf19S9q/qG6FQjZ7uBydCmvPNv0wpwHiJb2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+5iz1ur3AhafVddxnmU6lU8ku+jh4XfSyFt30WlMky6lsW5o
	QPVzT8Pd2EvFFLX2a1oTyxjYj/flREktsXsaSPo7RqG1mLroScBb1fvX
X-Gm-Gg: ASbGnctb6IJXnjfaQY/FbrbRW6qYXC/xY5O0VegeoP1vQRuI1iqNUvo/hRbp0MfDTBY
	JliAUlwA5JPUhaRZwXgia88vE1LdCgdMI99tOZ0v3uzUVFCy/rzbRyQP5KPDyC4lbyXg1n4e9EL
	dW+MpCgpaojL/eS70nBos2+UgvO3eL+u6Upkh3l4adMoajYQMVahmTuRt8OIMxMA9RYE6lOypPA
	Wyjac7gAeFVY8SGQqL4Eq7VoK8OYGgxFHlpyOKaWi568aqSKDoZDQgpfl6oAuJSjVvZk2RiNcyD
	Xr0s4cDj6Z10x7z2Gh+s/zfVRCbwiA6MmHv6RqAJZswz37+F9JVNa4XyBI0mUyYIxR9y15D1HCj
	tPfAFjdRaH2ibi2gF3uDLTFoRUOUjwyKUxBushX9jAUsm6ic5UpOdE8PZGDW3iPFKMPWbhCxzha
	jiXKOV4gtvvg==
X-Google-Smtp-Source: AGHT+IFtMcIib2KK0rM9it1qxR9Y9tOOlZNiy0Ui6unryK95uOARlpcCnZM+R1FaHUMpUZkUjRTLoQ==
X-Received: by 2002:a17:906:6a07:b0:b70:ac7a:2a93 with SMTP id a640c23a62f3a-b79ec6b93d3mr176869766b.43.1764828417241;
        Wed, 03 Dec 2025 22:06:57 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:06:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 5/7 RESEND] gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support
Date: Thu,  4 Dec 2025 08:06:21 +0200
Message-ID: <20251204060627.4727-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6369e5828189..bdb53824e3ed 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4223,6 +4223,37 @@ static const struct panel_desc samsung_ltl101al01 = {
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
@@ -5390,6 +5421,9 @@ static const struct of_device_id platform_of_match[] = {
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

