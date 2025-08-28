Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C242737F3;
	Thu, 28 Aug 2025 05:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756359866; cv=none; b=PFuMiqKXhGZkFKRJyGwV5+7YlfpnjF6pqJfCkrk/ed0RNcEIdJNCIfBHIq/qcjSqIHZeyH7gW6lbPH8WsesS1riGnidLrNYx8CRJnjMrxNkHp1n04sJwhexadnMOFKdZ/G1c/LxxU31CMZB5lZ+m2RW3eNR7VmNxkpMnlaB7DkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756359866; c=relaxed/simple;
	bh=SVm/66f36wSgvenSHIMpwxxA7rJfcYwK08iUz6qNS2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgKLdwn/C0Fx7f6Sw+zzOjV7GRs8jmbiGyFXU25psuOStZ75pWQAYKS4kCjYWsbVLPVBMnF35ikAvAp7OdewPbX5jtJNWIEvtSI8rZXvNnqXHrM3iMAEDQOL9Fwt4PGX5touIX8TFLK2Unb1Fj2X30Wcsd6nWz7qftuYI9X/jl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqtTM4mE; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqtTM4mE"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so596411a12.0;
        Wed, 27 Aug 2025 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756359863; x=1756964663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcSGivFSD4OuXx5N66G1KDt1FmdrP6jEVEJ6HZ0n2To=;
        b=DqtTM4mEDO7gt7S3ueSWOOzeVNFIzQtoLBGPFkuMONJGT0fC/lnTF6G+aAbjXghh0/
         WDkNpFDJzg2JwDfbTwPXq8/X9SbsfTADT83V6LvkiRgGqkq8dwE3ubMPPQ8IaEqUxgUH
         00y72Hl0YL5imNPmD0NR16xH/LJwoTnduQllXTGfAYfLDz74OY/Xkci4QQpeC65Zwb3S
         El3Ym43Z7Bi9mQrbQorOV9W6f1CIEmvnNqtYZkjzu0/7x/I3Vv/KmZ45SFASVclRECWG
         vTTNC92+QJ+cpIs/MoWdGFITHOMoBVx/DYBvDMrNu3GDNAvR3SX2xNa41MBGdxT02cFR
         DNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359863; x=1756964663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcSGivFSD4OuXx5N66G1KDt1FmdrP6jEVEJ6HZ0n2To=;
        b=HZZKO0ICW6rF/E7gAGboUx1c3CHZ+0V/GS8e2ROPdFFP3X+LTpBoBXA1QzLjrTbt3y
         BytBqU8H186ph+545CgnEGv+Yj+P78fphh0WSctE2hOWSR77XGrx+nuDyvnEkH5Fw+79
         fEbryT0R6nq8TbWZs+nDhr8tVPHO75m5sZfVQAibjtKw2Ca2CxdBxkLRNRzoPAqoS75Q
         19g+LA1XqlG+oDV8gM+K4M9IjB6R4VfoWcGBmN508ZqzEZKhH/wThi0Cw1u6qE+6pfSl
         O/cYNvGoyXp5FsCBrqgLZXPGIpp/R2sh2YTHq3lwQQ847QCLWJ1bXpMxJEvHkG2oFgt5
         mJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCU3Emp9c4Vv2vmgkDG+yPt0Gw8w+CSBWAmdPyDb5IhFqtcJZFCLRjvhR+9A5g7KGUE5PVsKt9vvJqnxWts=@vger.kernel.org, AJvYcCVDy2Fhs34LfbC9tay41S/LbWYkZguACpv85Taa5cWUEILxpoN+/iRV1I+gncB/sii16L1IkbXniLnbaMBu@vger.kernel.org, AJvYcCXt1ekCVppcO66RBc/18zUKS02QfVu0nxbd5NEm/LRFG8ibphiNyrXDz9VKmMp6BO6SCAVmD5LS/94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5U68RvDKIAzq6l98ZWUqP5DukknpB3TKCo1aIYHVsnCN+nhDD
	SPrEyjMYfKbklXpFTsR0Msfe9PpyT9JoSm8gOvWSg7lJaq26Ma71XGyS
X-Gm-Gg: ASbGncvGPPURLiudaF9AstRsJhHftnDOBAROakwlWkOLHYhuyNd4ovRgHH0v9B/Z12W
	kavATmgSa1s8YW7/rNtcUMeJtcUozVCmXuoC6P2WsxsGoPBiYARvk4L/UYMu3shucnZWnwRXkG1
	X40T5IgFUm2Dw6LlkfT3dhlRuPf4GUJFb+rfqvxTr9kEfeFgsZ66UWKubvD6kxjS0NqUr+CuEwW
	i00w5wgE2sbwEJW7L7ZB1ApQXBtx37b2M62ynNcgHxPmuOPYsYXbIUFEOQq9oe8Fv9TGr2NmcA0
	TModSfD+zuQ7I/qJMNV/KL0xzhQtn0VY4Fxuf+izLb1+n8GSWMPu7WWnvWU3nTLmsIss/dmxLre
	lrbieq7ufj40OJg==
X-Google-Smtp-Source: AGHT+IFtcxH3zxd8aYow9gXMQsfmYAfh4wBFQfjq4IBvLJ+tK7MVsPB6uKxjlRpyveKHwrvoaAe7+g==
X-Received: by 2002:a05:6402:52ca:b0:618:afa:70f7 with SMTP id 4fb4d7f45d1cf-61c1b490275mr18123976a12.12.1756359863165;
        Wed, 27 Aug 2025 22:44:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cbbdac051sm2102841a12.29.2025.08.27.22.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 22:44:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 0/4] clk: tegra: add DFLL support for Tegra114
Date: Thu, 28 Aug 2025 08:43:59 +0300
Message-ID: <20250828054403.7112-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DFLL is a dedicated clock source for the Fast CPU. The DFLL is based on
a ring oscillator and translates voltage changes into frequency
compensation changes needed to prevent the CPU from failing and is
essential for correct CPU frequency scaling.

---
Changes in v2:
- dropped 'drivers:' from commit title
- aligned naming to Tegra114

Changes in v3:
- add DFLL support for Tegra 114 was split into dt header addition,
  DFLL reset configuration and CVB tables implementation.
- added cleaner commit message to dt header commit
- added T210_ prefixes to Tegra210 CVB table macros

Changes in v4:
- expanded commit message of car header adding commit
---

Svyatoslav Ryhel (4):
  dt-bindings: reset: add Tegra114 car header
  clk: tegra: add DFLL DVCO reset control for Tegra114
  clk: tegra: dfll: add CVB tables for Tegra114
  ARM: tegra: Add DFLL clock support for Tegra114

 arch/arm/boot/dts/nvidia/tegra114.dtsi     |  33 +++++
 drivers/clk/tegra/Kconfig                  |   2 +-
 drivers/clk/tegra/clk-tegra114.c           |  30 +++-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 158 +++++++++++++++++----
 drivers/clk/tegra/clk.h                    |   2 -
 include/dt-bindings/reset/tegra114-car.h   |  13 ++
 6 files changed, 204 insertions(+), 34 deletions(-)
 create mode 100644 include/dt-bindings/reset/tegra114-car.h

-- 
2.48.1

