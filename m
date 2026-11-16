Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841844;
	b=uWpk2QQywZRqjL1jEQ1mngtnXqS1zRo8EURT579XTOi0nNoz9UBf46ZbfM8MS98Y0IoT
	 ugJbaQQbWc7v1iB/J9D7Tl3uzEI8XwioKg0h4RJFE0MSV/cxOEqwflUrlDccLPW7SjLyw
	 u5qg6znyIklyupPR8xw+rriT169MuzNAh5C398GxUo+wC0bL4upDjnv84WlpC9BerNzC0
	 8ATFORzdfWcFS5nlqOcJvrVataVUSe6OdU3pYk8xVPHsbagobQLnTswgPvIrvB20KH6MD
	 4NMyNy57NCGp7DBtnoAcCKA5iF+w5diXDbImhZUjQdr6LI0uskQ6Hp8dwkUtGBltFaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
	b=U+HXQ17W71UryMQFRBKCB4lwSLzAIHGN7A8e/Mt5x4SW1XjLpxcnkp4sqGTP5Lr99JDS
	 x09vtZkgjhaGiggRocuzF7VlSUu7pJ+v1sdScy8lqE5XqMEeEF7GFvIfrDk4AUSH+Ngca
	 +wNhoMFCQO23yJBdsYa1MKTEBnm1VutAg4VYoC3BICogzN+oGqTQEldIxr93SuCGgcWxn
	 uTsKkBrM7vTJ2FlSmrswd+/MZHAYl+QgrJ8OombuFd3jwjWlrvHhgkfG48Sw3HaruDlAA
	 RJJn6HBOF11QfHLODHiK4wVVOZ6mkWc47vVVU0MYOqMjNfLBMEADD1VU0DCeEWbCqsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TFN8p1e/";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB07606A88D
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB07606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFN8p1e/
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so596764766b.2
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841842; x=1795446642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
        b=TFN8p1e/uSzKxrjcenNwkH1QG5fZ7s+9FWDCaDpCd6eWIWq7HTDxfuqFQuqLs4XrAl
         TE7DT6E+SExpy3/sDwNYKRzlo3ZaISXpZanItqvbsUFxn0hNX71BusAt1CDEmqQHZdnD
         RFm6e+XgA2WAe+OIn2dbVE3RHhF47VlpqXj4xatsl6nOJjf9csqCHT3Vu3nNSDdHQQ54
         YaGrQYjz4DQuQf8b2tgWOm4NJ+2wFbXbaS9aByDDs9NPF+47zIo/a1tvASJ++aaFpRXc
         3IFKGdcALDq0konLECwZIKh2OIXUVWkoK9k1P2tS8iDJGZs9DwmuFU6Bl9th1onY1hcM
         3gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841842; x=1795446642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
        b=2q/3jf2MvExsBzAdAc9xi2xWV+3KDGdLotEbV/PH/OOawMW9jmF+CoGMN4KokTBKTg
         llerUXgGljAmOeqUMe27DPBUa9dKSJHPG/pcFJtmBr3whpXzvxLkLxWjXTVBGg540fmn
         dblr+mDSuYU47G083I/ltx4cZYk4ZVtrARgaxhuIotgK8cQgxs4v00dXL/wpTu3GsmWK
         HbWMr0Mm+PrXfn0LioIYfEZsr9LDuyqtw5Wo7DroliydoG8iIqgLSKGIeP7rY882uUNT
         MI9/AHrIu+rMK8SfQ42ClGnvbT78crl/IOgAjGGv+d/7Xjsy50N9FUEAvZl+2zGtggLN
         AubQ==
X-Forwarded-Encrypted: i=1; AL+hErFW2isX7igDGrV6UUI0C4LeByNPD/o5RtJKbHP2D77G8c77A76yziRB/RWALkAyPwa35w326gtDtewTrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9rvOqnZ81INQ1Byju0EgM8aSAFQlxA4V+/tgItFFXmdC9qdrtB
	u3RJdodaUSIOWv7lm6LSYus0JLt+eQGde5Usat9/OENdfp5M3A7Q8Tfx
X-Gm-Gg: AYBFou34JqO2Zr6piNOh97XwvbxQ8FEfTEbhI+/qj/FZrO1hn5GlMn0/LzP38D2CWrs
	RY7STm/+YCgSMH2mWg8aytO74ZDn3Dr9qh1VrvkVHq8+/KE+vrNz8O8ViX253sQSs0tsyqVCHj+
	HQnG3rR8b1/MBbACL086QvusC8dra9dBW52tlJjUaaX4JwXXJf3JecVXer0AOU6omthPq6idrI3
	90phmaCnTtYEOGZSquXqjsMa6zXsSRQnGZVOHHNfCSdMbZYMvZeP/sK5ajvBMAndcWOe3NBspdl
	veeFqLxGCaNON8s5y0potLxXDbJ5y3apaox8G/Mf7IES6tVvUtz5FGZldN36lfmbMM80arAzLYA
	Yefq3o9mLDzOUvz0iCQy37XMt+etyLx09ghIshTUB+P0CprLt/6Okd0YpcGVeSEUWCBcylGsLMQ
	288lxGYDNUyCLGYmr51RJbV1p+sVA48vtl2Gwd8mnamrvnDJtPUpbKgvnQ8eCdVWHNYr5k3Dfm2
	kD+JhUo82qMjf00pGkyTggI7zpmJeCWbfpRLvpUjrq4IuxQWGs4/L5b9l9KBgY9jQkpBU+/SS7Z
	tmjCKB5ftyJuxorQQcrjVHDh/qDoXvPci1UsrcvUUA77JpaOKNnIWUKCH43EvTpbo1EVWRzvOTf
	NK+XJFEKuiJo=
X-Received: by 2002:a17:907:8686:b0:c40:b59:1b with SMTP id a640c23a62f3a-c5096389f41mr846550366b.44.1794841842225;
        Mon, 16 Nov 2026 07:10:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:41 -0800 (PST)
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
Subject: [PATCH v7 05/12] drm/panel: panel-lg-lh400wv3: Drop redundant disable() operation
Date: Mon, 16 Nov 2026 17:10:10 +0200
Message-ID: <20261116151017.274764-6-clamor95@gmail.com>
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

Squash the disable() and unprepare() functions, since there is no need for
host adjustments between them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 63efeb434be13..c6834e5312089 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -115,7 +115,7 @@ static int lg_lh400wv3_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int lg_lh400wv3_disable(struct drm_panel *panel)
+static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
 
@@ -126,13 +126,6 @@ static int lg_lh400wv3_disable(struct drm_panel *panel)
 	panel_dbi_command(priv, 0xc1, 0x01);
 	usleep_range(10000, 11000);
 
-	return 0;
-}
-
-static int lg_lh400wv3_unprepare(struct drm_panel *panel)
-{
-	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
 
@@ -175,7 +168,6 @@ static int lg_lh400wv3_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.prepare = lg_lh400wv3_prepare,
 	.enable = lg_lh400wv3_enable,
-	.disable = lg_lh400wv3_disable,
 	.unprepare = lg_lh400wv3_unprepare,
 	.get_modes = lg_lh400wv3_get_modes,
 };
-- 
2.53.0

