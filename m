Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF823F383
	for <linux-tegra@vger.kernel.org>; Sun,  2 Mar 2025 22:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740956397; cv=none; b=EA/+47g3AlZdjilIX71zma69GYLQ0Ll08CGB4BosIYxbIj0p+cHGzFqTuU09WATxcUdUVMmzQeN6NkGfsMLGrmCkKVUl/w58EVc76F9bCuL+uPoYASlRgdiM0SPLyJwAe2P9LrPTD5U3vz74u1pkxLVTd2tTj8INg4yVH/amNpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740956397; c=relaxed/simple;
	bh=8xX8lbiW+5RQ+wFxa3JghYTzhMpaR5RIrDRPY8soEFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSgQ0Y8QfZNwUdQfmtY1JP3YNJjgZK3MXYh7lA1Y7iH6K0bf6NQERXb42avZgkF7kAJ493xuF9LRRfyKkrNcLvukAEWk42Ur4CfqsO0M7xWIOUNcbx1YsBOwaImqSUStV7XOOXcqxZJOP/pjcEh+DLBIrwzikTnoOTYAgSdzflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KFCuaIPm; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KFCuaIPm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740956393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9ZqF8FngRBwwLVOgM6/1uD7/Y5CAfT801f3ud25fkUA=;
	b=KFCuaIPmd13ybDYCHp+sSPU7HHo9wt9W0jWX5EnmXe4UfJn/SSkPBGLGraL5ojTNQZ26qa
	bdwn0i3YIzCVRtG+Z3wiqQflKrGwb7H8iEOcjJkufxt/Teo1OEQY25aYqM/RfE4wSMHPjs
	245ntXw/wAV/sFegitdGvTqNRkRcd8k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sheetal <sheetal@nvidia.com>,
	Ritu Chaudhary <rituc@nvidia.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ASoC: tegra: Fix ADX S24_LE audio format
Date: Sun,  2 Mar 2025 23:59:25 +0100
Message-ID: <20250302225927.245457-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Commit 4204eccc7b2a ("ASoC: tegra: Add support for S24_LE audio format")
added support for the S24_LE audio format, but duplicated S16_LE in
OUT_DAI() for ADX instead.

Fix this by adding support for the S24_LE audio format.

Compile-tested only.

Cc: stable@vger.kernel.org
Fixes: 4204eccc7b2a ("ASoC: tegra: Add support for S24_LE audio format")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/tegra/tegra210_adx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 3e6e8f51f380..0aa93b948378 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -264,7 +264,7 @@ static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
-				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.capture = {					\
@@ -274,7 +274,7 @@ static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
-				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.ops = &tegra210_adx_out_dai_ops,		\
-- 
2.48.1

