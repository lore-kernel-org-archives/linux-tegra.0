Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841843;
	b=SkCFVYTbN+d4SoC3uHvDsBVq7ur2VZKnZjoZZNE7y4K2Ji/FW/tRVIFx6VgBL5LXWUzs
	 mN57pWhugElXp0ckqYh2RY79RKwd4qcoKK5T3z2OLW/u035T4hU779Vr/B1+i0wM2y8ph
	 44DIU7o7rrUfJ/Km6Kwx4kJjODBx9nWj8af5cpZBspcJaKvBAYwRdf5lINI9hMdYg8B0J
	 YQJZUhuFzwHFlMfLi0AzVVFgKXBffEp+wIOhcnUC9o7ZzV3xr/FPG2XFlkQQJgU8z59h/
	 48olNcj8qVSWrO/bYiLzxJjUbr0lBqaHEhbnQicLSWnxyOMgHDX0BXaTofzQxRJVDkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
	b=H8NE1cHaBSnZdGWVPQTzbXrIL0jVbbXpEwQxM10ut7HSmVXDvy+CG8fRsVmCrjq/D9J2
	 OVOHcMjH8kFvDMykzWOSSm0D2t8VUg11NJVn+pqjK1nQATxQwB7i0NZt61xl+icOOViVF
	 qjI3HtLb2N9BPkmhKFysyOPWoZKETcg9YU4wh/xdGxO5ZvU0uaeSYbsKplk9TY6IMOqrX
	 fkl6oxOqnevgcwG9JvdbE/i3xPJguOGoAtS2N4TK4qBCxhcd3KjoiR5HxJwXOBphYMOLE
	 moc/qgp8xSwOhF3HtojK0ZkSLg7PhhLpQkEesoimnmm0qdZpTzHCdGIZ9+Yk1UUl+PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISHujfWx;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC794606A329
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC794606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISHujfWx
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50604721c8so578629266b.3
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841841; x=1795446641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=ISHujfWxChiC7AbQ1qkRWzaVsdz0aoKzaTEL/eJjn5CNVAWxWoycBjni4G/oWBXeq+
         q0tPd36ecYI+tWR/sKoiLjhfRPSV5Awa3tzxtMsrofblVldGlOqDy5RUF4h38zm2//aF
         gdR1ASZWg7jHH5LDGoSVVVpAMdkucT98caGO2zWxNPOgtkckfupJ+KkAgATcpNjkfi0C
         goDZ7jKzf6tODPF8Kwfg7lCRKX7LF5rGY+DT+CzY2PXKwP93mjHweNQF70xr27WUPhAb
         0ZIUWX0w2vpLkZhRRb52ppmhqyYa57LXqaec7jZCEEXeK0hhzAIV8KgiEtZXNH4vNHP5
         ZJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841841; x=1795446641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3WSfUrzAFZ6C8avlWVorHXjO1aUqVAyT5MLm+GUqW8=;
        b=Erb5TXDLsEohnl7tcRFdhKdxmz+8Crs2/vurYHYezfqB7LWsGuDm8l/zgaIrLzcfUy
         PEbZZrU1bQRrynNyzsrQZfYHHlPwmzbIZTONKz0c/yWKGL/YcF0TsWGKKL6WAnG5QuY/
         TthWta4nbuPuEFNnGm0rE3YehOXAvrQNZoBqm24KVGppT28QgJefNltwBHc3ZyhAzt0S
         xVjpC7e/T/YSJ86tRTd8DHjnMzZ1ctREIpkjaZJhP4O93Gd2NlVq8SSPfDWGGnE891A6
         Gu9017bJzz3wBTssYCx5eE7GEXNSV1jGKiegP2aSIlEJWVtv5YrzqNfd1lXXnDPjSRj3
         kHwA==
X-Forwarded-Encrypted: i=1; AL+hErGqm6Qarwdpni1aGbJDRqmFzmVoVS+fb2SsBci/KyWpzKRAlemp4XJYlVJMtH2OwOPuxsXDIMG0jURPcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/67LL95KZ11eDwovSU0+Q0eUw3u530XZrl7rnONOOYhAI6t2uB
	SkMwIYWUxJdB4B25mcQ3yoMnyWjb7OQHJARKhaVI+8uJ9XF5nVSs7bRj
X-Gm-Gg: AYBFou03vn5HXHriQlN1ZoBsyENmTOBhxsai4t39MJT5F50pIhWIH30FE4816iknQrK
	Nk2uEip7KRC13m/BoQzJhzWUZOjj7BHUovNAzfKw9hE7mI5Xg0E1UieNGj7NGWe60t4am1ZA8PX
	y+QVqSYOq4SY2iyQDiHp0QYxv+JEFIHYzuTlwWQHpxuG17v1xOujPSu5lpAJT1ZCATQ0QEsQrKr
	gKDDYWNHgdHQcNMhth/5G9ISD1INNYzLSdN5hQ6aRkPZtnrF0wBz5hhql4ZdI8VF4kGh1KV+h+X
	rrLnieypS1+aD941zDxTQC0532FgGevOV+O7wp41sbDyBFMEwOM6LnLVoWJdvZrpaufdw2LNBPM
	jbs00CI3+rL0lGAejCwPJIwSTkmml1GDZvKn3J1nNtYtNitcIIA9RLB1GkmWiQq85ucEfP+Q7Xh
	GfzSBfljvZgVeRxQOLVB94z903rgV3QqEP/wlj+i4bMpkb9Vwro456QxASeYCtQC9Sid7L8S3Th
	tCX3xoRY0q3/evcg+bm+PUiPagglBJ1QlHo18uJL+tZD8uQlbTKGJalZ/lcoXEYSzcwUpWflEFC
	EP9HB8s0VWZCovHAUi/b1WMaAPy3KJSVMxm7eLanAyVSch1Gv7y9+RWGa/IAZRnkIWvkizQ52ov
	XwaqglZPBM3w=
X-Received: by 2002:a17:906:9c93:b0:c50:5186:a428 with SMTP id a640c23a62f3a-c50963b3380mr940379266b.27.1794841840334;
        Mon, 16 Nov 2026 07:10:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:39 -0800 (PST)
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
Subject: [PATCH v7 04/12] drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
Date: Mon, 16 Nov 2026 17:10:09 +0200
Message-ID: <20261116151017.274764-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

