Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378470;
	b=29/vnV0d12g+OrAd1666X6EkqV+6ojobvqbe956gqzlID6faiJoKEsxBrZyK7sIZckEq
	 Ot+pgO2y2LbVxL0Ke2sgQApjRW7J1vhB0HjYwJinfk6RBpskvZWu5F8W2ZXhQ2t6NhwnG
	 gMFC5JoFaS0Q9moVM/y+aQFFH74YNogS7ZKrW/nACtWm4QZtWMMXXuBrUXruyLsGR2De9
	 qU9V8pdOQwxAT1nIf+S07unLMKIiTbdy2cm/BYCQM8MCHjac+/J1rNFwVdtgLXbF9F47y
	 hIvOM/1Nbyg8r8CHOSFwhlPqR+pPfI7L9DH5YYhNDnKn4C1rEMgSG6ZRdi4RRl0pqgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
	b=mpiSTOiiomjpXARursEdU9D64bJh4Pky+L0ZgAyNYx5NyS2CH4wUana13GW6nWXjeo1e
	 zzl6eOEf7O0cq7AHBIpObdWL3n6orVXGNrTsvkZ3E6d8UuGiJRmYzvN+0UGIx38DJm6XH
	 AFeu/QMpu1tH4PT8Vk2zMnaiFoJTSEfnoDETs+UJhnyrETuB5QQDY76+bujTCjXm2aPc2
	 E6w/FFv/ph+fw8XfpYOiWC5yO0WFmv4wqv5YnqFVGnbwDQ3q/X2ievtIVai1fcArH5dJJ
	 yMXrrVdd8kXY1AYLsfMp0o7fGaGfwS751LBJcARSQS6oTvcWbq2kBJLYI69l4911VZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUgCUsXH;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69086606A31E
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69086606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUgCUsXH
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso2803570a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378469; x=1795983269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
        b=aUgCUsXHYw3KaELR4kFag3t5wB9TMdvlrPOCMERQdBo6tE9XrKcTfz2uG8UIsGa2BM
         njA6POWPRJA3ichnU0xFmq9hKVOYjVx3NCMAHHlQEODE2reX+M5wYjKoxgrlTnM6WMk0
         gy0xblA1L5zSG7+RBF+sV2Bq0S9jS56bcVppIwTO7xDiFFFzEq1Tc3zgyaC2XwMyazSP
         FZumSKEduASM4h1ETwbJe72L2CiBxGfUkZyHsoKbxiMMl/GE+XCQl2yHyY+NNLRtL48n
         28ErKSMtnVdEQ3p4FOAXYrI2bVD30h6Dfl6n1fz6Ua7XKaPN46zsuIONXiApnGof/Afc
         MhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378469; x=1795983269;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7xLuQMY9AhHS5phvMKiL1Kg7irbD6BPlpn70hXvxYR4=;
        b=awaZ9Lo9abLa+izLvYHdWZ3QpiXAFzPhS7ZhKomMxUZIWQ8DAs6Nj3UvStKbURJeUp
         9Y5eVFngDWT/OGNcL9XMa8jgGOxrEq9l51ZQ4KZv8QXgxmoe/wQQwYJch+GV88rl3oDL
         I3ya61YnZEyfpTJ2n3RBrlb49RAjd8Oh4fluzGeN1k6vIDDcmoDGsLEHuSWhowc1lmLB
         oN/k7v49OtBftscgRXGZ4XKZ1AqCYs0nsi875BTN9Z2sCatx7OX/g4HI0s9Pj4Xf2gBW
         G7eHr7l+OscKy+LrnFiLqd5AkgrnLIDy213hVKVxMT7EJurAtl23z8tPYx9Oo2wK1waE
         DD8w==
X-Forwarded-Encrypted: i=1; AL+hErEV/IcbatWVHqNCWd498Gt9RJYCFudrOiS/6333Gj0M6mCK/2T0PzzMz9YioSAzH5toVFzHaBmNwR3Lyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LnaBPwWGSqABTAJzY4eqvOOF2oei5o+GbFkI5dGb1xEe4VjT/
	OiqUN1vLq+lwStd7RF6vBLs8OWpdyCmFOsmK+r+EU0yDJEK7oCqvE1Ep
X-Gm-Gg: AZFdTZchArqNH65Ybm9p4K3ADZ+aFJ3x8yWlO1jkt1cqPuuimOmLNk+jur1Jb4BGyu/
	oqIDbuXEXy0fToV7tdj776sjOcNy88hVkq40Qp+GUo0CI5Eh+PtAG5i+lF2m1xes/n9735t39F9
	L2YdQW4qVb9JSGCvbk9V+/V6PoFO9tLIcC/9bwxf/XZsBBAvXHQ1xYIaoblt02Ag6/S297r+O/o
	7F2kfvh7dU2GVun0wARvyF/Nz7DmzY9q3726wG/2zsvtzv7UmhSqdydEhgjuVa7oL3aqroESGYT
	xwFT1vcaqJ5N/sOmA6zjZsvJx/1sOC2QZS7hFAhLRcneLPsyebfLFCpAO5Bv4vTssl+tnRaExlh
	o897hro/oMTIz48+zcMzavWVbL0oTIW9jcRyQPlPhO8PFEZHeUmpue8UBC0GEK6zeQfJx5jUvV0
	IeOsrYJrD3WQRJdFLxkQW1+r4aJv6ukOryPbtuXHiyYYg5uNSKV13wDn0sQSWm7MbLuM+67DBQA
	ondby6izN+WxM/hxP51QEF6fb8ytCXlNS5V1fv4xLdzn/N/ysNYTjEWBszuVdKXiRfjswcyzEBI
	LjX9RXoKJw+odOGDDU3tzKjLN/T33ZkPr5jS8GKSDTApMi3ifJYrJgtur2tqDIAwVSu2uT+b7Mk
	mE+ZUv7S6Pg==
X-Received: by 2002:a05:6402:501c:b0:6b8:afbd:64e6 with SMTP id 4fb4d7f45d1cf-6ba37edaf1cmr6652717a12.42.1795378468547;
        Sun, 22 Nov 2026 12:14:28 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/18] [WIP] ARM: tegra: Update Tegra Note 7 configuration
Date: Sun, 22 Nov 2026 22:13:49 +0200
Message-ID: <20261122201407.23742-1-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch set is more a placeholder and is not meant to be merged just yet,
I am still working on it and comments are welcome. I am sending it to be sure
that my work is not stolen or overwritten by some AI slopper with a trial
subsciption to a fancy new LLM. Thank you for understanding.

Svyatoslav Ryhel (18):
  dt-bindings: ARM: tegra: Document Tegra Note 7 variants
  ARM: tegra: Diverge Tegra Note 7 device tree to support its common
    versions
  ARM: tegra: tegratab: Upgrade powerlines configuration
  ARM: tegra: tegratab: Add pinmux node
  ARM: tegra: tegratab: Bind VDE device
  ARM: tegra: tegratab: Configure USB and power supply
  ARM: tegra: tegratab: Configure MMC devices
  ARM: tegra: tegratab: Configure wireless devices
  ARM: tegra: tegratab: Add thermal configuration
  ARM: tegra: tegratab: Configure HDMI
  ARM: tegra: tegratab: Add audio codec and sound card configuration
  ARM: tegra: tegratab: Add common sensor nodes
  ARM: tegra: tegratab: Add MC and EMC timing nodes
  ARM: tegra: tegratab: Add CPU DFLL clock node
  ARM: tegra: tegratab: Update GPIO keys and switches
  ARM: tegra: tegratab: Update aliases, chosen and memory nodes
  ARM: tegra: tegratab: Add video input configuration
  ARM: tegra: tegratab: Add panel rotation

 .../devicetree/bindings/arm/tegra.yaml        |    7 +-
 arch/arm/boot/dts/nvidia/Makefile             |    6 +-
 .../nvidia/tegra114-nvidia-tegranote7c.dts    |   14 +
 .../tegra114-nvidia-tegratab-common.dtsi      | 2759 +++++++++++++++++
 .../nvidia/tegra114-nvidia-tegratab-p1640.dts |  603 ++++
 .../nvidia/tegra114-nvidia-tegratab-p1988.dts | 1405 +++++++++
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  341 --
 7 files changed, 4791 insertions(+), 344 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
 delete mode 100644 arch/arm/boot/dts/nvidia/tegra114-tn7.dts

-- 
2.53.0

