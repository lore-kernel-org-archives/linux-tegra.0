Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045972;
	b=TODYXhxYeHSOXo1L2PrEjf4BPPzrMNYomkfNHICahjqStnGRufQwXm1JQLF3j8qsJAM6
	 AX/XKMDTRA/eJOsrhcMsFIT/vK0Ow+ZTMF5bGv3N1YO1d4iPG1DCLrdu2H0kppABle4Yo
	 zL+LoVpY7DS4qqHJygRkiNfkHN23vtX+YuH6kZy51lfGC77uiYTZ2WYNNypqyudQvU6LZ
	 hnLLM7kcamO09jNUWLNToI9HVrg4/ezyFJ+fLy1cJjQvcYvpGVa4pv7258VdoD/4Iux10
	 XcBkmjkTuXmILjpxnSkJHgvH/7a+G+lr6tiILR5ZCsaVjy+erZ7MVwdb+8ZPk2Mh1Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045972;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wHAlF6yDlXhW0ZWr1IcAwZGVsRcN5yxAZVVVJzrwzhQ=;
	b=f3yyI7KT19DgdlaTy+DvSiXrHrOxDe8ny9DhjooR0IVaCOgSH1BujUj1ZeldnKWvOd52
	 aufbNAEuRh74rSUUGT6WSMMHaeCCsXCzvqcPvXbMRMimqcx4DcVnpOrvd9soGZa+q8g2p
	 cIONP5SU0j+11KlM1gZL2ltiZC9jGocTDuuSEUCpGhOlt8G8OerokS/jEBOtfAfkrHW1w
	 /hYFyPOwCx5xhZ06LOz3yH/Lbu6EipoNih/sVIlo3gLlYXnwjQMCQSqBPbiZSGDOZLNK9
	 B/WPfuu1CO3RMIEJ5CFU/KwZK3dErAnQdXca+fJpSA7XBoY3gHlx76MyBgU7CgkWF/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=HsYjdScD;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA91606A31A;
	Mon, 26 Oct 2026 20:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CA91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=HsYjdScD
X-Virus-Scanned: by amavisd-new using ClamAV (18)
X-Spam-Flag: NO
X-Spam-Score: 4.374
X-Spam-Level: ****
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793045963;
	bh=wHAlF6yDlXhW0ZWr1IcAwZGVsRcN5yxAZVVVJzrwzhQ=;
	h=From:To:Cc:Subject:Date;
	b=HsYjdScDJXTp9VM8GOENlHjEHp8yNBAbzRzaWg/MXWGZdJLVj/HYVcCnkIPwAt2O1
	 2w8b+wpGlLgvUB0hnHLZC+8DkQ2RVkjpVjSCMkw+WExeyjYDsHO/aguT6e7dH6je8b
	 hhlpSG/jQCGATvbWZlSJbgGRwLL0CkV1MVXpVOPq6CxFhyBgYy7sOvcLUuUHQz0L8g
	 el9yg68sdhaddvrWMCNORCS7c3LPYeDczlRAoFqL/kb05Ur9wg5+nBlqo9XxNmHydn
	 j7XQvMjJFXjv5yUYp1sA4th9qg7VeFeH3NiEILLlJYjEwXwvuvA88FmRYQjYUU18+h
	 cTES1dd+SzR5g==
Received: from milkyway (91-150-221-36.dynamic.play.pl [91.150.221.36])
	by server753313.nazwa.pl (Postfix) with ESMTP id 205C61BDF80;
	Mon, 26 Oct 2026 21:19:23 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-tegra@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 00/12] ASoC: Convert last few codecs to set_jack
Date: Mon, 26 Oct 2026 21:19:03 +0100
Message-ID: <20261026201915.57184-1-amade@asmblr.net>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There were still few codecs left using old method of jack detection by
exporting public *_mic_detect() function. Convert them to .set_jack
callback.

First implement the wrapper around *_mic_detect, currently either none
or just one of the arguments is used, so even if function exposes more,
wrap it, by accepting only one. (If in the future there is usecase for
more arguments, it can be easily added, by exposing jack setting struct,
and passing it by data pointer.)

Then convert the boards to use standard snd_soc_component_set_jack call.

And finally remove *_mic_detect() from headers and unexport it.

Amadeusz Sławiński (12):
  ASoC: codecs: wm8903: Implement set_jack callback
  ASoC: codecs: wm8962: Implement set_jack callback
  ASoC: codecs: wm8994: Implement set_jack callback
  ASoC: tegra: tegra_wm8903: Use standard callback to set jack
  ASoC: tegra: tegra_wm8962: Use standard callback to set jack
  ASoC: tegra: tegra_wm8994: Use standard callback to set jack
  ASoC: samsung: littlemill: Use standard callback to set jack
  ASoC: samsung: midas_wm1811: Use standard callback to set jack
  ASoC: samsung: tobermory: Use standard callback to set jack
  ASoC: codecs: wm8903: Make wm8903_mic_detect() static
  ASoC: codecs: wm8962: Make wm8962_mic_detect() static
  ASoC: codecs: wm8994: Make mic detect functions static

 sound/soc/codecs/wm8903.c        | 18 +++++++++++++++---
 sound/soc/codecs/wm8903.h        |  5 -----
 sound/soc/codecs/wm8962.c        | 10 ++++++++--
 sound/soc/codecs/wm8962.h        |  2 --
 sound/soc/codecs/wm8994.c        | 30 +++++++++++++++++++++++-------
 sound/soc/codecs/wm8994.h        |  6 ------
 sound/soc/samsung/littlemill.c   |  6 +-----
 sound/soc/samsung/midas_wm1811.c |  3 +--
 sound/soc/samsung/tobermory.c    |  2 +-
 sound/soc/tegra/tegra_wm8903.c   |  5 ++---
 sound/soc/tegra/tegra_wm8962.c   |  4 ++--
 sound/soc/tegra/tegra_wm8994.c   |  4 ++--
 12 files changed, 55 insertions(+), 40 deletions(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.56.0

