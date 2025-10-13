Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF772DEA6F
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 05:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334982; cv=none; b=BBuj2lF+9inlTA5maLWrPo4/X57i7Ue97so3BIDL/3hMyDga6ZPoHj/Jart9hPXq/VWI1mLQZp6lOKgGAvNvvmPjmQujda2LQ+sRat5GMe5xOP9Eev77JuDPvwye6FBJrvnazDM+PmTZrFwvL/6Ix5tdVtSgIYoX0W8xdKlO090=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334982; c=relaxed/simple;
	bh=kEk5LNotciAZWjxbpPSAlsjwVvH/hQCIwHrwOOjX+Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxP/HXiGV7pIVE0LlbqCxH9iIUTgryBe5++MlAqFE/aFW0a8fIU/DDvdjyCaUuOULS3roYv4kDPUgwtnbu0MHmsPAizNoVsZbJ8bKi/G+3542mzMx5Z7wM7YIUrCcyi/fiMmL4YXDjmW1lFlWGOxQbt59t+RcdD0UGYVR8s0ptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvN3zhYa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvN3zhYa"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b27b50090so702795766b.0
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760334978; x=1760939778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
        b=kvN3zhYaUhR8MSSgMoW8yI8N4HLs9XON78ES8QfYCKx9waClEVQt2SIqeaCxzLyTfr
         yysHTpYklkQRGXes2PcnvSNBXw4iUKFRc1SatzDD16rUIyR14y7df0U+2fYLS5qA2iKN
         kwfAxyf0njaBQIw4DByNRQAZuTzNlIfSjDZMX54FTG2EEA22INhAgPxAJRfdjoYNKCHG
         weG0CZeUULH0J5L7fzZqhb8VZfhWkI9s/Zf8j1cfXARjk3NaeslgRTQKIVZvHB0tKH01
         3bIa7AjPVrPQV6I74J1M+U3jRb7LqSo77o/nZ92YoRTD82s4Dgfh35ibunA54h7q5GSz
         9g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334978; x=1760939778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAf6EGQeqIJGv2EMJ3digEJ7PV9lZXWnKBDi4CC+hkM=;
        b=MOY3Ac1OlUWmuudjnuBHFAX+QAIdMhatiUTsDsLH1uMTkCB2UP8tuo4loyzoKa4snu
         tntgCWKvc+xOXcI2FTW/4bd/VKi+qGdIcmx52YItqJWJP2jUidvXPYvAZIgM532iBzI+
         G/kvI/hZlfhvLaJsUzKEizn4xwTCn/w9aaS6ys+zL2UnRJCsRtV7RW2RuTL0zGKxR+D6
         DmX2uxLjuqg/Tf1Iir7sTvTHExuoBOL/7ZOppZp/cGP4VgQahIpvNN5NhZEbSl6jfUC5
         +/mpDA/6Fo4FgbZhiKTgE1uwge1obnjyD5gK5OuC/vDe7jXcDHgtajuWoVycrr9+z/C1
         5NNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtGcUyXWzGN+o7tMLne+k96SKnGnPkxJoFegfHThhJ21o9JzsxldsdNwrZImJQLiqWhHHMH3llK74hZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJw6Kgu0Sz61IuNaT4CwNKwHNmTBdkBhuamUg0u0V3eLO25aqI
	uoJjkiSivdyJ05s/+kNy9f4ITOEXER/QXKYNZ5SDfoq6MinDTyp7h6vQ
X-Gm-Gg: ASbGnctq+itK282xBR+ZzG8a3x9RfihB0JktyswYPM1jKImwfrWfMr7QFZpUfhnGH6O
	/OXOQDE1+84ujGjCupJlWMFVUZhoHw5tRgRl5WXOUghYfJN/whsTIBxyLOuTePYvvQG6hloBqZD
	A/KXKj5nlfVr8hn42idmaJW7YLUrBGz8OUov41AxwuAzk6wuV74RoJFQ3cKBbrD9Puby/RO4sS6
	NnG5coSGzCevC2y/3hbo0EVn2Qu9yBFMYxCP8dzCJhAI70o+DBAiRRRABDuDkKM43rp0iNsyv2h
	a8hK5DvfAf3VuCmtUAU23RVGOS6C2NALTmEXYDhmN1+cEEHrAkP9mrIIGMwRhISFzWoqzQW4s39
	X2+2Uz+4AOeD88b0rwuetrvW72bzR2yF/vhKvuWv9/qM=
X-Google-Smtp-Source: AGHT+IE90eJykgwlLq6LrJzKnujY8LCDyZPy1SZa7XTZkQZFTXfuHu5TUiO7YqD4A1awp1OsNprVEA==
X-Received: by 2002:a17:906:ef04:b0:b44:cfe1:ac93 with SMTP id a640c23a62f3a-b50aaa9c403mr2034340066b.26.1760334978370;
        Sun, 12 Oct 2025 22:56:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:56:18 -0700 (PDT)
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
Subject: [PATCH v3 5/7] gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support
Date: Mon, 13 Oct 2025 08:55:40 +0300
Message-ID: <20251013055543.43185-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013055543.43185-1-clamor95@gmail.com>
References: <20251013055543.43185-1-clamor95@gmail.com>
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

