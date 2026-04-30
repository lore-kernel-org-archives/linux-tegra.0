Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4372A3A3830
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 21:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777585343; cv=none; b=ISU0mEv3Ddibv12aq63I9IxEfGAciydWcIg1YCRub4+GnP90lTjhI68UtVpnXTmrQ+t22Sz8y86hoOBIvaaisIDMbUG9/CNWt1JwI3Y7yvWvAMgbdGRnqyRbDyKmVZATqAzbZ784y4cy1RHE+XXtIjMbfLkC9bgcy1mM0SAuNzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777585343; c=relaxed/simple;
	bh=VjuwkmWTRytJbDUFZ8FgrsM6SQXVC7FBHKMz8U+rjwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/tYdV8F6sw//UgJtfD+d3kR9fZbOKrsMt7+RZhtTAcilG09ss4wPFbX2pJXXhvKSVwmpzAvFwn44R3j+8R7ZL1ndWxeMKYSPYD3h2s4zWVY/+hoVGgwBee7ulv3JSwW2SDIg20TTuwkLkjbuMoFO5nV/CDPhZ/sjOv4YopVFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcLk+M3z; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcLk+M3z"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ec37d52c0dso144429085a.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 14:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777585341; x=1778190141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaqCe9pe6XmQZeTZUwBv7+3qnfbWH0HbjUSW3TsEOPw=;
        b=hcLk+M3z6dh8f24GUb69wfl3EBooN+OmRdyXXGIhx5mtAzftaFB0NuasmwChOZY5yM
         cgWZbxgj8dF3V5cXJlLE1qRo+vlOBugijysdU1gI5XArjyYhiFfTIux6y8L9SX4Zen4+
         LtDMCoKT6tKiiNb9WwOLp6vcVFm7mGyg/ofTcF3MQbSGfdZ9y7UL6vGNQsUiOsvEoCkH
         1izALh+fgrhST8GJ50yRCBcdwiUnuoybYclXpAMUTA+7zf0QlU1s6f8oom4DubeHLdmd
         FgaN2WLcPJdNDsC7+zBXAwNh8tSVfC8T8lvvAnpvYGXX/QnzPvghp97c3uB7rdFMnLSQ
         5wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777585341; x=1778190141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaqCe9pe6XmQZeTZUwBv7+3qnfbWH0HbjUSW3TsEOPw=;
        b=cPiL4L7BYmW3Pi/7iaEv7FuuXrh4pKL+5CyVnH82FD6KCeQRmRaBE9ffLVvtrTBXDp
         y/Z5GgaDrR44WAgCx99JE0eHBuQMbtBCIxL3MvpXOZYovyEbwJqJKpyDE2zOYntACNj0
         1ws+PW1vnFY2SgXiS9LGwQ9Puto/g858y007whxFHpDbk302ixG0OyDQiYdD88LQ2npc
         XJ80mSuBSBhqcj3uDGdPdz2Kcp936flQJP0nDIbLCnDqHoWVKByEYC26pjsMLNfnE8wJ
         /OUi2DO50FiNuMaYcPJ4ot2+mTiirfirYlxqesLQqbx5IBfjiw0i9sWZV/ztEd3LfeJE
         k8eQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CCu3a8nDuaPPZdDIQyh4dwKQ85cDhL5vYtQWesvt+TUt+A062+rTXQNeUaPFp40Rl1unIS5VyTzUOnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3Q52p1DbNImR+V+CLpGLvm9tQEKMwWuyu7ihhvrElz/BT0s3
	N0g4is9BpbBRrzg080HzZmhtoMpD3DekMVwCcG2fpvZwr79jDyGKZ6MM
X-Gm-Gg: AeBDieuuPDbruL1NTYqYlPcb4ZvuEA/byrsxLHtRvE30enafGCdEiOdHPkycgLLPa4w
	7tA+xzaoqd9lVY41zKludsleVqKMAep44SjpunxyJgD95BEv1ryoblqV/MUnvBarB1u6E29flsT
	x/foUic8Vwzd0/LOkboePKTBj3/UpfMpTb9zktaysPFjt53zmrUzPLDYPd4c6eDK8jt06OZ2Moa
	1oxfvVbddf7uXKET5sS3VhKYSYSijGIRH/yh0wGp3hk1yLrWgmV4/NoGxdCFjhEzreJxn8EI+Iv
	jBVt1LKLlsVCBIPLxERrPpoZYsfx6tZDJR/xj9RYdiVKUcX5lIDUY5sI0RAer29d8dlhk7V/dxa
	xVFaHGhsvzdvP8R5XlORxPtloIX5411Mft3PASNqNyiz4GTEdR1nE385WXNTZthIScG7ZoEWpay
	MbJoPAXFpclSgN2rmKQxHuuMqZF5LKtkSj4tI3yhoZL9r66Z341qIrX34y78zIi8isV//3GkF1X
	ad2QPOss3myKbLZF2kZk/vkPgrSE+xo58POxAngfmfo5w==
X-Received: by 2002:a05:620a:46aa:b0:8eb:92a5:5c6c with SMTP id af79cd13be357-8fa8884277cmr779003485a.33.1777585341293;
        Thu, 30 Apr 2026 14:42:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbf420e984sm24378185a.47.2026.04.30.14.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:42:20 -0700 (PDT)
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
Subject: [PATCH] ASoC: tegra: ADMAIF: allocate with a single kzalloc
Date: Thu, 30 Apr 2026 14:42:02 -0700
Message-ID: <20260430214202.58405-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Consolidate the allocations for capture_dma_data and playback_dma_data
into a single kzalloc by using a flexible array member at the end of
the tegra_admaif struct. This reduces the number of allocations from
three to one, simplifies error handling, and improves memory locality.

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

