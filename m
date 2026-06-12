Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928839A045
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2026 04:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781240026; cv=none; b=hUn3cAqC8isAyXdh9ERlo3w6r4bQWcbqhnKgxlCl/4paqH2hysWVGg2uxfUlJ2sXtRKzFHzYO0+2lZvOgYm4Slwm3sNV4Ks3wqyODrNWa3POFPlzRiTG2NhRl0nOth701+lJPol3fV3hZBBNVZaMV1w2PplPRPbFgCDKFZpahCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781240026; c=relaxed/simple;
	bh=w3YBz8M9ZOGzP0Nc3LMeQzEwSVmySSMOsxY95RWee7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F45lssl3QquqwVXcGbnBQ+dy5hh49ts1i1FKbjbYTfMPq6Ao6TYGF2i2BG6AjVa08ZllA7kBcZpqwvKvFXxMC7ZEwsKhLCBQqoQbOTDSpz9EneJj/qIF7MNU4dPtEQIVHCdtvteZQnTecDSCY4Hvy03vDbe4/CZijALo6QJE2KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grS8NDzz; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grS8NDzz"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30807ba471bso1753216eec.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 21:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781240023; x=1781844823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+HD8F/AHJd0oNLjuLsJmTXzsCp0fd7yl1LFBZHKrX4=;
        b=grS8NDzzuPR6P+VaawkcUDox4YcDLK3IQS7nwL76e2BY2jCUlrg8rS33T1w5MWprOl
         FlGRI30KIe5+PphewldQpU08VhP+QklFVjXINVoij9eNnRvxE2HO7lBMXtp5RdmbtWhY
         ZZNF2jWsRwMZkJ1RILnQwdsZpIDcaThexLXYu1/ugkAkbYGXba/ymFW6JK2LRo+eXfgg
         Ywn9xQfLH9Qsj7MLfRFXGk2zNdiU07+yMxBNR0AbkPZ0o3/byVrX+q+DBElIgIL12nea
         0FEgmNklNLTb66f+iyNKO75PpgSL1Sd2zhvgsyacgZn4pKtET+9mD7hU5x4u9AwPZlyv
         x+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781240023; x=1781844823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+HD8F/AHJd0oNLjuLsJmTXzsCp0fd7yl1LFBZHKrX4=;
        b=l4KJ5dPj+XTFiP3I22uckF0u4eECHMu6E614ixIjgvP/9Zz9dF2FpXs1YtnAx8UJMo
         7MnS/tpilih2OwYRegoQU+9ajGCVeRDaV+/M5MvfjZGZJLLo5kVNWNnw4YF7qJB9T+/+
         bQe0ITfH008XMVgLAFJP0ccIH67fnBLBlQM7oU/SqKCcy56rE+wp3YyCOusUviJRS+0W
         ucIq2jZZy0xj+3xsTtoc0FRyXOvqz3T8a/QsNixbse6cRcrzuksNylNtGEk2V5eD2t07
         OwoXuAMqamDxW6tgE9BD2a1Kiac5JZfssDYSQRHXtHD7u0haErCYRGgnE4G2U9AnuHH3
         ncwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RMbnKv0ln6fu2RkodNI3Fd2xvpzNiNZn6746Alq2qpPRHmcOPpoKALH+j8B2LvWFEcbiGTPWGMpBqOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdosOugc9VZr8XtY7zxYwbUnTu0k8w5Kn516JN9AOcUZWe717
	QnimjGqXC0XEzy3C7HR4P/zOZ8cqb34+Ozi1oS9/rrj6NkCtoFzlqMIetjw42Lk4
X-Gm-Gg: Acq92OEMllQdJWDxmNX0A2/fN4YtlZhI136O0MXwqCvK1QkRBOLLbOZsZbewKIRHVxl
	t6hylUt34EeHVfkxZMep87+X4phL5OEZCy96CvqcYrLXrLL+McYqwhhETBFmSZeeNQqcgPF5H3A
	6/onU55A3x45keTjPB6Kwc2eHDp9JjWnQewfBJVD/xEk6CWYtc0TFylhu7jyNBeYyGsmNS4S575
	AZL6SaIo49/l1I8AB70Fxo8gJWhq0V4TWJx7/9ZuPPPdFKF7ckOzUNr2o1H+Hl/2ZPbDn92Tjsd
	1+FjdPeDxBvMj18VvqiwmtyjDZNWg+cD7BNRXptt0F3x7m8eCTCYTOljYqnMb35ujnd62fqYb9u
	WJQOby0AdgCI/yaqULBhvden8sgteruhaHK2wloCYoNs9VRYxzPxbbCthuGGuAsFRXk2En2yrdf
	fkqXJ1H565IyauMysCFsvabATvli19FnXUF4wrdmEzl6aKCCT/ByiYxZEMjU+XwwHIhaPIpw0UC
	Q==
X-Received: by 2002:a05:693c:2b06:b0:304:1fb6:88fd with SMTP id 5a478bee46e88-308200c6990mr742830eec.29.1781240023420;
        Thu, 11 Jun 2026 21:53:43 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm1971217eec.8.2026.06.11.21.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:53:43 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 12 Jun 2026 01:53:23 -0300
Subject: [PATCH RFC 1/4] ALSA: pcm: Add common CEA channel allocation
 helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-alsa-cea-channel-allocation-v1-1-b1bcbb6b1051@gmail.com>
References: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
In-Reply-To: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10123;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=w3YBz8M9ZOGzP0Nc3LMeQzEwSVmySSMOsxY95RWee7o=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnaEy7cOf0+YFnjIr9/Qoysj76dD1f7fX3d2fW8rh5B4
 WLyU9c86ChlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJmNYx/PcrCHs6p1ykwjB0
 Ze+ftPaeexMuPmy73979MeSK1IIPu3oZGVYJ+qi1V76N8WSf9iSLx75ELJo5ukpnDfObu2KHJOa
 7sgMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

HDA HDMI and Intel HDMI LPE carry independent copies of the ordered
CEA-861 channel allocation table, ELD speaker expansion, and allocation
selection loop. The copies originated from the same implementation but
already differ in table coverage and fallback policy.

Move the immutable descriptors and common transformations next to the
other PCM DRM ELD helpers. Build the derived channel count and speaker
mask at compile time, and make table range and fallback policy explicit
arguments so consumers can preserve their existing contracts.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/pcm_drm_eld.h |  16 ++++
 sound/core/pcm_drm_eld.c    | 181 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)

diff --git a/include/sound/pcm_drm_eld.h b/include/sound/pcm_drm_eld.h
index 5a38413ada91..917228e97375 100644
--- a/include/sound/pcm_drm_eld.h
+++ b/include/sound/pcm_drm_eld.h
@@ -2,6 +2,8 @@
 #ifndef __SOUND_PCM_DRM_ELD_H
 #define __SOUND_PCM_DRM_ELD_H
 
+struct snd_info_buffer;
+
 enum eld_versions {
 	ELD_VER_CEA_861D	= 2,
 	ELD_VER_PARTIAL		= 31,
@@ -84,6 +86,20 @@ struct snd_parsed_hdmi_eld {
 	struct snd_cea_sad sad[ELD_MAX_SAD];
 };
 
+struct snd_cea_channel_speaker_allocation {
+	unsigned int ca_index;
+	unsigned int speakers[8];
+	unsigned int channels;
+	unsigned int spk_mask;
+};
+
+extern const struct snd_cea_channel_speaker_allocation
+	snd_cea_channel_allocations[];
+extern const unsigned int snd_cea_channel_allocations_count;
+unsigned int snd_cea_spk_mask_from_alloc(unsigned int spk_alloc);
+int snd_cea_channel_allocation(unsigned int spk_alloc, unsigned int channels,
+			       unsigned int max_ca, bool fallback);
+
 int snd_pcm_hw_constraint_eld(struct snd_pcm_runtime *runtime, void *eld);
 
 int snd_parse_eld(struct device *dev, struct snd_parsed_hdmi_eld *e,
diff --git a/sound/core/pcm_drm_eld.c b/sound/core/pcm_drm_eld.c
index 1941ee520063..20156a9e3ed9 100644
--- a/sound/core/pcm_drm_eld.c
+++ b/sound/core/pcm_drm_eld.c
@@ -24,6 +24,187 @@
 #define SAD1_RATE_176400_MASK	BIT(5)
 #define SAD1_RATE_192000_MASK	BIT(6)
 
+/*
+ * CEA speaker placement:
+ *
+ *        FLH       FCH        FRH
+ *  FLW    FL  FLC   FC   FRC   FR   FRW
+ *
+ *                                  LFE
+ *                     TC
+ *
+ *          RL  RLC   RC   RRC   RR
+ *
+ * The Left/Right Surround channel notions LS/RS in SMPTE 320M correspond to
+ * CEA RL/RR; the SMPTE channel assignment C/LFE is swapped to CEA LFE/FC.
+ */
+enum cea_speaker_placement {
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
+};
+
+#define CEA_CHANNEL_ALLOCATION(_ca, _s7, _s6, _s5, _s4, _s3, _s2, _s1, _s0) \
+	{ .ca_index = (_ca), .speakers = { (_s7), (_s6), (_s5), (_s4), \
+		(_s3), (_s2), (_s1), (_s0) }, \
+	  .channels = !!(_s7) + !!(_s6) + !!(_s5) + !!(_s4) + \
+		!!(_s3) + !!(_s2) + !!(_s1) + !!(_s0), \
+	  .spk_mask = (_s7) | (_s6) | (_s5) | (_s4) | (_s3) | (_s2) | \
+		(_s1) | (_s0) }
+
+/*
+ * This is an ordered list. Earlier entries have a better chance of being
+ * selected by snd_cea_channel_allocation().
+ */
+const struct snd_cea_channel_speaker_allocation snd_cea_channel_allocations[] = {
+	/*                         channel:  7    6    5    4    3    2    1    0 */
+	CEA_CHANNEL_ALLOCATION(0x00,   0,   0,   0,   0,   0,   0,  FR,  FL),
+	/* 2.1 */
+	CEA_CHANNEL_ALLOCATION(0x01,   0,   0,   0,   0,   0, LFE,  FR,  FL),
+	/* Dolby Surround */
+	CEA_CHANNEL_ALLOCATION(0x02,   0,   0,   0,   0,  FC,   0,  FR,  FL),
+	/* surround40 */
+	CEA_CHANNEL_ALLOCATION(0x08,   0,   0,  RR,  RL,   0,   0,  FR,  FL),
+	/* surround41 */
+	CEA_CHANNEL_ALLOCATION(0x09,   0,   0,  RR,  RL,   0, LFE,  FR,  FL),
+	/* surround50 */
+	CEA_CHANNEL_ALLOCATION(0x0a,   0,   0,  RR,  RL,  FC,   0,  FR,  FL),
+	/* surround51 */
+	CEA_CHANNEL_ALLOCATION(0x0b,   0,   0,  RR,  RL,  FC, LFE,  FR,  FL),
+	/* 6.1 */
+	CEA_CHANNEL_ALLOCATION(0x0f,   0,  RC,  RR,  RL,  FC, LFE,  FR,  FL),
+	/* surround71 */
+	CEA_CHANNEL_ALLOCATION(0x13, RRC, RLC,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x03,   0,   0,   0,   0,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x04,   0,   0,   0,  RC,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x05,   0,   0,   0,  RC,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x06,   0,   0,   0,  RC,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x07,   0,   0,   0,  RC,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x0c,   0,  RC,  RR,  RL,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x0d,   0,  RC,  RR,  RL,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x0e,   0,  RC,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x10, RRC, RLC,  RR,  RL,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x11, RRC, RLC,  RR,  RL,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x12, RRC, RLC,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x14, FRC, FLC,   0,   0,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x15, FRC, FLC,   0,   0,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x16, FRC, FLC,   0,   0,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x17, FRC, FLC,   0,   0,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x18, FRC, FLC,   0,  RC,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x19, FRC, FLC,   0,  RC,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x1a, FRC, FLC,   0,  RC,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x1b, FRC, FLC,   0,  RC,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x1c, FRC, FLC,  RR,  RL,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x1d, FRC, FLC,  RR,  RL,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x1e, FRC, FLC,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x1f, FRC, FLC,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x20,   0, FCH,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x21,   0, FCH,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x22,  TC,   0,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x23,  TC,   0,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x24, FRH, FLH,  RR,  RL,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x25, FRH, FLH,  RR,  RL,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x26, FRW, FLW,  RR,  RL,   0,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x27, FRW, FLW,  RR,  RL,   0, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x28,  TC,  RC,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x29,  TC,  RC,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x2a, FCH,  RC,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x2b, FCH,  RC,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x2c,  TC, FCH,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x2d,  TC, FCH,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x2e, FRH, FLH,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x2f, FRH, FLH,  RR,  RL,  FC, LFE,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x30, FRW, FLW,  RR,  RL,  FC,   0,  FR,  FL),
+	CEA_CHANNEL_ALLOCATION(0x31, FRW, FLW,  RR,  RL,  FC, LFE,  FR,  FL),
+};
+EXPORT_SYMBOL_GPL(snd_cea_channel_allocations);
+
+const unsigned int snd_cea_channel_allocations_count =
+	ARRAY_SIZE(snd_cea_channel_allocations);
+EXPORT_SYMBOL_GPL(snd_cea_channel_allocations_count);
+
+/* ELD SA bits in the CEA Speaker Allocation data block. */
+static const unsigned int eld_speaker_allocation_bits[] = {
+	[0] = FL | FR,
+	[1] = LFE,
+	[2] = FC,
+	[3] = RL | RR,
+	[4] = RC,
+	[5] = FLC | FRC,
+	[6] = RLC | RRC,
+	/* Not represented by the baseline ELD speaker allocation byte. */
+	[7] = FLW | FRW,
+	[8] = FLH | FRH,
+	[9] = TC,
+	[10] = FCH,
+};
+
+unsigned int snd_cea_spk_mask_from_alloc(unsigned int spk_alloc)
+{
+	unsigned int spk_mask = 0;
+	int i;
+
+	/* Expand ELD's compact, paired speaker allocation into a full mask. */
+	for (i = 0; i < ARRAY_SIZE(eld_speaker_allocation_bits); i++)
+		if (spk_alloc & BIT(i))
+			spk_mask |= eld_speaker_allocation_bits[i];
+
+	return spk_mask;
+}
+EXPORT_SYMBOL_GPL(snd_cea_spk_mask_from_alloc);
+
+/*
+ * The transformation takes two steps:
+ *
+ *      spk_alloc => eld_speaker_allocation_bits[] => spk_mask
+ *       spk_mask => snd_cea_channel_allocations[] => CA
+ *
+ * TODO: it could select the wrong CA from multiple candidates.
+ */
+int snd_cea_channel_allocation(unsigned int spk_alloc, unsigned int channels,
+			       unsigned int max_ca, bool fallback)
+{
+	unsigned int spk_mask, i;
+
+	/* CA 0 is the basic stereo allocation. */
+	if (channels <= 2)
+		return 0;
+
+	spk_mask = snd_cea_spk_mask_from_alloc(spk_alloc);
+	for (i = 0; i < snd_cea_channel_allocations_count; i++) {
+		const struct snd_cea_channel_speaker_allocation *ca;
+
+		ca = &snd_cea_channel_allocations[i];
+		if (ca->ca_index <= max_ca && ca->channels == channels &&
+		    (spk_mask & ca->spk_mask) == ca->spk_mask)
+			return ca->ca_index;
+	}
+
+	/* Fall back to the preferred allocation with the requested channels. */
+	if (fallback)
+		for (i = 0; i < snd_cea_channel_allocations_count; i++)
+			if (snd_cea_channel_allocations[i].ca_index <= max_ca &&
+			    snd_cea_channel_allocations[i].channels == channels)
+				return snd_cea_channel_allocations[i].ca_index;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_cea_channel_allocation);
+
 static const unsigned int eld_rates[] = {
 	32000,
 	44100,

-- 
2.54.0

