Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EDC3CBE63
	for <linux-tegra@vger.kernel.org>; Tue,  7 Apr 2026 17:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581413; cv=none; b=MNIBN8AWRlb9sqJYPmxXxhLttSgBjncsB3t/d1ENDxv2jVhagA9WE9XqZi32VxqpeoavcqJHWFI0qONyw7jz/V+aY4KxSXyMszJ4zPgRwB/rjQB2t+V0JYJ5/Jmomz8Io923vD+u4su6mwEfx1c6Y/LbpW8P6tyHK7ngVBpl9sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581413; c=relaxed/simple;
	bh=O4uHzkKNl3IGefNGYCIuKpLs23GHSxTNT7OQCSZWAb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o1gZDMV5V00Z0Y8JsZpFj9zA3R2XwM0Q+DmjiWoVYC3nPFosRcoIrvEjfxGCI0q4+AHpioRXnW/qV35tgT6OHosOCOMwzyJEQVNOYKUsfOnfwsLUZNl75VHlnYHcg83OHxjNx1CKELI+JVsm0RekEBpIdGqSuzPeAg8sYbWKQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwGTc+No; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwGTc+No"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b299b3c739so10970655ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 07 Apr 2026 10:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775581411; x=1776186211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZoeSKMzor941OtTI2XswOre9sDwC8ZQogmJadnwKsI=;
        b=fwGTc+NoQzs7CC/0HsmFHA2t1fWwpmdRHuWZ41u+LDvPAEkRC51wI2OiNQ8kTsM5FV
         r7jonuR+8Xc5B+YyoFkbOxC9qXW/z8bhYXD7vnYNBd9eTpIvLcTVbiQ6nliT1rEfNTwb
         sUiRJXKvrAEA9Z6bGEfosa/qc/FvpTbDFKKxT73pnA29ZdCQb4ckDIzDtPyONcTFsGU1
         kXaHN+GB7C666e/avzv8mTBCz3jeRGrMfBnfIjK/IxHe52diXz+R4OjRYnJvxgsYzudG
         DCxSk80oi9Z3BsG6AOO3101JQDm1LpmV7sV23mSaHgFR2ax0t2ZEkqt8Kx8DrYDIOxZp
         QeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775581411; x=1776186211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZoeSKMzor941OtTI2XswOre9sDwC8ZQogmJadnwKsI=;
        b=GXhRED+99NkeAeQ72yCWSQYTTBnz0Aoc1IYRusoSfcwIsg3BRirIOdaMIFMnE0E7Zs
         hfKDgNcLcmnMYNFJ6cBKPl/eiRlBDid8BpE/mS4HyisE1o27KKCJTPXnNwYZzXkzY+82
         //YGov9Gs9Q/rOEnPDMWF3nB7YnoRuZX4K8+soGRBOgHcMtBITcCttDPmr6NYQyTDMJ0
         G+jPnNk8ZrxFxC9qs99VWHjR4SliWRLXG5ECEY6vygNkWBfDnGo3xjG9p7dn9w8N5cNB
         kf1herxlm0m6FGV6ujcLqCbfmQB54RbUxpnVZCSXwdhX84rbk2mINb8ecQUuCK1oVmV9
         hWtA==
X-Forwarded-Encrypted: i=1; AJvYcCWS+lYE5icVR+pmcTr3d4zd4YmrjEXPsI7oj+9t3dUek722tJdQZ269RZi0l8mJcFSN+Gh5PUtJ4v1KRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqG5TYKf0hqbLXdh8D8fEUbw8LOB61lbSGxPyGibhiHWE+AIUm
	l1H+4ayZlzn0FG+gxDLbhKWklaJugfO+td9BWo2gGtr4mz8H2GgRab2C
X-Gm-Gg: AeBDietlYXKRjzSdTlVVhjRdKYPvn16R9zqJ18Wf6t39coagA/So2gv5lIirGJLnWqj
	IdUu24fDN6EOlLpLdhaJn+j+z23XnQyEr54b6Yo3CCYqHH7GMljhzCu7mOqZFOIwP4WEEZatjIE
	RwuP3zhpW2xHZINjjOtIfafJ0sRpxasYKYkeBVwfh3fzuWe89cXNTiv4exbKRN8aWz8Omy3nwk7
	8baRTsLyZOLyuEdCYKvPgCDLthShzv/utFp53gHJAhOjld8civRFo3o9OHdU/r/+AanqDJcgVwz
	C9whZPaqzvdGAGrthK8NMMvCjeazEetax48EX59Jz/tvT69J8erPwW8Fev2Fa4XZGzX4+rfGXer
	5QI9JIJC1UBLgl1xeJikny7AjUMK5CvFjx1BDdiihXIrPXsuGtjsGMp7hVa5PN2DXXHQ60gbqQ3
	zRz1D/ecpjXyERH33+VwASmQXjMSIfTgGckjnrnyn+OO4Fyz3xCN5IEWETsSvdCuahJYAsuwhIt
	iUJNFRQv8ctX2ZN8FTthqOb2nEBrUjT0s2lLDKx6nI/qTz3xmISVNwK9w==
X-Received: by 2002:a17:903:32cd:b0:2b2:4697:78f5 with SMTP id d9443c01a7336-2b281798164mr173228185ad.36.1775581411233;
        Tue, 07 Apr 2026 10:03:31 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm196617905ad.29.2026.04.07.10.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 10:03:30 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: tegra210_adx: simplify byte map get/put logic
Date: Tue,  7 Apr 2026 22:33:07 +0530
Message-Id: <20260407170308.100238-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407170308.100238-1-piyushpatle228@gmail.com>
References: <20260407170308.100238-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The byte-map controls ("Byte Map N") already expose a value range of
[0, 256] to userspace via SOC_SINGLE_EXT(), where 256 is the
"disabled" sentinel. The driver stored this state as a byte-packed
u32 map[] array plus a separate byte_mask[] bitmap tracking which
slots were enabled, because 256 does not fit in a byte. As a result
get_byte_map() had to consult byte_mask[] to decide whether to
report the stored byte or 256, and put_byte_map() had to keep the
two arrays in sync on every write.

Store each slot as a u16 holding the control value directly
(0..255 enabled, 256 disabled). This is the native representation
for what userspace already sees, so get_byte_map() becomes a direct
return and put_byte_map() becomes a compare-and-store. The
hardware-facing packed RAM word and the IN_BYTE_EN mask are now
derived on the fly inside tegra210_adx_write_map_ram() from the
slot array, which is the only place that needs to know about the
hardware layout. This also lets us drop the byte_mask field from
struct tegra210_adx.

Slots are initialised to 256 in probe() so the default reported
value stays "disabled", matching previous behaviour. Values written
from userspace that fall outside [0, 255] are clamped to 256
("disabled") exactly as before -- no userspace-visible change.

As a side effect this also fixes a latent bug in the previous
put_byte_map(): because it compared the enable mask rather than the
stored byte, changing a slot from one enabled value to another
enabled value (e.g. 42 -> 99) would early-return without persisting
the new value.

Also fix a potential undefined behavior when constructing the packed
RAM word by ensuring the shift operates on a u32 value.

Addresses TODO left in tegra210_adx_get_byte_map().

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c | 80 ++++++++++++++++------------------
 sound/soc/tegra/tegra210_adx.h |  5 ++-
 2 files changed, 40 insertions(+), 45 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 95875c75ddf8..67948459e884 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -47,6 +47,7 @@ static const struct reg_default tegra264_adx_reg_defaults[] = {
 
 static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
 {
+	unsigned int byte_mask[TEGRA264_ADX_BYTE_MASK_COUNT] = { 0 };
 	int i;
 
 	regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_CTRL +
@@ -55,15 +56,28 @@ static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
 		     TEGRA210_ADX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_ADX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < adx->soc_data->ram_depth; i++)
+	for (i = 0; i < adx->soc_data->ram_depth; i++) {
+		u32 word = 0;
+		int b;
+
+		for (b = 0; b < 4; b++) {
+			unsigned int slot = i * 4 + b;
+			u16 val = adx->map[slot];
+
+			if (val >= 256)
+				continue;
+
+			word |= (u32)val << (b * 8);
+			byte_mask[slot / 32] |= 1U << (slot % 32);
+		}
 		regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_DATA +
-				adx->soc_data->cya_offset,
-			     adx->map[i]);
+				adx->soc_data->cya_offset, word);
+	}
 
 	for (i = 0; i < adx->soc_data->byte_mask_size; i++)
 		regmap_write(adx->regmap,
 			     TEGRA210_ADX_IN_BYTE_EN0 + (i * TEGRA210_ADX_AUDIOCIF_CH_STRIDE),
-			     adx->byte_mask[i]);
+			     byte_mask[i]);
 }
 
 static int tegra210_adx_startup(struct snd_pcm_substream *substream,
@@ -188,27 +202,10 @@ static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
-	struct soc_mixer_control *mc;
-	unsigned char *bytes_map = (unsigned char *)adx->map;
-	int enabled;
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
 
-	mc = (struct soc_mixer_control *)kcontrol->private_value;
-	enabled = adx->byte_mask[mc->reg / 32] & (1 << (mc->reg % 32));
-
-	/*
-	 * TODO: Simplify this logic to just return from bytes_map[]
-	 *
-	 * Presently below is required since bytes_map[] is
-	 * tightly packed and cannot store the control value of 256.
-	 * Byte mask state is used to know if 256 needs to be returned.
-	 * Note that for control value of 256, the put() call stores 0
-	 * in the bytes_map[] and disables the corresponding bit in
-	 * byte_mask[].
-	 */
-	if (enabled)
-		ucontrol->value.integer.value[0] = bytes_map[mc->reg];
-	else
-		ucontrol->value.integer.value[0] = 256;
+	ucontrol->value.integer.value[0] = adx->map[mc->reg];
 
 	return 0;
 }
@@ -218,23 +215,22 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)adx->map;
-	int value = ucontrol->value.integer.value[0];
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	unsigned int mask_val = adx->byte_mask[mc->reg / 32];
+	unsigned int value = ucontrol->value.integer.value[0];
 
-	if (value >= 0 && value <= 255)
-		mask_val |= (1 << (mc->reg % 32));
-	else
-		mask_val &= ~(1 << (mc->reg % 32));
+	/*
+	 * Match the previous behaviour: any value outside [0, 255] is
+	 * treated as the "disabled" sentinel (256). Negative values from
+	 * userspace fold in through the unsigned cast and are caught here.
+	 */
+	if (value > 255)
+		value = 256;
 
-	if (mask_val == adx->byte_mask[mc->reg / 32])
+	if (adx->map[mc->reg] == value)
 		return 0;
 
-	/* Update byte map and slot */
-	bytes_map[mc->reg] = value % 256;
-	adx->byte_mask[mc->reg / 32] = mask_val;
+	adx->map[mc->reg] = value;
 
 	return 1;
 }
@@ -675,7 +671,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
-	int err;
+	int err, i;
 
 	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
 	if (!adx)
@@ -700,16 +696,14 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(adx->regmap, true);
 
-	adx->map = devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx->map),
-				GFP_KERNEL);
+	adx->map = devm_kcalloc(dev, soc_data->ram_depth * 4,
+				sizeof(*adx->map), GFP_KERNEL);
 	if (!adx->map)
 		return -ENOMEM;
 
-	adx->byte_mask = devm_kzalloc(dev,
-				      soc_data->byte_mask_size * sizeof(*adx->byte_mask),
-				      GFP_KERNEL);
-	if (!adx->byte_mask)
-		return -ENOMEM;
+	/* Initialize all byte map slots as disabled (value 256). */
+	for (i = 0; i < soc_data->ram_depth * 4; i++)
+		adx->map[i] = 256;
 
 	tegra210_adx_dais[TEGRA_ADX_IN_DAI_ID].playback.channels_max =
 			adx->soc_data->max_ch;
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
index 176a4e40de0a..afe95e45458f 100644
--- a/sound/soc/tegra/tegra210_adx.h
+++ b/sound/soc/tegra/tegra210_adx.h
@@ -8,6 +8,8 @@
 #ifndef __TEGRA210_ADX_H__
 #define __TEGRA210_ADX_H__
 
+#include <linux/types.h>
+
 /* Register offsets from TEGRA210_ADX*_BASE */
 #define TEGRA210_ADX_RX_STATUS		0x0c
 #define TEGRA210_ADX_RX_INT_STATUS	0x10
@@ -88,8 +90,7 @@ struct tegra210_adx_soc_data {
 
 struct tegra210_adx {
 	struct regmap *regmap;
-	unsigned int *map;
-	unsigned int *byte_mask;
+	u16 *map;
 	const struct tegra210_adx_soc_data *soc_data;
 };
 
-- 
2.34.1

