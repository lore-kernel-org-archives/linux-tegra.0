Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335545;
	b=Cd4FEBmBvK7y28gzt6zH917Ah9z0ApYk2Z7eIde7r+luCRmi4e4t8jibp9DUCJQRgEaS
	 QNJR1HLvTYYPWT6S864fj25X/bprY8PBXc2h/elWobgTKZbphIy8vTXV0YW87G4TlmEoM
	 efVOOgR+PupkxGKhNGNTxfNXSP+455Ysvvb9S+lqgL9NvLuYjrw8ssbEzhmD1ai1qjk8s
	 FtzsyrltPneKKogAXguaOEjnFnkyDl6vcgAaHWUlyqsCOUZACzn7LgwYw+xEFzO4R0l2T
	 NrnTGKJvpxtbp+yDjhLeCyOtLuJkkWII+yBG44SZJHiezEGP524fvIkGzAoaw6nAU0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
	b=GnCjVVMPxTB3fO74l/gyCgb9rO/lw+GUflAtmcjPxN8Xq/DMJNXAhyIvZRQmMTA6fG4i
	 ZhW4NyPRUJ9hP4Hr9xuKkRKYHSiP0rdNWVl6mYIOpvESNgqo6QTATDj47LC9IU/ekoAsT
	 +TKgrpbkvLieBc9GaWoTN4fDtJOO2srPnpWYCnCbWhpnpxuhOVkY8MMVEB8vYvhCSOxl8
	 oP6L4e2jpHOlfm0eUIURq8zgp2/AWpLDFqs9gZPb0uZzdZWhhc+shBNJ2y2MIH0xBwyH5
	 iiXVpQPbdr3Y2xpALEXP2ZP56YJYWeNHzusNnHAv1hYisBLx2qZT+26pG0OQbZVOX+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LvBo5S7y;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9D0606A333
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 08:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B9D0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LvBo5S7y
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so2883835a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 00:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335544; x=1795940344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
        b=LvBo5S7yvr0z7KdgzrGRmCXs33lPM1QkxpmPhP2ZLyKNJU7Q/ynRbp/RIAU6gfelwc
         rS1F4qlfTc1bxfwZM+rEYhu8EOwmNa8T81NAeZC9eUs7B6J5VgmDto0pLM2kocFwcTs9
         Cc5TAnXMWdPMRuCiI2bBJxsZbBRUu+ilA4vm74i94CUjvCPwKOxHkg+Z2JJ30ymzrBVH
         IAUehypO41YGi31S2P5jnJ/4XJD9MILbY53k6UEuiuQbmCoeJbS+E8wv5CmWlCuMI1uA
         9A96EFliEBU8KBWtjwcMkilAQYJffUTUvJ9/pSRCKLxpt5ReRi0N7fdA77b1epcNm1NV
         JqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335544; x=1795940344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=raX6dCAIomOIJ7ELRGbL6/J7HJwcKSM4UvEKLE/Febc=;
        b=jqIbDx9lxjk5+jDIQAxWyUe1CVc1e3Dq1vXXqBXyts5gQKGUl91GM/rbLwOx0r85TK
         ++8yrGv5XGwsbYXhY8uDQXFVHJPEB7VPL8AZx7jMVqB1TRJqbsJPIZJQScYtt7SyUkii
         xhf2Lat9lRXgjYsXI9rapuPfxeSCr2tEq340Op/RazyRK4cWSU8Usr4TQoykSXiWxVok
         UpFUeB+Ou+YGAymuWTN6/hsfM0xD7hVKRThPOZ5yJdmrsFwgJc9A7AisaKMTjegtV+XQ
         dW4YkWhYK5MK7Su9Uw6jEgV0hXv6xOZ66tQdjkaWLL/2B8vC28zNNE5tpAQx41CQ9trF
         WyQg==
X-Forwarded-Encrypted: i=1; AL+hErFzTK7/bgjVb+POpOFHtc6vIiFMYUDd1y6oT5DxY89R7t/xZz7oTWygJ2UpUTbzH4MBZIOHVqTrKXy+rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VKipwtZUPSszfETRKq/QdTut+DYKZJzobGW1pXH+oGnPuiv+M
	K+CrjpISchxSlqTlpPhkEjPcINdy3C285lXUJSt3Aqe5AKAmWBj+Np3q
X-Gm-Gg: AZFdTZeusKcfPE6Fw3Y2g1tR+E2DBDeIFCncLqC/mf+Gpf6fV9vpKGpgwEcYLiGzCc1
	XHNlJpQFSp8dM71xZtHSUccPilmxGbCXw9aDbvqpqPQMnEgoUji3c99MGhKCzVUKrq4fhYDsuah
	Cw1//8uHJ/+EgmkjluYyLczplL/RHxTLaWJzSDpbN35TuQdCR0m7aOMeo3xJ6f4dKmH+7Luum5F
	xeQnCAdpqEq+HXIuNcZBkt1TSjKPO3bxD8gYlZSp08q1hSeEeZ5KxULq5257IwZ3KyElOuNaDxt
	9+fl+FXbE91woVr5WihKsnR6pNei06nP2Yvej8k3wVCNIsN/Mpv9INycD4uDc8AM0UTC0/NDsWE
	Xx37jUQ/H1D9AnYs54RIJV5IeZQATPacinxpNOF1tJDR8Yv0wOrxvfYsxYw6tQjmH0Fm78vxAHU
	JwQfVXFwQ5VerpHP3WEjy9aflRKkZmL2iF87OSngIgD32jI2/mBKRe8OpfDhlG37R/6jqHcjRgb
	FK8EhuvCLCXzi0Tr/x8k0O3QJCG1V0dzfCqEcFZZx7zupvp1JPA9kGyc9BXaZFSmJPvefSTtuDy
	UZlkr3QHSNlGBs6ifg2UgnHNbMXLMS/oL77SaeI8M4b4yJsSarJOGm8miZSRev6yyWshHgz/4Ty
	Kx6KGXswFkA==
X-Received: by 2002:a05:6402:1512:b0:6ba:12e2:46f2 with SMTP id 4fb4d7f45d1cf-6ba37d18d2emr4447226a12.8.1795335543575;
        Sun, 22 Nov 2026 00:19:03 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:19:01 -0800 (PST)
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
Subject: [PATCH v8 08/12] drm/tegra: output: Make panel parsing configurable
Date: Sun, 22 Nov 2026 10:18:16 +0200
Message-ID: <20261122081820.53199-9-clamor95@gmail.com>
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

The tegra_output_probe() function performs panel parsing unconditionally,
even for devices that do not require it or that handle panel parsing on
their own (like DSI).

This causes devices with dual DSI panels to fail, because they rely on the
OF graph to find the secondary DSI controller, whereas
tegra_output_probe() treats this port as a direct connection to the panel.
An example of such a device is the Xiaomi Mi Pad. Make panel parsing
configurable.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/drm.h    |  2 +-
 drivers/gpu/drm/tegra/dsi.c    |  2 +-
 drivers/gpu/drm/tegra/hdmi.c   |  2 +-
 drivers/gpu/drm/tegra/output.c | 52 ++++++++++++++++++----------------
 drivers/gpu/drm/tegra/rgb.c    |  2 +-
 drivers/gpu/drm/tegra/sor.c    |  2 +-
 6 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index bc720ae8d95e1..e53fe68161cb8 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -156,7 +156,7 @@ static inline struct tegra_output *connector_to_output(struct drm_connector *c)
 }
 
 /* from output.c */
-int tegra_output_probe(struct tegra_output *output);
+int tegra_output_probe(struct tegra_output *output, bool get_panel);
 void tegra_output_remove(struct tegra_output *output);
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output);
 void tegra_output_exit(struct tegra_output *output);
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index b5806a53e75ac..6d6adc485e51e 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1617,7 +1617,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
+	err = tegra_output_probe(&dsi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 3a94968bd983a..e8c4347f09e69 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1855,7 +1855,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
-	err = tegra_output_probe(&hdmi->output);
+	err = tegra_output_probe(&hdmi->output, true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index eebf0ec0eea0a..d7d7f6ce0a8c3 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -93,7 +93,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int tegra_output_probe(struct tegra_output *output)
+int tegra_output_probe(struct tegra_output *output, bool get_panel)
 {
 	struct device_node *ddc, *panel;
 	const void *edid;
@@ -103,31 +103,33 @@ int tegra_output_probe(struct tegra_output *output)
 	if (!output->of_node)
 		output->of_node = output->dev->of_node;
 
-	err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
-					  &output->panel, &output->bridge);
-	if (err && err != -ENODEV)
-		return err;
-
-	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
-	if (panel) {
-		/*
-		 * Don't mix nvidia,panel phandle with the graph in a
-		 * device-tree.
-		 */
-		WARN_ON(output->panel || output->bridge);
-
-		if (output->panel) {
-			drm_panel_put(output->panel);
-			output->panel = NULL;
-		}
-
-		output->panel = of_drm_find_panel(panel);
-		of_node_put(panel);
-
-		if (IS_ERR(output->panel)) {
-			err = PTR_ERR(output->panel);
-			output->panel = NULL;
+	if (get_panel) {
+		err = drm_of_find_panel_or_bridge(output->of_node, -1, -1,
+						  &output->panel, &output->bridge);
+		if (err && err != -ENODEV)
 			return err;
+
+		panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
+		if (panel) {
+			/*
+			 * Don't mix nvidia,panel phandle with the graph in a
+			 * device-tree.
+			 */
+			WARN_ON(output->panel || output->bridge);
+
+			if (output->panel) {
+				drm_panel_put(output->panel);
+				output->panel = NULL;
+			}
+
+			output->panel = of_drm_find_panel(panel);
+			of_node_put(panel);
+
+			if (IS_ERR(output->panel)) {
+				err = PTR_ERR(output->panel);
+				output->panel = NULL;
+				return err;
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 40a02cf5939aa..227a178f761bd 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -236,7 +236,7 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	rgb->output.of_node = np;
 	rgb->dc = dc;
 
-	err = tegra_output_probe(&rgb->output);
+	err = tegra_output_probe(&rgb->output, true);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 061c5dbb738be..ebac9068b670f 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3803,7 +3803,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto put_aux;
 
-	err = tegra_output_probe(&sor->output);
+	err = tegra_output_probe(&sor->output, true);
 	if (err < 0) {
 		dev_err_probe(&pdev->dev, err, "failed to probe output\n");
 		goto put_aux;
-- 
2.53.0

