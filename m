Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE7392C32
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2026 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781240028; cv=none; b=cKQhEVP0ic8ewkWrt3V2JSNy2xMCsE5kIjrBTUVF6gwHQjfRBGIZQC2uPzV5i3WsjgdBHBLLrW6zmzzqhslMYDAgkvYjksWMwsaZ8MzXrxGhOKWuJGzRQqc3deBB58dP7nFIQjXuscJXDZr3TkJzyYwvyLjdjnULKl99AsK+wiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781240028; c=relaxed/simple;
	bh=bC5nhyEvwg3cj1rmdxsWPtE4RSLFLa3kIumaK+qkIxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z5f9RCqjmjVb/21EIkxByQhMSiOracyL5Jai2kAb0iCoF4SYq7YOTT88O3ioXk6NybryBbO2AKENEZfAdJGKifMzQfhHEMiWjAwMLW9f2gUHdxxLBXfFNLJQcFNSYlwjGJFLG08Vs7yDEN5dKiOh18jqpibLNK001qLh5lLiWmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhS2NfMq; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhS2NfMq"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304e83724bfso955410eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 21:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781240027; x=1781844827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp7BgDgBWuECqdQGmmB7KB2QqKatc0D86dCpAImgq1s=;
        b=HhS2NfMqfJICVXMpFeKe4Nw1oy78qc1w13WHTHRxesEv5DtTOOz8gLhnZCUPYNHfI1
         kjjJkO8jmPit+2T0xyFTouPHNOwVHuLIZZcuOA47LVvzDiZzLgwBqdDFwuCmwhNI+ZFU
         J2TR6S06CDl93sd08RObj7iB5iLOlgffxopjRcQZPt0quzn/l/kQ+39hJZIK7vzKmp1G
         s9aAAwKZLvmckDbC6jvECBhdxsgw5JCtnifa311XLqW60+ByXjRazsVkjWcIKv7xLJzb
         rnUYspqqJi7CfN0y+fxw312Ff2mM4CuklCkQ/psACG5S1kjH7Z3SLMEjjzW2ec4JQ0f2
         king==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781240027; x=1781844827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rp7BgDgBWuECqdQGmmB7KB2QqKatc0D86dCpAImgq1s=;
        b=QGGD+FO7XmMxI/wSiz7p8SqzQDQ+XofU7jpAyuqIglnWtdg7BeqPvVc2sgVpPGAIDp
         TVlkCArkvsN101modq0KK91dnhkB/rxuPKeoD31sMUw8JyXexr+4dtfdHU5ilwrij8Nz
         WtO1FdB4cK//h6H8Q54rNiEyeQsav4DcNb6DVlbWrOHEPm6e5tTlrcJWRw/hmJobvIzF
         Ar8UgsZvizb8jPLAAz0J9NSchH8/SBuj2R837dNtdjEQQsAniwLUqcvUqQfKNQ2p2Evw
         ri9BCmLJ2N4EuyFvymF5oU0dwvrnZUs2BLaOY4RhQP16rmu84CuvUc6j8sFxTdZm3eFY
         4UJA==
X-Forwarded-Encrypted: i=1; AFNElJ+g7hrKDNnggIXk4o9rCuMNDYubAVGXcSpMkOtf6bwyyMavlJLID8JgbFh9ZPuwSpRJ/4r8D2N+rVhLZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxghaOOTMNzsIHxfQYq4gG5qiOTv8g/MLdlL5iYuP2xqZ7dbtE/
	Szvigaghd4qei2I+1lv/78d0gtgKbxdL7PPrJHbfi9n7kvq6I5DVOBTe
X-Gm-Gg: Acq92OFKyhZAJok0w3u4xWUdXqKjLujxwWqg5L4xFPEULcOUNaxo06XJ/JkXnxW8rI7
	YmKRn+5sA5+pIgQKgpsqgp0IgPCREBpU4/YmX+nYCqTFImZSeLL/eatxzgutb5dz+WYNc6mcUgd
	7Yr87i6F1ldSJsZI+dL29nckjiNBPEUKc1OZtQTFzYw3wp59F7DlcSAzP+bgLUcYOBHkxLXGB3L
	U4b1nGSpMpPMPl92Wi2jOsK3seEny8aAiKcLaYfhymOKA9Hy6YHqhxfuQSnc5WMJJfv0BLWDqpd
	tEKINmuk8cKq3i5/Gp2fuhrK0/JpGSr4MQXH/0jxBtS88LiBlITOXZc0zCtHngrUZuSKpGT6f3h
	qqeqmsXL576YXm31VGlB1UGAbhGSIIpM6n0cHIBIr8jPVAwiLgBeWfgkBuYKbysu5UskTQfAc+P
	1acyYJAscbEgtIwwtc8s3NRAcU9yfDu79e9Idev6u1rl2BTi9z31fOAsBh+Vc9W7/ANgdgGr33e
	A==
X-Received: by 2002:a05:7301:4b17:b0:2d9:a799:3c4f with SMTP id 5a478bee46e88-30820094860mr707464eec.24.1781240026473;
        Thu, 11 Jun 2026 21:53:46 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm1971217eec.8.2026.06.11.21.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:53:46 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 12 Jun 2026 01:53:24 -0300
Subject: [PATCH RFC 2/4] ALSA: hda: Make CEA channel allocation interfaces
 const
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-alsa-cea-channel-allocation-v1-2-b1bcbb6b1051@gmail.com>
References: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
In-Reply-To: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6515;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=bC5nhyEvwg3cj1rmdxsWPtE4RSLFLa3kIumaK+qkIxQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnaEy6y3JtVVlm9uvc5v/eH6N92++Rl1697X1XrvnJfw
 vdQ5uTlHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRmX6MDE9tW4LdeJkLj0oq
 crHdNGOryimy9DdfLM8h/cDitoX+O0aGriblja8rDS+t0Z7VaP3ig5eL1SEtfebPL1LPfkn4W8r
 MCgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The CEA channel allocation descriptors are initialized once and only
read by the HDA channel-map helpers and codec-specific callbacks.

Qualify the pointers passed through these interfaces as const. This
makes their read-only contract explicit and prepares the interfaces for
using an immutable common allocation table.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/hda_chmap.h         |  8 +++++---
 sound/hda/codecs/hdmi/atihdmi.c   |  6 +++---
 sound/hda/codecs/hdmi/nvhdmi.c    |  3 ++-
 sound/hda/codecs/hdmi/tegrahdmi.c |  3 ++-
 sound/hda/core/hdmi_chmap.c       | 12 +++++++-----
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/sound/hda_chmap.h b/include/sound/hda_chmap.h
index e508f3192294..b539595fd5cd 100644
--- a/include/sound/hda_chmap.h
+++ b/include/sound/hda_chmap.h
@@ -28,9 +28,10 @@ struct hdac_chmap_ops {
 	 * for devices that have non-standard mapping requirements.
 	 */
 	int (*chmap_cea_alloc_validate_get_type)(struct hdac_chmap *chmap,
-		struct hdac_cea_channel_speaker_allocation *cap, int channels);
+		const struct hdac_cea_channel_speaker_allocation *cap,
+		int channels);
 	void (*cea_alloc_to_tlv_chmap)(struct hdac_chmap *hchmap,
-		struct hdac_cea_channel_speaker_allocation *cap,
+		const struct hdac_cea_channel_speaker_allocation *cap,
 		unsigned int *chmap, int channels);
 
 	/* check that the user-given chmap is supported */
@@ -71,7 +72,8 @@ void snd_hdac_setup_channel_mapping(struct hdac_chmap *chmap,
 		       int channels, unsigned char *map,
 		       bool chmap_set);
 void snd_hdac_print_channel_allocation(int spk_alloc, char *buf, int buflen);
-struct hdac_cea_channel_speaker_allocation *snd_hdac_get_ch_alloc_from_ca(int ca);
+const struct hdac_cea_channel_speaker_allocation *
+snd_hdac_get_ch_alloc_from_ca(int ca);
 int snd_hdac_chmap_to_spk_mask(unsigned char c);
 int snd_hdac_spk_to_chmap(int spk);
 int snd_hdac_add_chmap_ctls(struct snd_pcm *pcm, int pcm_idx,
diff --git a/sound/hda/codecs/hdmi/atihdmi.c b/sound/hda/codecs/hdmi/atihdmi.c
index 44366f75de33..9afdbf44b6f0 100644
--- a/sound/hda/codecs/hdmi/atihdmi.c
+++ b/sound/hda/codecs/hdmi/atihdmi.c
@@ -262,7 +262,7 @@ static int atihdmi_paired_swap_fc_lfe(int pos)
 static int atihdmi_paired_chmap_validate(struct hdac_chmap *chmap,
 			int ca, int chs, unsigned char *map)
 {
-	struct hdac_cea_channel_speaker_allocation *cap;
+	const struct hdac_cea_channel_speaker_allocation *cap;
 	int i, j;
 
 	/* check that only channel pairs need to be remapped on old pre-rev3 ATI/AMD */
@@ -377,7 +377,7 @@ static int atihdmi_pin_get_slot_channel(struct hdac_device *hdac,
 
 static int atihdmi_paired_chmap_cea_alloc_validate_get_type(
 		struct hdac_chmap *chmap,
-		struct hdac_cea_channel_speaker_allocation *cap,
+		const struct hdac_cea_channel_speaker_allocation *cap,
 		int channels)
 {
 	int c;
@@ -406,7 +406,7 @@ static int atihdmi_paired_chmap_cea_alloc_validate_get_type(
 }
 
 static void atihdmi_paired_cea_alloc_to_tlv_chmap(struct hdac_chmap *hchmap,
-		struct hdac_cea_channel_speaker_allocation *cap,
+		const struct hdac_cea_channel_speaker_allocation *cap,
 		unsigned int *chmap, int channels)
 {
 	/* produce paired maps for pre-rev3 ATI/AMD codecs */
diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
index 94671ad24b5e..eaefa016cdec 100644
--- a/sound/hda/codecs/hdmi/nvhdmi.c
+++ b/sound/hda/codecs/hdmi/nvhdmi.c
@@ -24,7 +24,8 @@ enum {
  * - 0x10de0040
  */
 static int nvhdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
-		struct hdac_cea_channel_speaker_allocation *cap, int channels)
+		const struct hdac_cea_channel_speaker_allocation *cap,
+		int channels)
 {
 	if (cap->ca_index == 0x00 && channels == 2)
 		return SNDRV_CTL_TLVT_CHMAP_FIXED;
diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
index ebb6410a4831..751a50cd4b7d 100644
--- a/sound/hda/codecs/hdmi/tegrahdmi.c
+++ b/sound/hda/codecs/hdmi/tegrahdmi.c
@@ -205,7 +205,8 @@ static int tegra_hdmi_build_pcms(struct hda_codec *codec)
  * - 0x10de0040
  */
 static int nvhdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
-		struct hdac_cea_channel_speaker_allocation *cap, int channels)
+		const struct hdac_cea_channel_speaker_allocation *cap,
+		int channels)
 {
 	if (cap->ca_index == 0x00 && channels == 2)
 		return SNDRV_CTL_TLVT_CHMAP_FIXED;
diff --git a/sound/hda/core/hdmi_chmap.c b/sound/hda/core/hdmi_chmap.c
index c897fc443467..f76b5dcc6433 100644
--- a/sound/hda/core/hdmi_chmap.c
+++ b/sound/hda/core/hdmi_chmap.c
@@ -341,7 +341,7 @@ static void hdmi_std_setup_channel_mapping(struct hdac_chmap *chmap,
 				       bool non_pcm,
 				       int ca)
 {
-	struct hdac_cea_channel_speaker_allocation *ch_alloc;
+	const struct hdac_cea_channel_speaker_allocation *ch_alloc;
 	int i;
 	int err;
 	int order;
@@ -581,7 +581,8 @@ int snd_hdac_get_active_channels(int ca)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_get_active_channels);
 
-struct hdac_cea_channel_speaker_allocation *snd_hdac_get_ch_alloc_from_ca(int ca)
+const struct hdac_cea_channel_speaker_allocation *
+snd_hdac_get_ch_alloc_from_ca(int ca)
 {
 	return &channel_allocations[get_channel_allocation_order(ca)];
 }
@@ -622,7 +623,8 @@ static int hdmi_chmap_ctl_info(struct snd_kcontrol *kcontrol,
 }
 
 static int hdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
-		struct hdac_cea_channel_speaker_allocation *cap, int channels)
+		const struct hdac_cea_channel_speaker_allocation *cap,
+		int channels)
 {
 	/* If the speaker allocation matches the channel count, it is OK.*/
 	if (cap->channels != channels)
@@ -633,7 +635,7 @@ static int hdmi_chmap_cea_alloc_validate_get_type(struct hdac_chmap *chmap,
 }
 
 static void hdmi_cea_alloc_to_tlv_chmap(struct hdac_chmap *hchmap,
-		struct hdac_cea_channel_speaker_allocation *cap,
+		const struct hdac_cea_channel_speaker_allocation *cap,
 		unsigned int *chmap, int channels)
 {
 	int count = 0;
@@ -690,7 +692,7 @@ static int hdmi_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 
 	for (chs = 2; chs <= max_chs; chs++) {
 		int i;
-		struct hdac_cea_channel_speaker_allocation *cap;
+		const struct hdac_cea_channel_speaker_allocation *cap;
 
 		cap = channel_allocations;
 		for (i = 0; i < ARRAY_SIZE(channel_allocations); i++, cap++) {

-- 
2.54.0

