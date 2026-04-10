Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95A33F5B4
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775851572; cv=none; b=FYCLJg2R4/LBratpTAN2A9WED2x7zfRbf+uN9uSDQDz05Cy92YSFUcttYpatevGkWePNYTaA655ceG+ZsbvyOKRCDO+APJ/EoF7blrJ6e0TjcA9stCRicbMm0G+hVG2KCa9amgGDAZoumH6NDFibzLnOK2wu8oYomLQBwyw/SXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775851572; c=relaxed/simple;
	bh=sFV7iqgieN0KFItIWqAGLhioP5P/KLL3pDQtJDeDDxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuiHSJCj5IxKCP4rbC6D5OUFc3QkMou0DJaKeMPh27Bto3eG7LlcLjRiImHoHBhCDQwL92S84qbNhZdk80ZPtxDx00IOrAzIATwul96BV5t1J3QbrWBQLKtRa6NmV5PkM8ZqvVJOEO1UDinta5qkLyfUqVutcO4Qq84z0YZ5DAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCnRZKIs; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCnRZKIs"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1735031a91.3
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775851570; x=1776456370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIKVkUWRV3tsyXN2qB9/P/46aDPpmzyvk7S8fxwfbLc=;
        b=WCnRZKIs6fAKwpK/EYaePbwuHUijJfUj8VX6P7gCRW2n9Hf3AwubjeytmKymkdSC77
         aHMrYIIfXkt68N4jP2P3otNOhkW2bAMOTFpI656BMinIgKyKIWDgYUcKBItSakPjEPRJ
         qdee/Qi/xFHG5qvn+d/m0dDLj7gUYMYU6tPf2yc2KHd0G1DNpFlY+unIWarGtxpZQbRR
         zWMjcOE1QhLp22KJ0Cw9Rgfv53cc7oTEkKA8nGCA/xvL3UwPzRlaLIfQgYQjyEoPEfeo
         9hAIf/AMTf/GXhd+mbjsaIotaqVJiO+9sEQWHsNL9E4ZgA/6QvM1tAn8IhyxgZ3xvL1R
         fW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775851570; x=1776456370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VIKVkUWRV3tsyXN2qB9/P/46aDPpmzyvk7S8fxwfbLc=;
        b=qnBNRGq8U9906n9hWnIaw0uGRMPlKpveyfTsPb8XHcMmJR/lguBBwzCGNBQtVb9q5g
         90bdyfVqgfQcnVpTYLiAKcL+xM1HTRZqsaAfy07y5rh9WapfLQHBo7y2K3gAdUZXh6xa
         7DjiqlQrwAGLEMcaddBOpkuUFDcaDT/vtnCaFPh//HjGZe53tBFlCtEBy/amM2h8EMy0
         dBksJbuhm6QWBDhnYjrBO8A8OcB+2Vyp2jH0AE5gXDjEzw3fJffDX9gm4Q4jDpJj/g5C
         V/GKEyHBnEntTEDWtp5/vGME9/YLCb3jlhVJpKFoCqJ5ae/dGUiik7nyOXPRm1qOWuAi
         sI0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6BksWTl0aCRrkcfjsA4X5aGH39+C/cDaMHchMKG7P9PqDrKwDnWsn2IwVkrBFpVk8ShXSE1yi90+p3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzITIxJkiMTLItss3GvdV/GEE19dy7tqAGNzm0/jcn/b259LMvk
	Hd2DJMB9wr2djMyb/gZ62f0dDCB9Ljbsd2+PL/BceCGsv2LEtb6UEfcXzUhkF1X8ZpE=
X-Gm-Gg: AeBDieveYIbfcAqBLYv2Itcyj5dB5F+PpTNpK62Az1PQ7AhT8+kT/LyyyydgvUmhjrG
	PpwTiXAkv19uT8pHxVpjbRqcBp4AYlXHtnFeYQVuFyAQ2SPFowOmcd5LFtkbULfBphS1W2XdgfN
	iSkfRt2Y1R+XWRjabMSwSrzCQqJ7Qz2x0T+1itshzav0W+fD8c4O2oQW5TMEHiLYTmqGZ7kZZRP
	Bk5h4DFvpDI614HJ9gkOK0Id7olhuF8iU48M9M8+3sJOXDoEEGVtPsxICkVqPMcfFPvuI8zYUvd
	jUwFuSSM+z4JbpKAhxPCoETKEmc4iU5l7XD0FfExub6GxX1wZ7ad5UFu/GOdD7YJ2UHamdCEH9r
	TQKMykYkjYGA3lmHBZ2TOhdBPhaxFIqbHdesbkt01JY4p6dcnDfeL6LJTqu1v+H9hyz1BQLT6b3
	sjHmJvnRqrFz86T5qq/7wsLeOL2KkF/razEzCt5eXIw7TLyY9gk3BEmG5jTyx7Egd0jZRhy2pUt
	SiiFbnBr4o7nEXM+VJSA+nwJ+jy0tsolWR9jKRC
X-Received: by 2002:a17:903:2783:b0:2b2:539b:d2b1 with SMTP id d9443c01a7336-2b2d596537amr31136705ad.16.1775851569863;
        Fri, 10 Apr 2026 13:06:09 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:a107:5c92:b303:910a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dabc08sm39569975ad.5.2026.04.10.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 13:06:09 -0700 (PDT)
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
Subject: [PATCH v3 1/2] ASoC: tegra210_adx: simplify byte map get/put logic
Date: Sat, 11 Apr 2026 01:35:22 +0530
Message-ID: <20260410200530.171323-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410200530.171323-1-piyushpatle228@gmail.com>
References: <20260410200530.171323-1-piyushpatle228@gmail.com>
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
hardware layout.

The byte_mask buffer is allocated in probe() using devm_kcalloc()
with soc_data->byte_mask_size, so it scales to any SoC variant
without depending on chip-specific constants. It is zeroed and
recomputed each time write_map_ram() is called.

A new TEGRA_ADX_SLOTS_PER_WORD constant replaces the literal '4'
used for byte slots per RAM word, and BITS_PER_BYTE /
BITS_PER_TYPE() from <linux/bits.h> replace the literal '8' and
'32' shifts.

Slots are initialised to 256 in probe() so the default reported
value stays "disabled", matching previous behaviour. Values written
from userspace that fall outside [0, 255] are clamped to 256
("disabled") exactly as before -- no userspace-visible change.

As a side effect this also fixes a latent bug in the previous
put_byte_map(): because it compared the enable mask rather than the
stored byte, changing a slot from one enabled value to another
enabled value (e.g. 42 -> 99) would early-return without persisting
the new value, and the next CFG_RAM flush would still program the
old byte. The new implementation compares the stored value itself,
so this case is now handled correctly.

Addresses TODO left in tegra210_adx_get_byte_map().

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes since v2:
 - Move byte_mask allocation back to probe() with devm_kcalloc()
   using soc_data->byte_mask_size; revert write_map_ram() to void
   and runtime_resume() to returning 0. Suggested by Jon Hunter.
 - Fix bits_per_mask: use BITS_PER_TYPE(*adx->byte_mask) instead of
   the incorrect BITS_PER_TYPE(*adx->map) * BITS_PER_BYTE. Reported
   by Mark Brown.
 - Drop <linux/slab.h> include (no longer needed without kfree).

Changes since v1:
 - Use dynamic sizing via soc_data->byte_mask_size instead of
   chip-specific constants. Suggested by Sheetal.
 - Replace magic numbers with TEGRA_ADX_SLOTS_PER_WORD and use
   BITS_PER_BYTE / BITS_PER_TYPE(). Suggested by Sheetal.
 - Add <linux/bits.h> include.

 sound/soc/tegra/tegra210_adx.c | 85 ++++++++++++++++++----------------
 sound/soc/tegra/tegra210_adx.h |  5 +-
 2 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 95875c75ddf8..1d25e490879e 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -4,6 +4,7 @@
 //
 // tegra210_adx.c - Tegra210 ADX driver
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -47,18 +48,36 @@ static const struct reg_default tegra264_adx_reg_defaults[] = {
 
 static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
 {
+	const unsigned int bits_per_mask = BITS_PER_TYPE(*adx->byte_mask);
 	int i;
 
+	memset(adx->byte_mask, 0,
+	       adx->soc_data->byte_mask_size * sizeof(*adx->byte_mask));
+
 	regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_CTRL +
 			adx->soc_data->cya_offset,
 		     TEGRA210_ADX_CFG_RAM_CTRL_SEQ_ACCESS_EN |
 		     TEGRA210_ADX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_ADX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < adx->soc_data->ram_depth; i++)
+	for (i = 0; i < adx->soc_data->ram_depth; i++) {
+		u32 word = 0;
+		int b;
+
+		for (b = 0; b < TEGRA_ADX_SLOTS_PER_WORD; b++) {
+			unsigned int slot = i * TEGRA_ADX_SLOTS_PER_WORD + b;
+			u16 val = adx->map[slot];
+
+			if (val >= 256)
+				continue;
+
+			word |= (u32)val << (b * BITS_PER_BYTE);
+			adx->byte_mask[slot / bits_per_mask] |=
+				1U << (slot % bits_per_mask);
+		}
 		regmap_write(adx->regmap, TEGRA210_ADX_CFG_RAM_DATA +
-				adx->soc_data->cya_offset,
-			     adx->map[i]);
+				adx->soc_data->cya_offset, word);
+	}
 
 	for (i = 0; i < adx->soc_data->byte_mask_size; i++)
 		regmap_write(adx->regmap,
@@ -188,27 +207,10 @@ static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_adx *adx = snd_soc_component_get_drvdata(cmpnt);
-	struct soc_mixer_control *mc;
-	unsigned char *bytes_map = (unsigned char *)adx->map;
-	int enabled;
-
-	mc = (struct soc_mixer_control *)kcontrol->private_value;
-	enabled = adx->byte_mask[mc->reg / 32] & (1 << (mc->reg % 32));
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
 
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
@@ -218,23 +220,22 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
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
@@ -675,7 +676,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
-	int err;
+	int err, i;
 
 	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
 	if (!adx)
@@ -700,17 +701,21 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(adx->regmap, true);
 
-	adx->map = devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx->map),
-				GFP_KERNEL);
+	adx->map = devm_kcalloc(dev,
+				soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WORD,
+				sizeof(*adx->map), GFP_KERNEL);
 	if (!adx->map)
 		return -ENOMEM;
 
-	adx->byte_mask = devm_kzalloc(dev,
-				      soc_data->byte_mask_size * sizeof(*adx->byte_mask),
-				      GFP_KERNEL);
+	adx->byte_mask = devm_kcalloc(dev, soc_data->byte_mask_size,
+				      sizeof(*adx->byte_mask), GFP_KERNEL);
 	if (!adx->byte_mask)
 		return -ENOMEM;
 
+	/* Initialise all byte map slots as disabled (value 256). */
+	for (i = 0; i < soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WORD; i++)
+		adx->map[i] = 256;
+
 	tegra210_adx_dais[TEGRA_ADX_IN_DAI_ID].playback.channels_max =
 			adx->soc_data->max_ch;
 
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
index 176a4e40de0a..a6298c3dcca5 100644
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
@@ -61,6 +63,7 @@
 #define TEGRA210_ADX_SOFT_RESET_SOFT_DEFAULT		(0 << TEGRA210_ADX_SOFT_RESET_SOFT_RESET_SHIFT)
 
 #define TEGRA210_ADX_AUDIOCIF_CH_STRIDE		4
+#define TEGRA_ADX_SLOTS_PER_WORD		4
 #define TEGRA210_ADX_RAM_DEPTH			16
 #define TEGRA210_ADX_MAP_STREAM_NUMBER_SHIFT	6
 #define TEGRA210_ADX_MAP_WORD_NUMBER_SHIFT	2
@@ -88,8 +91,8 @@ struct tegra210_adx_soc_data {
 
 struct tegra210_adx {
 	struct regmap *regmap;
-	unsigned int *map;
 	unsigned int *byte_mask;
+	u16 *map;
 	const struct tegra210_adx_soc_data *soc_data;
 };
 
-- 
2.43.0

