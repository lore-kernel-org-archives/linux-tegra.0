Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF330390239
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 07:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273421; cv=none; b=pf7yf99oHWc+2OvDgdIYPw9moSpqeuc/IZT49BpjiS38YvFpbXsN8J+ljwdIfkQep2qyxQH2EqDMDRmW44Ys2XZVtwilQJP3cedxQw024fdJW7hVersq/OxRqWlLjIBqvBb5CkBakin6Q+e4QCOs0rYdREOOduAYGvbzzv1jUf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273421; c=relaxed/simple;
	bh=gpPPIkHcIu98HxBXPnM4t+YXLE7AWWIMDsr0lEdjrN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzOgeZ5HWqrX3Bk4Gu9axS9eXKN8zcEN/BHF6HZdePhLm1DaUUYCKYbjBRc3k6TiU/lUrI0erVgzwfV367cgpg/c2mCg1GJ7/KW6O6cuy/Miv919oY6lVhtP6kz9nX9Sw6/KqQ59H3FhM0nIIcSlYsthS4C/mlQ8gZTwdVQeWBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deLWHSK4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deLWHSK4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfbd17589so7790527f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273418; x=1777878218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0ipNjroP5bTPdmX0Il5KSrax+33oGeqlSqXi4ynRBQ=;
        b=deLWHSK4atjRuqrju8YmyKRcN0hVL7dU/DnibmXnAotTQ2BgNK0ONSo8MxetyhPUyL
         ZcpYDPrja/Jtnd287bKoQ/3gtKclIL5gOg80j1fqreP9MuZHJ+HGld/sBS+9rHV0qhTo
         6cpQ7NrNeXGghPkn48ZFp3qMCitfdLEn+kRdjJD0M27icBLRWJrIs3EEE3AfOrf2pgCa
         k4oJDr0gW1JBqcW8IyIPPN8yie0Oy1EdAToa3Hr2EeVKw/9T1sbL9r+IkD0IOD6HMxX+
         iOhfEnsgCuvZc3wirpmE2VhUTz7QJbG16rawoIUJcwk44ACTQtbzXGH+rdVugwkB7rTF
         2iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273418; x=1777878218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0ipNjroP5bTPdmX0Il5KSrax+33oGeqlSqXi4ynRBQ=;
        b=JFmq32Gt8nNZmH+Qe0A7/KX3LCFxElLmtnSnU4Oys5BDSd7sYfc0Hur9g4vAtqiwED
         Bq0GZmgELOo24JKq/NSaKofoPXeTzTsHRe+SNJcLW6M5isDJrUS70yulzGAwPLxXZr29
         euHNvi2OLxx5KsHFv6cmaTCsp4Ta4U1R55ZdEH4osBt51d0nL+kLvjRgKwXQ4eivL/Y9
         PYL5IjUveMhhJ7Cj5IPN+zDOILxec/kn2SP5yWOdCGtv/tKjxwWN1nzoDbEjSYXY2RWG
         oh5DpPQT/hASpUfEXyGdwW43LOZOxHddbRyJ7vGFyr9TzFoCfoZ5LRRNoaTXl0QMftlY
         gh+w==
X-Forwarded-Encrypted: i=1; AFNElJ8r+/sOgfga4/3DElIwGkaumFxOVAH9JawisIDgzEL5LMQMOG+sMwRLaomrZZQfMvcog1kE8hyYJ0yQQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJbxSMh57mH2ti5QytLlLa1teKuQJ3UI9h/F0wwNUgmpCX+g3U
	L9TbkgbWcznfsPK/r1q0DKolycpFVzP7xYkuBcYTYaxeJvPCCzd1X8Q0
X-Gm-Gg: AeBDievGWGmX8sqYAXUaXF9S69xEIE7OETfdrUeYOGzOzxbyZBpBa7cwAnAP4ZqJTWT
	Aszzvwf1B78eLjI4QpKp4Fwa7uH+6oA+FedFfNKoEtUTR3J22vCmM3EBRl+6g8RNuk/2TuAcEGi
	uLdgIAnp4NWE/GOW4EcZMHx1IeAgqu96xML2TYypoYgXqNmAGSCmTI7/GKSjunU4CYRrUD+vBet
	lhNM4umMTpntDtTh5213bL/Eov9VvyO2TXTz1O7MWEl3f0x5ySKGr4zqNbO9h9+N5/Bxt7er/5p
	40pnCIi3ztpBiv9aVt2OctkJbHNmvZbc35HyEA0CSaC3M/1yoR/JsGifuFGjlrkwTiDa7RLG6mf
	uTqU9MRqCSsIxc4ro1UeMBt68aMK949O2eiIZdjOVFAxPfLOJYUisxgki9+ixnKmlNS5y/SdS07
	dMA8o3VwdOp/vA3LNiiPxDlS99bTECefnJLg==
X-Received: by 2002:a05:6000:1865:b0:439:c1ca:82be with SMTP id ffacd0b85a97d-43fe3df2364mr68022330f8f.28.1777273418099;
        Mon, 27 Apr 2026 00:03:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/7] Tegra114: implement EMC support
Date: Mon, 27 Apr 2026 10:03:05 +0300
Message-ID: <20260427070312.81679-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for External Memory Controller found in Tegra 4 SoC along
with adjustments required for it to work properly.

Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.

First 4 patches of series are dedicated to memory subsystem, while
the remaining 3 patches must be picked after first 4 are applied
and are meant for the Tegra device tree maintainer.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

---
Changes in v2:
- rebased on top of Mikko's patch removing duplicated code
- dropped unneeded headers
- adjusted function naming to be SoC specific
- switched to dev_err_probe where appropriate
- made emc_init void
- header change commit squashed with related binding commit
- combined with related patchset for Tegra114 device tree changes
---

Svyatoslav Ryhel (7):
  dt-bindings: memory: Document Tegra114 Memory Controller
  memory: tegra: Implement EMEM regs and ICC ops for Tegra114
  dt-bindings: memory: Document Tegra114 External Memory Controller
  memory: tegra: Add Tegra114 EMC driver
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes
  ARM: tegra: Add DC interconnections for Tegra114
  ARM: tegra: Configure Tegra114 power domains

 .../nvidia,tegra124-emc.yaml                  |  174 +-
 .../nvidia,tegra124-mc.yaml                   |   31 +-
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 1439 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  157 ++
 drivers/memory/tegra/Kconfig                  |   13 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1353 ++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 9 files changed, 3257 insertions(+), 171 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.51.0

