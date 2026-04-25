Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E2204F93
	for <linux-tegra@vger.kernel.org>; Sat, 25 Apr 2026 01:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777081384; cv=none; b=ASvVY05BrF1Um3t717GNrFlvWRXBa2OUDsVmPHahwluzj9m8vuDunjIKGu81aUsVW91I0w8PpdPex4jE4lygxNDen2j/6jvzSKcdTTsYS+tcLKF3CJDo+QHIfawyqBjHI94HRFa4aL9myn2hqLDog4vlHKRwiGavdnONfYS30do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777081384; c=relaxed/simple;
	bh=+cdLIRk7vhwZO1mTjgtO6cxF+uoVQlfIJe72382/1X8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uN6wqxhjSugXR1J5/nAWxJYHMYz4Nd4pzwQ804XgpqIiLb9RNoH2ceCossbV2AAQjbXXvhPCy18yVeDjoziY+rP8nEuj+hVmRpHt7HrsGrwcvGYkgswUiObqQv77hEP+1ADkW1NXqzS75tYGlJwchxKz1rvh/UEGJqAQs0OB7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6Gfbe4r; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6Gfbe4r"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ab46931cf1so65640735ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 24 Apr 2026 18:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777081382; x=1777686182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7jfOZXdYS61UScW0k+/0N0W+wALOe5mQD08+f58S0o=;
        b=G6Gfbe4rwPdKE9yQ1N9dR77SsaGX7INzaTIO5P3JFJHkv6EaucQ/fxW6QlI7+7acCE
         9W7wAh2T+1Kw/PUNRaay4Eq6rcL9YAqS2EkIeY1+O6JYFBgMDWRtHW21FRMOw0qCFp/f
         jlmOlF7AjXr4xpcIz+zYv3GD5GLz6tpuiz/1D97uryvXiKhcuOULbRy2rKoLLWw8oMd0
         ZZDeifch6lO+6weuXgTy5yA49XxnazinE3xGPjBEpRKvst4Fn32zJ+szEiUEr1t3sRej
         9NfkHFScdHDxf12rwpyT9kZawrk16CbJsdN66KPqJ6ulTHmksBuhYvhsRpkjMHjnh1gc
         gY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777081382; x=1777686182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7jfOZXdYS61UScW0k+/0N0W+wALOe5mQD08+f58S0o=;
        b=Sq+1yYWLxSCR0eBcY0PtyKm90mDY/SDHqNFx26PaYNq/uyxM/lgugT8efJi/PBXNC/
         vMBq25qUS54RZdQNpbFZPgaWLfU+iMzgdRu+3BdLRciikcukUN+rKedVmlozYmBby7Sa
         eMKKiXVmEKzwLwNcsqKt72lBtxhxX4udohcJ926HQd//RY90ZprxQ6Whmcd/NplAy5Gx
         2tNCEsHbY4PuaRwKhFiJlSNGKHA94uyrutFmcwsurdU780G53fJ8li09x0D8lge0Ru4e
         24D4fd36Mn8fQaT6tJ5x9Uzk5slx0XSQ+IMq4JNPTU79kDqJTdXWrJpg5lUEKpy3pckn
         a27Q==
X-Forwarded-Encrypted: i=1; AFNElJ+TWZpw0U2siQfQMjn2UxbwtUgvdtsfsIs/yyiCvPrYPVnicxvLT8Wl1lFNRx+MPWCyHQRQ3xIQ1dFVgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJ9Ha+U8/9uYykMNiHCfGqWtkbTdlmTQzzaUg9P1Y3odNaRMj
	V1e1sU/ybFlUoxQ/v8pRafthkeEfqtu992t3P0tjBHkqK3uqYGIW4i1g
X-Gm-Gg: AeBDievRlwiZLSURHTLYq3tGG8P1sGZapcp7uRtzH63nzW7HmeGh6oudm2T8HgIVdpu
	womD6gKZGD2KCbTeqwAfKv2cisyY82VRGUdzZq+ydub+a/kaLo1lNjA5Zqj3TZwq+tmNf39cXTv
	Xz9GEj3Oadn2S1fEt996yPS98M2Yfouj9L0giHZAAWLlhEE3bX0ShubZNpsZtoZ7DQ8kqTiJzY0
	wc4slTJEPgXNtQYxb8FzpN1yAdQp+Ib/IVFPpbyxgoJc1Cprl6GBXNWXKQjKXCpdcSn9aueXlgG
	wCxwwmKbYi5c5mLYY6XuR4gB5j3lK20o+jydBm6sO46bpZDIYk3xKMRdhCTScgO6IcewbrAQZD0
	Q0fVjdwLYzNnll/PVy0eXXOSzfE3Y0QhJTRQIuCNp6Un9VY1ceX45yJLMMd5EE2GoSMV3Th+8p6
	UhuImXwz2eCd1RZFX4WIqKpvwBgnee+sSQLSKXcIq3RsRuMZef9xAA3oYadZSKvEpsoG+IlvR3h
	qNCsEezzXjJYTZoBHtswQzdxQ==
X-Received: by 2002:a17:902:e748:b0:2b4:5d0c:7a85 with SMTP id d9443c01a7336-2b5f9dbcd42mr318493365ad.3.1777081382212;
        Fri, 24 Apr 2026 18:43:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa494e1sm235306615ad.35.2026.04.24.18.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 18:43:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: tegra: ADX: simplify probe allocation
Date: Fri, 24 Apr 2026 18:42:44 -0700
Message-ID: <20260425014244.439788-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce 3 allocations to one using a flexible array member.

Also use of_device_get_match_data. No error checking since it cannot be
NULL.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 24 ++++++++----------------
 sound/soc/tegra/tegra210_adx.h |  2 +-
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index d2f742ffc59d..3f6c068d00c8 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -676,17 +676,20 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_adx *adx;
-	const struct of_device_id *match;
-	struct tegra210_adx_soc_data *soc_data;
+	const struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
+	size_t alloc_size;
 	int err;
 
-	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
+	soc_data = of_device_get_match_data(&pdev->dev);
+	alloc_size = struct_size(adx, map, soc_data->ram_depth);
+	alloc_size += sizeof(u32) * soc_data->byte_mask_size;
+
+	adx = devm_kzalloc(dev, alloc_size, GFP_KERNEL);
 	if (!adx)
 		return -ENOMEM;
 
-	match = of_match_device(tegra210_adx_of_match, dev);
-	soc_data = (struct tegra210_adx_soc_data *)match->data;
+	adx->byte_mask = adx->map + soc_data->ram_depth;
 	adx->soc_data = soc_data;
 
 	dev_set_drvdata(dev, adx);
@@ -703,17 +706,6 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(adx->regmap, true);
 
-	adx->map = devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx->map),
-				GFP_KERNEL);
-	if (!adx->map)
-		return -ENOMEM;
-
-	adx->byte_mask = devm_kzalloc(dev,
-				      soc_data->byte_mask_size * sizeof(*adx->byte_mask),
-				      GFP_KERNEL);
-	if (!adx->byte_mask)
-		return -ENOMEM;
-
 	tegra210_adx_dais[TEGRA_ADX_IN_DAI_ID].playback.channels_max =
 			adx->soc_data->max_ch;
 
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
index 176a4e40de0a..4406a4a74496 100644
--- a/sound/soc/tegra/tegra210_adx.h
+++ b/sound/soc/tegra/tegra210_adx.h
@@ -88,9 +88,9 @@ struct tegra210_adx_soc_data {
 
 struct tegra210_adx {
 	struct regmap *regmap;
-	unsigned int *map;
 	unsigned int *byte_mask;
 	const struct tegra210_adx_soc_data *soc_data;
+	unsigned int map[];
 };
 
 #endif
-- 
2.54.0

