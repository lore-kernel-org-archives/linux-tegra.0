Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC32EA16C
	for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780087; cv=none; b=T1syDyR8kHNkhXahl7l+LtMFeEZVsvTk1dEXm6cFpEs2csTtKvnzOxRVCiNgoXO7IE3DBjWcmuSgROpqh7qsKo4LVuroNXiMufTn1CFtqhEhl3f1816Bcq3VI3YY3xylflH3bW+K1sXnfwoRG4BLqH77mUriiUwWlegPbIlde60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780087; c=relaxed/simple;
	bh=PszrTvwUFgAHB3Pe1B87ctHo6r4Aoe2ej2tGVNg4EMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HzfbA/8k/89qRX3JTgnGe3BUmJLFC+ibcuRDLtevZ3Ve8TwFRmSYh5qqXzBUf/exjwVuimxVHiSjIXY/IBXJoyXea3GUjSeAVllA7tdAkcrF/C30MTCaEOWg/tqBtCM12TSE2j3u/kpYifo9LBge10uwMMCXl3lv1DaQuWpGTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCqAJpzL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCqAJpzL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1192279f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 30 Jan 2026 05:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780085; x=1770384885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvNmHZTLWASawbmDuih3QJ/Sdk0W5SUborAMkDuuQ7s=;
        b=NCqAJpzLudUuuPz5x4NMjcedLQw4MzWdIBGxdl1gMZyTzmeBhd1JF3/4vp3WFUJgtz
         UqDRTxINI4k64ZwrqYzgJEwFESAf3BtA5dz+Z62PUQ0rp8uSwc+IIw90S20o5WXlWzJ2
         SYJo6SKLzpjEiEiEfk7Cjrr1mIuYuULmfyuPvn7B4EWg07LohQx/sGsLw5ktADfa//k1
         LPWCScWAjjILkyff6dDN7eXzuwuG8Z553afQo2O0x9OiO/2OlvozrwiRBmHMqSuyUgCK
         DKyrFVthGmrqdSlyNqlXTRW4Pvg12wuUELVHl4TjoSIkTz1eMs/3qP7wx1tWfSpSTfDg
         KkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780085; x=1770384885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvNmHZTLWASawbmDuih3QJ/Sdk0W5SUborAMkDuuQ7s=;
        b=MoRy0a9JD4cWSpwlh6qdfdYr7e3G33M9LgEBFFEHx/gbq4oW5YX8Nt3LyQ78sdK3BN
         +fgqBh3ZliWZ70I822FLSIyksjeNnFBKWTa9v1uLmhCLo870j+eooaHAq9bgNyUzwj95
         Ff8lV9y5mm014danYA/F8O0uLFRxUDezJtZvg7y6qONQqziTYTh0pt4JKDltSKR8xr1a
         HG1DQ6FCddzI926fYqFzYymHTGPeS9n8awQyCD/IRRd+aM3D9hDiiD812t+2SFjvydaE
         KN27uO1sXBtC7Jx8//te31OItRR6yizJGi51jwmTqH4Ef4s4cIiWe6WGtUZymVkANCb1
         nfQw==
X-Forwarded-Encrypted: i=1; AJvYcCVWa1LVFdp8vUq98uARNBr5/qJV1vcPJ6bCIUzUnZW+COxplt3l22SJ8Bx8ydIqZKi9zbVF1gMueePNSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcdigFTNjQ3jlwxMT8yCe9CxG1aEJnUD4OyU8Tgu7J6fuPePXT
	QzVXLRd1QpHF6aMjWftYtaB5TYRXBKNvo543TJ8KVVjR9oUderum5mgg
X-Gm-Gg: AZuq6aIrdCL1tqkc38t5TAa4GnOyBiV0CjvTId2ksNcXdxKVilWaLIuNk2QzlAmvSot
	/yfNRjGKUms5812w0J4IAgY5yiCQ4a0DMwL9y58/RmvQiJZmBnbcC9qlVKFSoKlZNDF/sZyxm2Y
	UzpsIRH/XGoze6wBkyWOnJvnEzig6Cpm0Kinmeg/gX6hGRjKhiZfsBq9VQJEpRK3OYJVLLlVOWE
	CzTNmDGkntkGeJiAiVYVsb2NuNY00zKWJd7L1TWnErThQM/BJdhqA/9dcRoCAbp5XnPTPNryM8c
	+rgw1cReB+7wWptq1NXQc0srklx1gtgzQRo1e2UOyDzgrTcq/V/6L7TzEHlAlj9DWv6yn5wkTip
	JaUv2e2ramM26NnhHAk1XiO9ehCi0g45s+JUT0+PKrabOcHlgVW8dsU5VdPEkqJdmQiGz0YX2Iq
	N3
X-Received: by 2002:a05:6000:2401:b0:432:a9db:f99b with SMTP id ffacd0b85a97d-435f3a0ccafmr3862527f8f.0.1769780084484;
        Fri, 30 Jan 2026 05:34:44 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] ASoC: tegra: Add support for WM8962 and CPCAP codecs
Date: Fri, 30 Jan 2026 15:34:30 +0200
Message-ID: <20260130133434.353353-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for WM8962 and CPCAP codecs found in various Tegra devices.

Jonas Schwöbel (1):
  ASoC: tegra: Support WM8962 by machine driver

Svyatoslav Ryhel (3):
  ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
  ASoC: tegra: Support CPCAP by machine driver
  ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC

 .../sound/nvidia,tegra-audio-cpcap.yaml       |  85 +++++++++
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 ++++++++++
 sound/soc/tegra/Kconfig                       |  19 ++
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |  52 ++++++
 sound/soc/tegra/tegra_wm8962.c                | 165 ++++++++++++++++++
 6 files changed, 411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8962.c

-- 
2.51.0

