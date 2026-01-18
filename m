Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5520C477
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723389; cv=none; b=Tg6VFoIOJzWY2i4PqhEv+Va6XSretIbc3PsDFBY0WOApHSB2UrIP8p0tWY5h/lyRJZ0KcKEJ5nl8cK/57w2D3S+1Qs4VQEh9yCWmdSiV9AIF518540WlPav0dUWQEYRvgDHjLWzN9Brsc+7Fr8Svm1gTztE3ez+mVkxrfrq7mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723389; c=relaxed/simple;
	bh=jrTP11soEfORrLVH+xR41AKz6lAjKbEzIalTUkv5/1k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=olvCOqtMsBQv480g76p5CnHD+D7Kkr2kn7UlBjIhnX65RycjcoTmxt7D3D+w55nueuF2/rye606/Bh34gc8D8BR6K8KMcBWUldJsncrkj15Hu7IeSSaS2ou7D/o8pk0WSWselBhIBY9pSw+6yKnYElmRU67rRe3vSSbWadv0Q0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJVTbgsI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJVTbgsI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so20043685e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723386; x=1769328186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S0d4JaXYJUmXcmKZUFMKusPIGrJ84LJQoTA8blpIJf0=;
        b=lJVTbgsIf9kMoTS0d6IlfyUlv1XrXd3Ep9V2rQVJ3w9j1RJ61JEcwoZbvGrF/qwYRb
         5PaWmdwpRyBDXFnp/9JxqTjl33z+U6dXTgs1gwMAGEh69QG7cYY3bGp4wEc6GBp72Oj8
         nwg0Bfbrfbiy7LvUonDpCWF6/YC8U3VZ4S6MFi8rrPYzPLY4mRn4yMLaEHv7yly6mA/W
         BbVJz7qdT++2NUBTDGsMxEcS/3++6HVNbS/qIikPkFwvkJjJOyLuM7F4saNkeFKRhRBp
         adjsBPlR/clgpv+1oHDXeJQR7LlvMS5dyfhb9p7tIrxmCd/1fWVAGLv0EfGG+C5RmX/U
         KEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723386; x=1769328186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0d4JaXYJUmXcmKZUFMKusPIGrJ84LJQoTA8blpIJf0=;
        b=DN+w/FDxRuY8n+5xdpSqzjHreMm+LNJMLoZFAKbG6Ry7GryXgaOwphCzMv+gmxa3lF
         lEiMqastV6le4oyK7b+G/cOdEw8BotrtezWHMEA0/EEb/USUDf1mzAirgHspYgaDA3Xi
         E5cP9Tl40P0DLWbXecUmaGvYN0TR7DKMvjtU5IWZfFJacU8M95q9DSoYFRwgdG+3vdVQ
         zDPtXuaOHJVPRKP6jeo2R70uq6nEkT/Mjcrb0Cruk9iGf8LYWQ6BrffBUY6kPa5DPSEo
         lVoNVFxR/s4QHA44+suDaH/+XXQyRR4x0RvCh4TVaHCfztCpcm7D6j9A0uiEXtAicr2t
         uKsg==
X-Forwarded-Encrypted: i=1; AJvYcCVOIwiu7WhVlTLU5Sq/opVq6OyKx8FtEnyHSRat3BpM0eg6Cp5XAjHYgYd/b3NhZM6JzOSHG4Ggzadpnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/8HgpbR/jW8aQ3ZuidggjJJAgJFBcIBDQ8V1nK2sKtA53nHP
	Rs8kHhppw2q6n8287uKawMHyRWb/dQHmRXjT50p6RNgxs4qzmvUZ4jCM
X-Gm-Gg: AY/fxX4yr+kSfZ7EgSLRF/f+0vuDx5SkkcHp8j7JvVWAZTGSvdjWqVXzyPi8CEEEtQt
	OprnNSysGDq6iLLkaN56M2OUzt/fn8x9+cAflSvJ4Ekhxm3KmNVB8atK/s8kImWZgRa7LPO66Mq
	EATF5vi8+c0xw6uCh8XFLG9RM+gSsE5RIFJgCO3L+DFn07iZ8uj6mIJwIO+DW3z8UPKv+w1mSir
	7jGEWY8SgVPQYS6WClywhMrVd75DRNSKwTCka3qhHVYJ2OrtR4XNZGJGzrtqsHFnKHf0ynMrJvC
	bFCejNE8INCfnrOmL9pwsdrXnA5z/rQeln9p/9IkyFTUIznMX0sWsxT36ae1xBfIW1FiWT/p2ht
	emI4d40F2vWifL3usH3AxnJARnqxFYyc7fmwrnSp6TzPTdm3VfAztQoqNChoyF59glrkXj1p1t1
	zxY/GwUcTBnApB5IAu6MrAa+FVu/IGutEGjWv7U0H0zThddDwqJsiZwJRivY/dNci8qZQJhGdxc
	4BbDBs=
X-Received: by 2002:a05:600c:4e50:b0:47e:e946:3a59 with SMTP id 5b1f17b1804b1-4801e3503fbmr93270645e9.34.1768723386007;
        Sun, 18 Jan 2026 00:03:06 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b2755absm229099345e9.15.2026.01.18.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:05 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:00 +0100
Message-ID: <20260118080304.2646387-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings

for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:

  ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.20-rc1

This series updates various DT bindings for Tegra architecture,
primarily focusing on schema validation fixes and new feature
documentation for Tegra234 and Tegra264 SoCs. Key changes include
correcting realtek,rt5640 audio codec bindings (adding missing ports,
clocks, and jack-detect sources), converting Tegra20 NAND bindings to
YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
(introducing CMDQV and DBB clock support). Additionally, it resolves
legacy warnings for Tegra30/132 display and VI interfaces.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: iommu: Add NVIDIA Tegra CMDQV support

Charan Pedumuru (1):
      dt-bindings: mtd: nvidia,tegra20-nand: convert to DT schema

Jon Hunter (4):
      dt-bindings: tegra: pmc: Update aotag as an optional aperture
      ASoC: dt-bindings: realtek,rt5640: Document mclk
      ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      ASoC: dt-bindings: realtek,rt5640: Document port node

Svyatoslav Ryhel (2):
      dt-bindings: display: tegra: document Tegra132 MIPI calibration device
      dt-bindings: display: tegra: document Tegra30 VI and VIP

Thierry Reding (1):
      dt-bindings: memory: tegra: Document DBB clock for Tegra264

sheetal (1):
      dt-bindings: dma: Update ADMA bindings for tegra264

 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |  11 ++-
 .../display/tegra/nvidia,tegra114-mipi.yaml        |   1 +
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml  |  19 ++--
 .../bindings/display/tegra/nvidia,tegra20-vip.yaml |   9 +-
 .../bindings/dma/nvidia,tegra210-adma.yaml         |  15 ++-
 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     |  27 +++++-
 .../bindings/iommu/nvidia,tegra264-cmdqv.yaml      |  42 +++++++++
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  13 +++
 .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++++++
 .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
 .../devicetree/bindings/sound/realtek,rt5640.yaml  |  13 +++
 MAINTAINERS                                        |   2 +-
 12 files changed, 238 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra264-cmdqv.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
