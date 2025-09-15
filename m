Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967782E9EC7
	for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923345; cv=none; b=frjGJyLNIqLZVzv376I8OLJcQRc3EbXSlTzMxT+ggm/ZEf1ImUXa8sqs4MUQe/rb72PpDyTVtfDobm4DV70qaS8goVbxSHK7hGYbXruwmkjpsAZs5vhIXKDMdQ23QU2IT/fN6HIHCKNvb0kIKXANLvsB6OJXxRlbczzrWwrXSX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923345; c=relaxed/simple;
	bh=5tUbsNm4ND+FjslGEciU+SgdQeWUOp2dK35sNtPPOpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=shWMmCGZqJzWMCtvqCnxXjlKTk0776aT6Byp317woVW+n/uR3kkszLawgsU73zXsVrfE06xKCj3qddsepC/nAXXURmfAU1rV+P3cOVaKYEMDgmknow+gYDC7Q81qwzHBaD5iMfY/2H9/qFGRdjfXkMyTLnBzIWVGYxvQXAUPFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8j/x4ap; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8j/x4ap"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5608bfae95eso3674339e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Sep 2025 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923342; x=1758528142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlK0NJt8X/uN+s+VLiN7OERRrRGsvN6u57kWC/PGA1I=;
        b=h8j/x4apAqZ1Uk1IkXlLV0OkuI3q5HIx2RRd+UxDge+5aW3mtb6ri5bzw8ChiXatqE
         1twle/ThbjpyAumXwp2t80+58GpMB3LEoPRPpC5aETQo+rrTu6me96nw9DMXxI5kkE96
         Kjql30ZVH/86R8YG5NSf3EyffuB7qoyklrqCOPI8YakXk8C8iHJNM4OYoBaSVAMlZSxV
         R4rJiNHrYDPYcKSRvUzBHy9spRTsGlEmUysDhaHVPYa8ITMBHvlmxdUi/UyhE2fr3VFy
         hmlHxoJX6vBHPl5pHlI88Px2FiMntCipHGYWFxiB9THrl7DvigfP3eh4rorcRSblpJyl
         RdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923342; x=1758528142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlK0NJt8X/uN+s+VLiN7OERRrRGsvN6u57kWC/PGA1I=;
        b=Bz8mNOAGXOSmmvK1/lfoB3NYrn3xPEBjm3YPGMnBwQjoI19kjZ1GU4ke5ArcSAJrIE
         6jIHIZdMTEajjBDZUw58av06jlDo7PHnoZxyt2XJGE50cJV85oXIDy2eknaOcKuIzTvN
         VZArLti5oAd83EVFpb/lea6S9J9Zs2lbiMEbVlJTLb/QItkZ8FjWG/eRRwma35d3kxr5
         B+fD4poDcdu+ZechkGsKHSQFmDJk/TJdZ3WnDsljpBA5Mb0NEkJ5RMXE9QfAKFrOs4jJ
         +HlZMjXKameVKqVetCujI4XkYfLKQc35MO1c+Qh6CZJtJ3KahDx9m8MeiRozhQpddx5m
         esbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcK3Wf3wwCozaJEMCpd6xIUQ/bPAGXI/K+zqTqdKYPtv4kj7XKsoTfEtce7SUAuR5i8r2H3o11rhouTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxn8lctAQktBQvYVWMholTuNBNR3hIdZ8WGFiqGKU57a86MJgh
	NP7rbO641sxmwFDzm64Zi/N9S32Eclh1KuYT4WdKMg8HfPDZ4KMPuECG
X-Gm-Gg: ASbGncsuo/Wt/EtUNVzPDZtLiElSwWbQHoOfdHV+t3c1sXyE9PThYImc0PB+7niXGof
	N51AoKT/JzjGc3zYZozWeT3Tos/+idw/2VcfNvIjBJBBk6ZgGP0PkBkPBz8IPDIL99vW63OvH3c
	Tl4OOvpiCdwDFx4Z2YzH1WD9QOhlW8oYsLFgLYD4AfpAKBPDG/va3MMlUlKZurONMcS8jGghfy3
	NZ3i0nNCIVTl3s9aHYHSP4jeX+TgYg2ihoRwfSjmZdd4jbOPlOgUy87b4pIJj7lcyzJOBDqVxVj
	h1hXU9YY4PBOfiyDJyYEme0B2au5LkFuO987nxKgo4KRPeo1i9oM75c9tdmTostMMpBqCZE0oYI
	jcxo7uYadkxJ0wDqc9nd5qn1B
X-Google-Smtp-Source: AGHT+IH2zxID7pgmdeyagAsm2Y75nwFYaoq7c/hN/e/IBwiwpsQDWQwerPXqEEff1sVLGD2GNtU5Cw==
X-Received: by 2002:a05:6512:b25:b0:570:8bc4:9544 with SMTP id 2adb3069b0e04-5708bc4a075mr3805080e87.47.1757923341284;
        Mon, 15 Sep 2025 01:02:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 00/11] Tegra114: implement EMC support
Date: Mon, 15 Sep 2025 11:01:46 +0300
Message-ID: <20250915080157.28195-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

---
Changes in v2:
- fix programming completion detection (changed EMC reg to MC reg reading)
- Tegra114 incorporated into Tegra124 dt-bindings schema

Changes in v3:
- adjusted MC and EMC schema to move description and ref into common property
- added Tegra114 support into devfreq driver
- added MC/EMC to DC interconnections
---

Svyatoslav Ryhel (11):
  devfreq: tegra30-devfreq: add support for Tegra114
  ARM: tegra: Add ACTMON node to Tegra114 device tree
  dt-bindings: memory: Document Tegra114 Memory Controller
  memory: tegra: implement EMEM regs and ICC ops for Tegra114
  dt-bindings: memory: Add Tegra114 memory client IDs
  clk: tegra: remove EMC to MC clock mux in Tegra114
  dt-bindings: memory: Document Tegra114 External Memory Controller
  memory: tegra: Add Tegra114 EMC driver
  ARM: tegra: Add External Memory Controller node on Tegra114
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes
  ARM: tegra: add DC interconnections for Tegra114

 .../nvidia,tegra124-emc.yaml                  |  431 +++--
 .../nvidia,tegra124-mc.yaml                   |   97 +-
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  |  151 ++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   55 +
 drivers/clk/tegra/clk-tegra114.c              |   48 +-
 drivers/devfreq/tegra30-devfreq.c             |    1 +
 drivers/memory/tegra/Kconfig                  |   12 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1487 +++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 11 files changed, 2357 insertions(+), 186 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.48.1

