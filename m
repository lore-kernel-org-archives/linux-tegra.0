Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD40739A815
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2026 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781240033; cv=none; b=H9DaLEje1mA2nQ6Ixc190NzOcdOg9VDK7n8IvgNgXi3M4MZnA/aWK0+pqyzxKp4Y0S11FqYxaWIn4BW0HJzSNN20N2QAXrvVwGmaEhejTRXgN9Hcbc9X1makHl/wYBlwkKvY4QBLzCDJoMlIFQQYiu9UQu/lrFdV8NZ0oVBD7PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781240033; c=relaxed/simple;
	bh=IZ8UBsOmUsvw4NMXcjoLJmOzFOMsGyoQmhSE3IqMWWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+U3YXy3cXf9oGBzL1rcnpFoT+Vj6C1bVjXF/2UiaNbEoah4nP5zyQq0kNaL30kD2eZaohmmV6V9v3olmW0gw7mY1BlpvzrvERr27eyfUcfNZuYgGpNTMGOHk+fBgrvOpeG/iC02kYA8yW2v+vKy3O8dk6X03HHyawtBr3QEYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C57qD0fS; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C57qD0fS"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d8362a58so477196eec.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 21:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781240030; x=1781844830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSg79TjnF8E+BtAGGTPOs1qTkkp7J/8JDkappP7PNsE=;
        b=C57qD0fSnw4PY+w5o3qL6+qZfnAHQvmqMP2DeKFwfkATLJrDoOS1KLJntIekWWAGfC
         NqxkDFytZhZK5FiOubgrKc2cmFFnuQxqOJUqv8fSbW7NbBsNy/GjQTeHbSC/9uNUBu/J
         3ZDHFc3uzPkcOZ0xOQmotzZviVNFecr5eYpFD0vjJGWVzTFLNpNB+Fod4lUISmRu1Zh9
         CaiV3WzEwYbe4Lrlv8fNJOBEKXZW4kECO9rU73s01HfvPhAWrOCAUFG4PyJi7+/oVBL/
         eYSA4z++ai6kUEgF4357KBB1Hy4cC2eLTQ7O1m2grFl1amcnyyecvcJgEeoj3rUShTUZ
         Aiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781240030; x=1781844830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VSg79TjnF8E+BtAGGTPOs1qTkkp7J/8JDkappP7PNsE=;
        b=JOkJ1hmDYUMvLZ9F+isG7NJd6Dy9U+sUXm5ran5HgC3UwwMhn1EUWRHP3UD5MQWqSE
         Zmiy95poEzFr0dlvA81rQcBW1njH2BAecifiovlNbo01ltoXf+zyErSqW/128Hez58uS
         B63IAQXqtIqqlgLsEMYXjQiFx4JUBpXmwNcpHCBS/CnELdsZ7nmhIV6HS6JD6/pcDoLO
         0p8mFW/DyCWeS5aHUuinmfVLTEKqDC4DBJYotTyBe6k5X+GMBuf4/qa9B7I1kPJBWPk6
         14wDs2/+Rh9vKnLCthOzMR2DjaFdnm246yMrNp0YF+HR9jF3SUqawpAjV1Fs2ORDiePr
         ko4w==
X-Forwarded-Encrypted: i=1; AFNElJ9qhv3ZeOpT1c1yqwwTTOMRRpzVZfo6Z6puwjp/VYpi1D5DMwsn8vs8TYrv+EGnP6qKkdQASW0DgLw+GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuGIb4UryMonltxJ96opM55XqlOuz0WaqxXbMGldjNUo0+6CF
	9aMeRxXkyt6iHlDClr8XpHa+ISmwH0DVdig5JW4g8UpUycRhtoK3cKUi
X-Gm-Gg: Acq92OGTtL+kY/2l0pjjJojicRaFvyoBpwQ3+6ijfEJk9+hIxHRWJbXWUFvYi6I/xLw
	ZxGgxefU8rmrRGEG+TwXltKUhjZ5feXl3RbdPvslC3xV7Y1X32AC/dAgW+GagxFlH5R6pgNUPQc
	MHSHlnmgpn2rD6Lm2HDdAqQmpcl1E0mHeajq6PDwzx4YHmJ97iq7zOqjTMVRGBbf737LA2ks4LK
	9+5ZaPz5mhAi3l2qOkmKLZRxPZLgYorWNFO5HkWmPN3K+W5qGF8x8TAGTs/kB705/pMm3KmLet3
	ZmP/gYtc5jM665QXKkXrKuZDo+2BgaXT6jyM68h0eoLL9WN83aE+n0tG94N9xhehmsJ4S5MIQfG
	7dpQaDIoDWUvMR6Sqgb+WvSMuHAg4F+0dJDZH3jig5fk6JfolvdoaOVT3IYhfNhHFV0liehcmQH
	m7MTgMef4G0BiVhQZVhJP2GKMPyPUaBm4kyi0Myx4c6vdeo8In7p3/NDNquFnyMBNEOV1yR/+RR
	g==
X-Received: by 2002:a05:7300:642a:b0:2c1:67e1:61a9 with SMTP id 5a478bee46e88-30820cf444dmr515579eec.13.1781240029815;
        Thu, 11 Jun 2026 21:53:49 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm1971217eec.8.2026.06.11.21.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:53:49 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 12 Jun 2026 01:53:25 -0300
Subject: [PATCH RFC 3/4] ALSA: hda: Use common CEA channel allocations
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-alsa-cea-channel-allocation-v1-3-b1bcbb6b1051@gmail.com>
References: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
In-Reply-To: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21081;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=IZ8UBsOmUsvw4NMXcjoLJmOzFOMsGyoQmhSE3IqMWWg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnaEy4e2vj2xtJJEh8Lf8zVMj0R93JX9WqB0zvlPtZWf
 PvD0/7xQkcpC4MYF4OsmCLL6qRFlnu6Hlytj1vhATOHlQlkCAMXpwBMZP1Dhr8iVcE7cneF8+5+
 wWEi43xr/jc73hdnzhqGNnxOdvF2TS1gZJg/p932ivu+bQfunu7o3BOclZwcJlurlrbyvoLo+rV
 LPjEAAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Replace the HDA-local CEA allocation table and selection implementation
with the common PCM ELD data and helpers. Keep the complete CA range and
the existing channel-count fallback when the ELD speaker allocation does
not contain a compatible layout.

The HDA core now directly references helpers built under SND_PCM_ELD, so
select that option from SND_HDA_CORE.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/hda_chmap.h         |  17 +--
 sound/hda/codecs/hdmi/atihdmi.c   |   6 +-
 sound/hda/codecs/hdmi/nvhdmi.c    |   3 +-
 sound/hda/codecs/hdmi/tegrahdmi.c |   3 +-
 sound/hda/core/Kconfig            |   1 +
 sound/hda/core/hdmi_chmap.c       | 254 +++++++-------------------------------
 6 files changed, 54 insertions(+), 230 deletions(-)

diff --git a/include/sound/hda_chmap.h b/include/sound/hda_chmap.h
index b539595fd5cd..27e52b40a2a8 100644
--- a/include/sound/hda_chmap.h
+++ b/include/sound/hda_chmap.h
@@ -7,19 +7,12 @@
 #define __SOUND_HDA_CHMAP_H
 
 #include <sound/pcm.h>
+#include <sound/pcm_drm_eld.h>
 #include <sound/hdaudio.h>
 
 
 #define SND_PRINT_CHANNEL_ALLOCATION_ADVISED_BUFSIZE 80
 
-struct hdac_cea_channel_speaker_allocation {
-	int ca_index;
-	int speakers[8];
-
-	/* derived values, just for convenience */
-	int channels;
-	int spk_mask;
-};
 struct hdac_chmap;
 
 struct hdac_chmap_ops {
@@ -28,10 +21,9 @@ struct hdac_chmap_ops {
 	 * for devices that have non-standard mapping requirements.
 	 */
 	int (*chmap_cea_alloc_validate_get_type)(struct hdac_chmap *chmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
-		int channels);
+		const struct snd_cea_channel_speaker_allocation *cap, int channels);
 	void (*cea_alloc_to_tlv_chmap)(struct hdac_chmap *hchmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
+		const struct snd_cea_channel_speaker_allocation *cap,
 		unsigned int *chmap, int channels);
 
 	/* check that the user-given chmap is supported */
@@ -72,8 +64,7 @@ void snd_hdac_setup_channel_mapping(struct hdac_chmap *chmap,
 		       int channels, unsigned char *map,
 		       bool chmap_set);
 void snd_hdac_print_channel_allocation(int spk_alloc, char *buf, int buflen);
-const struct hdac_cea_channel_speaker_allocation *
-snd_hdac_get_ch_alloc_from_ca(int ca);
+const struct snd_cea_channel_speaker_allocation *snd_hdac_get_ch_alloc_from_ca(int ca);
 int snd_hdac_chmap_to_spk_mask(unsigned char c);
 int snd_hdac_spk_to_chmap(int spk);
 int snd_hdac_add_chmap_ctls(struct snd_pcm *pcm, int pcm_idx,
diff --git a/sound/hda/codecs/hdmi/atihdmi.c b/sound/hda/codecs/hdmi/atihdmi.c
index 9afdbf44b6f0..b1ac997dcce0 100644
--- a/sound/hda/codecs/hdmi/atihdmi.c
+++ b/sound/hda/codecs/hdmi/atihdmi.c
@@ -262,7 +262,7 @@ static int atihdmi_paired_swap_fc_lfe(int pos)
 static int atihdmi_paired_chmap_validate(struct hdac_chmap *chmap,
 			int ca, int chs, unsigned char *map)
 {
-	const struct hdac_cea_channel_speaker_allocation *cap;
+	const struct snd_cea_channel_speaker_allocation *cap;
 	int i, j;
 
 	/* check that only channel pairs need to be remapped on old pre-rev3 ATI/AMD */
@@ -377,7 +377,7 @@ static int atihdmi_pin_get_slot_channel(struct hdac_device *hdac,
 
 static int atihdmi_paired_chmap_cea_alloc_validate_get_type(
 		struct hdac_chmap *chmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
+		const struct snd_cea_channel_speaker_allocation *cap,
 		int channels)
 {
 	int c;
@@ -406,7 +406,7 @@ static int atihdmi_paired_chmap_cea_alloc_validate_get_type(
 }
 
 static void atihdmi_paired_cea_alloc_to_tlv_chmap(struct hdac_chmap *hchmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
+		const struct snd_cea_channel_speaker_allocation *cap,
 		unsigned int *chmap, int channels)
 {
 	/* produce paired maps for pre-rev3 ATI/AMD codecs */
diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
index eaefa016cdec..91a4d66b88a7 100644
--- a/sound/hda/codecs/hdmi/nvhdmi.c
+++ b/sound/hda/codecs/hdmi/nvhdmi.c
@@ -24,8 +24,7 @@ enum {
  * - 0x10de0040
  */
 static int nvhdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
-		int channels)
+		const struct snd_cea_channel_speaker_allocation *cap, int channels)
 {
 	if (cap->ca_index == 0x00 && channels == 2)
 		return SNDRV_CTL_TLVT_CHMAP_FIXED;
diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
index 751a50cd4b7d..d8d34faad0c5 100644
--- a/sound/hda/codecs/hdmi/tegrahdmi.c
+++ b/sound/hda/codecs/hdmi/tegrahdmi.c
@@ -205,8 +205,7 @@ static int tegra_hdmi_build_pcms(struct hda_codec *codec)
  * - 0x10de0040
  */
 static int nvhdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
-		int channels)
+		const struct snd_cea_channel_speaker_allocation *cap, int channels)
 {
 	if (cap->ca_index == 0x00 && channels == 2)
 		return SNDRV_CTL_TLVT_CHMAP_FIXED;
diff --git a/sound/hda/core/Kconfig b/sound/hda/core/Kconfig
index bfdcf6384c52..b5158a44a183 100644
--- a/sound/hda/core/Kconfig
+++ b/sound/hda/core/Kconfig
@@ -2,6 +2,7 @@
 config SND_HDA_CORE
 	tristate
 	select REGMAP
+	select SND_PCM_ELD
 
 config SND_HDA_DSP_LOADER
 	bool
diff --git a/sound/hda/core/hdmi_chmap.c b/sound/hda/core/hdmi_chmap.c
index f76b5dcc6433..033e0dda9ac3 100644
--- a/sound/hda/core/hdmi_chmap.c
+++ b/sound/hda/core/hdmi_chmap.c
@@ -23,23 +23,23 @@
  * CEA RL/RR; The SMPTE channel _assignment_ C/LFE is swapped to CEA LFE/FC.
  */
 enum cea_speaker_placement {
-	FL  = (1 <<  0),	/* Front Left           */
-	FC  = (1 <<  1),	/* Front Center         */
-	FR  = (1 <<  2),	/* Front Right          */
-	FLC = (1 <<  3),	/* Front Left Center    */
-	FRC = (1 <<  4),	/* Front Right Center   */
-	RL  = (1 <<  5),	/* Rear Left            */
-	RC  = (1 <<  6),	/* Rear Center          */
-	RR  = (1 <<  7),	/* Rear Right           */
-	RLC = (1 <<  8),	/* Rear Left Center     */
-	RRC = (1 <<  9),	/* Rear Right Center    */
-	LFE = (1 << 10),	/* Low Frequency Effect */
-	FLW = (1 << 11),	/* Front Left Wide      */
-	FRW = (1 << 12),	/* Front Right Wide     */
-	FLH = (1 << 13),	/* Front Left High      */
-	FCH = (1 << 14),	/* Front Center High    */
-	FRH = (1 << 15),	/* Front Right High     */
-	TC  = (1 << 16),	/* Top Center           */
+	FL  = BIT(0),	/* Front Left */
+	FC  = BIT(1),	/* Front Center */
+	FR  = BIT(2),	/* Front Right */
+	FLC = BIT(3),	/* Front Left Center */
+	FRC = BIT(4),	/* Front Right Center */
+	RL  = BIT(5),	/* Rear Left */
+	RC  = BIT(6),	/* Rear Center */
+	RR  = BIT(7),	/* Rear Right */
+	RLC = BIT(8),	/* Rear Left Center */
+	RRC = BIT(9),	/* Rear Right Center */
+	LFE = BIT(10),	/* Low Frequency Effect */
+	FLW = BIT(11),	/* Front Left Wide */
+	FRW = BIT(12),	/* Front Right Wide */
+	FLH = BIT(13),	/* Front Left High */
+	FCH = BIT(14),	/* Front Center High */
+	FRH = BIT(15),	/* Front Right High */
+	TC  = BIT(16),	/* Top Center */
 };
 
 static const char * const cea_speaker_allocation_names[] = {
@@ -56,24 +56,6 @@ static const char * const cea_speaker_allocation_names[] = {
 	/* 10 */ "FCH",
 };
 
-/*
- * ELD SA bits in the CEA Speaker Allocation data block
- */
-static const int eld_speaker_allocation_bits[] = {
-	[0] = FL | FR,
-	[1] = LFE,
-	[2] = FC,
-	[3] = RL | RR,
-	[4] = RC,
-	[5] = FLC | FRC,
-	[6] = RLC | RRC,
-	/* the following are not defined in ELD yet */
-	[7] = FLW | FRW,
-	[8] = FLH | FRH,
-	[9] = TC,
-	[10] = FCH,
-};
-
 /*
  * ALSA sequence is:
  *
@@ -110,75 +92,6 @@ static int hdmi_channel_mapping[0x32][8] = {
 	[0x13] = { 0x00, 0x11, 0x26, 0x37, 0x43, 0x52, 0x64, 0x75 },
 };
 
-/*
- * This is an ordered list!
- *
- * The preceding ones have better chances to be selected by
- * hdmi_channel_allocation().
- */
-static struct hdac_cea_channel_speaker_allocation channel_allocations[] = {
-/*			  channel:   7     6    5    4    3     2    1    0  */
-{ .ca_index = 0x00,  .speakers = {   0,    0,   0,   0,   0,    0,  FR,  FL } },
-				 /* 2.1 */
-{ .ca_index = 0x01,  .speakers = {   0,    0,   0,   0,   0,  LFE,  FR,  FL } },
-				 /* Dolby Surround */
-{ .ca_index = 0x02,  .speakers = {   0,    0,   0,   0,  FC,    0,  FR,  FL } },
-				 /* surround40 */
-{ .ca_index = 0x08,  .speakers = {   0,    0,  RR,  RL,   0,    0,  FR,  FL } },
-				 /* surround41 */
-{ .ca_index = 0x09,  .speakers = {   0,    0,  RR,  RL,   0,  LFE,  FR,  FL } },
-				 /* surround50 */
-{ .ca_index = 0x0a,  .speakers = {   0,    0,  RR,  RL,  FC,    0,  FR,  FL } },
-				 /* surround51 */
-{ .ca_index = 0x0b,  .speakers = {   0,    0,  RR,  RL,  FC,  LFE,  FR,  FL } },
-				 /* 6.1 */
-{ .ca_index = 0x0f,  .speakers = {   0,   RC,  RR,  RL,  FC,  LFE,  FR,  FL } },
-				 /* surround71 */
-{ .ca_index = 0x13,  .speakers = { RRC,  RLC,  RR,  RL,  FC,  LFE,  FR,  FL } },
-
-{ .ca_index = 0x03,  .speakers = {   0,    0,   0,   0,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x04,  .speakers = {   0,    0,   0,  RC,   0,    0,  FR,  FL } },
-{ .ca_index = 0x05,  .speakers = {   0,    0,   0,  RC,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x06,  .speakers = {   0,    0,   0,  RC,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x07,  .speakers = {   0,    0,   0,  RC,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x0c,  .speakers = {   0,   RC,  RR,  RL,   0,    0,  FR,  FL } },
-{ .ca_index = 0x0d,  .speakers = {   0,   RC,  RR,  RL,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x0e,  .speakers = {   0,   RC,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x10,  .speakers = { RRC,  RLC,  RR,  RL,   0,    0,  FR,  FL } },
-{ .ca_index = 0x11,  .speakers = { RRC,  RLC,  RR,  RL,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x12,  .speakers = { RRC,  RLC,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x14,  .speakers = { FRC,  FLC,   0,   0,   0,    0,  FR,  FL } },
-{ .ca_index = 0x15,  .speakers = { FRC,  FLC,   0,   0,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x16,  .speakers = { FRC,  FLC,   0,   0,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x17,  .speakers = { FRC,  FLC,   0,   0,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x18,  .speakers = { FRC,  FLC,   0,  RC,   0,    0,  FR,  FL } },
-{ .ca_index = 0x19,  .speakers = { FRC,  FLC,   0,  RC,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x1a,  .speakers = { FRC,  FLC,   0,  RC,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x1b,  .speakers = { FRC,  FLC,   0,  RC,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x1c,  .speakers = { FRC,  FLC,  RR,  RL,   0,    0,  FR,  FL } },
-{ .ca_index = 0x1d,  .speakers = { FRC,  FLC,  RR,  RL,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x1e,  .speakers = { FRC,  FLC,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x1f,  .speakers = { FRC,  FLC,  RR,  RL,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x20,  .speakers = {   0,  FCH,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x21,  .speakers = {   0,  FCH,  RR,  RL,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x22,  .speakers = {  TC,    0,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x23,  .speakers = {  TC,    0,  RR,  RL,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x24,  .speakers = { FRH,  FLH,  RR,  RL,   0,    0,  FR,  FL } },
-{ .ca_index = 0x25,  .speakers = { FRH,  FLH,  RR,  RL,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x26,  .speakers = { FRW,  FLW,  RR,  RL,   0,    0,  FR,  FL } },
-{ .ca_index = 0x27,  .speakers = { FRW,  FLW,  RR,  RL,   0,  LFE,  FR,  FL } },
-{ .ca_index = 0x28,  .speakers = {  TC,   RC,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x29,  .speakers = {  TC,   RC,  RR,  RL,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x2a,  .speakers = { FCH,   RC,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x2b,  .speakers = { FCH,   RC,  RR,  RL,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x2c,  .speakers = {  TC,  FCH,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x2d,  .speakers = {  TC,  FCH,  RR,  RL,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x2e,  .speakers = { FRH,  FLH,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x2f,  .speakers = { FRH,  FLH,  RR,  RL,  FC,  LFE,  FR,  FL } },
-{ .ca_index = 0x30,  .speakers = { FRW,  FLW,  RR,  RL,  FC,    0,  FR,  FL } },
-{ .ca_index = 0x31,  .speakers = { FRW,  FLW,  RR,  RL,  FC,  LFE,  FR,  FL } },
-};
-
 static int hdmi_pin_set_slot_channel(struct hdac_device *codec,
 		hda_nid_t pin_nid, int asp_slot, int channel)
 {
@@ -213,32 +126,12 @@ static void hdmi_set_channel_count(struct hdac_device *codec,
  * Channel mapping routines
  */
 
-/*
- * Compute derived values in channel_allocations[].
- */
-static void init_channel_allocations(void)
-{
-	int i, j;
-	struct hdac_cea_channel_speaker_allocation *p;
-
-	for (i = 0; i < ARRAY_SIZE(channel_allocations); i++) {
-		p = channel_allocations + i;
-		p->channels = 0;
-		p->spk_mask = 0;
-		for (j = 0; j < ARRAY_SIZE(p->speakers); j++)
-			if (p->speakers[j]) {
-				p->channels++;
-				p->spk_mask |= p->speakers[j];
-			}
-	}
-}
-
 static int get_channel_allocation_order(int ca)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(channel_allocations); i++) {
-		if (channel_allocations[i].ca_index == ca)
+	for (i = 0; i < snd_cea_channel_allocations_count; i++) {
+		if (snd_cea_channel_allocations[i].ca_index == ca)
 			break;
 	}
 	return i;
@@ -257,61 +150,13 @@ void snd_hdac_print_channel_allocation(int spk_alloc, char *buf, int buflen)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_print_channel_allocation);
 
-/*
- * The transformation takes two steps:
- *
- *	eld->spk_alloc => (eld_speaker_allocation_bits[]) => spk_mask
- *	      spk_mask => (channel_allocations[])         => ai->CA
- *
- * TODO: it could select the wrong CA from multiple candidates.
-*/
 static int hdmi_channel_allocation_spk_alloc_blk(struct hdac_device *codec,
 				   int spk_alloc, int channels)
 {
-	int i;
-	int ca = 0;
-	int spk_mask = 0;
+	int ca;
 	char buf[SND_PRINT_CHANNEL_ALLOCATION_ADVISED_BUFSIZE];
 
-	/*
-	 * CA defaults to 0 for basic stereo audio
-	 */
-	if (channels <= 2)
-		return 0;
-
-	/*
-	 * expand ELD's speaker allocation mask
-	 *
-	 * ELD tells the speaker mask in a compact(paired) form,
-	 * expand ELD's notions to match the ones used by Audio InfoFrame.
-	 */
-	for (i = 0; i < ARRAY_SIZE(eld_speaker_allocation_bits); i++) {
-		if (spk_alloc & (1 << i))
-			spk_mask |= eld_speaker_allocation_bits[i];
-	}
-
-	/* search for the first working match in the CA table */
-	for (i = 0; i < ARRAY_SIZE(channel_allocations); i++) {
-		if (channels == channel_allocations[i].channels &&
-		    (spk_mask & channel_allocations[i].spk_mask) ==
-				channel_allocations[i].spk_mask) {
-			ca = channel_allocations[i].ca_index;
-			break;
-		}
-	}
-
-	if (!ca) {
-		/*
-		 * if there was no match, select the regular ALSA channel
-		 * allocation with the matching number of channels
-		 */
-		for (i = 0; i < ARRAY_SIZE(channel_allocations); i++) {
-			if (channels == channel_allocations[i].channels) {
-				ca = channel_allocations[i].ca_index;
-				break;
-			}
-		}
-	}
+	ca = snd_cea_channel_allocation(spk_alloc, channels, 0x31, true);
 
 	snd_hdac_print_channel_allocation(spk_alloc, buf, sizeof(buf));
 	dev_dbg(&codec->dev, "HDMI: select CA 0x%x for %d-channel allocation: %s\n",
@@ -341,14 +186,14 @@ static void hdmi_std_setup_channel_mapping(struct hdac_chmap *chmap,
 				       bool non_pcm,
 				       int ca)
 {
-	const struct hdac_cea_channel_speaker_allocation *ch_alloc;
+	const struct snd_cea_channel_speaker_allocation *ch_alloc;
 	int i;
 	int err;
 	int order;
 	int non_pcm_mapping[8];
 
 	order = get_channel_allocation_order(ca);
-	ch_alloc = &channel_allocations[order];
+	ch_alloc = &snd_cea_channel_allocations[order];
 
 	if (hdmi_channel_mapping[ca][1] == 0) {
 		int hdmi_slot = 0;
@@ -438,12 +283,12 @@ static int to_cea_slot(int ordered_ca, unsigned char pos)
 	/* Add sanity check to pass klockwork check.
 	 * This should never happen.
 	 */
-	if (ordered_ca >= ARRAY_SIZE(channel_allocations))
+	if (ordered_ca >= snd_cea_channel_allocations_count)
 		return -1;
 
 	if (mask) {
 		for (i = 0; i < 8; i++) {
-			if (channel_allocations[ordered_ca].speakers[7 - i] == mask)
+			if (snd_cea_channel_allocations[ordered_ca].speakers[7 - i] == mask)
 				return i;
 		}
 	}
@@ -475,7 +320,7 @@ static int from_cea_slot(int ordered_ca, unsigned char slot)
 	if (slot >= 8)
 		return 0;
 
-	mask = channel_allocations[ordered_ca].speakers[7 - slot];
+	mask = snd_cea_channel_allocations[ordered_ca].speakers[7 - slot];
 
 	return snd_hdac_spk_to_chmap(mask);
 }
@@ -494,12 +339,12 @@ static int hdmi_manual_channel_allocation(int chs, unsigned char *map)
 		}
 	}
 
-	for (i = 0; i < ARRAY_SIZE(channel_allocations); i++) {
-		if ((chs == channel_allocations[i].channels ||
-		     spks == channel_allocations[i].channels) &&
-		    (spk_mask & channel_allocations[i].spk_mask) ==
-				channel_allocations[i].spk_mask)
-			return channel_allocations[i].ca_index;
+	for (i = 0; i < snd_cea_channel_allocations_count; i++) {
+		if ((chs == snd_cea_channel_allocations[i].channels ||
+		     spks == snd_cea_channel_allocations[i].channels) &&
+		    (spk_mask & snd_cea_channel_allocations[i].spk_mask) ==
+				snd_cea_channel_allocations[i].spk_mask)
+			return snd_cea_channel_allocations[i].ca_index;
 	}
 	return -1;
 }
@@ -542,8 +387,8 @@ static void hdmi_setup_fake_chmap(unsigned char *map, int ca)
 	int ordered_ca = get_channel_allocation_order(ca);
 
 	for (i = 0; i < 8; i++) {
-		if (ordered_ca < ARRAY_SIZE(channel_allocations) &&
-		    i < channel_allocations[ordered_ca].channels)
+		if (ordered_ca < snd_cea_channel_allocations_count &&
+		    i < snd_cea_channel_allocations[ordered_ca].channels)
 			map[i] = from_cea_slot(ordered_ca, hdmi_channel_mapping[ca][i] & 0x0f);
 		else
 			map[i] = 0;
@@ -574,17 +419,16 @@ int snd_hdac_get_active_channels(int ca)
 	/* Add sanity check to pass klockwork check.
 	 * This should never happen.
 	 */
-	if (ordered_ca >= ARRAY_SIZE(channel_allocations))
+	if (ordered_ca >= snd_cea_channel_allocations_count)
 		ordered_ca = 0;
 
-	return channel_allocations[ordered_ca].channels;
+	return snd_cea_channel_allocations[ordered_ca].channels;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_get_active_channels);
 
-const struct hdac_cea_channel_speaker_allocation *
-snd_hdac_get_ch_alloc_from_ca(int ca)
+const struct snd_cea_channel_speaker_allocation *snd_hdac_get_ch_alloc_from_ca(int ca)
 {
-	return &channel_allocations[get_channel_allocation_order(ca)];
+	return &snd_cea_channel_allocations[get_channel_allocation_order(ca)];
 }
 EXPORT_SYMBOL_GPL(snd_hdac_get_ch_alloc_from_ca);
 
@@ -623,8 +467,7 @@ static int hdmi_chmap_ctl_info(struct snd_kcontrol *kcontrol,
 }
 
 static int hdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
-		int channels)
+		const struct snd_cea_channel_speaker_allocation *cap, int channels)
 {
 	/* If the speaker allocation matches the channel count, it is OK.*/
 	if (cap->channels != channels)
@@ -635,7 +478,7 @@ static int hdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
 }
 
 static void hdmi_cea_alloc_to_tlv_chmap(struct hdac_chmap *hchmap,
-		const struct hdac_cea_channel_speaker_allocation *cap,
+		const struct snd_cea_channel_speaker_allocation *cap,
 		unsigned int *chmap, int channels)
 {
 	int count = 0;
@@ -655,15 +498,7 @@ static void hdmi_cea_alloc_to_tlv_chmap(struct hdac_chmap *hchmap,
 
 static int spk_mask_from_spk_alloc(int spk_alloc)
 {
-	int i;
-	int spk_mask = eld_speaker_allocation_bits[0];
-
-	for (i = 0; i < ARRAY_SIZE(eld_speaker_allocation_bits); i++) {
-		if (spk_alloc & (1 << i))
-			spk_mask |= eld_speaker_allocation_bits[i];
-	}
-
-	return spk_mask;
+	return snd_cea_spk_mask_from_alloc(spk_alloc | BIT(0));
 }
 
 static int hdmi_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
@@ -692,10 +527,10 @@ static int hdmi_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 
 	for (chs = 2; chs <= max_chs; chs++) {
 		int i;
-		const struct hdac_cea_channel_speaker_allocation *cap;
+		const struct snd_cea_channel_speaker_allocation *cap;
 
-		cap = channel_allocations;
-		for (i = 0; i < ARRAY_SIZE(channel_allocations); i++, cap++) {
+		cap = snd_cea_channel_allocations;
+		for (i = 0; i < snd_cea_channel_allocations_count; i++, cap++) {
 			int chs_bytes = chs * 4;
 			unsigned int tlv_chmap[8];
 
@@ -842,7 +677,6 @@ void snd_hdac_register_chmap_ops(struct hdac_device *hdac,
 {
 	chmap->ops = chmap_ops;
 	chmap->hdac = hdac;
-	init_channel_allocations();
 }
 EXPORT_SYMBOL_GPL(snd_hdac_register_chmap_ops);
 

-- 
2.54.0

