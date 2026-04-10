Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804DC37F745
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775851578; cv=none; b=clVIjQkvPJfoKIFjUKjtRfxD4rnqVhtJ2Q12LEqe4iZR8r6KzU/ddEVZRj7NVO5ei7iE46tnVOAxoMpLlTDHsMkrYsF781Y2YvDMSe17hmAbP7v0P/kEE7Z3Dam0CQvXlY8SWgbrjsDBBgSGhDfE4JNb7QlcT16ismLZMaudLVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775851578; c=relaxed/simple;
	bh=h4cqCKUlB4Wx1NRVb5QN3Ww7sLOHws6IeROjMdYYAuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6TQbFt8KOI2E2oYGdPZj4iLNjaXSBxJNYHv6qYyMQyF+VSGd6u6cg51q4FxBDwv/QY/QiVSaIknyIWLSra4ai43Os2XK+9xDmzqpMVAvj0D/EyYghbjd65xSOQeA5cbB2ZpjAyEXkzbWRIfwifqGeTpJNucff7gpFBggBS7ksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAKGeh42; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAKGeh42"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b2429f98d0so16422535ad.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775851577; x=1776456377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqdWyigSB2CQQBcY06A++oLVwY3qDgG48ezor5HbOpE=;
        b=LAKGeh42o9pVYTFr1hGk2GTJjPCqmvDvCuTDKbwqiktq828BX7gD5EpG6XCwa1uGsM
         yIugM/Xh6HDnO6ekWfLK9yBoDBwo6V3cH1vC9LSJZSJybbtupnR0dE5AsMrkWbCJJrHm
         Xjf7HV5hXN5Ye+SarKDJzgYb7zUo6haMB5M5mGMQyh8BZjW6JhRy9iOuHESNTYt4trUS
         oZE36hHfLWXZ9E04ZrYflOUgXi/4tq9g7eH9kQnE/vzOCH0Q6Sio2t+/q09FSYxtzHLE
         uWvzBe+4bXFbnh4qqPBTqIeq9Z3/ZKKHQLYbSu3+5Fzn8P+3tjctBkoVAz+0MXSutwad
         jMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775851577; x=1776456377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqdWyigSB2CQQBcY06A++oLVwY3qDgG48ezor5HbOpE=;
        b=AxWzYMNkwJX9xhmLaOBwORkoohFubfgt2Xmz8mt6hofWprDVt2fgWehuQL0e/lH68e
         kAWiCblC4o0PcltO+1HiHg+BfH5yaIiWZC69yMIl+8SBmgydVDTMh+OvuZHl826c8EIf
         /l2Rlf5jPucNSr0rvH9taOhMFw5SIevt79xCOZzRxKTWVkZ9xn8KQ+/C9gXma+JQfqwb
         IAFqLplb54sDyUifFf24rxVORpONgolvlnvBTEoHijRn+DPcXphnGlkKNdFcLAebse/g
         pA0ztQamw/8eYE2H7tO2O2wTAQE9Jf9KR1TfiGFEBSh/YZuK1kju/w42AQpAp8z2Uq4D
         qWCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBFsZ51POhuCkDZoxjjMg0jEfQebY5yrwNlMi62BuR5KN40xf0PTz6kWNRBezXYtVhJBy3lxSkE0F5jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGD4jTS0JHZ86IZ/eSpYWO0BY65j7HpgRxuR4zGqjtrhGbSlY
	NAj5kHB70WGaTXTQvZPsZpFXZI3VaWQ+WkfWsDsoWPT+KOUhdVTILkhy2TWhNdTwgYI=
X-Gm-Gg: AeBDiesKs6Yyc5KNNigDOURGXw3roHqh5+57QDJ7NQDS/Ijk2aPRuCaZAv25zdAtrBj
	WFA5kQxEPPnvcjdy/B5Uu68A8SQKmMGLZuC7dikiVUQNy6lXA6Lom5SuKUDKvSUPpiJPK7c5CWC
	iT60y/3wFlzv+oychWRwDJVWw7bP6HtBV0w9VDaHAr2dIwJXM6n8Ta4IzlFBo173/lZ9BA5OU5w
	d8WQ0oZdUrNlpPpE3u69mOJM0cH9R3rTgk6HtHiUFLM4jP4oG2pvYx/Idp6AWg9vNcIP1DeH70U
	Zt09LnoGElRN+2Lyk3UjjrJoIwXcC02vcaPcdHMejV2YKyJp5WIHH02Qa3V2UA4Q5+R9w/K1HJm
	SvAIxF1rjQMqgb2D53YOTJg56hDS/Zs5tmjtrgIFCzhFY18XnHV4fOWF2fYgFfSpVV2Jc0n1wTF
	JcqtG6TGiiw9C3ptgyNPxf1uP00BtBgTqfvkP7rYP7kDwTJqK+lEbfkl1gywWINsxjHh9juk3re
	Pn3uW+eJzdo0gxM0Or+T9x23SqOA2EEqXUIjqM6
X-Received: by 2002:a17:902:cec8:b0:2b0:6885:f1d4 with SMTP id d9443c01a7336-2b2d5a58899mr44631525ad.39.1775851576688;
        Fri, 10 Apr 2026 13:06:16 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:a107:5c92:b303:910a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4dabc08sm39569975ad.5.2026.04.10.13.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 13:06:16 -0700 (PDT)
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
Subject: [PATCH v3 2/2] ASoC: tegra210_amx: simplify byte map get/put logic
Date: Sat, 11 Apr 2026 01:35:23 +0530
Message-ID: <20260410200530.171323-3-piyushpatle228@gmail.com>
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
hardware-facing packed RAM word and the OUT_BYTE_EN mask are now
derived on the fly inside tegra210_amx_write_map_ram() from the
slot array, which is the only place that needs to know about the
hardware layout.

The byte_mask buffer is allocated in probe() using devm_kcalloc()
with soc_data->byte_mask_size, so it scales to any SoC variant
without depending on chip-specific constants. It is zeroed and
recomputed each time write_map_ram() is called.

A new TEGRA_AMX_SLOTS_PER_WORD constant replaces the literal '4'
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

Addresses TODO left in tegra210_amx_get_byte_map().

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes since v2:
 - Move byte_mask allocation back to probe() with devm_kcalloc()
   using soc_data->byte_mask_size; revert write_map_ram() to void
   and runtime_resume() to returning 0. Suggested by Jon Hunter.
 - Fix bits_per_mask: use BITS_PER_TYPE(*amx->byte_mask) instead of
   the incorrect BITS_PER_TYPE(*amx->map) * BITS_PER_BYTE. Reported
   by Mark Brown.
 - Drop <linux/slab.h> include (no longer needed without kfree).

Changes since v1:
 - Use dynamic sizing via soc_data->byte_mask_size instead of
   chip-specific constants. Suggested by Sheetal.
 - Replace magic numbers with TEGRA_AMX_SLOTS_PER_WORD and use
   BITS_PER_BYTE / BITS_PER_TYPE(). Suggested by Sheetal.
 - Add <linux/bits.h> include.

 sound/soc/tegra/tegra210_amx.c | 82 ++++++++++++++++++----------------
 sound/soc/tegra/tegra210_amx.h |  5 ++-
 2 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index bfda82505298..ecdba16aa756 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -4,6 +4,7 @@
 //
 // tegra210_amx.c - Tegra210 AMX driver
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -60,16 +61,35 @@ static const struct reg_default tegra264_amx_reg_defaults[] = {
 
 static void tegra210_amx_write_map_ram(struct tegra210_amx *amx)
 {
+	const unsigned int bits_per_mask = BITS_PER_TYPE(*amx->byte_mask);
 	int i;
 
+	memset(amx->byte_mask, 0,
+	       amx->soc_data->byte_mask_size * sizeof(*amx->byte_mask));
+
 	regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_CTRL + amx->soc_data->reg_offset,
 		     TEGRA210_AMX_CFG_RAM_CTRL_SEQ_ACCESS_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_ADDR_INIT_EN |
 		     TEGRA210_AMX_CFG_RAM_CTRL_RW_WRITE);
 
-	for (i = 0; i < amx->soc_data->ram_depth; i++)
+	for (i = 0; i < amx->soc_data->ram_depth; i++) {
+		u32 word = 0;
+		int b;
+
+		for (b = 0; b < TEGRA_AMX_SLOTS_PER_WORD; b++) {
+			unsigned int slot = i * TEGRA_AMX_SLOTS_PER_WORD + b;
+			u16 val = amx->map[slot];
+
+			if (val >= 256)
+				continue;
+
+			word |= (u32)val << (b * BITS_PER_BYTE);
+			amx->byte_mask[slot / bits_per_mask] |=
+				1U << (slot % bits_per_mask);
+		}
 		regmap_write(amx->regmap, TEGRA210_AMX_CFG_RAM_DATA + amx->soc_data->reg_offset,
-			     amx->map[i]);
+			     word);
+	}
 
 	for (i = 0; i < amx->soc_data->byte_mask_size; i++)
 		regmap_write(amx->regmap,
@@ -212,26 +232,8 @@ static int tegra210_amx_get_byte_map(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct tegra210_amx *amx = snd_soc_component_get_drvdata(cmpnt);
-	unsigned char *bytes_map = (unsigned char *)amx->map;
-	int reg = mc->reg;
-	int enabled;
-
-	enabled = amx->byte_mask[reg / 32] & (1 << (reg % 32));
 
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
@@ -243,22 +245,20 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
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
@@ -727,7 +727,7 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct tegra210_amx *amx;
 	void __iomem *regs;
-	int err;
+	int err, i;
 
 	amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
 	if (!amx)
@@ -750,17 +750,21 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 
 	regcache_cache_only(amx->regmap, true);
 
-	amx->map = devm_kzalloc(dev, amx->soc_data->ram_depth * sizeof(*amx->map),
-				GFP_KERNEL);
+	amx->map = devm_kcalloc(dev,
+				amx->soc_data->ram_depth * TEGRA_AMX_SLOTS_PER_WORD,
+				sizeof(*amx->map), GFP_KERNEL);
 	if (!amx->map)
 		return -ENOMEM;
 
-	amx->byte_mask = devm_kzalloc(dev,
-				      amx->soc_data->byte_mask_size * sizeof(*amx->byte_mask),
-				      GFP_KERNEL);
+	amx->byte_mask = devm_kcalloc(dev, amx->soc_data->byte_mask_size,
+				      sizeof(*amx->byte_mask), GFP_KERNEL);
 	if (!amx->byte_mask)
 		return -ENOMEM;
 
+	/* Initialise all byte map slots as disabled (value 256). */
+	for (i = 0; i < amx->soc_data->ram_depth * TEGRA_AMX_SLOTS_PER_WORD; i++)
+		amx->map[i] = 256;
+
 	tegra210_amx_dais[TEGRA_AMX_OUT_DAI_ID].capture.channels_max =
 			amx->soc_data->max_ch;
 
diff --git a/sound/soc/tegra/tegra210_amx.h b/sound/soc/tegra/tegra210_amx.h
index 50a237b197ba..420b62f0cf35 100644
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
@@ -73,6 +75,7 @@
 #define TEGRA210_AMX_SOFT_RESET_SOFT_RESET_MASK		TEGRA210_AMX_SOFT_RESET_SOFT_EN
 
 #define TEGRA210_AMX_AUDIOCIF_CH_STRIDE		4
+#define TEGRA_AMX_SLOTS_PER_WORD		4
 #define TEGRA210_AMX_RAM_DEPTH			16
 #define TEGRA210_AMX_MAP_STREAM_NUM_SHIFT	6
 #define TEGRA210_AMX_MAP_WORD_NUM_SHIFT		2
@@ -105,8 +108,8 @@ struct tegra210_amx_soc_data {
 
 struct tegra210_amx {
 	const struct tegra210_amx_soc_data *soc_data;
-	unsigned int *map;
 	unsigned int *byte_mask;
+	u16 *map;
 	struct regmap *regmap;
 };
 
-- 
2.43.0

