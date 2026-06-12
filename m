Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811434B1AD
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2026 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781240035; cv=none; b=mFU45oa4Me0SXtOz01UKRtlLtUCb+AF2tshNtyEHG4J8c0ysALjVuAWQ6WvXD5oeUj/PK1xcoC148K6ylJ0SNJ673qr+LXrZBhETJUmlZI0UIKi+3AVHgg5InhULp4XxNssjl2h4sx3IS7FdQh7gAhm4aw5OrkqHcs49wG0mEFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781240035; c=relaxed/simple;
	bh=bC/8un0gjlQzbn6mx8nfwiMtVZXofE+XiUEEsbGFVz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+lpL+oJn0vVQXgaLcHKJ8QJcSd6Q6/LYCPaH6D+k7XXnjUNDLOfW0Gp/m7pMz9WhkscJEN6VXRaJMdy8G5Hr3apVtAuKuNwYMKpsaAd5ZzphzhPXavQqj2RjKYfnnFMaK7D49oyheVTK2n159BrScNamnZNjKU/+6RY8mzByWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNqksR1F; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNqksR1F"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3042a388168so945005eec.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 21:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781240033; x=1781844833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVcQQd4sC+ylekkm5CE3VRYg0x6kzjaCjRpitPRM408=;
        b=aNqksR1FFgPmom3xbSB5+HcovsbFKGiHWi4IFUkUV38hT9KSf79E1Wy7qATdvhvFea
         wFFegE3SpCMRQIzb0nVvd3UPypWfJ9kEk2L53PPOUyWLnTGT7cLWzVMC+fIXnXmtbP2X
         DHPkX28OTvJMfPocCLu2xAOtC9r1ycZDZqZwztAvmm/K0mK+0Cm1TX2KTqc5PDsJWuBA
         IY1noSToSkSvp4QDanLC1cJBUhKkwCZNeA267oB9iItBvHaLIEDGgkdRCk9Te5QPg4l7
         zax/93xWYJImnGs2wEuHmLSc0vff149fSDqwcILU9rehdqQVd52UMMz0NcSnH7bgGnI0
         N8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781240033; x=1781844833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVcQQd4sC+ylekkm5CE3VRYg0x6kzjaCjRpitPRM408=;
        b=HXqQfflIW4IRz0jDokYFMTGZJtw+8I1d3N3+4o1er97Ap8hel5M95fSorNTnxy6nR+
         O569WwvXe76nBx8AIAO77vZXwzFNTUb+eljjne9gys1hIo/jO0hd9kQyiayykmG98K9K
         2fsd9erpBuwzU7LyXWOtPcoqFPBaHdcFuiZ1Q29Tf6UWsyNFZOfv7Lk2kJHeApg9SVRc
         Wrsck5vHK69fNfcTbEggNKkaedBAhMcolXFCg5WgNRtP+Dspy5RhxBEoEOM5gzE4d7FJ
         GTqzA7r6mnQ2jKXC7Cdw9Mqziq2Vi5uamVyuao+YUT/I8MsydlSbEKMiCCh8NUZbInOE
         TNjA==
X-Forwarded-Encrypted: i=1; AFNElJ8FOUl6i/Ddl7moQ3uaNxejtVzIp83V26E9nnU9rlg9iuDP5W8UP1QVsPlepHKmuAsOHOfbhJt4xjVBdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoL9Xab09moM689WTBsDfqjbqES12xZSpItKcuBkdhrC49XW8r
	UfN+fHcv9zXUdR77KTWaPTYRUu9DvdXhQAIV+teRxRpjcjBtbRQXEebg
X-Gm-Gg: Acq92OEH7VHg9VDfH2XR00FRuPupSezDeANJGl2slKscfT6YfJyD567PVsEBhQygeH1
	fqKQ7qE4GKdyroJAQpYBxzsnrtDcrwDqZx+yalTHagEFfLxY3nsrJ8yi9R1TwiZiLHPsFWeu4fY
	VZNcCV0a8rc5cyuvDvG4g++ycyOISV/V7TJQofDPffwAnuk+ClTn7ThML/hhJi9e7T1JwDIZxfh
	uWnYXW3UpMw/QeI0yNVjsYopJehuRxVeDzM7zMtBU9ap4HRS9xxrSEuDQRNOKn59UmhemJeAUAg
	ydi0ip0gF/UxRTcJPa76TWRifg4nbxHu0bN3qlOMuWdUo8RpcmnHwICMj1MdByb0uRDemS/4A8M
	wW+A+Vwk0OAu+TWrFkGO3oft9lb0yKUXD6R73+cgnmHaue1UmoHuMQEOffxK/mqDl9oypQArOl3
	ErH1FdIB/gZp/sZpwWYdtQPoHGiH3XD/84eyci2ze7Nb8aeW9cR2ykKPoUuK8I9mVom5dKrK7BK
	g==
X-Received: by 2002:a05:7301:e8b:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-3081ddff1d0mr594316eec.3.1781240032969;
        Thu, 11 Jun 2026 21:53:52 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm1971217eec.8.2026.06.11.21.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:53:52 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 12 Jun 2026 01:53:26 -0300
Subject: [PATCH RFC 4/4] ALSA: x86: Use common CEA channel allocations
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-alsa-cea-channel-allocation-v1-4-b1bcbb6b1051@gmail.com>
References: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
In-Reply-To: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9800;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=bC/8un0gjlQzbn6mx8nfwiMtVZXofE+XiUEEsbGFVz8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnaEy6e7VmZqcibc5pl+r+yyLlvDh6d/yZsu5x7NPOla
 V7NDUaJHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCR9yIM/yzymDY3JDrMrHw/
 N1CrN9czjqd6SeoPL6PsZ5vCd8q7BTD8d2nl2/Rzq4Scauoxidu96coVMote7fqy4tJhtiIBjY9
 T+QE=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Replace the Intel HDMI LPE copy of the CEA allocation table and selector
with the common PCM ELD helpers. Preserve the driver's existing limits:
only ELD speaker bits 0 through 6 participate, only CA values through
0x1f are considered, and an incompatible ELD does not use HDA's fallback.

Select SND_PCM_ELD for the new helper dependency.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/x86/Kconfig            |   1 +
 sound/x86/intel_hdmi_audio.c | 158 ++++++-------------------------------------
 sound/x86/intel_hdmi_audio.h |   9 ---
 3 files changed, 20 insertions(+), 148 deletions(-)

diff --git a/sound/x86/Kconfig b/sound/x86/Kconfig
index 4ffcc5e623c2..a990989a12b9 100644
--- a/sound/x86/Kconfig
+++ b/sound/x86/Kconfig
@@ -12,6 +12,7 @@ config HDMI_LPE_AUDIO
 	tristate "HDMI audio without HDAudio on Intel Atom platforms"
 	depends on DRM_I915
 	select SND_PCM
+	select SND_PCM_ELD
 	help
 	 Choose this option to support HDMI LPE Audio mode
 
diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 91dfcf47e979..4ea29c3ea6c5 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -26,6 +26,7 @@
 #include <sound/core.h>
 #include <sound/asoundef.h>
 #include <sound/pcm.h>
+#include <sound/pcm_drm_eld.h>
 #include <sound/pcm_params.h>
 #include <sound/initval.h>
 #include <sound/control.h>
@@ -57,72 +58,6 @@ module_param(single_port, bool, 0444);
 MODULE_PARM_DESC(single_port,
 		"Single-port mode (for compatibility)");
 
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
-	[7] = 0,
-};
-
-/*
- * This is an ordered list!
- *
- * The preceding ones have better chances to be selected by
- * hdmi_channel_allocation().
- */
-static struct cea_channel_speaker_allocation channel_allocations[] = {
-/*                        channel:   7     6    5    4    3     2    1    0  */
-{ .ca_index = 0x00,  .speakers = {   0,    0,   0,   0,   0,    0,  FR,  FL } },
-				/* 2.1 */
-{ .ca_index = 0x01,  .speakers = {   0,    0,   0,   0,   0,  LFE,  FR,  FL } },
-				/* Dolby Surround */
-{ .ca_index = 0x02,  .speakers = {   0,    0,   0,   0,  FC,    0,  FR,  FL } },
-				/* surround40 */
-{ .ca_index = 0x08,  .speakers = {   0,    0,  RR,  RL,   0,    0,  FR,  FL } },
-				/* surround41 */
-{ .ca_index = 0x09,  .speakers = {   0,    0,  RR,  RL,   0,  LFE,  FR,  FL } },
-				/* surround50 */
-{ .ca_index = 0x0a,  .speakers = {   0,    0,  RR,  RL,  FC,    0,  FR,  FL } },
-				/* surround51 */
-{ .ca_index = 0x0b,  .speakers = {   0,    0,  RR,  RL,  FC,  LFE,  FR,  FL } },
-				/* 6.1 */
-{ .ca_index = 0x0f,  .speakers = {   0,   RC,  RR,  RL,  FC,  LFE,  FR,  FL } },
-				/* surround71 */
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
-};
-
 static const struct channel_map_table map_tables[] = {
 	{ SNDRV_CHMAP_FL,       0x00,   FL },
 	{ SNDRV_CHMAP_FR,       0x01,   FR },
@@ -384,68 +319,13 @@ static int had_init_audio_ctrl(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/*
- * Compute derived values in channel_allocations[].
- */
-static void init_channel_allocations(void)
-{
-	int i, j;
-	struct cea_channel_speaker_allocation *p;
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
-/*
- * The transformation takes two steps:
- *
- *      eld->spk_alloc => (eld_speaker_allocation_bits[]) => spk_mask
- *            spk_mask => (channel_allocations[])         => ai->CA
- *
- * TODO: it could select the wrong CA from multiple candidates.
- */
 static int had_channel_allocation(struct snd_intelhad *intelhaddata,
 				  int channels)
 {
-	int i;
-	int ca = 0;
-	int spk_mask = 0;
-
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
-
-	for (i = 0; i < ARRAY_SIZE(eld_speaker_allocation_bits); i++) {
-		if (intelhaddata->eld[DRM_ELD_SPEAKER] & (1 << i))
-			spk_mask |= eld_speaker_allocation_bits[i];
-	}
+	int ca;
 
-	/* search for the first working match in the CA table */
-	for (i = 0; i < ARRAY_SIZE(channel_allocations); i++) {
-		if (channels == channel_allocations[i].channels &&
-		(spk_mask & channel_allocations[i].spk_mask) ==
-				channel_allocations[i].spk_mask) {
-			ca = channel_allocations[i].ca_index;
-			break;
-		}
-	}
+	ca = snd_cea_channel_allocation(intelhaddata->eld[DRM_ELD_SPEAKER] & 0x7f,
+					channels, 0x1f, false);
 
 	dev_dbg(intelhaddata->dev, "select CA 0x%x for %d\n", ca, channels);
 
@@ -487,7 +367,7 @@ static void had_build_channel_allocation_map(struct snd_intelhad *intelhaddata)
 	/*
 	 * Sink may support more than 8 channels, if eld_high has more than
 	 * one bit set. SOC supports max 8 channels.
-	 * Refer eld_speaker_allocation_bits, for sink speaker allocation
+	 * Refer the CEA ELD speaker allocation mapping for sink allocation.
 	 */
 
 	/* if 0x2F < eld < 0x4F fall back to 0x2f, else fall back to 0x4F */
@@ -505,24 +385,25 @@ static void had_build_channel_allocation_map(struct snd_intelhad *intelhaddata)
 		}
 	}
 
-	for (i = 0; i < ARRAY_SIZE(eld_speaker_allocation_bits); i++) {
-		if (intelhaddata->eld[DRM_ELD_SPEAKER] & (1 << i))
-			spk_mask |= eld_speaker_allocation_bits[i];
-	}
+	spk_mask = snd_cea_spk_mask_from_alloc(intelhaddata->eld[DRM_ELD_SPEAKER] &
+						 0x7f);
 
-	for (i = 0; i < ARRAY_SIZE(channel_allocations); i++) {
-		if (spk_mask == channel_allocations[i].spk_mask) {
-			for (c = 0; c < channel_allocations[i].channels; c++) {
-				chmap->map[c] = spk_to_chmap(
-					channel_allocations[i].speakers[
-						(MAX_SPEAKERS - 1) - c]);
-			}
-			chmap->channels = channel_allocations[i].channels;
+	for (i = 0; i < snd_cea_channel_allocations_count; i++) {
+		const struct snd_cea_channel_speaker_allocation *ca;
+
+		ca = &snd_cea_channel_allocations[i];
+		if (ca->ca_index > 0x1f)
+			continue;
+		if (spk_mask == ca->spk_mask) {
+			for (c = 0; c < ca->channels; c++)
+				chmap->map[c] =
+					spk_to_chmap(ca->speakers[MAX_SPEAKERS - 1 - c]);
+			chmap->channels = ca->channels;
 			intelhaddata->chmap->chmap = chmap;
 			break;
 		}
 	}
-	if (i >= ARRAY_SIZE(channel_allocations))
+	if (i >= snd_cea_channel_allocations_count)
 		kfree(chmap);
 }
 
@@ -1723,7 +1604,6 @@ static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	init_channel_allocations();
 
 	card_ctx->num_pipes = pdata->num_pipes;
 	card_ctx->num_ports = single_port ? 1 : pdata->num_ports;
diff --git a/sound/x86/intel_hdmi_audio.h b/sound/x86/intel_hdmi_audio.h
index 88bf9ef2c491..21cec605a879 100644
--- a/sound/x86/intel_hdmi_audio.h
+++ b/sound/x86/intel_hdmi_audio.h
@@ -44,15 +44,6 @@ enum cea_speaker_placement {
 	LFE = (1 << 10),        /* Low Frequency Effect */
 };
 
-struct cea_channel_speaker_allocation {
-	int ca_index;
-	int speakers[8];
-
-	/* derived values, just for convenience */
-	int channels;
-	int spk_mask;
-};
-
 struct channel_map_table {
 	unsigned char map;              /* ALSA API channel map position */
 	unsigned char cea_slot;         /* CEA slot value */

-- 
2.54.0

