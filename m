Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80537221543
	for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197262; cv=none; b=AvN7wY+ITUzgz77id1Ojf0hbjzq3Xqo1pLPmyRV1iWrvo48L6MDA6XtZCnCsY8NlVWIZ/O8tHJ2qfR82Z5HjaJLe7SX9qfl/Uh+3F5UPXO2BAJBJjURRSpn31AM9zmQrNG0Wy1pwQxjP65I2ii+1HlGktNJaimshBpfoQ6W6NVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197262; c=relaxed/simple;
	bh=yrGG+hMwf6QlqsGnobYEtBrE77rQUzzH4+zd0SjNkcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BOYmVUNRgaqrvNx47XBLlHkORVvBbLsid1nd6mVnUdCBj1mzhHfIEjgH5qvlxLIsPzm9DQCSYHFTwJQCdKasnYS4BenM1ybwyG2chGvJOJHd6G0pC4QzYuMPW53yZ/B+J4vSWfP/kVNsWBSIawm+V0+B71kOgT5YhYguk+zYpc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5EfknQK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5EfknQK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso1484498f8f.1
        for <linux-tegra@vger.kernel.org>; Sat, 15 Nov 2025 01:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197259; x=1763802059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOVY22gCITksV2gxcyAqD2EMrioeVssa5L5prhcUC28=;
        b=Y5EfknQKc5Zk0mpy1qYPZlm7dZueqrrfOiNeGlNdiSJxm+jL4WAY+w2vF4zKLut66e
         gm8YjeXc9jQ57MKq+NRFUkUHTDcj0VZVEX8hOhHB1VJcoVQAiCJ/DcMZKarlzpYx9/Uu
         xvZwcEe7XgTSdad0ZrsKnsCDNF2h3OrmPWQsJ06HYzIENevVU0Up/LfCshhgyib5NqB1
         kekG0Hk9xuM/4YnRRr+x+dIFymfkhTBm9TT/kiTHUU/3CJFtSbs3C5m3gY8OpV0Mm5Oe
         QqEWLTGRad4Agd2ChZMaTnsz6Omy+wWhln4RLx/sUscq2dhvbO04XIoiAFhGptfHRktL
         x6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197259; x=1763802059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOVY22gCITksV2gxcyAqD2EMrioeVssa5L5prhcUC28=;
        b=HypKzo6XLdI6rbenUlSuF9xRhNd9OfX8cQ3d3Dxc9jRn2da5BKPKZwb9QSQ9H4vPJe
         iU+XJNSrSlXv4MD4hc8g544vQ97gRjqUoPrK0ge3IbCerqZ0Qf57+6uh2PhmuQz9iZpK
         0y7iBaahoGo4rDEVTgDiXbeQCAexxRek3Rmw4EhlH3yCJWGCbZ1Zbf5U+PJCfnffR+QQ
         GY4DKKCoeGZgZ3cgQJECOpHm5k4i4tkU0O1pO4f9lsHYOhDPWFf9FXtOOwVNUmo07GOb
         O+F0p1rcCcO96k4q88bla/aXPXWeC5WuhYdHiwOxRx+doH3cd4n+pRUtcwnkyPUdnDot
         j5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFk9s9D5rsHwBPUF9xy77+FQygB0V+DNIz7xz0UiGMLAnlkto4dBVrCbIkX9nxYCMtpIbHODFC1axiPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1CzkM9lJDgw6M/FEg07PosaNOWPePLaBUJOxE+eKu+pyu82C6
	jrO5RP52ywjIAFPGHwYSGNr0a4vSkDQ47bnC6Ke6KQM960mdBx5QZU0o
X-Gm-Gg: ASbGnctvmlNCzLY3spXuaHPU3jpbdhIxby7i9ep+uQIBVanUUlQkKL1nNJDQeWoo4AB
	qTuJ63uf0emS6KNt4H3uBQMDHmLCBD/Ny1v7TgW/mgxSZB/3vNeMOYFhqrg+cWCodta+eQImr3o
	2PoONR+3fRxh7k+Ae5KIK6dukWGtKCSe7MWXlB8l8zz0KtTg7FWV1ujrjX6iGU2V9jTuaZ8Eo7d
	5+e016a84sJkg9LZS8fC46FAbXY+0wBPYtzgOKbgQa7xbiNpzYuQyuQVMwmsw2REpw/pFFtW8aT
	b8Frr+ilf4DoEBy0ctToDYKGQjOiML12fkhxhnKG0HWKqsnaPnCkNH+wuCclYSvkjseMqgtjij0
	wuL16MKAPjuYeZjEa6TtaraS5McJRtvwqV3xayVBItviVlNC1cagQA72t7h/metsqt/j1RQub45
	XIMmniJA7nDRwqXJMc3H10RfViN+uGeBy7Bk3Rw1oObMpvb34s1HxvlhgYifFMKmSdKgQH
X-Google-Smtp-Source: AGHT+IFoaK3lhY6hP5vpOdFQPuE5XMwCFmwtA4zhKi+e0WF3vPhR/3CXQ4PwTkjEDkzYzg1tAlyYAQ==
X-Received: by 2002:a05:6000:288a:b0:42b:3cd2:e9ba with SMTP id ffacd0b85a97d-42b595a48b6mr5302713f8f.33.1763197258729;
        Sat, 15 Nov 2025 01:00:58 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17291sm14874843f8f.32.2025.11.15.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:57 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Device tree changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:40 +0100
Message-ID: <20251115090044.3140331-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm-dt

for you to fetch changes up to f224e936dad0933a1baa3b7152f48918cdd98498:

  ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101) (2025-11-14 17:43:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.19-rc1

Add more host1x devices on Tegra114 and Tegra124, as well as CSI for
Tegra20 and Tegra30. Support for the Xiaomi Mi Pad is also added.

----------------------------------------------------------------
Svyatoslav Ryhel (4):
      ARM: tegra: Add missing HOST1X device nodes on Tegra114
      ARM: tegra: Add missing HOST1X device nodes on Tegra124
      ARM: tegra: add CSI nodes for Tegra20 and Tegra30
      ARM: tegra: Add device-tree for Xiaomi Mi Pad (A0101)

 arch/arm/boot/dts/nvidia/Makefile                  |    3 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2790 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi             |   64 +
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |   19 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |   24 +-
 6 files changed, 2960 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
