Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACB495E5
	for <linux-tegra@vger.kernel.org>; Sun,  3 May 2026 00:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777768253; cv=none; b=og0qpciabvP8YdNe0MSDg5RoasCl++HPrv5qEeSnZAiH0ps5/r7iujgqFBm6TEOpI7mFqZWUpoNfh1tvN4PGnadxiGHCqkeKRURERhGChI4YTPHsKyF/gBDqX/UUxis1vKRllcGxdth/WZjfGfo7/xscc8cRyOCPCQXZl7fSFog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777768253; c=relaxed/simple;
	bh=N4Oewy83+Tf/MQeuvG7fpzvA1Aszha9anFzqTZugG0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQE39V7gDOtoEq2atsA0EoHFJB9feHhmgOGOFYyDp9YABkonh4kdK1sXlrfdIf8lyPGnwUl3aaiUfz1H60G7TS4/fLk5z8AtKfNSGn5OBhoE/AO7L4rIhl+RxAJoAzOkgL0l5Sw5UtAJl5gp4RS4e2EH6VSnNGyu73YUYY0rTHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPjCbDfq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPjCbDfq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso104506b3a.0
        for <linux-tegra@vger.kernel.org>; Sat, 02 May 2026 17:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777768252; x=1778373052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cqtN6UxMZDT/bmefPZMzQI/MaSXcFcM6J1zz/t6mH8=;
        b=hPjCbDfqOIYxyAYnFs5HLlGwKMxVf5NDKQTQt29hcQc9/JY9AKo86YOSG3SD2eTuiS
         oqMgwiLlookbhcBR1UEja0SUwEkE4BYlbco2Pf02rF1zpsPMlp0vC4rEh69dRvzsZwH5
         KsS1VEXKYPOBEdH++9ukyselT3Lkfav5ktXq398EIxlELnjv61JK67wA4iFQhYgT84AQ
         LFyQdoqpJUq9G5TGXY3u3pgpm/y6YURmLdkXPKNt89w9KLa4W5x2D0Lr5B5b3H3duv6t
         u3Y4trT/kta3Iiu4BDzYxXTWmqFsdoQnqiILx6AzsGBoWQBe1Kjjj2TgouBtNZh82syw
         GM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777768252; x=1778373052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cqtN6UxMZDT/bmefPZMzQI/MaSXcFcM6J1zz/t6mH8=;
        b=PGhqN4PdOCqyv1AEkc0yABFqdkaoU8aiJPAsCe8ltx7zhG0IKIJezFkGP0adwdttc6
         0vn+CZv+bUSSv0MGadV3Al6/CVQztDeiosQTnhnjLn7wJpRDiSu5x/xOkTL8q5J2gcTo
         qP9x1Fs6GLVNeXE/XeceywE3yavSL4VaMmKnMW6+8KniRbeFZbYTETOERN+dyrrGPUgK
         5IuWtVIfbY71VqVQ8NWj15L5JB94H0CzE0r2SALFiNP+cDTFeBtEOdnrlZ28UUnCMOl0
         WtFE8fNXrKNhiB1SbSwACc/J5cobdzlxQWmhNX5ayYW76MrhuJxIywUb38g5tfsLdb9B
         Cm/A==
X-Forwarded-Encrypted: i=1; AFNElJ9l3qobutbNggnYTHu7HVU9L+cTkFYtc7paqbQIBIpO1dEf56Jpq5HW2OpF09ENFeIIVzjFquglxqZDbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ZVuT5cU0wTvX/mkhinuvMI07FsiO+8q68dInkTqo+h9wtDID
	yTPKUpsKEdw//Ac56T8iA7duGnJmUm6F9WKFXMXtywcl57VQZNBISdRwXQV6xA==
X-Gm-Gg: AeBDietmjDFu9Q29VPj8jvU0j/xPYcDxYeLJxpYFP4VAJ1XjQU9ZDKkY137++EkAtKm
	tUXih0CVAiT83LMAVRXpGeSgrBl+a1BM4Fu4hDDIVQ7kO+3b53tWr9TqHYiHHdGy4a/78Tlq9GX
	djPNSwysYY+59o962J6RLgC0J4D4ptwl1B4wfRGmGRqcKpFJ3S+zIcj/6aHj8l13mxC93/ahzGv
	eh8zxQgUhr0SXu2VkuiDj0AAuiyqsdjD5ojy89FZYgEGzJg3qi1wDYsYnlALEU2OudW94CugHCb
	sS+GgIsAScWS5KYloYeIgJI27PvVwOWvmwg9jm5ZLklU5XzqrCROqyqRunbmsT934f/7uaqfH3S
	t6LqVYyyjpoJJyRaadEcp5w6MBmeaFqXDncyaFdHoikQsmG+bGuok3X1/LBJRrtxh0M2phZGPoN
	d9l+SPrSA0YGDTKaG+WOOdmSsPxmuyvoIwov18yPBMHojU2LwKDMhbOnagf11en0S3fdut3lEEN
	JOWTzLNXb15cK9HTR/91OjuKCEgrQz38WTRzDmKpWJ5IA==
X-Received: by 2002:a05:6a00:299a:b0:822:69b2:7ed0 with SMTP id d2e1a72fcca58-8352c3b0cc7mr3848193b3a.6.1777768251973;
        Sat, 02 May 2026 17:30:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835293f022asm4086305b3a.45.2026.05.02.17.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 17:30:51 -0700 (PDT)
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
Subject: [PATCHv2] ASoC: tegra: ADMAIF: allocate with a single kzalloc
Date: Sat,  2 May 2026 17:30:37 -0700
Message-ID: <20260503003037.11942-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate the allocations for capture_dma_data and playback_dma_data
into a single kzalloc by using a flexible array member at the end of
the tegra_admaif struct. This reduces the number of allocations from
three to one, simplifies error handling, and improves memory locality.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: place description in the proper place.
 sound/soc/tegra/tegra210_admaif.c | 28 ++++++++++------------------
 sound/soc/tegra/tegra210_admaif.h |  2 +-
 sound/soc/tegra/tegra_isomgr_bw.c |  1 +
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index a1c2757a3932..7299c6bfcf15 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "tegra_isomgr_bw.h"
@@ -912,35 +913,26 @@ MODULE_DEVICE_TABLE(of, tegra_admaif_of_match);
 
 static int tegra_admaif_probe(struct platform_device *pdev)
 {
+	const struct tegra_admaif_soc_data *soc_data;
 	struct tegra_admaif *admaif;
 	void __iomem *regs;
 	struct resource *res;
+	size_t alloc_size;
 	int err, i;
 
-	admaif = devm_kzalloc(&pdev->dev, sizeof(*admaif), GFP_KERNEL);
+	soc_data = of_device_get_match_data(&pdev->dev);
+
+	alloc_size = struct_size(admaif, capture_dma_data, soc_data->num_ch);
+	alloc_size += sizeof(*admaif->playback_dma_data) * soc_data->num_ch;
+	admaif = devm_kzalloc(&pdev->dev, alloc_size, GFP_KERNEL);
 	if (!admaif)
 		return -ENOMEM;
 
-	admaif->soc_data = of_device_get_match_data(&pdev->dev);
+	admaif->playback_dma_data = admaif->capture_dma_data + soc_data->num_ch;
+	admaif->soc_data = soc_data;
 
 	dev_set_drvdata(&pdev->dev, admaif);
 
-	admaif->capture_dma_data =
-		devm_kcalloc(&pdev->dev,
-			     admaif->soc_data->num_ch,
-			     sizeof(struct snd_dmaengine_dai_dma_data),
-			     GFP_KERNEL);
-	if (!admaif->capture_dma_data)
-		return -ENOMEM;
-
-	admaif->playback_dma_data =
-		devm_kcalloc(&pdev->dev,
-			     admaif->soc_data->num_ch,
-			     sizeof(struct snd_dmaengine_dai_dma_data),
-			     GFP_KERNEL);
-	if (!admaif->playback_dma_data)
-		return -ENOMEM;
-
 	for (i = 0; i < ADMAIF_PATHS; i++) {
 		admaif->mono_to_stereo[i] =
 			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
diff --git a/sound/soc/tegra/tegra210_admaif.h b/sound/soc/tegra/tegra210_admaif.h
index 304d45c76a9a..fd9877aa95d3 100644
--- a/sound/soc/tegra/tegra210_admaif.h
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -229,13 +229,13 @@ struct tegra_admaif_soc_data {
 };
 
 struct tegra_admaif {
-	struct snd_dmaengine_dai_dma_data *capture_dma_data;
 	struct snd_dmaengine_dai_dma_data *playback_dma_data;
 	const struct tegra_admaif_soc_data *soc_data;
 	unsigned int *mono_to_stereo[ADMAIF_PATHS];
 	unsigned int *stereo_to_mono[ADMAIF_PATHS];
 	struct regmap *regmap;
 	struct tegra_adma_isomgr *adma_isomgr;
+	struct snd_dmaengine_dai_dma_data capture_dma_data[];
 };
 
 #endif
diff --git a/sound/soc/tegra/tegra_isomgr_bw.c b/sound/soc/tegra/tegra_isomgr_bw.c
index fa979960bc09..c0f300fb3d38 100644
--- a/sound/soc/tegra/tegra_isomgr_bw.c
+++ b/sound/soc/tegra/tegra_isomgr_bw.c
@@ -6,6 +6,7 @@
 
 #include <linux/interconnect.h>
 #include <linux/module.h>
+#include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "tegra_isomgr_bw.h"
-- 
2.54.0

