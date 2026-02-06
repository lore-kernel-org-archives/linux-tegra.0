Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B42E7BD2
	for <linux-tegra@vger.kernel.org>; Fri,  6 Feb 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399278; cv=none; b=WTWS+pTm5K4aBsyTR5ytQMquGv+8wU1SOKHg+zwpL7GjFpNJ8QzMUchClaodn6La3PWB8bRZ/aCEi5rrB6vlEaFQWlezppiQ1JfoUvMb9dDDZJ/b57WyAIzu/k1Du3eGpyQMnqm41HJcWEhBQLQ17sE2TzWMLZNA2Wq2XJsaiqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399278; c=relaxed/simple;
	bh=bMEvoZ3YmzKwhD0+i0HI3Rbo7G9luQ7yinQw97aXDYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UgPe5WE2Gf16CUIFaLL/lzitIYCgKJa+cFahuimPeg6vN1+0yATK4WNSWM19BeHisWjCMa7Htye3LnXoFoa830jhqNyRgoZJwaepkJ7YZFylzWwcLk09dnarXlKna71SxOsm3If6yog7Lbf5eyclFsNo5RtkPw6EKHgwJljRim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsyPFx2W; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsyPFx2W"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436234ef0f0so1284467f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 06 Feb 2026 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399277; x=1771004077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/eXKWQ3nkCuVv9yvoGqXiUiEc5FnE49Hs9X00Cu0mk=;
        b=MsyPFx2WibQYb+f+yb8NdJHbaQY39uS5Rfk/h+0xzoTH2RXem4glozwuQNC3YKG6R/
         8siBCvFP3G5JGoyXoF5VPlw3ZQNvYV1ya4lF3Mg38BtHacT25K8ihfvcZ2HWWjakNzNP
         y4Rm5Vu8RGhnC3fNRzB36rlAFLvbJHL7LwbsPlOZDlcfhY/THLLtG01iM5KgcCcPrFJh
         R8F5TBtxXwUVE7D3VtFTWZR9SUayfpuS1ZmjpUJQ1iMhTZIPJh6EEZpVxwGRkdbeC/e2
         nfLzr8RF5/vfwMxpCXLjkbpl2T7uoLDiflgNNz3tCcPIXibZoeaxydh3RRT2mxCdqn7I
         8Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399277; x=1771004077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/eXKWQ3nkCuVv9yvoGqXiUiEc5FnE49Hs9X00Cu0mk=;
        b=bbhmnQnWCRSdQF0TmadwcefyFguELxNaikdXspxMYe8ccjYEboFA1FTE0aIvJ+5Csq
         ag1YUVaO9c5ZzclGamvFtypRcnXRRdVXyk4Sp8d+IdQc8bk/GuhexS2p2c8yhhIB2RpL
         XR2SyAihirqQlHr4OSjnz5lKV3SW9cH2dCsWm5VoT2D2bZYKdzJ0czpZLqFPY5osAR5m
         qntYWyGZ0cFQGTX3dqYXGwFOdjuEoALVkg0Fh788Zd8hUBoOMPvpJoVayBlKVsb4gM+u
         kbBpYYNFILLoGPxmRev3I+M1dsj14t8eraopnBGq8e2AcRWp7KHP24v2L7ECWpMcYd2n
         qNOg==
X-Forwarded-Encrypted: i=1; AJvYcCWaI228ZbG/407uy/Vanrf6N2L2LuNZdvA+zSk/124zfxusWBvQqOSA5nyIw0XuQSyEZSjid5kGveocRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmz7CRL5GRkggS2XlQGZpclUhzSxd3sZ2mhwtulKZjJAk9eYl5
	XsMp8bQGOa40DKtWpXfVwf/vQ7abUs4sPsBC2qY821bQURHK2K5/XU4w
X-Gm-Gg: AZuq6aKlQ0yiHXxnWGuEM6SsK3H4JOmH86L8Te/uNuOiSMLDbqGhhMqyc6mWbszbf+K
	XCjAHWQyiFi5ptjCV79I7XEO5NkjipuAdS6DOfuIVyDhj6kBHRljJmbDQiX/xys3H5wKbL7081h
	rjkj0MK9QZkvqYRR2pxOv34Nb192VJ+BfsOCq8zizx1LBHcV7oETWrYzbFDoyzRv2hV+K7HlpzN
	9ACPlxIJJ1acj/bHaQjHaN2Ird0IKUaOlljiJhdow1ZmHx3m4Q5L9MuKmM1utIRq8jXxBybWlRv
	UNPfGYUiVGiHfryfQtozC3WaebHukyNBzIumWI4PsfM8RDxjb71N4QVCLfW+yPrbNjfHcaE9eLp
	IuhLOP0pvc1cfK7cdcmjTBnhBpBUx96Fr/oO+d9xbKBxZel5B34gW8dSLjfFS1OzDvMVUqk9ezM
	cd
X-Received: by 2002:a5d:64c4:0:b0:432:a9d9:b674 with SMTP id ffacd0b85a97d-4362969518bmr5089891f8f.63.1770399276985;
        Fri, 06 Feb 2026 09:34:36 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:36 -0800 (PST)
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
Subject: [PATCH v2 0/5] ASoC: tegra: Add support for WM8962 and CPCAP codecs
Date: Fri,  6 Feb 2026 19:34:17 +0200
Message-ID: <20260206173423.145954-1-clamor95@gmail.com>
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

