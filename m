Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BBA3164B1
	for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072381; cv=none; b=tyCPyeBthbg/+NFvsS4ViNDrE/msDwvKjaYj/AqcWJPAT1PV+qqmlvovUiTSuwrw72AmMaoWf4x6ex0iU9tyzt7K3/Iz0nTp6Au8JtpZBlsUU6VXplilSUlZN5qmQ0TTbW/vmIRzVEc0IuvHkQkedXs69CKubN5tOfW4uCOxTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072381; c=relaxed/simple;
	bh=fQuCm3yVvrbhWBVd7I+43ZxQG3uqjhF1nzecABEWEzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ilqboz0cNoQyB5BwWxLsmbpli0+kTbF8KmkU0DrjAYnpiBbAoYhrYtgFQl8B+/AHYvoFIgZR8s7IgPvf2pYusa9Lv20U3ja1AB4OB1UdbKIWMNp4ss64eH0FEzkGzup+BQmvBpJ1Gu5+eNRM4dYKYQXhuk1X4eBzhosMQF1VwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU06mM61; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU06mM61"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957f617ff0so5771953e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 25 Nov 2025 04:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072378; x=1764677178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMKSnXZvXFWxstn6Wmt0f2cu30nxjUQkf102sfmvkHQ=;
        b=fU06mM61RvceKoi868Rmd50KYSbyekQdnapBzNgSLtDZtNpvEyAchg97gli56zRuVc
         Q1iIyvKq7V/My2nW0jL+8iYAsc9Bx+3258ebqGgZxrwVQmKWv3pTC6a/HDJuJvZdR7o7
         OTb7dCJfCxtvu4S/dnMoKyWiIlg64lE5tQ8ND78BxoSNfprDi9gBcA/t0MafYW1GSpIP
         fv2O2HcZmMLzdTJ/5EWxZare/6uhytq0GX9VB9/e3pt4BvOk/T47jbWms9m+XhmfczjF
         LfJ4tNE+Ps5wMCDYYUwdvfe7FLwEokCIHalr+Bb291DxUsokUtVhSPrWO3nPqn41ieRj
         biKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072378; x=1764677178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMKSnXZvXFWxstn6Wmt0f2cu30nxjUQkf102sfmvkHQ=;
        b=WhpmMYdynbvIT4R7SeGdIIIs8BjDSnS748mUC2AbqN2/8k/VdF8n73EupuJ4d791k4
         fq72P6R4x+NuElaPNGwGRGOroWWkT5KZihXVLc4x/4SgYcWHH5ukwi+kvV/HFUFfqEnH
         hrB26aynApCPEkUDbcuWRUQ2WB83yPFqHtmvidj7TeRWcPyzZTIZb4xV+tuuB8HpDD6h
         xXusblpqnANRmpiahPB7enYRKGnFvBTQfAaFbthdMwL5U7J474wZPTHkYr3pqxNSa6tH
         zlZCrGePvbDAXvLRg7IL1eHlcd1OwbVal3Q/5FEakpQss11qynWol1SaOod+vXmpxpKm
         eNoA==
X-Forwarded-Encrypted: i=1; AJvYcCXbQ00l0xTH8oDbSuKIUCqiRgwm3XLxaH41+Gx+xC4r32sf4dkarZ0Ie3iy0gCuYcQU5EkeA1hSk2Julw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJtAyFyISm/ZabIkhwnOvMsTY+fMYa5lVRhlu6UgpgiULLQ+p
	Ktqyi+0Z2zIoupq448waZoi/vp6bGqxaBeFLJNk50v4lhyuSF82GY6G9
X-Gm-Gg: ASbGnctJaG5l85qylb1A8TZ8h0VDLoIbM8nnSkgU7mScQL8rXbsTj1p52TPPHXTACNJ
	BPthx5uDigcY0ECD/cmGRqkZF16gCAcULmb/EPhd/StPTo3iMLMh9LXHkGEVHqwrRb8c7TeIPl+
	1oquU+Obv5a6ggcvmdJjNdlD/SqyAQZnIabIeA7Vphl5y+lP05NKt80hM6z3LvKUpM4Jg6z8edj
	J9Rb/En0+viDk7zDE6KNQPWlZ+QxwdE8Nun3HeTqY98Azsc+sgVEiBzB8f+eYdPPMK8aymz+LC4
	i0oLRhtYatxo/ioAnqjJkv4lchMSXhc9BkcHxjTh/R8drnUqtEzeRJA42gSObbrUCYZKjbnaoiQ
	z5/al9JTqZ4aNyDidpQm9PU6m4jqf3rgPIMBypDkD/OYNAQ18SNHzBuzsbACRprb2T7mQ2oSQcT
	U=
X-Google-Smtp-Source: AGHT+IF56otrGriTfA9UvJPBnGRevOk1eZ6opICTPkgG1WVGE7MGrd1ZjER/ONAVY4mquR51YjO8wg==
X-Received: by 2002:a05:6512:695:b0:594:2db8:312b with SMTP id 2adb3069b0e04-596a3ea66bfmr5947719e87.7.1764072377467;
        Tue, 25 Nov 2025 04:06:17 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:17 -0800 (PST)
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
Subject: [PATCH v4 00/12] Tegra114: implement EMC support
Date: Tue, 25 Nov 2025 14:05:47 +0200
Message-ID: <20251125120559.158860-1-clamor95@gmail.com>
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

---
Changes in v2:
- fix programming completion detection (changed EMC reg to MC reg reading)
- Tegra114 incorporated into Tegra124 dt-bindings schema

Changes in v3:
- adjusted MC and EMC schema to move description and ref into common property
- added Tegra114 support into devfreq driver
- added MC/EMC to DC interconnections

Changes in v4:
- fix number of EMC clocks required by activity counter transaction
- set minItems/maxItems for MC and EMC registers
- removed CONFIG_TEGRA124_CLK_EMC ifdefs from clk-tegra114
- minimized changes to tegra114_clock_init
- switch to devm_tegra_core_dev_init_opp_table
- switch to readl_poll_timeout_atomic for polling
- adjust DLL_CHANGE logic
- drop touching EMC_CLKCHANGE_SR_ENABLE
- use for_each_child_of_node_scoped for timing iteration
- add emc-mc timing check
- added print for amount of timings and ramcode
- align commit and code style
---

Svyatoslav Ryhel (12):
  devfreq: tegra30-devfreq: add support for Tegra114
  ARM: tegra: Add ACTMON node to Tegra114 device tree
  dt-bindings: memory: Document Tegra114 Memory Controller
  memory: tegra: implement EMEM regs and ICC ops for Tegra114
  dt-bindings: memory: Add Tegra114 memory client IDs
  clk: tegra: set up proper EMC clock implementation for Tegra114
  dt-bindings: memory: Document Tegra114 External Memory Controller
  soc: tegra: common: add Tegra114 support to
    devm_tegra_core_dev_init_opp_table
  memory: tegra: Add Tegra114 EMC driver
  ARM: tegra: Add External Memory Controller node on Tegra114
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes
  ARM: tegra: add DC interconnections for Tegra114

 .../nvidia,tegra124-emc.yaml                  |  174 +-
 .../nvidia,tegra124-mc.yaml                   |   31 +-
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  |  151 ++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   55 +
 drivers/clk/tegra/clk-tegra114.c              |   39 +-
 drivers/devfreq/tegra30-devfreq.c             |   17 +-
 drivers/memory/tegra/Kconfig                  |   12 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1463 +++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 drivers/soc/tegra/common.c                    |    5 +-
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 12 files changed, 2016 insertions(+), 192 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.51.0

