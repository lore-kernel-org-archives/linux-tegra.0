Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B8A4DEC10
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979340; cv=none; b=nsYe7ROqu82D++kb+Rfh92pILyDIFTUHYzcTumg2m1zZ4pNcLT3iZkitigcJGs/IyyjOxaz7dNuxnixKX1CQzcu+k3amEUw7Nu7jnUCQRth0aC+HE8e/AU/kkjYhHuM0LY1aYOqullqAeMrEz3RRsU38caktT/OE955+G5rB2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979340; c=relaxed/simple;
	bh=ew6C9tF0Hto4FCznXsHAlkcnPGFhEf22Z2CTdUK92UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FgDlAP3QCP4y9AZ376jOTtTqs3Ag8xACjaQ3807V893om8cvxrZdUmwlCnJ6XYT61xkv69T1rKJwx3SOUmxQ+/zMt9dJFGCGnwWlBmBrwT3eKCvFkNfaKdv3WuyuuTamvB6ZOADRh5/arnCjU0hhRKmZjiGxwJqPP7Bk+25v/Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aixumOY7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aixumOY7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso1325497a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979338; x=1792584138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=aixumOY7nnXWzJbjk4sjmVUDbx7viJW1FlqyrKZVXqJ/UC/+cbbMXPk00KtgKpv21p
         D7KGY/amn1M0XetyKWmo4OQrhdbYJcgn8DRIDb8nllS5xMQyk7Qi+36t9ef+R0UP9fov
         0yDOLY5NdtOdkwTmtsMqBlsz+ZXZtqz+iYGgoJny2vaOyNYV/znibMwde4taW9l1YThq
         B0yTvdTp4c9Mu8/nAym/mWkzDJz4RD4FX477xFeoKq9Lvfvggkxx6RFSmzI4aFvuPpGT
         R+Fr5wRtXAtygc2aVNXRa4HcmN60dlVL+3lBVBfEa7sacVJuQi6kDL2tvM2uyQDKXWHl
         YKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979338; x=1792584138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=Wql8mSYMuwET0tEIL7LgvCAzMM81aifgZH/ArbKQ5JYRCt+QWrwcUsEGqe4JUH13I8
         EkpQMW7fdMUuEghzHIfYk5YVfh7a19BWSwKYsft5t1jWpEG+QVuN8MPBZubldy4LXjCv
         ThoxOh1AW0laOmqAbwL0MOHzhemdy7NQGUVwln9KH6/jHHP/dq+RCe+QBtZVO9Wj/ZzU
         xWMlobLXKCuD8A6ciT7rwFdu3YSPds7Vb/PJYJ6PrNNw2gt1xHnBQtKnsaZqb9KZOltl
         1BriF09qAHTLTzAnMbfmn8btWrqK4lfmQ4iNwk7kebS/PpNVqu7EC5NcZJr91WbqTivv
         RROQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhQeBC1r58Vnf+n236VbpLI+RGr/75bEnannSqdwIJThwC+nh6A0lnE4AMeWdbnQTHnIEYR2nGmUOrCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFPKL/SKWw27wLV74WtdyByosz17qbrX7ir70h4u/Cj/XIjNsu
	/UVs+kd40e5XiO3aRG7Fum/aWNreF3cayQacALyunMto+qw80a6mu4PL
X-Gm-Gg: AYBFou2P1myWz3WNNh1uN+9NE8GL/QiuVD0toJrxdmNC4CB+4amSJTG025JPGcvZcGB
	Z0MVzYz1p87nItqxxQegROh2GgaXk5oACNR/mXKlPbfToQ2DyGelSREA4orFMmX0vKzQUzF11f1
	IK2+/IDka680F6FCNEp6lXsHfP5I9DMZAncCeI6uTq//wN9uFfw0Xcke6kBLQePFaDz48RGJQmq
	jHXnzkt0VRvsg53IdD3WSdBhA4ENRfOu/ctqyH4pNUOcaCphmo8mcyGfDh4PUwrDO6c4bvqnTeJ
	40qiZlDxjKjLSCNTSrhgodeEyoEpTBLps94S/U72f5KfpYlfmMaoO2DbTbMi/hW5BBqttSrnIwQ
	RiIblnbtp8zkjMpXqqC5EXcRg+FSm1UIBpNn3j2FhPNRVQKd+lmQI5R05Ai/uBFWJYG3qc+LMHP
	6FsapgmstBrMWDwFFCK47NhX0MIs2UzvO/kBuxXWWuWpmx1oyseVDLjUeb6BEe5UZFDtTqiFK83
	wPH/INfwgbM3cxuDGUq0+bxsM0Wkw==
X-Received: by 2002:a05:6402:c1d9:b0:6b1:b9da:2047 with SMTP id 4fb4d7f45d1cf-6b1b9da412bmr5434409a12.16.1791979337314;
        Wed, 14 Oct 2026 05:02:17 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm10937057f8f.36.2026.10.14.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:02:16 -0700 (PDT)
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
Subject: [PATCH v2 0/2] ASoC: tegra: Support WM8994 by machine driver
Date: Wed, 14 Oct 2026 15:01:46 +0300
Message-ID: <20261014120148.126160-1-clamor95@gmail.com>
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

---
Changes in v2:
- added missing dapm widgets
- added owner into snd_soc_tegra_wm8994
- fix jack detection disable and place it behind check
- change copyright comment style to C++
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: nvidia,tegra-audio: Document WM8994 CODEC
  ASoC: tegra: Support WM8994 by machine driver

 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 +++++++++++
 sound/soc/tegra/Kconfig                       |  10 +
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |   2 +
 sound/soc/tegra/tegra_wm8994.c                | 175 ++++++++++++++++++
 5 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

