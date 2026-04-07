Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A153CBE63
	for <linux-tegra@vger.kernel.org>; Tue,  7 Apr 2026 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581429; cv=none; b=GsPvK9zbHXzmd5C60KjpkaM4O0DvW73OcwaDvd8tU/h44jhlSVtpBTcCLwI0fj/d3F2IHDSGigDRApzv85hBwvB9dhjd/im3d0B0rims7jSzJGCZwHQLc0rZuVmlVSaJlDPZN3sLNJRjmH6NXgKqFJjDrBUsQEp+JB5lQmb8F0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581429; c=relaxed/simple;
	bh=LEaAiWuc2iDIokGArBD4Y2Hs4D2o0VD9O5lvKNgWjEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qEupe3CaLpt02g6vqzbRLDU7L4GwO5pRJU5ZPt3Hfig16t7IGLyU4CkvKw9saDtcvf0Rgup641yLDig/dkYPiTKFkEQS1fmMwJMViOFohaBdwMprD8KusdDhPVAmUSM6CduI6PunaCovSwZDrz52P39lvkDtbbi1GpmLwjf810k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGQIXz5n; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGQIXz5n"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab077e3f32so22338775ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 07 Apr 2026 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775581426; x=1776186226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fesHMBqfmQJa8k2eFKVrT51rcc3PDADSOTcCGgAHuI=;
        b=eGQIXz5n3boH74uQVLyhloS2PGw2S9ZJu3TKHSzEXjmWJh1Y3rVGXD9m2qNm6pfT0s
         TC9IPdZsxn6WKl8zzAO39M7joL+DY0PQ0zopd4mAa54nd4qwrLG8NstuPzNchPIUOaPf
         LIzCDXgmq840lmExwyx+npq8VFT2nH/2nFEEaCrj8y9Yz/1ICBoZWvWLYKZ12P9Q40I9
         k+wxxFlPK6o+dkTkzGM6UrUW7JZ6e5kIHPGq/VbF/vzM50IwzDj/7t8+AEtmOTPfgaIW
         UxraawVvXXKHv28b0vWLYV96pjhsSV3f+KTVVYoAdCBU8Q2BMSpjV8uY+2cx7FGKNBK4
         XQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775581426; x=1776186226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0fesHMBqfmQJa8k2eFKVrT51rcc3PDADSOTcCGgAHuI=;
        b=TE4cChFLdd6YxHvBYQTDgbZd0yKFoPOryIgnn11j7gWfbKS0CKhLXxpeRUp8uzPw0L
         kOPXrTmETFyiN+c9JH/DCukN2jIeFPts3VuCOvgeuKQbun4VzRJHRahQwbv305yo7saD
         oLr+fIuTmyOEgGU+YR729I0rvm5TiU8HxU9RgIRkcgKXFJLqm/eJqoKlDHOV6sQr6X+q
         HLH+pzqfOkeqdsgCI9YIWnao/ZTlwT8N48b5PRqzOjoyhCdZBZDY6WqbGM+Kket65zAm
         Kcmp4w8LVXWIs/33/Ww4fhLOKP3eqYLfaMWH4GCjLOEhIx+eJyns3aP8x5UrzaFzQqFl
         YPIg==
X-Forwarded-Encrypted: i=1; AJvYcCXivfH5131xqYMx5oWZfSzzFqR9xO++chQtZTLPM0bhxoRiaRZfldRKYIZf6vncpXhCXqpvdFQgWpKtCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKozV33Mvrx/xPjd6O/+dJParb5+En2K4hpNuxcTNHRfWuxiOw
	ts34bKG/M1rIJXDVHvjXFpOViG800qIVN0dLMbrvKXEM642i87lYILgM
X-Gm-Gg: AeBDiesd37Yd6H7MFk8ImnWb2SC05/FIkmulVAA1JWIvSczdousE7nlfua5iQpW0GLb
	zsIplgcdfz1UiXRkzL+I3ZLEwOuOaSdsSdrvJMD7ldHUkZNnx1YzyKIAhfIp36J4xGf2/DSGkMz
	Qph4uhlTQ8+IjxJGXVbRVzanHFTrjOjKXI7MWbjqSXc6QM5iPKNaybZU5rqitKFxzJztvUGmTZF
	WKbhl7O1qGmtzMVnkdcA/nfXtQHnp9mKpvfFT+DClfd5GE2zM+M99R8dW0wzkJRUbei1F0U9Wjh
	zpM851RGnFWSwBBlnba5QPKVvIBf2a0OHaRdkIdXjV2n7uHx0brHeaKhQMWPXcHe3Pls4Jys25V
	Pi8NbOEueLs98DAfgeJdFCsEzN/mhp+XjYAtdKXljS7vDSCy5djqv7WNAFS+HmWhgKn7QS4/naT
	SqlOiO3Zvc6k6z3DMw0I5ZQxGZE7zh3fzs6/xKhAcHv0EjyjXVYFfoB1oBYZ59GJ/86gdfb62XM
	3XApMGyysDV571NLlhGgS9Fcq9HJX0NFuXqKAAWu02sPSqqoqAKXO6agQ==
X-Received: by 2002:a17:902:f541:b0:2b2:4e5a:9473 with SMTP id d9443c01a7336-2b2816dcedbmr171355955ad.21.1775581426079;
        Tue, 07 Apr 2026 10:03:46 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm196617905ad.29.2026.04.07.10.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 10:03:45 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: tegra210_amx: simplify byte map get/put logic
Date: Tue,  7 Apr 2026 22:33:08 +0530
Message-Id: <20260407170308.100238-3-piyushpatle228@gmail.com>
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
hardware-facing packed RAM word and the OUT_BYTE_EN mask are now
derived on the fly inside tegra210_amx_write_map_ram() from the
slot array, which is the only place that needs to know about the
hardware layout. This also lets us drop the byte_mask field from
struct tegra210_amx.

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

Addresses TODO left in tegra210_amx_get_byte_map().

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 sound/soc/tegra/tegra210_amx.c | 77 ++++++++++++++++------------------
 sound/soc/tegra/tegra210_amx.h |  5 ++-
 2 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index bfda82505298..4dd158e6e974 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -60,6 +60,7 @@ static const struct reg_default tegra264_amx_reg_defaults[] = {
 
 static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
 {
+	unsigned int byte_mask[TEGRA264_AMX_BYTE_MASK_COUNT] = { 0 };
 	int i;
 
 	regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL + amx->soc_data->reg_offset,
@@ -67,14 +68,28 @@ static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
 		     TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < amx->soc_data->ram_depth; i++)
+	for (i = 0; i < amx->soc_data->ram_depth; i++) {
+		u32 word = 0;
+		int b;
+
+		for (b = 0; b < 4; b++) {
+			unsigned int slot = i * 4 + b;
+			u16 val = amx->map[slot];
+
+			if (val >= 256)
+				continue;
+
+			word |= (u32)val << (b * 8);
+			byte_mask[slot / 32] |= 1U << (slot % 32);
+		}
 		regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_DATA + amx->soc_data->reg_offset,
-			     amx->map[i]);
+			     word);
+	}
 
 	for (i = 0; i < amx->soc_data->byte_mask_size; i++)
 		regmap_write(amx->regmap,
 			     TEGRA210_AMX_OUT_BYTE_EN0 + (i * TEGRA210_AMX_AUDIOCIF_CH_STRIDE),
-			     amx->byte_mask[i]);
+			     byte_mask[i]);
 }
 
 static int tegra210_amx_startup(struct snd_pcm_substream *substream,
@@ -212,26 +227,8 @@ static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)amx->map;
-	int reg = mc->reg;
-	int enabled;
 
-	enabled = amx->byte_mask[reg / 32] & (1 << (reg % 32));
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
-		ucontrol->value.integer.value[0] = bytes_map[reg];
-	else
-		ucontrol->value.integer.value[0] = 256;
+	ucontrol->value.integer.value[0] = amx->map[mc->reg];
 
 	return 0;
 }
@@ -243,22 +240,20 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)amx->map;
-	int reg = mc->reg;
-	int value = ucontrol->value.integer.value[0];
-	unsigned int mask_val = amx->byte_mask[reg / 32];
+	unsigned int value = ucontrol->value.integer.value[0];
 
-	if (value >= 0 && value <= 255)
-		mask_val |= (1 << (reg % 32));
-	else
-		mask_val &= ~(1 << (reg % 32));
+	/*
+	 * Match the previous behaviour: any value outside [0, 255] is
+	 * treated as the "disabled" sentinel (256). Negative values from
+	 * userspace fold in through the unsigned cast and are caught here.
+	 */
+	if (value > 255)
+		value = 256;
 
-	if (mask_val == amx->byte_mask[reg / 32])
+	if (amx->map[mc->reg] == value)
 		return 0;
 
-	/* Update byte map and slot */
-	bytes_map[reg] = value % 256;
-	amx->byte_mask[reg / 32] = mask_val;
+	amx->map[mc->reg] = value;
 
 	return 1;
 }
@@ -727,7 +722,7 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct tegra210_amx *amx;
 	void __iomem *regs;
-	int err;
+	int err, i;
 
 	amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
 	if (!amx)
@@ -750,16 +745,14 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(amx->regmap, true);
 
-	amx->map = devm_kzalloc(dev, amx->soc_data->ram_depth * sizeof(*amx->map),
-				GFP_KERNEL);
+	amx->map = devm_kcalloc(dev, amx->soc_data->ram_depth * 4,
+				sizeof(*amx->map), GFP_KERNEL);
 	if (!amx->map)
 		return -ENOMEM;
 
-	amx->byte_mask = devm_kzalloc(dev,
-				      amx->soc_data->byte_mask_size * sizeof(*amx->byte_mask),
-				      GFP_KERNEL);
-	if (!amx->byte_mask)
-		return -ENOMEM;
+	/* Initialize all byte map slots as disabled (value 256). */
+	for (i = 0; i < amx->soc_data->ram_depth * 4; i++)
+		amx->map[i] = 256;
 
 	tegra210_amx_dais[TEGRA_AMX_OUT_DAI_ID].capture.channels_max =
 			amx->soc_data->max_ch;
diff --git a/sound/soc/tegra/tegra210_amx.h b/sound/soc/tegra/tegra210_amx.h
index 50a237b197ba..6df9ab0fe220 100644
--- a/sound/soc/tegra/tegra210_amx.h
+++ b/sound/soc/tegra/tegra210_amx.h
@@ -8,6 +8,8 @@
 #ifndef __TEGRA210_AMX_H__
 #define __TEGRA210_AMX_H__
 
+#include <linux/types.h>
+
 /* Register offsets from TEGRA210_AMX*_BASE */
 #define TEGRA210_AMX_RX_STATUS			0x0c
 #define TEGRA210_AMX_RX_INT_STATUS		0x10
@@ -105,8 +107,7 @@ struct tegra210_amx_soc_data {
 
 struct tegra210_amx {
 	const struct tegra210_amx_soc_data *soc_data;
-	unsigned int *map;
-	unsigned int *byte_mask;
+	u16 *map;
 	struct regmap *regmap;
 };
 
-- 
2.34.1

