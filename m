Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876793A5E64
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485697; cv=none; b=onQtsW6B1hDpur5X2UCvh7+w344+2cgF4LAe+8y8kuTO+Rjw4LY1w5KwvcxgZSf0nXFcCT2EByf0IH60i3ZYh48zkFZk5/Va2knzlZQrW85VDh8JefRmeXsGZsdMuwwMg6FwAOaDeMJmSNgzxwfr/76UjcAMy5sTGs3CsWUsUIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485697; c=relaxed/simple;
	bh=DTG0d6srwYuZw11HXVSrISSlverDM3+dZg5dZOfkCs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HH2fhXI38B31qqSv7uuOqYb1QEKZGgTtI4sOQ9/SUBlXF0sYdLXO27jVVOl3TL4MZsXwz0yjyRpyhUe74LDZkubGrxk6xkgCnrbL8rJntUk10/0f9EvWNTJPlb62Q3mCoqxfXqJg4cSDOhomdQlTXTh0kSOiohMsVC/56raQXb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joIivMUG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joIivMUG"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8c94cefcdso530628e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485683; x=1779090483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzV/r9uQPwH3fg/E4X8ZbrbeGCJOX8rINpZLXDiidxQ=;
        b=joIivMUGmujWdGdblvDXrz77mKEVZqeNYh2LgRTyDJp3U/Huzl1yRfnFy0gH37JF6N
         C/GldSmHGPdOT76CNmCzlLxJIxQZD3eMap89bdNGVVzJr0Ah3NYSA0uUcP+hELe3E29N
         fQnnmxadU1kQ+eAL7KwsqiNvG4py4Zdnbf0x6sqjm3kvCIdGCFZCkg6XySalPqpfGIJk
         vXTuwAIOFQ1lyJJD8vkRCqGYk5R/6soIKT8T5wwoyNZNAMzfc9RH12OhZsPAU3rCRwf4
         SHMc5Pzsy2kq7Zz4g5VthCN7DQhQkz07JgruilTP0gLInC6RQZlvoakKvOUuAeb3bL2F
         bPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485683; x=1779090483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzV/r9uQPwH3fg/E4X8ZbrbeGCJOX8rINpZLXDiidxQ=;
        b=o/eI8BaG19noImwtU8qCrTxcv99LCUDu2dVFYKVpmWgAr6HCaLkMtup4yVl5kWzJ9F
         y5K8nXS5vqurlHFcN3NznZdPm7puAdwzQg0vTuTEXKTO580UYpIqJF12A0QTbN3NukO8
         0l3S0ZjkVLH5OLKY9aEFQ7dLCA1fh5RUDlewEzB2wRczW7asJu5bF4KGYRcqvzRkFscJ
         UZYhqBkLUJ6OklWH8Rcjw7DnvEn2op+bhyLm/n/XDwye+12CndMRSifQlpJ3KtIpXB6C
         JSSCCdYS5NuLgGpdn0frJIUE1V8IiQnHY1s9R7wAGt4/l/GKHTZDGqqRCWhSrnaiLh3C
         +WvA==
X-Forwarded-Encrypted: i=1; AFNElJ+UgLer9oJ6Jq888Z7azAUhsJkVFxN+bjJHkj1AsU/uyQj0HVhCEwHQpnDnL5V7oOmHMwmoaVPthoMzfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywD5O0NwGfwevCmyPjQrLuNX9IoLc3J5pd4ZOLFbktIcorddHj
	gACQHtZftNP9LpWI7of0ajcDcDyaxAe0sHg8+i3kBlfW+1tp+YHAwfy/
X-Gm-Gg: Acq92OHPf3/72EOOGEowsA5dMyDq/om1YGOaWlsUlmUbonI2sCR9ZS5cD2mGRajede1
	Yq+5cE5cuavu7cZoB21z7doEEy12jRYUYCCiPcMXgif1f/zS2+IAS29KNAf6Qc0+WVB8vhZtZBe
	GgsslG2z0hY0Jv0+rrXGcmhwAHsh81SVWFAVOjWdyGKpeIR/Z/dvsWuXgicT7t6ARhggiFO2Ot+
	ZqIvdjBr7ezYA/J+VDnPRJ8cJSpkoCi3Nk8s4wiagJBZOVHzPhNuQuqx3BGtBgraFdkhiR55LYk
	Vx6LZw9vfT6NCnGu+c2UQnYaVR7w6OxBiQQ5yF3YouS/FQo8/ujIC3dA2ArJ7cOAPNHJChHJYb1
	9hdVNieUJEPKh4xMZO4csoXXKqDu81BnwXk0WhBxkiu3R85gA2VeGiSQSHrA+UYANRxTSey9fIA
	d49tVqbXItlP64
X-Received: by 2002:a05:6512:2315:b0:5a8:6cab:4871 with SMTP id 2adb3069b0e04-5a8b719719fmr2232605e87.36.1778485682662;
        Mon, 11 May 2026 00:48:02 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e096sm2386670e87.38.2026.05.11.00.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:48:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Mon, 11 May 2026 10:47:47 +0300
Message-ID: <20260511074752.24745-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
logic and clocks. With a few minor tweaks, existing tegra DSI driver
should work on Tegra20/Tegra30 devices just fine. Tested on
Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).

Svyatoslav Ryhel (5):
  dt-bindings: display: tegra: document MIPI calibration for
    Tegra20/Tegra30
  clk: tegra20: reparent dsi clock to pll_d_out0
  gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
  gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
  ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30

 .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++--
 arch/arm/boot/dts/nvidia/tegra20.dtsi         | 14 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi         | 18 ++++
 drivers/clk/tegra/clk-tegra20.c               |  5 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +
 drivers/gpu/drm/tegra/dsi.c                   | 69 ++++++++++------
 drivers/gpu/drm/tegra/dsi.h                   | 10 +++
 drivers/gpu/host1x/mipi.c                     | 82 +++++++++++++++++++
 8 files changed, 206 insertions(+), 35 deletions(-)

-- 
2.48.1

