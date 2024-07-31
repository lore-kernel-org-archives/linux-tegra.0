Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A062171;
	Wed, 31 Jul 2024 19:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453251; cv=none; b=aSB6I4ioFaHgnGrNv55RvV+hp6D+4IKesygcohASQMbZXEnTyA95f6D8nDfgjEMpL7vDcquR462VaSKRyfb6ajOTL/QIe3Uyd5OWZOcKylxcVIOn0kzwQMe/4AjN9d+o0niVYbSJPbtyxPoCBc4UsClTTVMhy6HMVHUiGhNLe8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453251; c=relaxed/simple;
	bh=WRL9MTV5KVviP3ADIdFaB0RE+d1s1I+xQRWRxhsKF+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qt4bEm27oI0bV43nKVhKBEla0Il/lIOejQfRj2qMzYtUasqJKSKwUrZkv+0lFkgB721YJyRxNy/sHkzdfnrDc0IUvUlIe5QceNmxI3PYA0ZREQGYxggYSNjiHPZylgydFhoBGGBH4k48LMGP/mgXqlixj6dT+87NNzWowU/Nd7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/V/n5YR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/V/n5YR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BE5C116B1;
	Wed, 31 Jul 2024 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453250;
	bh=WRL9MTV5KVviP3ADIdFaB0RE+d1s1I+xQRWRxhsKF+w=;
	h=From:To:Cc:Subject:Date:From;
	b=c/V/n5YRs6QlM+Fvt4Y5SmXFYofH8UtyZGaKhlShpb0drs+6OpECP3YLOk824/iY/
	 PfMUSB/MuC2cXTsODvH5L197Eoaq7n4Wr2hNKXmcm0yl+xaeoAKs35fsTLs9kJrHqz
	 35TIvMh74xhyxv0iVcW+4vYHdIEenTPKWC0IvHxnqhYx6cT2khqii4cvoSgt5wSLAJ
	 VyyUVQ1dsAzJeV8/SlqtIvGnz+K9Jj2MpfaLMPoHdZAIO0EeSs3Ak3j6EzW5ELSaRP
	 Ag2aj2+UPf14Wdo7I4+Fho2VPxB0ub/Num0m3nqK4YoaECt/ARhWR2J/Vm+0Ux7alZ
	 APN5+Xz/tNR3Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:57 -0600
Message-ID: <20240731191312.1710417-19-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_property_present() to test for property presence rather than
of_get_property(). This is part of a larger effort to remove callers
of of_get_property() and similar functions. of_get_property() leaks
the DT property data pointer which is a problem for dynamically
allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 sound/soc/fsl/mpc5200_psc_i2s.c | 2 +-
 sound/soc/tegra/tegra_pcm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index af8b9d098d2d..931b430fa983 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -184,7 +184,7 @@ static int psc_i2s_of_probe(struct platform_device *op)
 
 	/* Check for the codec handle.  If it is not present then we
 	 * are done */
-	if (!of_get_property(op->dev.of_node, "codec-handle", NULL))
+	if (!of_property_present(op->dev.of_node, "codec-handle"))
 		return 0;
 
 	/* Due to errata in the dma mode; need to line up enabling
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 4bdbcd2635ef..05d59e03b1c5 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -213,7 +213,7 @@ int tegra_pcm_construct(struct snd_soc_component *component,
 	 * Fallback for backwards-compatibility with older device trees that
 	 * have the iommus property in the virtual, top-level "sound" node.
 	 */
-	if (!of_get_property(dev->of_node, "iommus", NULL))
+	if (!of_property_present(dev->of_node, "iommus"))
 		dev = rtd->card->snd_card->dev;
 
 	return tegra_pcm_dma_allocate(dev, rtd, tegra_pcm_hardware.buffer_bytes_max);
-- 
2.43.0

