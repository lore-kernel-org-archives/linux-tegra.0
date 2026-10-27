Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102444;
	b=fZfkilFplfxwNxblDKDCZSwWXRJpV9Ui1XLw2c4W515s4VJEJVaik1Ux0keA09piG+/2
	 o73LI8tUlGZVhWgkufQFZqC+Lb6v1ec5uyK5VJHTOsQmGYLDyakXBJN2y9nTMOFWBaLsC
	 yjM9SVh1spkZwQESkgJdj77o8pkWPHf+iaMnsd7x3truvfK2uMpUeYclfISmrYpPPQQ7e
	 63r+q+Ha4/MowSWOjstpJ6S19e1vobb5+loRccHzb2AWByG93n2e3pEUys4VUba3G/MZ9
	 r55fv+sII47jPrBDz9S9atAUR3fcAPu7UFqNeqkwgON9kqJVGNRfCYdcTSw110N6ypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
	b=eLt0aF7ba05kEh4QkBHDfsJ/QEuHO1J0RvUYuvMmjEJCp8/zk+KH5EilvrWmyxJ/cjzG
	 hG4VoPfNxRlzgGo/VPK9Djlv/CM/2xqATeKY27/DrzHd19rUyGa3xNO6eb++p+av4/V05
	 EuRS6b3wznx+2GfrjVJTGtv5KTqZyzloiDq5KemdXGnkjlejeRFXkX/6CtX5jWUOdGpiu
	 X/hn+sw9GxRIt7wWnpJ3c3QyOWx9Ovgyq8VLjqtcyNMgN2yitoMi+bFET5PU0hbS/dFuO
	 VG7/LD8bG+tu5yCKmil0R8Zm62erWtqDiFpVylEO/bJ2BCEU7JNvUVDQG9rLV73pQuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC8D606A31A
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 12:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC8D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBMmomfb
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso6064083a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102442; x=1793707242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=UBMmomfbj2Z/DjSKvnujnL23eqaP+gUcQIKIHuZb2TRimkcNNzFUtX4uedUvg7v/UD
         XE/n06vqJED+aa4VxKMc9zLcxSqlgFmpYhl7WWHaarYZpQIYo55qJ5WpZP4vRXubHNn6
         +VIA1vOgufoGjryjPWh2UHMWrCMPZNgMOY6T9Q9b6QJ2LbBSdC0yHPAa36W9QD4MUFsF
         fcjj++1d1mBqdo4lLIQVHrdb9YrVjJP6rjtRmydlhgaD4n4h6Itk3zBVtUjzBfGIWlRs
         Uel4I0aabouVD9+O6DmFg8uWJW71hea87Y9SuQQvToogunsgIs0+POC08uZOoJDciL3p
         PEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102442; x=1793707242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KBnKZ2ldhWTCS/0yCI6Y+UH0y9EQUDr5Imq5+wRBAk=;
        b=bw2HnPo8YrxFmzuUGD6JP214t6wVqR9x71tULVPqLxhkybo/ajVPxuwIsf9frFy569
         BKlutub2KTe/aFPjw67Ytw6y+VsP/p9+/GfjxdPkYVRoZCRPA+o00WcbdjZjbeAGE87B
         LG4nCZw/eLxO8saO4EQxIm2aXS9iIBVBfZyp/WmqOnS9Ufhj9N+OCVnUJDqJqhxFltna
         ZtDyHMiZN/guW07HQK2ljdEiFgTGs7F8VrX7kYO+/ssE9ZSYJy0/L0XeROUC2VRUkkLo
         cfDi5sCjofWO87qNKDG9NgtrkgU4ypec6VwejKoGae5oKGnk7sVDwqzrf6j8kaKKZ4GK
         FWwQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/l0ykFOFjP7Odbpn2pt7aUGj0hmoaQubTlYZPCceHsvpNdoq9SklB25OKLx0i4oZtuMEqmRIMnAPG/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYXgLzjwv2yrE0xK+pM2Z33UvjqMFdF4WllTyPiE/2o4nfIpHE
	b3qCKf8skriJd9CfizwQRTdSm/WCTtab+4qr22twscRw5YvJ+1jX36hX
X-Gm-Gg: AYBFou0ZE+94Q7T3r3RrALF2zPHbw3oiDiLvzDMyteGRYrT5guvd8arnaOGuaohR1Zy
	PjyHgLOoRA8KOLBmc6A0647aqY3vHFDCMXtiDeILJ7W7JlLoN/qRJM1pDQADIBCUlxjj/3voEaq
	L5HOx6UCAY2An5lHJLhiOFMjlSXzGguDwe7kNwDHk0NbM9S8sVGLlomyo6lu6zVRfPB51n3swdt
	4BLUwXYGEAD2YEn1L23tDUGsbNFGo1QfthgxAmxKncMkZFHfMZCEYyGGA8tMpjg8gi3OoMRJGHC
	I6keRiuOo97clCYOlATztK1vHbHAJrZqBu7tZZanksTmLrdVb4RRYsfh6hMLvkLVeJwKhQ3Jla+
	XSjBx/MQTf3iJQQ6u3JzxObytIKK9Pb4TSDwTmjjhSmBbaT7kBpgmk+KjWbtaXVc8QpJFxG3Jl6
	TxNLg+29ZefbQNsth4SiE8LOXHv7ro49cd1tSJsSrtebJFv0xBk/RmVT2u9cB58DI2wUkDBFVsJ
	zqaHvVTXNG8O5b/G088IfFdVT/+tnXynpkIfVxMF4xTtJl7OGIvgr5PsdCJ3uyDTz19tiPJWUEO
	yvzQM7YsC+LiSW20nb0p/Q==
X-Received: by 2002:a05:6402:c14b:b0:6b4:2d6:cbea with SMTP id 4fb4d7f45d1cf-6b442fcab59mr6665292a12.9.1793102442085;
        Tue, 27 Oct 2026 05:00:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:32 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Tue, 27 Oct 2026 14:00:12 +0200
Message-ID: <20261027120019.93611-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add/Update #sound-dai-cells to some codecs often used by Tegra devices.
Document #sound-dai-cells property for i2s and ac97 nodes of Tegra20
and Tegra30 devices since they all provide a single dai cell. Add these
properties to SoC level Tegra audio-related nodes. This is required for
creating more complex audio paths.

Svyatoslav Ryhel (7):
  ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
  ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
  ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
  ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells
    property
  ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes

 .../devicetree/bindings/sound/maxim,max98088.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-ac97.yaml |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra20-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/nvidia,tegra30-i2s.yaml  |  8 +++++++-
 .../devicetree/bindings/sound/realtek,alc5632.yaml     |  8 +++++++-
 .../devicetree/bindings/sound/realtek,rt5631.yaml      |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8903.yaml          |  8 +++++++-
 .../devicetree/bindings/sound/wlf,wm8994.yaml          |  2 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi                 | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi                  | 10 ++++++++++
 12 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.53.0

