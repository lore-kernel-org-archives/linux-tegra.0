Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979252FFFA3
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766134; cv=none; b=kufM5WR9tz3ZxkD62OO61XQBSqup8WePkuB15osRqOzxcxOYTMflL6RrRxnMoHB+Hmz43MnCY1eU1LFeBq5r4gu7w0u1898B9sw9MFFb9pTWm/zWZRAUC4oG4GpW86xTjbnjuv9XOKVEyIKHhWptL99xo6pgnCqsor5kNQa0NSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766134; c=relaxed/simple;
	bh=kEk5LNotciAZWjxbpPSAlsjwVvH/hQCIwHrwOOjX+Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joj2H2COU1dnKudyPkCdXHcHtQXnLI04xIeEwc7t3H3Yyl6EQgaqmawSh8y0+yZ8iaXJJbTbi4YYVLdWfMg8/kGOGoveI4aC69oqh6wCLFLNwtsoB58g7BXuWtRpCOiE6yuo7x2N8nYuoZUqY/fDqAcS+A+UE/N4Ljv1tOWfY6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bL02WzZo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bL02WzZo"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5945510fd7aso2067913e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766130; x=1763370930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
        b=bL02WzZo38Qm2DoYCbD/JJ8g1hVIWbKZz1cmHrVSeOZ5qxNBeT5j/ziRrufn+wvCvM
         8SQIPeJWO/BTmkdBUCrbUvWmF5R7dHqriQRZobl4R1y8b4IZ5LfIovB5C/WWhPbYPbWf
         IVognFVnWJAyStQ6+XdCYKg5VdjbKM+0eE4NwehW/sFgafA1F/OnuGwXZsOFyL3Ac6nZ
         qCfRnxBGFycAmChkL/xxeFhGcBF7vgW+J0j1GK/j/nE3UbZyRHrNh9qstRfdN/Hlm6ib
         KPvC2WcK9ny2JHvmABfSI5xDA/PY22zY6ezrew8nF+/8dml2fGcb2u2th4FzRDWyifyb
         293Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766130; x=1763370930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
        b=X9AuXkcjjGdb/PnsO8mGhBY4Ux0K8XRn1S+bhoTVoInNLcSFvFOyrm+EM0C25FzjE6
         zL54CmHne680f21uN+Hi2eDG8b71xsE+tb9Ail909Uxxvv5770ys7JgEZBhIhLeZIbYV
         Lw4fvI5Ehwi4JUEFR+Drm6R6Oz6yk7yNslzMrlTP3U0t7UVW/sSS6QJGMcy1EvBiX2Z/
         Bay1kv+4pEu4kusw5E4dCP4pZvGHI4XSlHmb5dCnCnwIN3Dg1Kw6EQuFcD/iPEQJfRtW
         2W8vAHUTS66JIOXzX+ZRM/U7eePEUx5qEkMVA04eO3iYh4fy9Nps55gxhXcNdIQfFvOe
         RuMw==
X-Forwarded-Encrypted: i=1; AJvYcCVQnCvNSijC+Xi4gZZsYT5wpB/xZZrGgu0xQ6t55/yc2eGR5aS9Pp7vsyv7wPAWvv8C2LQAqqnBqoTCuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpmGOxOqJBvsG05eCBLC/LcwPp7YXXEMVZEmPrJYn/3jo9HVpp
	FMTwf3Lz8/Gmq3No/cDJJDqxqh/wmmTpHvz1hE3PG59VitBN6aqxKQbTpVtQ7A==
X-Gm-Gg: ASbGncsGZfPg8/zXSPT4RJn2M2f3oAPUWlPYOusQBdwYLoMhCYTyMsBrCEBizQzyEHE
	8v8qDX6+o9WMBjO9RiLkDSZVSC5Npl/ocV+sCZYdInHTA09n5LO9zD8njfUFXpon+Qhlhl/O9XR
	bY0CMTwkylSxJsLhRgjDrhdvVyFy5g1Q1ns029mC157YJOHkPueuTR1TOJPlRQ1SOFvWQpE/pNl
	C16S530GBpwejuINgoUK9nVKYSF7H/T4tdckqNh5d9UIGsklStoh4hPrCoNIJgf+Txw8fRuZJ0f
	mo/tbHKOsQXlcl0+frso0MbGlACF6cFLMkQg9n/3mT8i5eT6DXPNM6KvoYGvEBwsiMqpJcEyyAR
	TR7r1H7jC+J6z4T4hGXHoEHPL2RCVlxUHq/DyGfR2bIMF9Bjn1b3d+BsfT6YGaFyLNFF+/JthEG
	J2Iy8UGTMEYQ==
X-Google-Smtp-Source: AGHT+IHKVA2KBHA8B796GKRYtFtqhfXw7u6AasCbdjSjaT+/hAWyiSuW0TYURDuTx8uldyGjv94z6w==
X-Received: by 2002:a05:6512:308c:b0:594:34b9:a7f4 with SMTP id 2adb3069b0e04-5945f1b6d56mr1751014e87.29.1762766129518;
        Mon, 10 Nov 2025 01:15:29 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:15:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: [PATCH v3 5/7 RESEND] gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support
Date: Mon, 10 Nov 2025 11:14:35 +0200
Message-ID: <20251110091440.5251-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

