Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB074AA1CD
	for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403847; cv=none; b=Cik0JQgb2KmCQJXsssisnPI7EDn7BIb3X3Rxx71JDJX/3nz3J6ZkQLJHmB2pbusLX/NRF1ZBS2BPr7+FjBtjcTAP3b5LBdmrS21IWjxYA8ivr+t327JHMntFA4k7UQfZv4MZ1oLC5kW6YpKd5N6scirImP2dx06GZOQxDKxTw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403847; c=relaxed/simple;
	bh=XB5CwEO7affGKAmL4pQhgSwl62lNe0rB4dEO0D6OYYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+t0TAuIUrAsQ3HheGSh0AzlJbjk+9PtNb+1M4GdAfF0E1KXpBPAdY97jzDjyQL7RQnOGwZcmXLdDu3wIPs9hb9HYg4BSi3i8fqW+LWl45bCDMND232XeFA8Q66oDajkPY8Rl/JJID0nuTXf9Nsl6wiR8EE4ShBfDstMAnzBdc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYWg/Y++; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYWg/Y++"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0728so448334f8f.1
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403844; x=1793008644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7COsRHRwbFZs67dB0peGMQf1r+S9Yv4n+CsneXuo9SU=;
        b=PYWg/Y++E+4vO4MVDsolvTL/XjzUBM+YbmVZTKHt0wiIeNRKx+uOpeHKGMBn9EQlmR
         cNUos4wrulqTvAJacwxghyWKRMIPOATw599VVtINAf36XaDWlA9OzyuGh9Oz8RvNuVUG
         M0nAb1z3Qj2FGdVZ5fodB6XIXLCcbfILfBHpBGvjMavaUB9yNTeS6c1DitYJZ8PeAycf
         Op/HqyqVvRaM3CixEQoug7Zkc4Xg+AhWFHH3vHNvp9O4SJ8ta7MNynbJi2zGmQLlfehl
         19ZK3xad5BPVl1GcbkLpl/Bd4CVnO7ZOWrODGZKexKIXi6ER+gTiXwnQ9erwaoXF5ED0
         Tubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403844; x=1793008644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7COsRHRwbFZs67dB0peGMQf1r+S9Yv4n+CsneXuo9SU=;
        b=Ra9AmHRcvDq0BQEKGPL16gI+7xBYzAbj6qAWBy5/0PI5Xv1H0Yh+lrLORoWayH0Wb5
         fr6fIhFkI3dhfIgpw7Jj50Sueau4U5zuysALL+rFtKGHpYp9etwV1byeMR/SI4ImFFd7
         aKxSrsEZR94ct1skiQP+XXHu3Q3VVbun9UVEG5+rtee5aBnn+7kcmvYi/x1VSdC9sC3r
         mf4LE7OAX3IiPU0OL+Wl4bqrHA2cdpXltUYQD3d9JLi2SUpkp+LytGb2Tt1uFyvqpVIW
         e5pmFG0NN3X5FeLOWVaRzMxjLXUVZJK8fzDKdSbEQoxGjA8JraO+XVtvUoTIzKjm+E0u
         B3KA==
X-Forwarded-Encrypted: i=1; AKwUvBxeCFbdlYQtVoBGRaebSVm7OZqbTvW5oZAj0afTkGbWu2woAGGFSc0PyUJ2kxk0FQERnjXV+hMYiT13kg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhqJpHcY7jvhOryFmpwL0OGB3NcHGog6c7G4vGbewj9KYh48gf
	asGLCIvPG6+SPRCAonozxP33u33QJ/Orf+5OZgJIkBDNHQWw6Hzc3SX9
X-Gm-Gg: AYBFou2JITtK91Yqjte35SkSfpyalzptKcYwEvbMZWMPEd0JlYzL11lmPIbgmceTgau
	15j1JOJ4lab+561/NpG+A97b+ZDNyzTqrQWZ/LS8VC7WrZvLj4hsqK70uVqPbmunznI2jP0mY5w
	/CUxloK2pmEeb6RISWqH3T6BTxSbKNCFjYiYDcP/1eLQt+Pv3l1Ev9Cq3Y/q7CLNuDjtyHiRp0i
	sFg/loMTsvFBO7WtGTyV6g25Bf2SnE5oIzxwGGcAXvMv2FTABQ/8v4Hr5d5qESqMWobH12W+IQa
	rRArBXiR1Q9JynarsCTunBJBh2MB49AoykFO12Yn74aEc2k4jeC4czYOIEaJYdbLaIUweoUT8AP
	2UxdM0BqWnKW8UNGThiI4g207AP4yO0D41QKPejAKcHoKnjbJyYYKPOYMhgS20MutMfgbyzfUKL
	G/l9BrvhQhXPpSzn9KxV5MDQKAKD5TcnqBVWOgHHZsH+GfN3GBysul6dlAAlotU44v4h3xMfAlT
	MSluK4IqEIn0Z6/4yc=
X-Received: by 2002:a05:6000:468d:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48e07978df7mr9786078f8f.5.1792403843556;
        Mon, 19 Oct 2026 02:57:23 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/7] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Mon, 19 Oct 2026 12:56:58 +0300
Message-ID: <20261019095705.91062-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'.

Add DC parametrization options needed for fine tuning by bridges.
Add 8-bit CPU interface in form of a bridge linking to RGB port.
Add 2 DBI Type B panels used in LG Optimus 2X which work with
the 8-bit CPU interface.

---
Changes in v2:
- convert enums in the dc header into definitions list
- add check in RGB if bridge_state is not NULL, if yes, use default flags
- inverted FLAG_PIXDATA_SAMPLE flag setup logic since default value is set to
  be on NEGEDGE while v1 set default to be on POSEDGE
- 8bit-cpu schema renamed to dbi, removed compaible and set as DC child
- expanded list of required properties
- 8bit-cpu bridge remodelled into dbi interface as DC child
- improve gpio handling
- rework attach to get drvdata from parent
- add panel supplies description
- split panel driver into per-panel drivers
- get DBI interface from the patent directly

I have deliberately left GPIO parsing from device tree since it seems to
be the most convenient and mainstream method of working with GPIOs.


Changes in v3:
- rgb: fix default bus_flags to match original behavior
- dbi-schema: remove compatible from required props
  remove dc@54200000 wrapper from example
  restrict dbi nodes for tegra20/tegra30 only
- dbi: remove unused idx from tegra_dbi_priv
  wrap dbi registration in dc with devm_add_action_or_reset()
  separate dbi into separate object
  export tegra_dc_commit() and trace_dc_readl()/dc_readl()
---

Svyatoslav Ryhel (7):
  drm/tegra: dc: Expand available registers layouts
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 +++
 .../display/tegra/nvidia,tegra-dbi.yaml       | 138 ++++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +
 drivers/gpu/drm/panel/Kconfig                 |  27 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 297 +++++++++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 236 ++++++++++
 drivers/gpu/drm/tegra/Kconfig                 |   7 +
 drivers/gpu/drm/tegra/Makefile                |   3 +
 drivers/gpu/drm/tegra/dbi.c                   | 415 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  32 +-
 drivers/gpu/drm/tegra/dc.h                    |  50 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  41 +-
 drivers/gpu/drm/tegra/trace.c                 |   3 +
 14 files changed, 1312 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c

-- 
2.53.0

