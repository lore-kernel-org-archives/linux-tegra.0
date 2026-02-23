Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF3C346E64
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829464; cv=none; b=k+snfpM8rBFpMogqnUTk+7/kvnSl3fyFMT6GzzZYRDH5FmWAll9B9RcSMRN23nfLKHOy9yM60G6WIYXuFmeUNeQeoO3MwjhNgjjxFWuaPtnQxy6G0tACzxOp6w/WOk6CWL8figo5PV4trBtxEA++750syxcShJxHBWnSIWgafGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829464; c=relaxed/simple;
	bh=qowcBJVi0boPrAEbMprHmoxPxBn/f6cve6U/hViUU3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IAvGbGCQc/Qas6zyUtURvyuwmZZGbxl3T6PoAuNGEXOfuca70Ja09fkHs1019esUUYHSk6ZTGjEpG9ZkxJv2+7lGLEoqBRPeXrQ0h4c4mh/JGIbT15d5LG61ze8g3Sc5ycdBLMgn04wkx43PGJnhqI8ns9ptlZpKtlBMH40CglE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnxNc4CX; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnxNc4CX"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3878de20527so34238381fa.3
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 22:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771829461; x=1772434261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6pR3G4a3CQ6oBq2KzhWpos/Gb35dTMTzLB28yt+kEA=;
        b=FnxNc4CXqVoUmhQuyR2R2AVI8g4bhDrWTxpJn9G8y42IwFDl6qJdvT0dPP/q3zbqAF
         15bZTM0uRmsj9pWVVfswcf1ASS014X+exhQhnv0iMPBpRiaKHAnnaYifCVtGDnbRV9JY
         ZF8DePapogbvrc4ZhhIjcSoPkJE5WiDdR9TYSmZRYXfDn7AISLnq1Do/GyTh+u5hRYnK
         5I5AwPSOtGNExrcbmKymBOsFDf93nrPf9l82O7w+FjyJLlglA4N8DuaJv9Xiuq0gczEK
         pdbpXYYvKs4wGp8GpBxPBgBNDkprRZJbg6twKctEkDJRiFpzDaTBcQPS6fYOliK6Qj1Q
         6feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829461; x=1772434261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6pR3G4a3CQ6oBq2KzhWpos/Gb35dTMTzLB28yt+kEA=;
        b=UU2MBqCclsw7leE+MoPL1lOAr1x1csHRVIV8lhajtYLW5pO9piFEGn84Ewa7hOu+XG
         ULVidXZp8Sq/pG8qUVZMSuamJDj4j446iexeeL7JPfMt65rxv7yPFv2km0lfdFds5yrV
         +B/X3EhVGOs0l9HjBLqjM4Rcdyj6AWGo7q3jqne6LR2ts58yE4j1hGiPEUkv8qenPubv
         2s5XTOx7P28YrM2Wiepotw8aNZ74YDmpwY/lzYu3VFfyNlO7d1BVt/EcRUwChqhXIBOK
         W7xV/sxt18A+/KNQjp+3TAhnSCRGApSQMKyN9x23TFS8OXlygBzvXkLUn1b+MHVAyP2d
         r9sA==
X-Forwarded-Encrypted: i=1; AJvYcCWzVOA1jLW+5siCAj13pejsuXAxs/3RiAEWk3y3QeLejfrC8ChoTjQgOWpTY38K3ctQ8yaMuri8751wMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybr9JzIVTVGUdxp1wOMMj583C8I7+E6lr1sB8wOynBO+ap9GaM
	/gsK1hbSTks1FcooJpRHvTBtRAMJ8qcgJkOtlSULmDIPrumMSNYbLQu1
X-Gm-Gg: AZuq6aKcHG+xOTGSvz6J0McxBCy4FxedvUMA5cl6OAjycHSEg02pd+mSbwaxH/knHkS
	wgvD5uUeeZZYrEWDTnFl0P7K3ucOkc8qoNQcSa7EslgktNck2ayerOxYmM4TXV/dSGEmU7wpkbU
	EafNyzkIg0nWTfdDWHussKsx3cappQKyTTvUgb7CMFnDOKjYzKBVUqsi6lEEAk2D7xq6DdbwFls
	WzU6dEYfy5qNApLTFUyP7b333p6L/udCM0jt3Aj32OCdvLCfigOBxOqhAg79IpR2q2A+bafbEkR
	FmFKXvMXzhvfBiG8rFe7sFMOyRRH3C9dt8y6VPbm3d6ij2gAOv7YMAHKaPoiVasQ0XFMcWnMtdi
	CmuKvvfAFpVLIKf2HYuocNa7ZlK8/PHTo37T0ecTWiWrnWU4AC6uCYrdlEdTg2DjuDqXgy/PXkY
	5aS6jqWkHqAnkF
X-Received: by 2002:a05:651c:150c:b0:385:f235:51c9 with SMTP id 38308e7fff4ca-389a5de9682mr24271771fa.34.1771829460571;
        Sun, 22 Feb 2026 22:51:00 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78b4a45sm13916521fa.13.2026.02.22.22.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:51:00 -0800 (PST)
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
Subject: [PATCH v3 0/5] ASoC: tegra: Add support for WM8962 and CPCAP codecs
Date: Mon, 23 Feb 2026 08:50:46 +0200
Message-ID: <20260223065051.13070-1-clamor95@gmail.com>
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

---
Changes in v2:
- fixed Kconfig dependencies
- added schema adjustments for max9808x

Changes in v3:
- in nvidia,tegra-audio-cpcap.yaml set vendor of device specific
  compatible to motorola
- in nvidia,tegra-audio-cpcap.yaml in example adjusted compatible
  to avoid confusion
---

Jonas Schwöbel (1):
  ASoC: tegra: Support WM8962 by machine driver

Svyatoslav Ryhel (4):
  ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
  ASoC: tegra: Support CPCAP by machine driver
  ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
  ASoC: dt-bindings: nvidia,tegra-audio-max9808x: document additional
    board pins

 .../sound/nvidia,tegra-audio-cpcap.yaml       |  90 ++++++++++
 .../sound/nvidia,tegra-audio-max9808x.yaml    |   5 +
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 ++++++++++
 sound/soc/tegra/Kconfig                       |  19 ++
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |  52 ++++++
 sound/soc/tegra/tegra_wm8962.c                | 165 ++++++++++++++++++
 7 files changed, 421 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8962.c

-- 
2.51.0

