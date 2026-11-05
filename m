Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887566;
	b=XT72sxpRb/UJVqii1+Izbzt9JE2GkXL5GasqwwJSHud9tQFZfnxFFRpmXpELcTQr798G
	 F/eETpiIhIRaNwgnPuDN1Aj1JYR2uHdw9od20z2O8WVd1g42nCpJR0wF8cVcc/2eXNbTU
	 9EHl/WGgtaj+TIgiCarw5FGyY97SGM7cdHlp56JIYiJS/JLeUlNZJkoIlhinOSG9ccjZL
	 ktM0k/Yxfc+AkFnJugSofltPwMcX9S3QiBuWJsDLvRz3URhr/GmXTdYJ+iSlgsGJQyNAl
	 9a93d9Q4Lb5/GZeypv7IEhOg3HD9lGRo4bmwrlJezMgdynMgmFBs135PL9Hgd9UzRrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/TZdy0v25LHQ/8qZj/SLbaFNwYCRnqtlTMoJLynwB7k=;
	b=dNReH/0blnCUTk0zFJzMlRBuo0zr8SEf3Fa8HNknMz4jraQShWrFO4jb6FPp3N0CEond
	 iOO1vju4ti3UlaXwD2fpVfAvXDj2fwwm4HfyR+XP0OcCExnnDToFqnJ1v0kYCr7eM8rBY
	 M7+Naqt6MzxwIC4N1s2J64wLlMtXN2mJvEFgzvAGzxbDqRRja5bu1uOvDxBp6+vpB4P7d
	 efU7M+fLBXWgq1l75g56ojrkX758b4FAighBULVLzSAru7Q31MuiNDc5PoD8+ndsOdBu+
	 Vkhw9311ba895Gly2A3Y8L/WEJcqUXJmW0ffkREZ/hWbp2xUvmibjEuyGN5rt8tztIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzGmAogF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342A606D81F
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1342A606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzGmAogF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so18166275e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 06:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887564; x=1794492364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TZdy0v25LHQ/8qZj/SLbaFNwYCRnqtlTMoJLynwB7k=;
        b=PzGmAogFk5pSFK+wRR9BO/6p0BoRe9LotWLbM+RS9OR9kFRGX0Fus28SaCZHTGG88U
         EPKw2Cc9cpeAr99lWCcTu5Vmk4jyf/vjnH5dYm7Icj0AYxqLi7vt/dyF/EybyeBhDqeY
         kXME8cwLrQNVhJDa2beTo+cY2ZCQ0qzs+Ofze8rkUO5o4l2Zf6OoEnYFBqI7nw2EuQMk
         rX4NkywdVM0w1kS2Zrn+dEQ3Bnss2G5/Qd6B4OuGMU25VFuVH/4SdgcpBvAwFEvpQZkp
         2fOOz0jj3KYGOUQwCn/bmfrSkLeo5V9kyGZuJm9DUv65PJn27GU6OQmjxRB6JbTlBDLZ
         M4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887564; x=1794492364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TZdy0v25LHQ/8qZj/SLbaFNwYCRnqtlTMoJLynwB7k=;
        b=Uk504oFULQELn9fO1lwbHi4vAujZX+J5ALVM9WG4OkEgDslr69H9ikpD4QPNJqXdh5
         QC9s4LieetUeqZNpjyynOjQYjeIIYBqDP7p8IJJ7p/drsryFWWlJ5sAi+KgkLSabXFND
         3pFHsUXLLcOgI0ODtwYrg+mShHY0x4GIxafCGEOSCbiWO3T540cSnhRIjkgSoNyGKQQ8
         G3AmkUNOl4AcKq3v8nTo1NPeAxkSdvcXfhlcAM90TYEQ3MUW4IJjesy7YvTA+bST4PHW
         nW1RG0ciOj+tNL4BgCB/+41sI2yIFkGW6Mff5QkFnHKgGO+eeChGmBAppIqfb25DJe3i
         vO+A==
X-Forwarded-Encrypted: i=1; AKwUvBxhxoNBnzHz7kUFTvj+w20iDbWxMIn/h+5A07+KYwBrMFehM9GNolZ+1psZ5yns3k/9IGBYMK028yvqPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yYd2RmDbN9rHhtnF88XuPpqJ/p5Z96qWARokNyR/op4hdbmio
	diwG8t3xZeg6BEZAhPG0Q5ZBP4jrP4DkKpiCKbcXwFaqfYXhqVsR2iru
X-Gm-Gg: AYBFou2y5kAFT0Q5UlIW6ksX4fd+7J8hHkG1BLdKiG0e+Qdcemp3+NeOj2MQmdamf3y
	21aXA8TisgQTqju0656CHNxZaNAxqt/WqWS72A8rkb+rfFGlDfIPEfcwJXAseAtjD3yBw82mzri
	ry9D/Cg8PPpeFOf7OcsKRXEjCk5h2vXCc65gOQup4dLaK/GRK0r7DVtkuIwdG2/KT9fo6GPZyer
	vQGGN6RumhVSu+QCYF1zQLozt+Kk/47/Wp8w+fEJyTPhpRhe5n/8I7FA4kqxfW+qRSNxZajiKfQ
	HmJ7wtJfRysJF/nrml1lTSU6jVWZ1O3bqJ2Oj8FEDYf8rGKDT3C3IWCouIYPvxyxgdbYV7bXUe5
	C6VboHbwzVknhx6yyDCCc44yJsmqh47xj+/E34z+uYW/8cdv5mBPVlDQ3hfqrya/AVnxmBE0TnC
	yejMpjJWxtSX4cyzeeXflwjnZji2byemXQh3Is+diCZqQDFmTPCCmmeByR5a7K6YCdUUjXMR/SD
	x9uu1M02yCBM5qfkX7t6VuHtQCt9A/67u9IfneOzElLz/QFXtV+piMAM5V44Mj2Hw4mtTP5LWNM
	cjU3SKb323lhtHPJm3b7Ynx+mp+KXfIEafIuAqbltqqi6VKqoQ==
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr424532335e9.17.1793887564261;
        Thu, 05 Nov 2026 06:06:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:03 -0800 (PST)
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
Subject: [PATCH v6 06/10] drm/tegra: Make panel parsing by tegra_output_probe() optional
Date: Thu,  5 Nov 2026 16:05:06 +0200
Message-ID: <20261105140510.165165-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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
index 0d2c0ab0a63e9..fc6eb7410045c 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1855,7 +1855,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->output.dev = &pdev->dev;
 
-	err = tegra_output_probe(&hdmi->output);
+	err = tegra_output_probe(&hdmi->output, true);
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

