Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335531;
	b=3DKEXArwMwlOTxTCOnSSKhM0SWzrY0RCJWMf7hzLz014XMCtD9lJHb1u/6HdF/PqUeIQ
	 iAbrqHiXjRK0A6xmMV1L/YE4xAr6ij4GTnqO9+b75KASlEC2subRBJAs5buJ0irQAAHxL
	 +wddwxtlEA597fOhelJ4Fm3X0d4nxJnD3G5mOO3MvryMS5Gx7ChsGPiLVyEGq0KG+EwEJ
	 did5XIISeqisHo3Eai/9aVWMS63FwvprhaY0np28yaoSIquKV0P38wsU8wLGgaIkgsmQc
	 8Hoh702MNul7iInS9cSkj/VVPXBpLmSGgSjMIc9fgIEkR82fOQOjATgrBkE6MhyYiOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
	b=5Rzqn7mYIz9LdCQIT0w+DeoU3JRsaBvvLVzHWxn9WCPAYpGULuv5yhiyo1ZHBeZIOAId
	 +AIq2ECsxs5ZPO+9IPEeIc2eQ7MIPsmUdnc7Y7/GfigNruwqsiSDSRz/ga8AwvPrJaBj7
	 zAQljSNomy0yOsozoZi8ADJE2TLe9Lp9z2mCiCV+Lb/n+hUp3Ij6HcMELwj7zfOhsSsUZ
	 4lg6fORJELDla7MTotPsTru86YqVnc2Y700alz10jazqeqqW9wt5oTW9GxWP6XtTkO26a
	 RYtNWqWjQtRKPEURXKCY2k+niQf6YNKcbldr8dLWkxAZtzl43klG19r6L4pS7dsXbRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB26HDf6;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48E606A320
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 08:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E48E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bB26HDf6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c516a1623d0so53129066b.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 00:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335530; x=1795940330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=bB26HDf600jdMqxCKutJPmbsqrb8UZ5Jx77PmaK8AmGNXP9Zdth99ToXahTI8I9fGH
         k0j7n049EpqXTbWdvSbQKB721kBIAY40T4HdjoZ8WR9jjHaoSBwUlQN51ul0nSGrRr1g
         p5hUYJx08CxznYsnpigmJdThiVzp1tdAMyTKPrLICt2jPoS1vW89davjz7D/4ZVJmuR/
         5z4EhvXS9X2PSggMbIKii2kA3xhUY3epdlmLrEB4zQ7x5UUdRqSiNbi74OVc2SfzePkk
         nmmA/VdUeyD44VTJnPIcYrZ4YGdrh0QZSQ/Z+x0dWvU3V9KzvshiINP6/S/4h1V0AMc9
         FFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335530; x=1795940330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=BUYOOQp+JcjEkFNsq4LchYdikiCmwr58DUwrikhgttPoQWkpwaPYVL01rU02cfJdwa
         3/b6L78xgU7sJsTLrhhCfgJHGiewARRmcn3trEgkzVLlDUe0eHpirrJ2TYTXRnCEXsow
         EoHglCXK5fwjXsyNUhc+VLJJk4Aod+Y5DH69cDzVA9i/KGCzbXjwi/iF9yhJYcvEGSt1
         aJZfdzkSWbo6kabtm4uq0ejYh2/veSN+IDf7d5cbXlSG1mBE/qXf6cjGbYaxPFFI38JY
         ZRJr2vlX3tAc817Npb/Sr+VURhxFJCws+QayNEa3V4PelxGFYcGBIKM9AjIK8El2H2hc
         0PEg==
X-Forwarded-Encrypted: i=1; AL+hErEDfgW/gFMIodzFBM2D3rna2i8p6Pu12sx4C5NLRGONh2dx9gWa1IJWe3I6e6zIaUQI7UUB0LnLqmfu5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UUA9j/bpZrYoCFqzEGbYBY12aJ6vWGJsUs2objzD6+raGwnkv
	8z7je2kwfu6HTyAmXdYvNP0rxXneQe/ezLfoxeJR3pT3PqEnE2zFAIAD
X-Gm-Gg: AZFdTZdvhczEKQ5QTfZDDxwszy+tEPKS+FHZBFK+RLfqf5Yv6v5mP7syql58g51elKY
	qHEvgR5cSxVUHwlCvxbkpC2a4f6HU5IExuwQ96H5beZCCVCGbZZFvAgdRCspkExZD3qUE+PnNbG
	caRhG9Qt3T25K39kRKPxn0eERFTJ0l+mhSa2WSPmg0mVjM8WJM9KQy25d74tmgq+EAb7y2Ig/LY
	3f4W0JGdRyU8bJs/1xGOoB+SLIPXav+aTJ25WgpfC0a7gzdDx47eooz5BGVHz3LxWaOlzuOc77E
	9OIxsYgwEYbAYrRcSkO9/oUo/od9N8UhAAn6B8I+6YZ9wNIVPogxEV9M5hyY2H9LJerA40zTKQe
	UB9kYMDDKAPVwCWIzAHtFal/EA1K8ePcNAbnFMVtcL0eUfw87WfLNpEmfgAC0ZfehGLjWGBivI2
	OR0KLIW/6OToc31HbXgNmavkXm7cUO6cmS4xZrwTb4VOK0AL9cmN6pqJIqQ8WOmIZPUuv7Tx9Gk
	A7UOVfoqsXc/6KvZm00DlFbOVjTGhXZnCS+RLCnCZdwa15lg1tSARwKrPnKsvGvjbT6ChbxK8/n
	7iZ0iBnIG+wLYiID0OBE8py2XdGJqWEB8QscX9JYT7EwjFkElMsEmgrvwLCJIfwdEiFxIbWPHb6
	CIDFbsgxlBnjcdhuPx6xgeP3IBI00pBY=
X-Received: by 2002:a05:6402:320f:b0:6b4:59d0:7294 with SMTP id 4fb4d7f45d1cf-6ba37e9ec85mr6083730a12.31.1795335529477;
        Sun, 22 Nov 2026 00:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:47 -0800 (PST)
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
Subject: [PATCH v8 04/12] drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
Date: Sun, 22 Nov 2026 10:18:12 +0200
Message-ID: <20261122081820.53199-5-clamor95@gmail.com>
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

Switch from a generic platform driver to a dedicated MIPI DBI Type B
driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 27 +++++++++++------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 557bcb6f2ca70..63efeb434be13 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -14,6 +14,7 @@
 #include <video/mipi_display.h>
 
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -25,7 +26,7 @@ static const struct regulator_bulk_data lg_lh400wv3_supplies[] = {
 
 struct lg_lh400wv3 {
 	struct drm_panel panel;
-	struct mipi_dbi *dbi;
+	struct mipi_dbi_device *dbidev;
 
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
@@ -40,9 +41,10 @@ static inline struct lg_lh400wv3 *to_lg_lh400wv3(struct drm_panel *panel)
 ({ \
 	const u8 d[] = { seq }; \
 	struct drm_panel *panel = &(priv)->panel; \
+	struct mipi_dbi_device *dbidev = (priv)->dbidev; \
 	struct device *dev = panel->dev; \
 	int ret; \
-	ret = mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
+	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
 	if (ret) \
 		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
 	ret; \
@@ -54,10 +56,6 @@ static int lg_lh400wv3_prepare(struct drm_panel *panel)
 	struct device *dev = panel->dev;
 	int ret;
 
-	priv->dbi = dev_get_drvdata(dev->parent);
-	if (!priv->dbi)
-		return -ENODEV;
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
@@ -129,7 +127,7 @@ static int lg_lh400wv3_disable(struct drm_panel *panel)
 	usleep_range(10000, 11000);
 
 	return 0;
-};
+}
 
 static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
@@ -182,9 +180,9 @@ static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.get_modes = lg_lh400wv3_get_modes,
 };
 
-static int lg_lh400wv3_probe(struct platform_device *pdev)
+static int lg_lh400wv3_probe(struct mipi_dbi_device *dbidev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &dbidev->dev;
 	struct lg_lh400wv3 *priv;
 	int ret;
 
@@ -203,6 +201,9 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	priv->dbidev = dbidev;
+	mipi_dbi_set_drvdata(dbidev, priv);
+
 	ret = drm_panel_of_backlight(&priv->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
@@ -211,9 +212,7 @@ static int lg_lh400wv3_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add panel\n");
 
-	platform_set_drvdata(pdev, priv);
-
-	return 0;
+	return devm_mipi_dbi_attach(dev, dbidev);
 }
 
 static const struct of_device_id lg_lh400wv3_of_match[] = {
@@ -222,14 +221,14 @@ static const struct of_device_id lg_lh400wv3_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lg_lh400wv3_of_match);
 
-static struct platform_driver lg_lh400wv3_driver = {
+static struct mipi_dbi_driver lg_lh400wv3_driver = {
 	.driver = {
 		.name = "panel-lg-lh400wv3",
 		.of_match_table = lg_lh400wv3_of_match,
 	},
 	.probe = lg_lh400wv3_probe,
 };
-module_platform_driver(lg_lh400wv3_driver);
+module_mipi_dbi_driver(lg_lh400wv3_driver);
 
 MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
 MODULE_DESCRIPTION("LG LH400WV3-SD04 MIPI DBI Type B panel driver");
-- 
2.53.0

