Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B283D411A
	for <linux-tegra@vger.kernel.org>; Wed,  8 Apr 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668120; cv=none; b=APAjbpcs1dTO6ZCLgepQ4pkaYV3SH4ZzK3ZPFVWk56yKEHj8FBBS/YMDBWGPLKEM+oXU5X3gFTsPc314KqwNlOmA/r4IX0w/TWZTiB+MMJdfqKkF8dE2KsONFIjJadPp/ko+OkDFZZAt3XxqmlvoUa2zImUXb5E6hBxsZtHJepk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668120; c=relaxed/simple;
	bh=YZg75ezqJIP+f+P7cP0wDeFjr2y4+3ycZAwHZbKERNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dES1miYVo4dNg4J/fU3s8TmzFC60fQmduAt5hG0zJr+fNXHSJwkjlk+HugThZfMW/pDaHmac0EY5jOo2VCpw5tog8G3WSgzuZahW1wefiNc2PtpOowHOQ15mT2jLbt6fePBWubfpJmz1TfrGoZgpTEpTz9ISUqck0JdIJBtb2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3n9uX2l; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3n9uX2l"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cec955160so28871b3a.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2026 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775668117; x=1776272917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM4n0gqKs7WW6dxpr3AefN9VBR+orpZRM4Lpqp05uEE=;
        b=f3n9uX2l7Ly34I3YONmVugZtmUDhZ66OuRtD9SGfYKAueZrGrCDJBBfjBOS2JouI1I
         jfKEEjvSh4P4KOb+HoMDXXSNZ50KLk3fEWBg8SPftHWyzdd6tJYYuQN3jsSBCO8BqHhW
         8ZZGyHgv0uDXeun12opL0/WSV1orFqMfWR+Q/79gtQrDwXwMeTtCuKCa/I+gI35d0dET
         Pi5BbmdZ2X6AZ/aHEbO2oG6LTs1hwXr7oF3rdPqIG/N5fkB0kPYoq4oHzRfCdnPCZ03X
         MQNYVXaVoC6VR5Em/NL3sZbWNpTok3MISa+MCLNEpxvLLulRwHvwroFiCLKU2Jrv0haw
         BoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668117; x=1776272917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QM4n0gqKs7WW6dxpr3AefN9VBR+orpZRM4Lpqp05uEE=;
        b=PQ1ZGuedbBODRNz/DuF/DoMFxZMMXB2mZUb6LwXU77u00sj8K633Py5TyBCL4ChGbQ
         Ymh9iviIjAeS3xOipv4b4SjQIn9RTps7u3b+h1lu1ykindezOyBwtidH4SsYqV9OWBWn
         sWFiX11/+Rk120OIEIKR0H97DaBZ1RHPzWIcxvXIXqGlTXFOToXLqgJ19m+iLazaP6os
         vagPq9lXRZnpow1UltdYElTO+/n/Uwe1xO2QanBgFZj2EZZwvI02mVRbDEPhoVOfULJl
         aRbOBl0R3djVsz6jGcjY4SrFgskC2CY5+KvsVrj7TXBG8Ut4vBojtpHfHg9jb9qZRPnz
         5JQg==
X-Forwarded-Encrypted: i=1; AJvYcCVuYvWuLa/yW50KQ9K6U2piS3/cxHC3pC8z3qJiaynSRjwWxT21FcsHgirdgdbft+AxgPtsfDDA7icWJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIxPl0lL5h+UsFtwS7vNRvMWtLdfsQ9KTkcE1K7bE+Arecxaqo
	bnwj4HV9lBD5pdFr2rHpv1nh7GffSrDTYy1IzOIl4a19uSxif1WcF8TF
X-Gm-Gg: AeBDiesEN+SjeD1q2JAmT/JA55vKpcn0yYrWCH+XDgtVR+VR90InvoQB4ET6h65+aac
	gfPMalqWSOG1yF4NWncpyKJ38jTF8VHf0R4IpG93CJ9sMD0HYqC3ORdFVv76l77hJpt5Yyvj4AX
	2z/zPPp7BWodtcZ70JcK3IzJNvdoAQ8EVffe1xw9Np9kILArOiqI8265ba0f7Rrjdt6vS2iCeow
	UmIbo87xHCobegEGzXNXkjScDOV8NJ/UNpnEYQGUozwP7Q3UdUGS3BiN5bLhkXC2g84IwbIpi/R
	/OjChUbf71+7AmhQ46Q7Dos3AAh8uc17ZshpYaN4DkFs64ab2pKBJLZOY+ZcUCvc/n2K1t7hM9E
	OtLjivGEInMi8hRrzVE3wTdwCyeJScRw1Pz+A7rH+O6KNyhPKjyTkoFy+d1ff3ceRClh90OERYs
	mZ4f/fDoRl5igK3MaYYVYffFa4vXhprAgL28PvZL2LHmkNpKu9Iy3gp5vQwx0Sa0xqeLz/j6U9R
	OFf8Vn0sThIxXxwYEGw13O5+mTQiYRg5FyTZHQH6ko2EqJCkR9boudcKw==
X-Received: by 2002:a05:6a00:2351:b0:823:1252:9428 with SMTP id d2e1a72fcca58-82dd8992eb1mr330936b3a.9.1775668116584;
        Wed, 08 Apr 2026 10:08:36 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b2694csm21775091b3a.2.2026.04.08.10.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:08:36 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: tegra210_adx: simplify byte map get/put logic
Date: Wed,  8 Apr 2026 22:38:17 +0530
Message-Id: <20260408170818.70322-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408170818.70322-1-piyushpatle228@gmail.com>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com>
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

The byte_mask scratch buffer is allocated dynamically using
kcalloc() based on soc_data->byte_mask_size, removing dependency
on SoC-specific constants. The byte_mask field is dropped from
struct tegra210_adx.

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
Changes since v1:
 - Allocate byte_mask[] dynamically using kcalloc()
 - Propagate -ENOMEM from write_map_ram()
 - Replace magic numbers with TEGRA_ADX_SLOTS_PER_WORD
 - Use BITS_PER_BYTE and BITS_PER_TYPE()
 - Add <linux/bits.h> and <linux/slab.h>

 sound/soc/tegra/tegra210_adx.c | 99 ++++++++++++++++++----------------
 sound/soc/tegra/tegra210_adx.h |  6 ++-
 2 files changed, 56 insertions(+), 49 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 95875c75ddf8..2a2f7e9e90ca 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -4,6 +4,7 @@
 //
 // tegra210_adx.c - Tegra210 ADX driver
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -13,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -45,25 +47,49 @@ static const struct reg_default tegra264_adx_reg_defaults[] = {
 	{ TEGRA264_ADX_CFG_RAM_CTRL, 0x00004000},
 };
 
-static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
+static int tegra210_adx_write_map_ram(struct tegra210_adx *adx)
 {
+	const unsigned int bits_per_mask = BITS_PER_TYPE(*adx->map) * BITS_PER_BYTE;
+	unsigned int *byte_mask;
 	int i;
 
+	byte_mask = kcalloc(adx->soc_data->byte_mask_size, sizeof(*byte_mask),
+			    GFP_KERNEL);
+	if (!byte_mask)
+		return -ENOMEM;
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
+			byte_mask[slot / bits_per_mask] |= 1U << (slot % bits_per_mask);
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
+
+	kfree(byte_mask);
+
+	return 0;
 }
 
 static int tegra210_adx_startup(struct snd_pcm_substream *substream,
@@ -118,9 +144,7 @@ static int tegra210_adx_runtime_resume(struct device *dev)
 	regcache_cache_only(adx->regmap, false);
 	regcache_sync(adx->regmap);
 
-	tegra210_adx_write_map_ram(adx);
-
-	return 0;
+	return tegra210_adx_write_map_ram(adx);
 }
 
 static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
@@ -188,27 +212,10 @@ static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
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
@@ -218,23 +225,22 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
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
@@ -675,7 +681,7 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct tegra210_adx_soc_data *soc_data;
 	void __iomem *regs;
-	int err;
+	int err, i;
 
 	adx = devm_kzalloc(dev, sizeof(*adx), GFP_KERNEL);
 	if (!adx)
@@ -700,16 +706,15 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
 
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
-	if (!adx->byte_mask)
-		return -ENOMEM;
+	/* Initialise all byte map slots as disabled (value 256). */
+	for (i = 0; i < soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WORD; i++)
+		adx->map[i] = 256;
 
 	tegra210_adx_dais[TEGRA_ADX_IN_DAI_ID].playback.channels_max =
 			adx->soc_data->max_ch;
diff --git a/sound/soc/tegra/tegra210_adx.h b/sound/soc/tegra/tegra210_adx.h
index 176a4e40de0a..7ea623b4183b 100644
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
@@ -88,8 +91,7 @@ struct tegra210_adx_soc_data {
 
 struct tegra210_adx {
 	struct regmap *regmap;
-	unsigned int *map;
-	unsigned int *byte_mask;
+	u16 *map;
 	const struct tegra210_adx_soc_data *soc_data;
 };
 
-- 
2.34.1

