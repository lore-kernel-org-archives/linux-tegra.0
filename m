Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244131FCFEF;
	Fri, 29 Aug 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756470180; cv=none; b=R31O0nkl5f9rpWMMrAfSumVduSbpVj7FfqZ9YN0v4lqdhkEU3O1NAZF+jSMKglfgSg0GrPFRV8kGi5quXUksx2XndeBah9xFQst9/2Y1vADDuI6OuYskhMWXIECpi3j00a4R7Z9KFJfS+FTvGgvrm0Z/iMiGxHmQFptoPL0YoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756470180; c=relaxed/simple;
	bh=ay1mkIvcJE/e4r+EJO+M8d+Jm7aZ9adWMkwfNZ58b8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bafO1daZG8j58cVECg94PECeOZmk/L9GyAAIaWrN8rot8mUiThN1dq2naA269G6CGPiBVPyGcePqcKlABUdB7bqqrjhpVFfaIXB2YqBa+sQKmuFguXoxFF52OV4HRDdSqv+G8PHeghv2hbXMSsU3m8KVwFObyFAhH+BpHaLqd8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxH3uX5H; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxH3uX5H"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb78fb04cso340250366b.1;
        Fri, 29 Aug 2025 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756470177; x=1757074977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjCf5U90YZZ0G4CHynnYnJa+eoUbXgmAFBJXFe1CPV0=;
        b=HxH3uX5Hqk+7S2jLyYb0o1dePQYbmhV53qWI9HpO+uI+qOc4iMP+K6Rng3evFLYv+T
         A4AKAooSpgL+8ufg0psIBjyqcCme6jT8QkTJ4Yzi3uuHqOdqm/w0BhOjbXkMJQrXexRY
         QkARRcdThX5THCjDVb9yylsaw3iIuV7Z6D89P6EjyorD1nBUhL6Ow4uApwZHtR5rd3GV
         iGMLVcvLi/iIQ+Ex3IXRlAS78hdD+SXNdl7drc2u51p4usHL3YOOUMh1ub8+SCPowqV8
         g32TJRVNXMNClz4r7Kb/DNm6Mx8yaFTxbknC8+/TpNlPM86N0b3SvoVcSRxb4JweaAKX
         6IyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756470177; x=1757074977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjCf5U90YZZ0G4CHynnYnJa+eoUbXgmAFBJXFe1CPV0=;
        b=nM71Y0B3b7j7xJ/WCMJjHHCHd5v55fDgOrtd1tAB8QU+Kr7BlLh08CSVSNNtR5jUtu
         mXznRasW9hot4G6lIDM7i2TKqFyVrVUY5NPUFJMOfAt9cRWV0LrIvh7zE/EQ9Ljw0B4D
         qOUEhUPcSeeE+qpmR8W7Bj8Ap25W2YJVw3KoQgLgmMCUinxjKlzzm3KdeGw59Mo921N4
         jcjCV5nHN7puC5sNo/+aFkB+etsdIcs0gE6vk17/wLm7a0BsDgGeP5I7n3XFQO2BKKij
         eclkiXe4aNGwm2MPad+zrUJ2lmO6AXsu7bmTKMez8UIEIGtW4aHkJYV5sRxcLfSzD72m
         xhIg==
X-Forwarded-Encrypted: i=1; AJvYcCW3lZkpYdX5XqLpuv4LhuGHpCSgZtUBBsAHQ9NYUCs/kmgbDZsmwiZHWP3NU3b+e7B/97kjPttKn2fYwbIJ@vger.kernel.org, AJvYcCWypGFmXO2K0d+iB+Y0sdYXi1ahbYUlqcVbAHObm3ooGQ19ktIxqzA34YSH/wt6W0UFXIdlnjIwHHw=@vger.kernel.org, AJvYcCX3/AbXtEuXu9uuD4v5qOSyYRUCeWMCkp651/M0hHrwNdTqi7f0g8WKysXZl0vvxWVg0s9ZU2b6YpyRsNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwagMEdlcRNxRh4XN1TjaODG4nvIdAi/9vzjTyATE0LiG/Xnu8Z
	ZMTp2RbNVi0EBmj45oOuxmcL1ISEfph3jEBLlm2FhvUm6ByTFFDQe/mL
X-Gm-Gg: ASbGncsBc7qVVqPOKIuTMztJnlqwHgjP0NZ8Vg2Ps6840Zir2Nb+ZDW9nWylUwdKewn
	e3xN3hjIhT7wK630xMB/ekHkjbK9pFXlhF4B8Go4wZJ+gr8FcVDL1qNTUlXRdhK1Sz1a5lcBMqh
	45EKkgbvrDR7siIIiKXSH5bmSip5iP9c7mQ3Aound7KIullMC83uAArdl9xDGzISbdAUxL6lZTS
	/iYSNbV7hN8b57J6CEuP/uub05ywbmZaTNt6GMXNm6XUynSvYds1vpJRH340dxOx9mvGVnh9CZ0
	bjOjsZimqg9cnjOPC3dVBj5PvH947GiclNUSTNUybGEI6A2ODJ/i+QV1dAzs+oIO35Ayd7BdYYd
	EVdzF0ydHs9oRSiuDRdkqbKqk
X-Google-Smtp-Source: AGHT+IGqYYxMXNlImQJTgUD4sXHYvG+ESLaCPCwhHiKJEer55gLJWbBlAmZD2vuXTZ0CgJz6USoxgg==
X-Received: by 2002:a17:907:6095:b0:afe:b311:a255 with SMTP id a640c23a62f3a-afeb311ae54mr1399145766b.48.1756470177143;
        Fri, 29 Aug 2025 05:22:57 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd7047sm188662166b.51.2025.08.29.05.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:22:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 0/4] clk: tegra: add DFLL support for Tegra114
Date: Fri, 29 Aug 2025 15:22:30 +0300
Message-ID: <20250829122235.119745-1-clamor95@gmail.com>
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

Changes in v5:
- renamed tegra114-car.h to nvidia,tegra114-car.h
---

Svyatoslav Ryhel (4):
  dt-bindings: reset: add Tegra114 car header
  clk: tegra: add DFLL DVCO reset control for Tegra114
  clk: tegra: dfll: add CVB tables for Tegra114
  ARM: tegra: Add DFLL clock support for Tegra114

 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  33 ++++
 drivers/clk/tegra/Kconfig                     |   2 +-
 drivers/clk/tegra/clk-tegra114.c              |  30 +++-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c    | 158 +++++++++++++++---
 drivers/clk/tegra/clk.h                       |   2 -
 .../dt-bindings/reset/nvidia,tegra114-car.h   |  13 ++
 6 files changed, 204 insertions(+), 34 deletions(-)
 create mode 100644 include/dt-bindings/reset/nvidia,tegra114-car.h

-- 
2.48.1

