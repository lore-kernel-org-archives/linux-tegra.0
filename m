Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A343336CDE1;
	Wed, 20 Aug 2025 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702827; cv=none; b=m6FcjuOwnhi8iW7E0I8ZOaxy55yiiDBrSCA1VMptzKQLQPo210a1KD7N0p9ekm6HID7ezIFcCd6V0B44SwHqRQI2dmSSa7bPyRRy/Hl4QKn9paeh1OVrUM0lhJe0s6Zu8pXX0hwbumbZNpFMLX2I0dRf2HUBujCiBMrFH/OvRoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702827; c=relaxed/simple;
	bh=Q+FY2HZgN+2r/jPeIG//FV2KZZUId7ZVbeRPcXZwhJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLZnFjQvQi84/jLZE2k6f8rt/Ema8pWEv0HXoq9pCQ3W+AxvlV2LyY/XKP2WHAs/2WGRZZFCWUm1/HuWZIjDPvaImWSM9ET5ArhKQMjZQoFX6XwQCqILK9TW07jzr4qjYcjw6p8spR7XmPRMUznLlkJokVlomQnpVMo1+szv+Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO2lfdx3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO2lfdx3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188b690517so10322a12.1;
        Wed, 20 Aug 2025 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702824; x=1756307624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmbXlaeZbd6bs8tudHkGuoTxa6KBgZ2JwZKNq9hGSw0=;
        b=VO2lfdx3PC4OBXlOny1wbWmtnt56nvqHDb+//PBRwMvviAgx795IkRE92O92DzFD8f
         3AlXYKR2deoRzjHAWzvU9WUBTL6qqxD+F0UnuTuu8sVc0IU4IU33FkdAnpwGoW80ZAbC
         iwVk2til6jF798QIGQQ0iTurX+CrbhHvw7MxiMupThoE60o6SsxvMjG28X4jd6jXmPag
         wQ2XahFlGRlGawBCQ9mIiwUW05JdIzzJlapMwvAoqID2mcMMi19CUGw+jbnHuhnYN+PF
         CxRgZDH+nllMuRTIngJwIDtTuRLygVkXISmIIDy7z6vwmSVN2kgnbdLDqm6w5ECcloT7
         wB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702824; x=1756307624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmbXlaeZbd6bs8tudHkGuoTxa6KBgZ2JwZKNq9hGSw0=;
        b=rxyfvRe844c4QwUNUDmV9RKmK+6ej7gexX0i7jjAtWyUdqdO99EhJ5ez72B8Z/b7XP
         EcBujkf0qlUrK1esv5pCObRJO/s/XeqhwuYWAic/TLMF8CXtkGO3ictGDsfuPz9CGPU/
         2JE97++o9HSGtAiDWpzxiV2e3tFpeBdxO/O5Om99XMfEVIdLf+rPBYYOvnMe8KHaYyLc
         YZwQhogPC1W/hDCwOlKaP2AH22Eb6RFAgCnjxQO08U23nwJHTuWqn/DIpbI9nA3uZrNa
         ScBjnYscV/ptyhBO1LWTki2W552KPmquT6TqBpzIBqInLrCuIrDTA3NE922nVG0NS752
         Ud2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGH7DhFcWEjkK3tzUGLutAtgOb2RTY2VA1ohAsCUNJHiogmclH5rTcXvb8+GWst8/T+WvJywR06pgi@vger.kernel.org, AJvYcCXOQzSmIS7EwA9kVobLRuPPs8Dy8h7DJz0rZu+YZFq2glDHb3M7waeDF++s2FuG0De1EbvY6CC/gVjy@vger.kernel.org, AJvYcCXVC+ppxWmPOIzUAA3OPN4wmFIuAJ1z7xsME3yU6uwiNiFvYtZxrgwVZHviwbxdKN1XpuQwTC6PR/ZNkFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPSh64OVJxAOOrnkQhlUKbQy+7mPWMjM4J1qM3WEfrhcUvmdyO
	zXHd+RKZOenlvjaU65dWUp3Dk7tUOYOXVu1ZqVMjXyDD6ct9QMYu29Nm
X-Gm-Gg: ASbGncu0vNO7+nfo9mpitL0dMXrcWSY8QEXqYO1NDKI3z1S6f/+iMgKPM8yiOXlc3je
	VXub8D35CIMMKQXLUm9IhhcCljipiy9jxCcaHf7z/7bHUIyjpAusIj2sXQ9pZeUQJ3gVPLZdbeG
	d/xplUJhk72Ilf6Um+fsoEix+NB6Anovt2H5j+qU5PlWfagx6ohpSb+GdxBfZaNHU1oesk4XzCP
	0zcOpBGR8SoI0aMxSsVIvswmGJ8R1tERBsb53okGe7+swfpD3A8GTBo51G9ao6oW1ktR+7vAIg3
	dHnf6bkbyaUec2dpFBZ22kilvrwSb7WZYDT796JJbJqC1rUZH17Iyn5YwvaQOsLWg7oRZvOlzvr
	BsV3gtJ5+FEDICg==
X-Google-Smtp-Source: AGHT+IG5g184ukqO2j/P+fGxNOMQMECOnRZiWMWKp3i2FsZCi3NseoOr+qgK/u4eHe5tjZSwUC5AOA==
X-Received: by 2002:a17:907:9604:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-afdf003e177mr259096566b.1.1755702823657;
        Wed, 20 Aug 2025 08:13:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:43 -0700 (PDT)
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
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/9] Tegra114: implement EMC support
Date: Wed, 20 Aug 2025 18:13:14 +0300
Message-ID: <20250820151323.167772-1-clamor95@gmail.com>
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

This patchset requires DFLL patches to be applied first to avoid
issues https://patchwork.ozlabs.org/project/linux-tegra/list/?series=464976

---
Changes in v2:
- fix programming completion detection (changed EMC reg to MC reg reading)
- Tegra114 incorporated into Tegra124 dt-bindings schema
---

Svyatoslav Ryhel (9):
  ARM: tegra: Add ACTMON support on Tegra114
  dt-bindings: memory: Document Tegra114 Memory Controller
  memory: tegra: implement EMEM regs and ICC ops for Tegra114
  dt-bindings: memory: Add Tegra114 memory client IDs
  clk: tegra: remove EMC to MC clock mux in Tegra114
  dt-bindings: memory: Document Tegra114 External Memory Controller
  memory: tegra: Add Tegra114 EMC driver
  ARM: tegra: Add External Memory Controller node on Tegra114
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes

 .../nvidia,tegra124-emc.yaml                  |  445 +++--
 .../nvidia,tegra124-mc.yaml                   |  106 +-
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  |  151 ++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   33 +
 drivers/clk/tegra/clk-tegra114.c              |   48 +-
 drivers/memory/tegra/Kconfig                  |   12 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1487 +++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 10 files changed, 2349 insertions(+), 194 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.48.1

