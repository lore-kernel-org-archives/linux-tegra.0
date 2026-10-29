Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287785;
	b=Gj4xgIn2Ae9kyaKlkxLBT5DP0M2yRAl8Er4PV1dnO77ayjOtqfrxCWc3nAkt+bK9bk4b
	 NGEW8gWp6PL80pYNw0AgRPRrpoliryHaHEt3E4wAIORtdcfwqKJ0u7hbePmNim1sQpywg
	 uK0lHDgaQvm97b6kiCGGRn9h7PZ/b7EcpHCQH9FaK8C9ZDO6iA4X2a853M4HKzgo0jjms
	 xQlXOMku8o7hUHKlXQKsLfuCuVc7WoWxvC9lVVLsVaUXHsQSb0DOMiKAHLgaDcSyfSaKv
	 qkam9n1D4cBHwN68m6OEmcjeS9i9gArnQuBRCuw3oNUV6GwzibTnv6fukAiPi14nfxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BMKtjudVZEjfMcNSisc3laHJ/AC+VgTtmt6i7T2INik=;
	b=bcrJ0UtOL4AWzDaKvO0fUEo+9wW2myCBTq++xr1/vimyUt3Jja2lO0PrdxHBapwJHsd3
	 3KrwGc7kjTEMrGHhsZ81q3VGLGzdbL2r+xu2wlHlFWDdpYjWXdkch4ja/DwRuD5EN7OTr
	 eEHL863X+UjizmeOfrg2lqOIqioeeFH9+9QSTSnnNsc+llzPRHNAi6NFzxyXRYhc36iEd
	 /7wZE5C0iZ0E5qMFCAiChpSojUx8DXg8hZvaPb2WvqDxl1KWogSvgUuUiae2yQlfvti0X
	 +moMNFozJ1j2UV6Eh+KAABFmLrsEI8Z1cslhQMrZc4ponqK/tuzlVuBBat/HBZ4EFHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tYv3aGNs;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE0260A2609
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE0260A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tYv3aGNs
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso3399254a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287783; x=1793892583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMKtjudVZEjfMcNSisc3laHJ/AC+VgTtmt6i7T2INik=;
        b=tYv3aGNs2aMiCQmwxH9QbfyD+MlIHSNs4FIXY/6cTaTEjVGi0KOLFGdsjVHUrH6CBR
         ILAX8BOBqknzCEpb3JbfyX1O/jKZmzLfnMo9G1uZmzNJH9zfsXDO97NaWvdGGRxY+GBn
         qkjWDVOHpqhP5yUpCqxfqt0f5CjHdeLpjhoJFBacrLqB8zBOMmxJP5Z6sxGX9vHqPiMu
         0I56FcIAOR5klEHz682jcUReQ7+IlMZEhO9woiZdezFvBfZnp1Bvq4mvXsDbDkU8JGYi
         CFx07ph0nHFsOIbaZgdLuN5qLjlEw9iCY7UqwhXl/ldJQbaOisDaqylSlc9277MBH5Cf
         NXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287783; x=1793892583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BMKtjudVZEjfMcNSisc3laHJ/AC+VgTtmt6i7T2INik=;
        b=pPMDJG9KaYnUJpZ2KSkdvdI9lNIEPf489TKoh4hqxzJMUBj+ofYu9ghtZMz/res+cv
         8JcUcUl9/rwywgYU8DAbq3j1FdtgqfswIutYoX2OrHDHnsEDgoay5hYiKvpvJKlwg3PN
         iEVzmtra6kSC7KgqKEfbWkHTLkGZB/9Of9XLyF8cAqmHHfdFTvjQz4arEJA8cd/oq3XK
         3+84L7kLrPxIfQnowRygSX0cncNCwYR3yRqHmeHuzhfiIdxcKiFzD0ZbJHQ9Bu2MDL1t
         uigXnCPGMOpGUpHMuVKVw7/Vl3/JbHTw3dVvvdG5JDbuYK631FpVtrW+AlCutZRIWM+y
         g+3w==
X-Forwarded-Encrypted: i=1; AKwUvBx2C0WL0HMc/eDT1MNUhsON2V61s0EltT0LFEgT6aakLiOYu7H2WrBpbkkVa3hfmtkBGNa1a4hGkyF3Jw==@vger.kernel.org
X-Gm-Message-State: AFq9FYICk6OiCJuDJrbuM3nDvMmIL+DO0vPtCRaUvDA5mD1gC5noGgUK
	X9b/Aee5k4m9kZR5sodi+xSPvQbWCWqUBKHmG4U4Piu4r302Ru5pUh+9
X-Gm-Gg: AYBFou0C4DZmPRdi3phK8F+JG7ut3iDkWW5SKobDjKtrch2+MN3+dLdiB7DQncNvVYr
	VxKH0iWd3qbdWLDOn2RcBc9G50QpH97XDuo4AcH/ruWHe1oEKvhuuIIXxZMW9gDSnd1c7UMIN85
	yqTUcBEliDVGzidim7XpO5avO0KjdblpZd4TGYpmnitssWuWekx06akzzCf61IWBDpvXnbIFH+H
	ybav5hMwsbSUZqDRNamHPpTTj8ErWsQp6it1MabD4p9eHP39+wM2rdAgFZAc3ktk92e0wfHZG02
	lx4pL/oCVjEvtjQvdlXKmW0urunNxQrlzuYXqSuzhwGllfmvWCw72Q1h3X205A1UR3A89jRwuwO
	twxQeV4qxp/xl9ZjZuBHL0FB65ijZy1PcZGHZ+x4GSVPMta4pbol2G6unQyzFZA+tTd9osw3SKb
	N8DhDB0Q3/Ucv3wQdfHXM991kdNFLkZABQnFSdi31612/V9wWminGrPDtnanEIc5jBmPmtmcE+T
	xLCwikGbBTsi2r8nmgJZUCp0RkvISB4hZLAwMBT4b0Uix88Yh3c5p8J+ewOEwxc82h47o3vQM7+
	hp1tIhvu1wjT/o2ZZt77bTuDpDjn6K1GR669d/P3ZytaPi9xpg==
X-Received: by 2002:a17:907:940f:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c49bda76b47mr526656866b.0.1793287783214;
        Thu, 29 Oct 2026 08:29:43 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:42 -0700 (PDT)
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
Subject: [PATCH v5 07/11] drm/tegra: Make panel parsing by tegra_output_probe() optional
Date: Thu, 29 Oct 2026 17:29:05 +0200
Message-ID: <20261029152909.234584-8-clamor95@gmail.com>
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

The tegra_output_probe() performs panel parsing unconditionally, even for
devices that do not require it (such as HDMI) or that handle panel parsing
on their own (like DSI). Make panel parsing configurable.

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
index 7b595310e7379..a4c0c63bbe567 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1618,7 +1618,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	err = tegra_output_probe(&dsi->output);
+	err = tegra_output_probe(&dsi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0d2c0ab0a63e9..c0845bb45bb15 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1855,7 +1855,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
-	err = tegra_output_probe(&hdmi->output);
+	err = tegra_output_probe(&hdmi->output, false);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index d0ba3bd0aab8f..ff2e28a1e00b7 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -94,7 +94,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int tegra_output_probe(struct tegra_output *output)
+int tegra_output_probe(struct tegra_output *output, bool get_panel)
 {
 	struct device_node *ddc, *panel;
 	const void *edid;
@@ -104,31 +104,33 @@ int tegra_output_probe(struct tegra_output *output)
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
index addcecf8592b1..01475995d9cc8 100644
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
index e384cbd0cbf72..ab81e412e05f1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3806,7 +3806,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto put_aux;
 
-	err = tegra_output_probe(&sor->output);
+	err = tegra_output_probe(&sor->output, true);
 	if (err < 0) {
 		dev_err_probe(&pdev->dev, err, "failed to probe output\n");
 		goto put_aux;
-- 
2.53.0

