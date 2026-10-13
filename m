Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB4497B9E
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916360; cv=none; b=Ecz7ykwLx5vASUB9Qw6a9KH2c2a/WWyFZbbP/kbNpWenHfwPJI0gSlJRDiEJuP3mF32HLtIn91FCUKozuXcIN14+1tBAL/5fbymmaH0SjAxdNFg8+hNe1mCMWiABCPJPVliCb+4bkL+bdMcZ+2eX4ua8fIsf5hwcB9TXIgC77hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916360; c=relaxed/simple;
	bh=coCkx+On/PYyms59yzcyUxSZaTFniVRkfGkf4kFQfdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4+RYyCjsjTZZZzK/2HFZznTEhoLtONmgNI0RUtTgJBHv+aQbPWZstINQpoybKBdo+D88DR6vWOAoggs1Iw86XHufmthS1zzE6POk2cm9wWbx6RK4YB2UihzDPaLaiywU4VkdAAstnTaBDObMvOaeoGQbp4bFcoasoE3k+f3XZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flswW5Xp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flswW5Xp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so1994915e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916357; x=1792521157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6xu/m6gLmnhmuK37G0mkWpbfD0iKHbUJbBWVpw5Q+Q=;
        b=flswW5XpxZC/2Q8jDTyXpWt9BiMv+mvr5R/28HN004YKnIFZjdaWyhvcKlObT3dKSL
         HIZ3v+IZTgwDdIDtBRAwgSiiJIYDKsJcczvBZokR8gORGxRdRHKDJYxKD47lSICJXJBk
         d+ryhQwA3gdu/Tejk/DW5RVdoGWc2l2XGxLn273PRsf/oR1Fl42AfGFPw/JBKMYjpx29
         uP5gbm3g9IhOn5/f+UBaNvZzk+LxAaOaSgbWrCIWgXWuaNPB6QauZIaP0b9I61IoR1pp
         WnwlvajSk4wUo5jOlEOT6LwHh6s4XekGwmDNwgXYyRM4ud4SPSr5evnG1VMiX4bMMNIx
         K/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916357; x=1792521157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6xu/m6gLmnhmuK37G0mkWpbfD0iKHbUJbBWVpw5Q+Q=;
        b=hYgHo3haJZU4kHg3vXlm+Yhmp8lXWYHWN69dO8ksX/GwrT0CKR7R24SpvKL+UNP/h2
         N1+hJ6N59Habxox5WJ66rXQGdJ/AnuuEY+5WYFH/eHkIBaW79MijoJyqLMbQ4OLfmf15
         Uow6SBbUZINolBtmDnPXr4RGNAQhcd5/cCXc1kFpwdL2lNEbRKpSEEiVTmQg40DKQGzX
         kQ8yzeTMYJ4vEXDXFH3+a6wSjC62oJ6SJ6UAtAK+go5yMRS6W0RAKXgqaF8JvrvFv9Jx
         nRAg0gJgfPtAlNdY03SquQhJgaX7+ZOE/X/PXWmYxCqhzXkLQRiRYYX91GaPDwKOgxxs
         dCuw==
X-Forwarded-Encrypted: i=1; AKwUvBwkXi+BkGfB7dpZ6GtrICBC3kvc166UZXJnqylYg828YzNLviZsuUt6XVPc04iEw3D7rvfzkJbKf9YynQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvUXxs22/xLC/GKGvzVmczv5Fscej0E62zaVuizIPy2X4IlrA5
	bveDJEPRnRDw6qKCcpY2QJPgSx3TtqCRQOR/yoif9i4oMkhRmbP/h1kJJEes5A==
X-Gm-Gg: AYBFou1ECIJyTrWERmGcip96EvhpyJ8xWvAwFw2dP3evQCDaXB5X3hTSSJThSaCQCBl
	A9FK9cmGcRVtNxtkeY9bZ5tw+8E82pAb4yp/vjIigpdtpoKp0fPJ72JI6/Bn3ZCSMD7fBX+hN6S
	SBIw0kgo01AxvCZVo4dyefdqgxYCxauKmlZ59Toe8816R5doTtsbnu99HIbt+9AcVITNAwUR3T7
	Y6RirWaXvC0eIRtnPfrFFzpS5paNUR7G1AU/T2BzXcBta9kE7zZg/SiySXAPRyFfflpu8U6WstN
	237lFul86vsROk9Jc1S+lNTKWLwA3LoYxDPjKb9GEaFC2dVfgoxloo2zBXK70F4GQs9Jx6dQcqb
	anSPI71VVW6KN2k7oL1WwRn5sScBwyA54SqCd0VGEZHhYcC9LtQFly58oFsIOkYp0SBHcMxb7Jo
	0lrAznOwlwuJytFUyVeDjpMYdD17C67vJA0WgxPJ2LxvyoP84BAG/w15hi1L0lyiyhLOlMCZrPS
	o2I49fv7Eq0OBqH854=
X-Received: by 2002:a05:600c:6289:b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1a475d8acmr98966005e9.34.1791916356633;
        Tue, 13 Oct 2026 11:32:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm548921305e9.9.2026.10.13.11.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:32:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: tegra: Support WM8994 by machine driver
Date: Tue, 13 Oct 2026 21:32:24 +0300
Message-ID: <20261013183226.513658-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: nvidia,tegra-audio: document WM8994 CODEC
  ASoC: tegra: Support WM8994 by machine driver

 .../sound/nvidia,tegra-audio-wm8994.yaml      | 109 +++++++++++
 sound/soc/tegra/Kconfig                       |  10 ++
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_wm8994.c                | 169 ++++++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

