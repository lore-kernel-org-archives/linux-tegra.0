Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796070;
	b=JBuo/wcurO4sI9KTXM8cgly9wpfj8vCZ35ZjSCNVne2BG4kNbFdUia+6XEaZqf5SbyKt
	 CYc1kiiz1LnCqrjMuxTVvUZgduim/BbMOY/6HK3Spn+unS8ADAJuIBeK1e8mAnmrrc8MD
	 KTX8rHDpbC016YpDVlOBjWFfpjmEeBtOXeKz6J4eXIup4PSsvv+50Sa1x2++bJcsuCzua
	 ov7tF+Mws1RSK9PxEl8zpWVDwzaTUMsCdZFptJzaw9FP1mBzmeO3ym5JiAPD+oWXGAJfd
	 mlhpuzmmoVXyZq5CNRlNxwB/+g8kQwbr/Ib37LuGLd8gI+X7n5NzBD8ipd/JLgv/H1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
	b=O/4tLSi2JcBp3rVwAAcse6tlb0GM+ZhE5Ax5bfDPVVCwsVR2t2zroKMNc/dn0UjXWgKV
	 mK0auxQBy84C8Mma6lrpp9h8yCYQbzwKwedxWKgwSK01zmkjGsrqgdv7I5QOScT2bxRK+
	 bzdFQzpRs88Qqr0J2KoJDith0Nw0hA4N4pce/evhe0KTEwuRgVI11DcMieMSlywIqT5mz
	 h+wr2SA3n9yNZtB//4I2N0ZYp+TertmooC76sOFfiZXh4SzFhu/HfoGGwC0wPm+PilJZD
	 yXVEIs/t/dYCKKplB6f0uNyTWzSZYbEoMTbCfCgDZRehqp/7pE+SzodC5KTiDgPAzfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nPrA/j3h";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3658606A329
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 12:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3658606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPrA/j3h
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4379965e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2026 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796068; x=1794400868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=nPrA/j3hW/O99kGx7s7SfheqzoTdHcd7g8W0JNdsUl00HXqTn8wSNxBLgNloX3FIyX
         YO7/f3D5E18Qlkt79cbst05LdOHDR1AS7pXXPq35ksVs9SsYj8NXcmqHvvlOAleTHGTu
         UC8fEr2kVQZS96YagjQZxneYbBb+do3+oaK1SEufyUS6kp0xBIFmLzNOEDZGwyHx91xR
         Lwq5mYGeo66/wTMaofcA4vh3sHp3wRFyQI25eoefUO1zLsJ7YjYDQrMLR289PvmRvLIq
         u/lgVyiFQb4CPuwsnhFgppKQLDDoRdfZZZ8teZ5djHsGe5TPjk34aWGZCNdLTF8QEomL
         6ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796068; x=1794400868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFSSkNgtw9qZg2rx70HlBlm2wqAAOtu/7zBcOSJ/emI=;
        b=YDyRZev0mSZpFKxKLjioKjs2SAIaV3rB+e7Cu5AqbU0Yh9ZflsZkta5D9Y7xsQ8fwL
         D5v+n7xb7HLVLmxwWIbvK2nwjKnRftGg740AH8IBA41q2hy/A0aPv2SY5OUmQcFlWU/Z
         WpYFvhg0djlUb3DVzCSRPcf3FR3BvGpCCLtRrXDfYKzS4B2QLHz2VxLDrUOK2GFmc0yN
         OLW33aR8OtCI4v2vaI8zfm4rFIdsWnWbRwm0GsbTAxaDoyur6IFlJIHGHBgW9ts0372T
         TIY4SZFQC4DzJaDLWbu0dtUdbV7dtU3BOyyO6AChT/766vlNnv1nUNSGg0Ay+RszwvqP
         wh/g==
X-Forwarded-Encrypted: i=1; AKwUvBy6I4K+KeNUrNC+pQbgVhmeRJlF/ZVGScVESLWaEPAs4FpeBXUrLCk30sTBLVvE187YP/6qjn0mPE7Stw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nWnMtGona673SZXllVGc4MNtScXEPayQNRQkIi+xx7V5K8Sqa
	+olJOIj39HKFC+vhJZnw+StYOwntpg+Z1cK5xr8H2U5Jo56ntOTR27oV
X-Gm-Gg: AYBFou18na+tBLZqm+oghhlS8K5zBLjH7VLm4tQXJ0xR/mrtbzalEPOlcxNcz1EItTn
	jZ11oWsX584rURfGbzTYAHezmfAXmYl61qkCoyTRzCiV6otO/0JNoLiLuH9FitqJotBrqyFTSc/
	Ckf29lATkfgBkNEWLCMiSQ/UEh3V7As5hq8SAUfMY3mLpCdZJp6E8U8YP6LS+i6xcxG79H7MvD5
	oINwBKrXjLjWbJ9DXCtXg2ICqI1yOdfKkaAEq32vpeaa4BkfT7X4s454zif4I5QZEZHR2oyhIJ9
	6pPQYnKkjtZMxdJe2DY1lx86gQXV2Z43E+qtRaWedJZS0vUn8z/P62oHIdID2SNMC3hN08TCPbv
	rz6+9l/Ya1RSkqN/6hlA2paNrC8iucPx8m2C68XQU/dmr6T7AqhG+K8TE9Tbl47PWXGk8dNqVJB
	gieSp5I5De0dEMTd+Vjz6cjLntyW/qgVJBtO5RKxgh3bPmRK9FXZTtgM4VYiln5rrg+XUoH930l
	s7PWy+JrZKyJ2ZMEFE/HKMv1KN+3C4/a+guWf1I83kXJHwN0hGNBGU0LKB06ONFjFFcIXm5YA5W
	P48a1tmIb4Jxa5s3QvQV8qkqrFWikkXRbihJLSZ3tp0NmimmFJ4=
X-Received: by 2002:a05:600c:3ba5:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4ac16fa356cmr437727975e9.11.1793796068291;
        Wed, 04 Nov 2026 04:41:08 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:07 -0800 (PST)
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
Subject: [PATCH v2 0/7] ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
Date: Wed,  4 Nov 2026 14:40:50 +0200
Message-ID: <20261104124057.240288-1-clamor95@gmail.com>
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

---
- fix dai cells in wlf,wm8994
- fix commit message in maxim,max98088
---

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

