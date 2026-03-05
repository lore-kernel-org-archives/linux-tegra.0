Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452EF3CE4B9
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727067; cv=none; b=shnjHswxLKmUU27ugTH1zL1ZbXF61q4M6ozuOLM/b0J0riNl+9ClYtr14MnXo18eMgFN96fq5C47sGnZXx58rm05JARhO6aIzc++zuD2vrOuz2CSWMPtv9BJPeKh9oIeReXmMNrO6AmsIKKU3dxPFiwS/9UxUiCwJbQzCUhZwHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727067; c=relaxed/simple;
	bh=OzG43Idqbxi1ORnEPr1z+IJWMjZLaY1zNTO9se1MEao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FqSSzmlUabF1Y9sTSVSMe13WNpkdSGOABoBHBCVJ8zwJwDhR1DNFxfHribkRc/JJAd0xH/gQmbQaWVe+nZ7i8ysNqpvsr+Lda6mu1n45a4cXKGQO0ii4U3afFIc2eDYf06y5Tyu5ZOfFFt/BfBqbGVnpN9+8MapZfewsCwGe/PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBe504Xs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBe504Xs"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9b1900bso3382184f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 08:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772727064; x=1773331864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJeeuaZ7qx7HAcADjaqwPatptaDaRzMU0Sji/6Pdru8=;
        b=aBe504Xsbu8iHnHNKNCs4eBEkc0kB2vrBnmihyKK/6J3qTybxFKNWvYT7gUI4dMuGh
         dk4Ng8amczAdZ06xvopXqugkzr//cdPOe77pOEAe7DzTi5zfLtMSnAVh4BUUwnYblSa7
         Q7oACL2AHL7MHNy55M7LZExPIPRGHNZpA+qrd4J2QA71sFHqYwyXakAEa3lTIsyOTWAd
         7lXuUjUKKaPtn8yhBKa2IvWY2zznPoUut/GIzguh95HWoj5ViLa/n+pnRq0ADXLCXjS6
         aSSRQPHwGxPANjF2o+/jBfUzvwC0xoczMH1jJLYPERrAPseoxsiGOBER64YfpZIlHK6W
         /Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727064; x=1773331864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJeeuaZ7qx7HAcADjaqwPatptaDaRzMU0Sji/6Pdru8=;
        b=K2i2emH28KyVr9ZAPkGGgTsHO/cXcwXX5Gmu0fj+WXgV5fA3BsOizOVAEeDdx8/Wrj
         HK8BJU8W2ppQKaXg+DYX62Z3sVu03l9pQS5keeJ4Vk/f5aRRXl7pqJET/TkxMMUCLAie
         /K9GpLfw4vpu4rPnq3HhtzN1EIL8MSoBu44en5kmj4p6EmhnRRbMsvym1EouQWacbmfT
         5cwruRBPubLWQydy5UPGNH5FRhe7RGDX6Ste7ZnKpPSrEfwPmcQ5XzdqzufZrC1JFpEr
         HC2lXAO5YqBD1SY/SzHn0quvbcWIizYEQGf2nwJQXKgUGBDg5Zoqh8u8/raHcmHwDHwx
         j2hw==
X-Forwarded-Encrypted: i=1; AJvYcCUdYPE9hniAEGvb0QyP71NDd2KnEGq28mTDe1/8SObf6pjqwfP+cYR4FjAA+l4p4nL+zEw5gaQMPP+D1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ3BNu2nlA9qrHoIEAW3TFdU9oBp22rQgKbt4Ekzza8GCBSMX9
	utCWf0ZIMasw93FcUri06gaxYvxKpT0byL5KcjWbgHlBKdf5KYcxznKbpIYaTQ==
X-Gm-Gg: ATEYQzzrXDD4vJsBYUeXNc0Iy4K2MTt4n2ks2Dslq3Bqg6/kpa5kbGd4CJ7OQfttMzd
	T7P+nHRygpxqeHJ3DAV91+fadIXb5h+vRJ7g8BJ5lJ/XwFR9ED2zY9hdZI2+eZJdvAEqfURAgR5
	XcXdkoMKS1BwdyY1JpwxxcX5dSd5BErvP3DVEZKpWHUvnKKe4MjhtNhg2YiDm+HVEiqNUSL0/mc
	Ies0UPz693cH/lIiHue1MOoEu6THITcmZkyJL+fZoMw3U6+O6AJsz3kHZJCQ8u53abKeeHzkcY4
	DjSAjyLIWK74q5l3z4gumdEWEBIOUJ8hg8rYw3//X/TlSpmftowRCDdTdgRUAWygc9Q1rOjrGFm
	u9ES5l+QcEoMDG30Jhh851dNA0/A+KOfKPzoqF3ZCEbvGv3YcdJD2xdGWT0Ud5Apfb9ktXlQ0lh
	Oc1ofOjSPsSx8A
X-Received: by 2002:a5d:5848:0:b0:439:bc31:a05a with SMTP id ffacd0b85a97d-439c800f812mr12087240f8f.43.1772727063494;
        Thu, 05 Mar 2026 08:11:03 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm31426496f8f.4.2026.03.05.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:11:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] [RFC] drm/tegra: dsi: remove tegra_output_probe use
Date: Thu,  5 Mar 2026 18:10:35 +0200
Message-ID: <20260305161035.64548-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305161035.64548-1-clamor95@gmail.com>
References: <20260305161035.64548-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra_output_probe() function parses DC, DSI, HDMI, and SOR nodes for
panel phandles, OF graph endpoints, EDID, HPD GPIOs, and DDC buses.
However, this function is redundant for DSI controllers that define the
panel as a child node.

Furthermore, it creates conflicts with modern dual-mode panel bindings
that use OF graph links to both DSI controllers. The function incorrectly
treats these links as standard panel links and attempts to resolve a panel
that should not be handled there. For example, this causes the Mi Pad
panel to fail initialization.

Testing shows that bypassing this function allows the Mi Pad to work
correctly while maintaining compatibility with other Tegra20 and Tegra114
DSI devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 55259b68c933..5fbce17ea1fa 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1594,10 +1594,6 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
-	if (err < 0)
-		return err;
-
 	dsi->output.connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	/*
-- 
2.51.0

